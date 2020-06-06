from houdini.plugins import IPlugin
from houdini import commands, handlers
from houdini.handlers import XTPacket

from houdini import permissions
from houdini import PenguinStringCompiler


class Nostalgia(IPlugin):
    author = "Solero"
    description = "Nostalgia plugin"
    version = "1.0.0"

    def __init__(self, server):
        super().__init__(server)
        
        if self.server.config.type == 'world':
            self.server.penguin_string_compiler['Nameglow'] = PenguinStringCompiler.custom_attribute_by_name('nameglow')

    async def ready(self):
        await self.server.permissions.register('nostalgia.nameglow')

    @commands.command('nameglow', alias=['ng'])
    @permissions.has_or_moderator('nostalgia.nameglow')
    async def set_nameglow(self, p, color: str):
        color = str(int(color.lstrip('#'), 16))
        await p.set_custom_attribute('nameglow', color)
        await p.room.send_xt('upng', p.id, color)
        await p.send_xt('mm', 'Nameglow updated', p.id)

    @handlers.handler(XTPacket('h', 'ng'))
    @permissions.has_or_moderator('nostalgia.nameglow')
    async def handle_set_nameglow(self, p, color: str):
        color = str(int(color, 16))
        await p.set_custom_attribute('nameglow', color)
        await p.room.send_xt('upng', p.id, color)

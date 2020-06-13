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
            self.server.penguin_string_compiler['Namecolor'] = PenguinStringCompiler.custom_attribute_by_name('namecolor')
            self.server.penguin_string_compiler['Bubblecolor'] = PenguinStringCompiler.custom_attribute_by_name('bubblecolor')
            self.server.penguin_string_compiler['Bubbletext'] = PenguinStringCompiler.custom_attribute_by_name('bubbletext')
            self.server.penguin_string_compiler['Ringcolor'] = PenguinStringCompiler.custom_attribute_by_name('ringcolor')
            self.server.penguin_string_compiler['Size'] = PenguinStringCompiler.custom_attribute_by_name('size')
            self.server.penguin_string_compiler['Transparency'] = PenguinStringCompiler.custom_attribute_by_name('transparency')
            self.server.penguin_string_compiler['Rotation'] = PenguinStringCompiler.custom_attribute_by_name('rotation')
            self.server.penguin_string_compiler['Walls'] = PenguinStringCompiler.custom_attribute_by_name('walls')
            self.server.penguin_string_compiler['Speed'] = PenguinStringCompiler.custom_attribute_by_name('speed')
            self.server.penguin_string_compiler['Mood'] = PenguinStringCompiler.custom_attribute_by_name('mood')
            self.server.penguin_string_compiler['Moodcolor'] = PenguinStringCompiler.custom_attribute_by_name('moodcolor')
            self.server.penguin_string_compiler['Snowball'] = PenguinStringCompiler.custom_attribute_by_name('snowball')

    async def ready(self):
        await self.server.permissions.register('nostalgia.nameglow')
        await self.server.permissions.register('nostalgia.namecolor')
        await self.server.permissions.register('nostalgia.bubblecolor')
        await self.server.permissions.register('nostalgia.bubbletext')
        await self.server.permissions.register('nostalgia.ringcolor')
        await self.server.permissions.register('nostalgia.obese')
        await self.server.permissions.register('nostalgia.size')
        await self.server.permissions.register('nostalgia.transparency')
        await self.server.permissions.register('nostalgia.rotation')
        await self.server.permissions.register('nostalgia.walls')
        await self.server.permissions.register('nostalgia.speed')
        await self.server.permissions.register('nostalgia.mood')
        await self.server.permissions.register('nostalgia.moodcolor')
        await self.server.permissions.register('nostalgia.snowball')

    @commands.command('nameglow', alias=['ng'])
    @permissions.has_or_moderator('nostalgia.nameglow')
    async def set_nameglow(self, p, color: str):
        try:
            color = str(int(color.lstrip('#'), 16))
            await p.set_custom_attribute('nameglow', color)
            await p.room.send_xt('upng', p.id, color)
            await p.send_xt('mm', 'Nameglow updated', p.id)
        except ValueError:
            await p.send_xt('mm', 'You must enter a valid hexcode.', p.id)

    @commands.command('namecolor', alias=['nc'])
    @permissions.has_or_moderator('nostalgia.namecolor')
    async def set_namecolor(self, p, color: str):
        if color is 'r':
            await p.set_custom_attribute('namecolor', color)
            await p.room.send_xt('upnc', p.id, color)
            return await p.join_room(p.room)
        try:
            color = str(int(color.lstrip('#'), 16))
            await p.set_custom_attribute('namecolor', color)
            await p.room.send_xt('upnc', p.id, color)
            await p.send_xt('mm', 'Namecolor updated', p.id)
        except ValueError:
            await p.send_xt('mm', 'You must enter a valid hexcode.', p.id)

    @commands.command('bubblecolor', alias=['bc'])
    @permissions.has_or_moderator('nostalgia.bubblecolor')
    async def set_bubblecolor(self, p, color: str):
        try:
            color = str(int(color.lstrip('#'), 16))
            await p.set_custom_attribute('bubblecolor', color)
            await p.room.send_xt('upbc', p.id, color)
            await p.send_xt('mm', 'Bubblecolor updated', p.id)
        except ValueError:
            await p.send_xt('mm', 'You must enter a valid hexcode.', p.id)

    @commands.command('bubbletext', alias=['bt'])
    @permissions.has_or_moderator('nostalgia.bubbletext')
    async def set_bubbletext(self, p, color: str):
        if color is 'r':
            await p.set_custom_attribute('bubbletext', color)
            await p.room.send_xt('upbt', p.id, color)
            return await p.join_room(p.room)
        try:
            color = str(int(color.lstrip('#'), 16))
            await p.set_custom_attribute('bubbletext', color)
            await p.room.send_xt('upbt', p.id, color)
            await p.send_xt('mm', 'Bubbletext updated', p.id)
        except ValueError:
            await p.send_xt('mm', 'You must enter a valid hexcode.', p.id)

    @commands.command('ringcolor', alias=['rc'])
    @permissions.has_or_moderator('nostalgia.ringcolor')
    async def set_ringcolor(self, p, color: str):
        try:
            color = str(int(color.lstrip('#'), 16))
            await p.set_custom_attribute('ringcolor', color)
            await p.room.send_xt('uprc', p.id, color)
            await p.send_xt('mm', 'Ringcolor updated', p.id)
        except ValueError:
            await p.send_xt('mm', 'You must enter a valid hexcode.', p.id)

    @commands.command('size', alias=['si'])
    @permissions.has_or_moderator('nostalgia.size')
    async def set_size(self, p, size: str):
        if '|' not in size and int(size) in range(1, 500):
            await p.set_custom_attribute('size', size)
            await p.room.send_xt('upsi', p.id, size)
            return await p.send_xt('mm', 'Size updated', p.id)
        await p.send_xt('mm', 'Your size must be a value betweeen 1 and 500.', p.id)

    @commands.command('transparency', alias=['tr'])
    @permissions.has_or_moderator('nostalgia.transparency')
    async def set_transparency(self, p, transparency: str):
        if '|' not in transparency:
            await p.set_custom_attribute('transparency', transparency)
            await p.room.send_xt('upal', p.id, transparency)
            await p.send_xt('mm', 'Transparency updated', p.id)

    @commands.command('rotation', alias=['ro'])
    @permissions.has_or_moderator('nostalgia.rotation')
    async def set_rotation(self, p, rotation: str):
        if '|' not in rotation:
            await p.set_custom_attribute('rotation', rotation)
            await p.room.send_xt('uprt', p.id, rotation)
            await p.send_xt('mm', 'Rotation updated', p.id)

    @commands.command('wow', alias=['walls'])
    @permissions.has_or_moderator('nostalgia.walls')
    async def set_wow(self, p):
        wow_value = 0 if int(p.get_custom_attribute('walls')) is 1 else 1
        await p.set_custom_attribute('walls', str(wow_value))
        await p.room.send_xt('upws', p.id, str(wow_value))
        await p.send_xt('mm', 'Walls updated', p.id)

    @commands.command('speed', alias=['sp'])
    @permissions.has_or_moderator('nostalgia.speed')
    async def set_speed(self, p, speed: str):
        if '|' not in speed and int(speed) in range(1, 500):
            await p.set_custom_attribute('speed', speed)
            await p.room.send_xt('upsp', p.id, speed)
            return await p.send_xt('mm', 'Speed updated.', p.id)
        await p.send_xt('mm', 'Your speed value must a number between 1 and 500.', p.id)

    @commands.command('mood', alias=['m'])
    @permissions.has_or_moderator('nostalgia.mood')
    async def set_mood(self, p, mood: str):
        if '|' not in mood:
            await p.set_custom_attribute('mood', mood)
            await p.room.send_xt('upmd', p.id, mood)
            await p.join_room(p.room)

    @commands.command('moodcolor', alias=['mc'])
    @permissions.has_or_moderator('nostalgia.moodcolor')
    async def set_moodcolor(self, p, color: str):
        try:
            color = str(int(color.lstrip('#'), 16))
            await p.set_custom_attribute('moodcolor', color)
            await p.room.send_xt('upmc', p.id, color)
            await p.send_xt('mm', 'Moodcolor updated', p.id)
        except ValueError:
            await p.send_xt('mm', 'You must enter a valid hexcode.', p.id)

    @commands.command('snowball', alias=['sb'])
    @permissions.has_or_moderator('nostalgia.snowball')
    async def set_snowball(self, p, color: str):
        try:
            color = str(int(color.lstrip('#'), 16))
            await p.set_custom_attribute('snowball', color)
            await p.room.send_xt('upsb', p.id, color)
            await p.send_xt('mm', 'Snowball colour updated', p.id)
        except ValueError:
            await p.send_xt('mm', 'You must enter a valid hexcode.', p.id)

    @handlers.handler(XTPacket('h', 'ng'))
    @permissions.has_or_moderator('nostalgia.nameglow')
    async def handle_set_nameglow(self, p, color: str):
        try:
            color = str(int(color.lstrip('#'), 16))
            await p.set_custom_attribute('nameglow', color)
            await p.room.send_xt('upng', p.id, color)
            await p.send_xt('mm', 'Nameglow updated', p.id)
        except ValueError:
            await p.send_xt('mm', 'You must enter a valid hexcode.', p.id)

    @handlers.handler(XTPacket('h', 'nc'))
    @permissions.has_or_moderator('nostalgia.namecolor')
    async def handle_set_namecolor(self, p, color: str):
        if color is 'r':
            await p.set_custom_attribute('namecolor', color)
            await p.room.send_xt('upnc', p.id, color)
            return await p.join_room(p.room)
        try:
            color = str(int(color.lstrip('#'), 16))
            await p.set_custom_attribute('namecolor', color)
            await p.room.send_xt('upnc', p.id, color)
            await p.send_xt('mm', 'Namecolor updated', p.id)
        except ValueError:
            await p.send_xt('mm', 'You must enter a valid hexcode.', p.id)

    @handlers.handler(XTPacket('h', 'bc'))
    @permissions.has_or_moderator('nostalgia.bubblecolor')
    async def handle_set_bubblecolor(self, p, color: str):
        try:
            color = str(int(color.lstrip('#'), 16))
            await p.set_custom_attribute('bubblecolor', color)
            await p.room.send_xt('upbc', p.id, color)
            await p.send_xt('mm', 'Bubblecolor updated', p.id)
        except ValueError:
            await p.send_xt('mm', 'You must enter a valid hexcode.', p.id)

    @handlers.handler(XTPacket('h', 'bt'))
    @permissions.has_or_moderator('nostalgia.bubbletext')
    async def handle_set_bubbletext(self, p, color: str):
        if color is 'r':
            await p.set_custom_attribute('bubbletext', color)
            await p.room.send_xt('upbt', p.id, color)
            return await p.join_room(p.room)
        try:
            color = str(int(color.lstrip('#'), 16))
            await p.set_custom_attribute('bubbletext', color)
            await p.room.send_xt('upbt', p.id, color)
            await p.send_xt('mm', 'Bubbletext updated', p.id)
        except ValueError:
            await p.send_xt('mm', 'You must enter a valid hexcode.', p.id)

    @handlers.handler(XTPacket('h', 'rc'))
    @permissions.has_or_moderator('nostalgia.ringcolor')
    async def handle_set_ringcolor(self, p, color: str):
        try:
            color = str(int(color.lstrip('#'), 16))
            await p.set_custom_attribute('ringcolor', color)
            await p.room.send_xt('uprc', p.id, color)
            await p.send_xt('mm', 'Ringcolor updated', p.id)
        except ValueError:
            await p.send_xt('mm', 'You must enter a valid hexcode.', p.id)

    @handlers.handler(XTPacket('h', 'size'))
    @permissions.has_or_moderator('nostalgia.size')
    async def handle_set_size(self, p, size: str):
        if '|' not in size:
            await p.set_custom_attribute('size', size)
            await p.room.send_xt('upsi', p.id, size)

    @handlers.handler(XTPacket('h', 'transparency'))
    @permissions.has_or_moderator('nostalgia.transparency')
    async def handle_set_transparency(self, p, transparency: str):
        if '|' not in transparency:
            await p.set_custom_attribute('transparency', transparency)
            await p.room.send_xt('upal', p.id, transparency)

    @handlers.handler(XTPacket('h', 'rotation'))
    @permissions.has_or_moderator('nostalgia.rotation')
    async def handle_set_rotation(self, p, rotation: str):
        if '|' not in rotation:
            await p.set_custom_attribute('rotation', rotation)
            await p.room.send_xt('uprt', p.id, rotation)

    @handlers.handler(XTPacket('h', 'walls'))
    @permissions.has_or_moderator('nostalgia.walls')
    async def handle_set_wow(self, p):
        wow_value = 0 if int(p.get_custom_attribute('walls')) is 1 else 1
        await p.set_custom_attribute('walls', str(wow_value))
        await p.room.send_xt('upws', p.id, str(wow_value))

    @handlers.handler(XTPacket('h', 'speed'))
    @permissions.has_or_moderator('nostalgia.speed')
    async def handle_set_speed(self, p, speed: str):
        if '|' not in speed and int(speed) in range(1, 500):
            await p.set_custom_attribute('speed', speed)
            return await p.room.send_xt('upsp', p.id, speed)
        await p.send_xt('mm', 'Your speed value must a number between 1 and 500.', p.id)

    @handlers.handler(XTPacket('h', 'mood'))
    @permissions.has_or_moderator('nostalgia.mood')
    async def handle_set_mood(self, p, mood: str):
        if '|' not in mood:
            await p.set_custom_attribute('mood', mood)
            await p.room.send_xt('upmd', p.id, mood)
            await p.join_room(p.room)

    @handlers.handler(XTPacket('h', 'mc'))
    @permissions.has_or_moderator('nostalgia.moodcolor')
    async def handle_set_moodcolor(self, p, color: str):
        try:
            color = str(int(color.lstrip('#'), 16))
            await p.set_custom_attribute('moodcolor', color)
            await p.room.send_xt('upmc', p.id, color)
            await p.send_xt('mm', 'Moodcolor updated', p.id)
        except ValueError:
            await p.send_xt('mm', 'You must enter a valid hexcode.', p.id)

    @handlers.handler(XTPacket('h', 'sb'))
    @permissions.has_or_moderator('nostalgia.snowball')
    async def handle_set_snowball(self, p, color: str):
        try:
            color = str(int(color.lstrip('#'), 16))
            await p.set_custom_attribute('snowball', color)
            await p.room.send_xt('upsb', p.id, color)
            await p.send_xt('mm', 'Snowball colour updated', p.id)
        except ValueError:
            await p.send_xt('mm', 'You must enter a valid hexcode.', p.id)


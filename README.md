# Nostalgia


## Setup

- Place the dependencies file (glows.swf) in your media-server `/legacy-media/play/v2/client`.

- Add an entry in `/legacy-media/play/v2/client/dependencies.json` for the dependency as shown:

```
{
    id: 'stampbook',
    title: 'StampBook'
},
{
    id: 'glows',
    title: 'Glows'
}
```

- Place the houdini plugin file within houdini's plugin folder. 

- Give permissions in the table `penguin_permission` for your penguin to use the commands.

## Commands

| Command Alias  | Permission Required | Arguments |
| ------------- | ------------- | ------------- |
| nameglow/ng  | nostalgia.nameglow  | hexcode |
| namecolor/nc  | nostalgia.namecolor  | hexcode or 'r' for rainbowfy |
| bubblecolor/bc  | nostalgia.bubblecolor  | hexcode |
| bubbletext/bt  | nostalgia.bubbletext  | hexcode or 'r' for rainbowfy |
| ringcolor/rc  | nostalgia.ringcolor  | hexcode |
| size/si  | nostalgia.size  | integer in range of 1 & 500 |
| transparency/tr  | nostalgia.transparency  | integer |
| rotation/ro  | nostalgia.rotation  | integer |
| wow  | nostalgia.walls  | None |
| speed/sp  | nostalgia.speed  | integer |
| mood/m  | nostalgia.mood  | string |
| moodcolor/mc  | nostalgia.moodcolor  | hexcode |
| snowball/sb  | nostalgia.snowball  | hexcode |

## Support

For more support, you can:
- refer to this more detailed [tutorial](https://solero.me/t/adding-openglows-to-houdini/190) 
- refer to our [Discord](https://discord.gg/87d42kd) server
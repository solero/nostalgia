# Nostalgia


## Setup

- Place the dependencies file (glows.swf) in your media-server `/media/play/v2/client`.

- Add an entry in `/media/play/v2/client/dependencies.json` for the dependency as shown:

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
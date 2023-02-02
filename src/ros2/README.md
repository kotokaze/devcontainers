
# ROS2 Workspace (ros2)

ROS2 Workspace with Web VNC

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| distro | ROS2 Distributions (Check the original image for more details https://hub.docker.com/r/tiryoh/ros2-desktop-vnc) | string | foxy |
| useZsh | Install and setup Zsh as default login shell | bool | false |

## Example Usage (Recommended method)

### Foxy with devcontainer cli

0. Create configuration files

> **Note**
> You can customize with the --template-args option

```bash
devcontainer templates apply \
  --workspace-folder ~/ws/ros2-ws \
  --template-id ghcr.io/kotokaze/devcontainers/ros2:latest \
  --template-args "{\"distro\":\"foxy\",\"useZsh\":\"true\"}"
```

1. Open the workspace folder with VSCode Remote-Containers

```bash
devcontainer open ~/ws/ros2-ws
```


---

_Note: This file was auto-generated from the [devcontainer-template.json](https://github.com/kotokaze/devcontainers/blob/main/src/ros2/devcontainer-template.json).  Add additional notes to a `NOTES.md`._

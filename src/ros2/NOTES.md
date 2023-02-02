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

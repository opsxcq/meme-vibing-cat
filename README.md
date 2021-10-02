# Vibing Cat generator script

![cat vibing](./print.png)

This script generates the Vibing Cat meme from a template

# Prerequisites

* ffmpeg
	- Ubuntu/Debian: `sudo apt install ffmpeg`
	- Arch: `sudo pacman -S ffmpeg`
	- Fedora/RHEL: `sudo dnf install ffmpeg` (requires RPM Fusion)

# Usage

```shell
./cat-vibing.sh -c OPSXCQ -d Github -x "Shit Posting"
```

# Help

```shell
  ----[ Cat Vibing meme Generator by OPSXCQ ]----
The general script's help msg
Usage: ./cat-vibing.sh [-o|--output <arg>] [-c|--cat-text <arg>] [-d|--drummer-text <arg>] [-x|--drum-text <arg>] [-v|--version] [-h|--help]
	-o, --output: output video for the meme (default: 'meme.mp4')
	-c, --cat-text: Text over the cat (default: 'OPSXCQ')
	-d, --drummer-text: Text over the drummer (default: 'Bash')
	-x, --drum-text: Text over the drum (default: 'Memes')
	-v, --version: Prints version
	-h, --help: Prints help
```

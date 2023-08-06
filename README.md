# dotfiles

For managing my dotfiles obviously

# Install

```console
./install_zsh.sh
./install.sh
```

# Testing

To test in a clean OS:

`docker build . -t dotfiles`

`docker run -rm -it --entrypoint //bin/bash dotfiles`

*// for Windows Bash behavior*

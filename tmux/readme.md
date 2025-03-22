Install commands:

```
# Backup existing ~/.config/tmux if it exists, using numbered backups (~1, ~2, etc.)
[ -d ~/.config/tmux ] && mv --backup=numbered ~/.config/tmux ~/.config/tmux_backup

# Clone the repository if ~/.config/tmux does not exist
git clone https://github.com/PoutineSyropErable/config_tmux ~/.config/tmux

# Backup existing ~/.tmux.conf if it exists, using numbered backups
[ -f ~/.tmux.conf ] && mv --backup=numbered ~/.tmux.conf ~/.tmux.conf.bak

# Create a symbolic link only if the cloned .tmux.conf exists
ln -s ~/.config/tmux/.tmux.conf ~/.tmux.conf

git clone --depth=1 https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


```

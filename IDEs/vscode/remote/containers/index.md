- https://code.visualstudio.com/docs/remote/containers
- https://code.visualstudio.com/docs/remote/containers#_personalizing-with-dotfile-repositories

Personalizing with dotfile repositories

in settings.json:

{
  "dotfiles.repository": "your-github-id/your-dotfiles-repo",
  "dotfiles.targetPath": "~/dotfiles",
  "dotfiles.installCommand": "~/dotfiles/install.sh"
}
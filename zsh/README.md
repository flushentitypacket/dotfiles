# zsh

```sh
brew install zsh

shell_path="$(which zsh)"
if ! grep "$shell_path" /etc/shells > /dev/null 2>&1 ; then
sudo sh -c "echo $shell_path >> /etc/shells"
fi
chsh -s "$shell_path"

ln -s `pwd`/zshrc ~/.zshrc
ln -s `pwd`/ddrc ~/.ddrc
cp ./secretsrc ~/.secretsrc
```

## Plugins

```sh
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting
brew install zsh-history-substring-search
```

## Prompt

https://github.com/denysdovhan/spaceship-prompt

# dotfiles

These are my dotfiles. There are many dotfiles like it, but these ones are mine.

### Mac Setup
---

#### iTerm2

Download iTerm2. Go to `Preferences > Keys`. 
```
Hotkey : Control+Space
```

#### Oh-My-Zsh

Download Oh-My-Zsh. Set theme to `avit`. Copy `avit` theme to custom directory:
```
cp ~/.oh-my-zsh/themes/avit.zsh-theme ~/.oh-my-zsh/custom
```
Comment out `LS-COLORS` section.

#### Spectacle

Download Spectacle
```
Center      : Shift+Command+C
Left Half   : Shift+Command+Left-Arrow
Right Half  : Shift+Command+Right-Arrow
Top Half    : Shift+Command+Top-Arrow
Bottom Half : Shift+Command+Bottom-Arrow
```

#### Default Screenshot Location

```
mkdir ~/Pictures/Screenshots
defaults write com.apple.screencapture location ~/Pictures/Screenshots
killall SystemUIServer
```

#### Mechanical Keyboard

For any Mac using 60% mechanical keyboard, complete the steps below

##### Remap Modifier Keys

Go to `System Preferences > Keyboard > Keyboard > Modifier Keys`

```
Caps Lock : Caps Lock
Control   : Control
Option    : Option
Command   : Command
```


##### DefaultKeyBinding.dict

```
mkdir ~/Library/KeyBindings
cp DefaultKeyBinding.dict ~/Library/KeyBindings
```

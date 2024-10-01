---
title: How to rename terminal tab title in gnome-terminal?
---

source: 
- https://unix.stackexchange.com/questions/177572/how-to-rename-terminal-tab-title-in-gnome-terminal
- https://github.com/ElectricRCAircraftGuy/eRCaGuy_dotfiles/blob/master/home/.bash_aliases#L250https://github.com/ElectricRCAircraftGuy/eRCaGuy_dotfiles/blob/master/home/.bash_aliases#L250

```bash
# Set the title string at the top of your current terminal window or terminal window tab.
# See: https://unix.stackexchange.com/questions/177572/how-to-rename-terminal-tab-title-in-gnome-terminal/566383#566383
# and: https://askubuntu.com/questions/315408/open-terminal-with-multiple-tabs-and-execute-application/1026563#1026563
# - Example usage:
#   - A) Static title strings (title remains fixed):
#     - `gs_set_title my tab 1` OR `gs_set_title "my tab 1"`
#     - `gs_set_title $PWD` OR `gs_set_title "$PWD"`
#   - B) Dynamic title strings (title updates each time you enter any terminal command): you may
#     use function calls or variables within your title string and have them *dynamically*
#     updated each time you enter a new command. Simply enter a command or access a global
#     variable inside your title string. **Be sure to use _single quotes_ (`'`) around the title
#     string for this to work!**:
#     - `gs_set_title '$PWD'` - this updates the title to the Present Working Directory every
#        time you `cd` to a new directory!
#     - `gs_set_title '$(date "+%m/%d/%Y - %k:%M:%S")'` - this updates the title to the new
#        date and time every time it changes *and* you enter a new terminal command! The
#        date output of the above command looks like this: `02/06/2020 - 23:32:58`
gs_set_title() {
    CMD="gs_set_title"
    # Help menu
    if [ "$1" == "-h" ] || [ "$1" == "-?" ]; then
        echo "Set the title of your currently-opened terminal tab."
        echo "Usage:"
        echo "  1. set a **static** title"
        echo "          $CMD any title you want"
        echo "          # OR"
        echo "          $CMD \"any title you want\""
        echo "  2. set a **dynamic** title, which relies on variables or functions"
        echo "          $CMD '\$(some_cmd)'       # with a dynamically-run command"
        echo "          $CMD '\${SOME_VARIABLE}'  # with a dynamically-expanded variable"
        echo ""
        echo "Examples:"
        echo "  1. static title"
        echo "          $CMD my new title"
        echo "  2. dynamic title"
        echo "          $CMD 'Current Directory is \"\$PWD\"'"
        echo "          $CMD 'Date and time of last cmd is \"\$(date)\"'"
        echo "          # [MY FAVORITE!] To actively show just the directory name"
        echo "          $CMD '\$(basename \"\$(pwd)\")'"
        return $EXIT_SUCCESS
    fi

    TITLE="$@"
    # Set the PS1 title escape sequence; see "Customizing the terminal window title" here:
    # https://wiki.archlinux.org/index.php/Bash/Prompt_customization#Customizing_the_terminal_window_title
    ESCAPED_TITLE="\[\e]2;${TITLE}\a\]"

    # Delete any existing title strings, if any, in the current PS1 variable. See my Q here:
    # https://askubuntu.com/questions/1310665/how-to-replace-terminal-title-using-sed-in-ps1-prompt-string
    PS1_NO_TITLE="$(echo "$PS1" | sed 's|\\\[\\e\]2;.*\\a\\\]||g')"
    PS1="${PS1_NO_TITLE}${ESCAPED_TITLE}"
}
```

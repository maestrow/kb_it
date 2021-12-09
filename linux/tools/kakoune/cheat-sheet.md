The documentation will write keyboard commands like `c-o` and `a-X`. 
`c` means Ctrl. `a` means Alt. Capital letter means you need to hold Shift.

# Insert mode

    <esc> enter command mode
    :q    exit
    :w    save file

# Command mode

    i     enter insert mode

## Navigate

    b w word
    h l char
    a-h a-l beginning or end of line and create selection
    a-n n Prev Next Selection
    

Hold Shift key with any selection command to Add selection.

Menus:
    g goto
    [ or ] Select Surrounding Object
    v center

## Selection

    % Select all text.
    s Subselect

## Editing

    u Undo last edit.
    y Copy (yank) current selection.
    p Past what was copied.
    ` Uppercase selection.
    ~ Lowercase selection.

# Commands

    :e open file for (e)diting



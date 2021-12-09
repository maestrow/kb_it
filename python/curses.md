https://www.devdungeon.com/content/curses-programming-python

```py
import curses

screen = curses.initscr()

screen.addstr(0, 0, "This string gets printed at position (0, 0)")
screen.addch(5, 5, "Y")
# Changes go in to the screen buffer and only get
# displayed after calling `refresh()` to update
screen.refresh()

curses.napms(3000)
curses.endwin()
```


screen.clear()   # Wipe the screen buffer and set the cursor to 0,0
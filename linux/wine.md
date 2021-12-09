# WINE

## How to disable windbg popups?

Problem: Иногда в процессе работы windows-программы открываются окна с сообщениями об ошибке от процесса winedbg. Сама программа работает корректно, однако сообщения доставляют неудобство. Как их убрать?
Solution: 

`winetricks nocrashdialog`

Source: https://wiki.winehq.org/FAQ#How_do_I_disable_the_GUI_crash_dialog.3F
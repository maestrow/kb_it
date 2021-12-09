# Управление службами

systemctl
- disable
- status
- start
- stop
- restart

journalctl -f -u <unit>

## Recipes

### Remove all journal entries

To remove all journal entries (including active journal files, which are marked as archived by the --rotate command), use:

```
sudo journalctl --rotate
sudo journalctl --vacuum-time=1s
```
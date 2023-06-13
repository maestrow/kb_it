Panel 1:

    ping ya.ru 2>&1 | while read pong; do echo "$(date): $pong"; done | tee ~/ya-ru-ping-20220915.txt

Panel 2:

    tail -f ~/ya-ru-ping-20220915.txt | grep "Network is unreachable"


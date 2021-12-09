Тупой способ:

```
    root /usr/share/nginx/html/;
    index maintenance.html;
    location / {
        try_files /maintenance.html =503;
    }
```

Лучший способ:
- https://help.sorryapp.com/en/articles/2783542-install-maintenance-pages-on-nginx
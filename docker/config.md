# ~/.docker/config.json

Sample:

```json
{
	"auths": {
		"repo.example.com": {
			"auth": "..........................................=="
		},
		"https://index.docker.io/v1/": {
			"auth": "......................................................=="
		}
	},
	"HttpHeaders": {
		"User-Agent": "Docker-Client/19.03.2 (linux)"
	}
}
```

`auth` is simply a base64 encoded 'username:password' string.
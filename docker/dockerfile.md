## Variables

Dockerfile:
```
ARG version
ENV VERSION $version
RUN dotnet publish --no-restore -c Release -o out -p:Version=$VERSION
```

Build:
`docker build --build-arg version=3`
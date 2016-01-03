[Upsource](https://www.jetbrains.com/upsource/) is a code review tool from [JetBrains](https://www.jetbrains.com/).

## How to use the image

It is recommended to use a data container to persist the application data:
```
docker run --name upsource-data \
  -v /opt/Upsource/conf \
  -v /opt/Upsource/data \
  -v /opt/Upsource/logs \
  -v /opt/Upsource/backups \
  busybox chown -R 999: /opt/Upsource
```
Run Upsource container:

# Debug Mode #

```
docker run --rm \ 
 --volumes-from upsource-data \
  -p 8080:8080 --name upsource lynnchin/docker-upsource
```
# Production Mode #
```
docker run -d --rm \ 
 --volumes-from upsource-data \
  -p 8080:8080 --name upsource lynnchin/docker-upsource
```

Open up URL: http://localhost:8080/ to start Upsource configuration

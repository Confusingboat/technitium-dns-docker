## Docker Run Example

```
docker run \
  --name=technitium-dns \
  -e TZ='America/Chicago' \
  -p 5380:5380 \
  -p 53:53 \
  -p 53:53/udp \
  -v /path/to/config/dir:/etc/dns/config \
  -v /path/to/log/dir:/etc/dns/config/logs \
  confusingboat/technitium-dns:latest
```

## Kubernetes + High Availability
With some trickery you can have a HA DNS cluster on Kubernetes by creating a single instance deployment for the web admin
with the config dir mounted `rw`, and by creating another deployment of n-instances that mounts the config path `ro` and
mounting the log path `rw` to an ephemeral location.

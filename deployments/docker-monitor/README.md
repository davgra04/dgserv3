whoami
======

An example deployment using containous/whoami.

## Setup

### Deploy

```bash
# bring deployment up
docker-compose --env-file=../../dgserv-variables.env -f docker-compose.whoami.yaml up -d

# tear down deployment
docker-compose --env-file=../../dgserv-variables.env -f docker-compose.whoami.yaml down
```

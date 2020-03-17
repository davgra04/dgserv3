wekan
=====

A deployment for Wekan, an open-source kanban solution.

## Setup

### Deploy

```bash
# bring deployment up
docker-compose --env-file=../../dgserv-variables.env -f docker-compose.wekan.yaml up -d

# tear down deployment
docker-compose --env-file=../../dgserv-variables.env -f docker-compose.wekan.yaml down
```

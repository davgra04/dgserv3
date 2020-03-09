goal_blog
=========

A simple [TiddlyWiki](https://tiddlywiki.com/) deployment to be used as a personal goal-tracking blog.

## Setup

### Create credentials.csv

Before building, set up credentials by saving the following to credentials.csv:

```bash
# credentials.csv
username,password
myuser,mypass
```

This will be baked into the docker image for TiddlyWiki's BasicAuth.

### Build Docker Image

```bash
docker build --env-file=goalblog-variables.env -t goal_blog .
```

### Deploy

```bash
# bring deployment up
docker-compose --env-file=../../dgserv-variables.env -f docker-compose.goal_blog.yaml up -d

# tear down deployment
docker-compose --env-file=../../dgserv-variables.env -f docker-compose.goal_blog.yaml down
```

## Backing up to local machine

Simply run `backup.sh`. This tunnels the docker socket according to dgserv-variables.env.

Also included is `crontab.txt`, a crontab entry for backing up daily at 1:00am

# berkley-db-docker-cron
*Post Build Usage:*
```
---
version: '3'
services:
  mantainance:
    restart: always
    image: darmagedon/berkley-db-docker-cron
    volumes:
      - /path/to/log/folder:/logs-folder
    environment:
      - DIRS=/logs-folder
      - SCHEDULE=23 10 * * *
```

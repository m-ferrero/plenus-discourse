#!/bin/bash

# init /shared
[ `ls -1A /shared/ | grep -v ^lost+found$ | wc -l` -eq 0 ] && rsync -ax /bootstrap-shared/ /shared/ || true

# fix permissions
chown -R discourse:www-data /shared/backups/ /shared/uploads/ /shared/log/rails/
chown -R postgres:postgres /shared/postgres_backup/ /shared/postgres_data/ /shared/postgres_run/
chown -R redis:redis /shared/redis_data/

# boot discourse
/sbin/boot

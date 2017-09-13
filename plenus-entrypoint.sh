#!/bin/bash

# init or update db
if [ ! -f /shared/state/plenus/db_initialized ]; then
  rake db:migrate
  mkdir -p /shared/state/plenus
  touch /shared/state/plenus/db_initialized
fi

# init SiteSetting.notification_email on first startup
if [ ! -f /shared/state/plenus/notification_email_set ]; then
  rails r "SiteSetting.notification_email='$NOTIFICATION_EMAIL'"
  mkdir -p /shared/state/plenus
  touch /shared/state/plenus/notification_email_set
fi

# fix permissions on /shared/backups/
# needed if the directory is used as a mount point for a nested volume
# because in this case discourse will not create the directory and permissions would be wrong
if [ -d /shared/backups/ ]; then
  chown discourse:www-data /shared/backups/
fi

# boot discourse
/sbin/boot

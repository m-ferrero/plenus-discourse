#!/bin/bash

# init or update db
rake db:migrate


# init SiteSetting.notification_email on first startup
if [ ! -f /shared/state/plenus/notification_email_set ]; then
  rails r "SiteSetting.notification_email='$NOTIFICATION_EMAIL'"
  mkdir -p /shared/state/plenus
  touch /shared/state/plenus/notification_email_set
fi

# boot discourse
/sbin/boot

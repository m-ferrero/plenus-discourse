#!/bin/bash

# init or update db
rake db:migrate

# init SiteSetting.notification_email (only if empty)
rails r "if SiteSetting.notification_email == '' then SiteSetting.notification_email='$NOTIFICATION_EMAIL' end"

# boot discourse
/sbin/boot

#!/bin/bash

# init or update db
rake db:migrate

# init SiteSetting.notification_email (only if empty or with default value)
rails r "if SiteSetting.notification_email == '' or SiteSetting.notification_email == 'noreply@unconfigured.discourse.org' then SiteSetting.notification_email='$NOTIFICATION_EMAIL' end"

# boot discourse
/sbin/boot

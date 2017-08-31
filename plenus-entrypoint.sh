#!/bin/bash

# init or update db
rake db:migrate

# boot discourse
/sbin/boot

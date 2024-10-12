#!/bin/sh

# Start the Postgres server

mkdir ~/data

chmod 750 ~/data

/usr/lib/postgresql/15/bin/initdb -D ~/data

/usr/lib/postgresql/15/bin/pg_ctl -D ~/data



#!/bin/sh

# Start the Postgres server

mkdir ~/data

chmod 750 ~/data

touch ~/pgpass

echo $PGPASSWORD

echo $PGPASSWORD > ~/pgpass

/usr/lib/postgresql/15/bin/initdb -D ~/data -U $PGUSER --pwfile=/home/nonroot/pgpass

echo "unix_socket_directories = '/home/nonroot/data'" >> ~/data/postgresql.conf
echo "listen_addresses = '*'" >> ~/data/postgresql.conf
echo "host    all             all             0.0.0.0/0               md5" >> ~/data/pg_hba.conf
echo "host    all             all             ::/0                    md5" >> ~/data/pg_hba.conf

/usr/lib/postgresql/15/bin/postgres -D ~/data


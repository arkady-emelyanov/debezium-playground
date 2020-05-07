#!/usr/bin/env bash

echo "Setting up logical replication"
sed -i 's/^.*wal_level.*/wal_level=logical/g' /var/lib/postgresql/data/postgresql.conf

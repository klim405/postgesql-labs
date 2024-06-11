# Копируем базу
pg_basebackup -h pg113 -D $PGDATA -U replicator -P -R -v --wal-method=stream
cat config/recovery.conf > $PGDATA/postgresql.conf
pg_ctl stop
rm -rf $PGDATA
pg_basebackup -h pg117 -D $PGDATA -U replicator -P -v --wal-method=stream
cp config/postgresql.conf $PGDATA/postgresql.conf
pg_ctl start

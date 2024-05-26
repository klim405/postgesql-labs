cp config/postgresql.conf $PGDATA/postgresql.conf
cp config/pg_hba.conf $PGDATA/pg_hba.conf
pg_ctl start
sleep 3
createuser postgres2 -s -p 9483
createdb postgres2 -p 9483
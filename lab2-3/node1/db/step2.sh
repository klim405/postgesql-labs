cp config/postgresql.conf $PGDATA/postgresql.conf
cp config/pg_hba.conf $PGDATA/pg_hba.conf
pg_ctl start
sleep 3
createuser postgres2 -s
createdb postgres2
createuser postgres1 -s
createdb postgres1
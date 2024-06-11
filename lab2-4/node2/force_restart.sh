rm $HOME/failover
pg_ctl stop
rm -rf $PGDATA
./step1.sh
pg_ctl start

touch $HOME/failover
sleep 5
psql -h localhost -d test -U user0 -f sql/create_test_data.sql
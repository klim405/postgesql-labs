mkdir $HOME/qnz7
psql -f sql/init_tablespace.sql
psql -h localhost -d sickgreenhair -U user0 -f sql/create_test_data.sql

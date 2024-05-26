mkdir $HOME/qnz7
psql -p 9483 -f sql/init_tablespace.sql
psql -h localhost -p 9483 -d sickgreenhair -U user0 -f sql/create_test_data.sql

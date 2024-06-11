# Инициализация
initdb
# Установка конфигов
cp config/postgresql.conf $PGDATA/postgresql.conf
cp config/pg_hba.conf $PGDATA/pg_hba.conf
pg_ctl start
sleep 3
# Добавление пользователей
createuser postgres2 -s
createdb postgres2
createuser postgres1 -s
createdb postgres1

psql -f sql/create_users.sql
psql -d test -f sql/create_test_tables.sql
psql -d test -f sql/create_test_data.sql
psql -d test -f sql/grant_roles.sql


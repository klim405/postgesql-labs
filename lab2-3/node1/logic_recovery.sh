# Делаем верные запросы
psql -d sickgreenhair -f sql/insert.sql
# Создаем резервную копию
./dump.sh
# Повреждаем данные
psql -d sickgreenhair -f sql/drop.sql
# Поднимаем pg сервер и создаем pg.dump
echo "Ожидаем создание дампа"
ssh pg117 "./node2/logic_recovery_2.sh"
# Копируем pg.dump
echo "Ожидаем завершение скачивания дампа"
scp pg117:~/pg.dump ~/pg.dump
echo "Скачивания дампа завершено"
pg_restore -d sickgreenhair -c ~/pg.dump
echo "Восстановление завершено"
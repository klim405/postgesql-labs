# Восстанавливаем последнюю версию
export PGDATA=/var/db/postgres1/tvu35
export PGPORT=9483
cd ~/node2
./recovery.sh
# Запускаем pg сервер
pg_ctl start 1>/dev/null
# Создаем дамп
pg_dump -Fc 1>~/pg.dump
echo "Дамп сохранен на узле 2"

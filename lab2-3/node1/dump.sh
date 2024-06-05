
BACKUP_DIR="backup_$(date +"%Y-%m-%d_%H:%M:%S")"
TBLSPC_DIR="qnz7_$(date +"%Y-%m-%d_%H:%M:%S")"

# Выполняем полное резервное копирование с помощью pg_basebackup
pg_basebackup -D ~/backups/${BACKUP_DIR} -X s -T /var/db/postgres2/qnz7=/var/db/postgres2/backups/${TBLSPC_DIR} -p 9483

# Копируем копию на резервный узел
scp -r ~/backups/${BACKUP_DIR} postgres1@pg117:~/backups/${BACKUP_DIR} 1>/dev/null

# Копируем табличное пространство на резервный узел
scp -r ~/backups/${TBLSPC_DIR} postgres1@pg117:~/backups/${TBLSPC_DIR} 1>/dev/null

# Удаляем старые копии на основном узле
find ~/backups -type d -mtime +7 -exec rm -rf {} \;

# Запускаем скрипт удаления старых копий на резервном узле
ssh pg117 ./node2/remove_old.sh

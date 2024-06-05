last_tablespace=`ls ~/backups/ | sort -r | grep qnz7 | head -1`
last_pgdata=`ls ~/backups/ | sort -r | grep backup | head -1`

echo "Использованы резервные копии: $last_tablespace $last_pgdata"

pg_ctl stop 2>/dev/null

rm -rf ~/qnz7
rm -rf $PGDATA

cp -r ~/backups/$last_pgdata $PGDATA
cp -r ~/backups/$last_tablespace ~/qnz7

echo "Восстановление завершено"

scp -r pg117:backups ~/ 1>/dev/null
./recovery.sh
pg_ctl start
find ~/backups/* -type d -mtime +30 -exec rm -rf {} \;
ssh pg113 "echo 'Привет с резервного узла! Старые файлы удалены'"
#!/bin/sh

echo "Hello, World!"
source ../.env
echo $DB_USERNAME
echo $C9_HOSTNAME

mysql -u $DB_USERNAME -p $DB_PASSWORD $DB_DATABASE < hoge.sql >out.txt
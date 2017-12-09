#!/bin/bash

mysqladmin -h docker.angeloneacsu.com -u root --password=pass -P 53306 status

mysql --host=docker.angeloneacsu.com --user=root --password=pass -P 53306 -e "CREATE DATABASE db1;"
cat mysql/unit_test.sql | mysql --host=docker.angeloneacsu.com --user=root --password=pass -P 53306 db1



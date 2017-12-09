#!/bin/bash

mysqladmin -h docker.angeloneacsu.com -P 53306 -u root status

mysql --host=docker.angeloneacsu.com -P 53306 --user=root --password=pass  < unit_test.sql


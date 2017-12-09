#!/bin/bash

mysqladmin -h docker.angeloneacsu.com -P 53306 -u root status

mysql --host=docker.angeloneacsu.com -P 53306 --user=root --password=pass  < mysql/unit_test.sql


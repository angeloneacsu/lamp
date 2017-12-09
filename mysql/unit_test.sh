#!/bin/bash

mysqladmin -h docker.angeloneacsu.com -u root --password=pass -P 53306 status
mysqladmin -h docker.angeloneacsu.com -u root --password=pass -P 53306 create databasename db1 \
&& \
mysql --host=docker.angeloneacsu.com -P 53306 -u root --password=pass db1  < mysql/unit_test.sql



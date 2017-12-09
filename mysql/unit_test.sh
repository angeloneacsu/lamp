#!/bin/bash

mysqladmin -h docker.angeloneacsu.com -u root --password=pass -P 53306 status

mysql --host=docker.angeloneacsu.com -P 53306 -u root --password=pass  < mysql/unit_test.sql


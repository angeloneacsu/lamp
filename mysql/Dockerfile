FROM mysql:5.6

# allow mysql data to be persistent
VOLUME ["/var/lib/mysql"]

# default password for testing only
ENV MYSQL_ROOT_PASSWORD pass

RUN mysql -u root -p  -e "create database db1; use db1; create table t1 (name varchar(20)); insert into t1 (name) values ('testname');"



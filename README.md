# SQL-Server Tool

Sql Server tool is a docker image built by debian for linux-x64 architecture, that use the Microsoft [SqlPackage](https://docs.microsoft.com/en-us/sql/tools/sqlpackage?view=sql-server-2017) to manage the operations for SQL Server instances. 

## Export an existing database

Export an existing database

```
docker run -v $local_directory:$container_directory kallsu/sql-server-tool 

docker exec -ti $container_name sqlpackage /a:Export /ssn:tcp:<ServerURL>,1433 /sdn:<DatabaseName> /su:<UserName> /sp:<Password> /tf:<TargetFile>
```
Where `<TargetFile>` refers as base path the `$container_directory` .

**i.e**

```
docker run -v /home/kallsu/sql_backup:/mnt/ kallsu/sql-server-tool 

docker exec -ti $container_name sqlpackage /a:Export /ssn:tcp:192.168.10.123,1433 /sdn:my-database /su:my-user /sp:MyPassword /tf:/mnt/my-database.bacpac
``

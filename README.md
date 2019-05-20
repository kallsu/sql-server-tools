# SQL-Server Tool

## EXPORT MSSQL data

To export an existing MSSQL database, reachable on the network, run following command:

```

 docker run -ti -v <LOCAL_DIRECTORY>:/sql_data_volume  kallsu/sql-server-tool \
    /opt/sqlpackage/./sqlpackage /a:Export /ssn:<DNS_NAME_OR_IPL>,<PORT> /sdn:<DB_NAME> /su:<USERNAME> /sp:<USER_PWD> /tf:/sql_volume/<FILE_NAME>
 
```

Assuming that:

```

 LOCAL_DIRECTORY = ~/tmp_data_volume
 DNS_NAME_OR_IP
 PORT = 1433
 DB_NAME = docker_test
 USERNAME = sa
 USER_PWD = Passw0rd1234!
 FILE_NAME = test.bacpac

```

The command will be:

```

 docker run -ti --user root  -v /home/kallsu/sql_volume:/sql_volume kallsu/sql-server-tool \
    /opt/sqlpackage/./sqlpackage /a:Export /ssn:localhost,1433 /sdn:docker_test /su:sa /sp:Passw0rd1234! /tf:/sql_volume/test.bacpac

```

Other possible combinations are allowed according specific cases, in these cases please visit the document of (SQLPackage here)[https://docs.microsoft.com/en-us/sql/tools/sqlpackage?view=sql-server-2017#export-parameters-and-properties]


**Note** : The documentation is written by Windows CLI interpreter, under Linux the command differs a bit.

## EXPORT MSSQL structure



## IMPORT

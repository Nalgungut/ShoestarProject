create tablespace teamProjectData
datafile 'D:\Programs\Oracle\oradata\orcl\team_data.dbf'
size 20M
autoextend on
next 3M
maxsize 500M;

create user shoestar identified by shoes1234
default tablespace teamProjectData
temporary tablespace temp;

grant connect, resource to shoestar;
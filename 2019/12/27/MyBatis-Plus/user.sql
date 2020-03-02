drop table if exists user;

create table user(
id bigint(20) not null comment '主键ID',
name varchar(30) not null comment '姓名',
age int(11) not null comment '年龄',
email varchar(50) not null comment '邮件',
create_time timestamp comment '注册时间',
update_time timestamp comment '更新时间',
primary key (id)
)

alter table user add column version int default 1;

select * from user;

alter table user add column deleted boolean default 0;

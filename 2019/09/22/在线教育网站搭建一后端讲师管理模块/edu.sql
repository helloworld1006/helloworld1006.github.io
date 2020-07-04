create database online default character set utf8;

show databases;

use online;

drop table if exists edu_teacher;

create table edu_teacher(
	id char(19) not null comment '讲师ID',
	name varchar(20) not null comment '讲师姓名',
	intro varchar(255) not null comment '讲师资历',
	career text comment '讲师简介',
	level int(10) unsigned not null comment '头衔 1高级讲师 2首席讲师',
	avatar varchar(255) default null comment '讲师头像',
	sort int(10) unsigned not null default 0 comment '排序',
	is_deleted tinyint(1) unsigned not null default 0 comment '逻辑删除 1 表示删除，0 表示未删除',
	gmt_create datetime not null comment '创建时间',
	gmt_modified datetime not null comment '更新时间',
	primary key(id),
	key idx_name(name)
)

alter table edu_teacher add rate decimal(10,1) unsigned not null default '5.0' comment '讲师评分';

alter table edu_teacher modify gmt_create datetime not null comment '创建时间';
alter table edu_teacher modify gmt_modified datetime not null comment '更新时间';

select * from edu_teacher order by sort desc;

SELECT count(*) FROM edu_teacher WHERE is_deleted=0

drop table if exists edu_subject;

create table edu_subject(
  id char(19) not null comment '课程类别ID',
  title varchar(50) not null comment '类别名称',
  parent_id char(19) not null default '0' comment '父课程ID',
  sort int(10) unsigned not null default '0' comment '排序字段',
  gmt_create datetime not null comment '创建时间',
  gmt_modified datetime not null comment '更新时间',
  primary key (id),
  key idx_parent_id (parent_id)
)

alter table edu_subject add is_deleted tinyint(1) unsigned not null default 0 comment '逻辑删除 1 表示删除，0 表示未删除';

alter table edu_subject modify gmt_create datetime not null comment '创建时间';
alter table edu_subject modify gmt_modified datetime not null comment '更新时间';

select * from edu_subject where id='1234965930556063746'

DROP TABLE IF EXISTS edu_course;

create table edu_course(
  id char(19) not null comment '课程ID',
  teacher_id char(19) not null comment '课程讲师ID',
  subject_id char(19) not null comment '课程专业ID',
  title varchar(50) not null comment '课程标题',
  price decimal(10,2) unsigned not null default '0.00' comment '课程销售价格，设置为0则可免费观看',
  lesson_num int(10) unsigned not null default '0' comment '总课时',
  cover varchar(255) CHARACTER SET utf8 null comment '课程封面图片路径',
  buy_count bigint(10) unsigned not null default'0' COMMENT '销售数量',
  view_count bigint(10) unsigned not null default '0' COMMENT '浏览数量',
  version int(20) not null default '1' COMMENT '乐观锁',
  status varchar(10) not null default 'Draft' comment '视频状态 Draft未发布  Normal已发布',
  gmt_create datetime not null comment '创建时间',
  gmt_modified datetime not null comment '更新时间',
  primary key (id),
  key idx_title (title),
  key idx_subject_id (subject_id),
  key idx_teacher_id (teacher_id)
)comment '课程表'

select count(*) from edu_course c where Date(c.gmt_create) ='2020-04-11'

alter table edu_course modify lesson_num bigint(10) unsigned not null default '0' comment '总课时';

alter table edu_course add subject_name text not null comment '类别名称';
alter table edu_course add teacher_name varchar(20) not null comment '讲师姓名';

alter table edu_course add keyword varchar(255) not null comment '课程摘要';

alter table edu_course modify gmt_create datetime not null comment '创建时间';
alter table edu_course modify gmt_modified datetime not null comment '更新时间';

delete from edu_course;

select * from edu_course order by price

select count(*) from edu_course

alter table edu_course add column es_flag tinyint(1) unsigned not null default '0' comment '是否被添加到elasticsearch';

alter table edu_course modify es_flag bigint(10) not null default '0' comment '是否被添加到elasticsearch';

alter table edu_course rename column es_flag to current

update edu_course set es_flag = 0

drop table if exists edu_course_description;

create table edu_course_description(
  id char(19) not null comment '课程ID',
  description text comment '课程简介',
  gmt_create datetime not null comment '创建时间',
  gmt_modified datetime not null comment '更新时间',
  primary key (id)
) comment '课程描述表'

alter table edu_course_description modify description longtext comment '课程简介';
alter table edu_course_description modify gmt_create datetime not null comment '创建时间';
alter table edu_course_description modify gmt_modified datetime not null comment '更新时间';

delete from edu_course_description;

select * from edu_course_description;

select c.id,c.title,d.description,c.cover,c.version from edu_course c left join edu_course_description d on c.id=d.id

drop table if exists edu_chapter

create table edu_chapter (
  id char(19) not null comment '章节ID',
  course_id char(19) not null comment '课程ID',
  title varchar(50) not null comment '章节名称',
  sort int(10) unsigned not null default '0' comment '显示排序',
  gmt_create datetime not null comment '创建时间',
  gmt_modified datetime not null comment '更新时间',
  primary key (id),
  key idx_course_id (course_id)
)
select * from edu_chapter ORDER BY sort desc;

DELETE from edu_chapter

alter table edu_chapter modify gmt_create datetime not null comment '创建时间';
alter table edu_chapter modify gmt_modified datetime not null comment '更新时间';


drop table if exists edu_video

create table edu_video (
  id char(19) not null comment '视频ID',
  course_id char(19) not null comment '课程ID',
  chapter_id char(19) not null comment '章节ID',
  title varchar(50) not null comment '节点名称',
  sort int(10) unsigned not null default '0' comment '排序字段',
  play_count bigint(20) unsigned not null default '0' comment '播放次数',
  is_free tinyint(1) unsigned not null default '0' comment '是否可以试听：0免费 1收费',
  video_source_id varchar(100) default null comment '视频资源',
  duration float not null default '0' comment '视频时长（秒）',
  status varchar(20) not null default '' comment '视频状态:见阿里云文档',
	video_original_name varchar(50) default null comment '视频名称'
  size bigint(20) unsigned not null default '0' comment '视频源文件大小（字节）',
  version bigint(20) unsigned not null default '1' comment '乐观锁',
  gmt_create datetime not null comment '创建时间',
  gmt_modified datetime not null comment '更新时间',
  primary key (id),
  KEY idx_course_id (course_id),
  KEY idx_chapter_id (chapter_id)
) 

alter table edu_video modify duration float not null default '0' comment '视频时长（秒）';
alter table edu_video modify gmt_modified datetime not null comment '更新时间';

alter table edu_video add column video_original_name varchar(50) default null comment '视频名称'

alter table edu_video modify duration double(10,3) unsigned not null default '0.000'

select * from edu_video

select * from edu_course c left outer join edu_video v on c.id =v.course_id where v.vie='6a510c0c31264392874913d636dbe38a'

delete from edu_video where id ='1237658295855034369'

select c.id id,c.title title, c.lesson_num lessonNum,c.price price, c.cover cover,cd.description description, t.name teacherName,es.title subjectName
		from edu_course c
				left outer join edu_course_description cd on c.id = cd.id
				left outer join edu_teacher t on c.teacher_id=t.id
				left outer join edu_subject es on c.subject_id=es.id
		where c.id='1235822849831206914';
		
		
select c.id,c.title,c.price,c.cover,c.view_count,c.lesson_num,c.buy_count,
			 cd.description,
			 et.id teacherId,et.name teacherName,et.avatar,et.intro,
			 es.id subjecId
from edu_course c
left outer join edu_course_description cd on c.id=cd.id
left outer join edu_teacher et on c.teacher_id=et.id
left outer join edu_subject es on c.subject_id = es.id
where c.id = '1235822849831206914';
				
				
drop table if exists statistics_daily;

create table statistics_daily (
  id char(19) not null comment '主键',
  date_calculate varchar(20) not null comment '统计日期',
  register_num bigint(20) not null default '0' comment '注册人数',
  login_num bigint(20) not null default '0' comment '登录人数',
  video_view_num bigint(20) not null default '0' comment '每日播放视频数',
  course_num bigint(20) not null default '0' comment '每日新增课程数',
  gmt_create datetime not null comment '创建时间',
  gmt_modified datetime not null comment '更新时间',
  primary key (id),
  key statistics_day (date_calculate)
)comment='网站统计日数据';

select * from statistics_daily;

DELETE FROM statistics_daily where date_calculate='2020-03-29'

SELECT * FROM statistics_daily order by date_calculate

drop table if exists ucenter_member;

create table ucenter_member (
  id char(19) not null comment '会员id',
  openid varchar(128) default null comment '微信openid',
  mobile varchar(20) default null comment '手机号',
  password varchar(255) default null comment '密码',
  nickname varchar(50) default null comment '昵称',
  sex tinyint(2) unsigned default null comment '性别 1 女，2 男',
  age tinyint(3) unsigned default null comment '年龄',
  avatar varchar(255) default null comment '用户头像',
  sign varchar(100) default null comment '用户签名',
  is_disabled tinyint(1) not null default  '0' comment '是否禁用 1（true）已禁用，  0（false）未禁用',
  is_deleted tinyint(1) not null default  '0' comment '逻辑删除 1（true）已删除， 0（false）未删除',
  gmt_create datetime not null comment '创建时间',
  gmt_modified datetime not null comment '更新时间',
  primary key (id)
) comment'会员表';

select count(*) from ucenter_member u where Date(u.gmt_create)='2019-01-19'

select count(*) from ucenter_member u where Date(u.last_login)='2020-05-06'

alter table ucenter_member add column login_ip varchar(255) default null comment '登录时用户IP'

select * from ucenter_member where nickname='小王';


drop table if exists edu_admin;

create table edu_admin(
 id char(19) not null comment '管理员ID',
 username varchar(50) default null comment '管理员姓名',
 password varchar(255) default null comment '管理员密码',
 introduction varchar(100) default null comment '签名',
 avatar varchar(255) default null comment '管理员头像',
 gmt_create datetime not null comment '创建时间',
 gmt_login datetime not null comment '登录时间',
 gmt_modified datetime not null comment '更新时间',
 primary key(id)
)

select * from edu_admin;

alter table edu_admin add role_name longtext not null comment '权限名'

alter table edu_admin add is_deleted tinyint(1) unsigned not null default 0 comment '逻辑删除 1 表示删除，0 表示未删除';

alter table edu_admin modify gmt_login datetime not null comment '创建时间';
alter table edu_admin modify gmt_create datetime not null comment '创建时间';
alter table edu_admin modify gmt_modified datetime not null comment '更新时间';



drop table if exists edu_admin_role; 

create table edu_admin_role(
 id char(19) not null comment '权限ID',
 role_name varchar(50) not null comment '权限名',
 admin_id char(19) not null comment '管理员ID',
 gmt_create datetime not null comment '创建时间',
 gmt_modified datetime not null comment '更新时间',
 primary key(id)
)

select * from edu_admin_role;

drop table if exists edu_order;

create table edu_order(
  id char(19) not null comment '订单ID',
	trade_no char(40) null comment '支付宝交易号',
	course_id char(19) not null comment '课程ID',
	ucenter_id char(19) not null comment '用户ID',
	ucenter_username varchar(50) default null comment '用户名',
	ucenter_mobile varchar(20) not null comment '用户手机号',
	course_title varchar(50) not null comment '课程标题',
	course_price decimal(10,2) unsigned not null default '0.00' comment '课程价格',
	trade_status int(2) not null default 0 comment '交易状态：WAIT_BUYER_PAY（交易创建，等待买家付款）0、TRADE_CLOSED（未付款交易超时关闭，或支付完成后全额退款）1、TRADE_SUCCESS（交易支付成功）2、TRADE_FINISHED（交易结束，不可退款）3',
	gmt_create datetime not null comment '创建时间',
	gmt_modified datetime not null comment '更新时间',
	primary key(id)
)

select now()

show variables like '%time_zone%'

set global time_zone = '+8:00'

flush privileges

SELECT * FROM edu_order WHERE gmt_create >= '2020-05-05 15:05:00'

alter table edu_order add column order_no char(40) not null comment '订单唯一编号';

alter table edu_order add column is_deleted tinyint(1) unsigned not null default 0 comment '逻辑删除 1 表示删除，0 表示未删除';

select * from edu_order;

delete from edu_order;

delete from edu_order where id='1243948257722261506'

select count(*) from edu_order
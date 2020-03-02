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

select * from edu_teacher;

insert  into edu_teacher(id,name,intro,career,level,avatar,sort,is_deleted,gmt_create,gmt_modified) values ('1','刘德华9','毕业于师范大学数学系，热爱教育事业，执教数学思维6年有余','具备深厚的数学思维功底、丰富的小学教育经验，授课风格生动活泼，擅长用形象生动的比喻帮助理解、简单易懂的语言讲解难题，深受学生喜欢',2,'',10,0,'2018-03-30 17:15:57','2019-02-23 05:48:45');
insert  into edu_teacher(id,name,intro,career,level,avatar,sort,is_deleted,gmt_create,gmt_modified) values ('10','唐嫣','北京师范大学法学院副教授','北京师范大学法学院副教授、清华大学法学博士。自2004年至今已有9年的司法考试培训经验。长期从事司法考试辅导，深知命题规律，了解解题技巧。内容把握准确，授课重点明确，层次分明，调理清晰，将法条法理与案例有机融合，强调综合，深入浅出。',1,'',20,0,'2018-04-03 14:32:19','2019-02-22 02:01:26');
insert  into edu_teacher(id,name,intro,career,level,avatar,sort,is_deleted,gmt_create,gmt_modified) values ('11','刘德华1','string intro','string career',2,'',10,0,'2019-02-22 23:37:44','2019-02-22 23:38:30');
insert  into edu_teacher(id,name,intro,career,level,avatar,sort,is_deleted,gmt_create,gmt_modified) values ('2','周润发','中国人民大学附属中学数学一级教师','中国科学院数学与系统科学研究院应用数学专业博士，研究方向为数字图像处理，中国工业与应用数学学会会员。参与全国教育科学“十五”规划重点课题“信息化进程中的教育技术发展研究”的子课题“基与课程改革的资源开发与应用”，以及全国“十五”科研规划全国重点项目“掌上型信息技术产品在教学中的运用和开发研究”的子课题“用技术学数学”。',2,'',1,0,'2018-03-30 18:28:26','2019-02-22 02:01:26');
insert  into edu_teacher(id,name,intro,career,level,avatar,sort,is_deleted,gmt_create,gmt_modified) values ('3','钟汉良','毕业于北京大学数学系','中教一级职称。讲课极具亲和力。',1,'',1,0,'2018-03-31 09:20:46','2019-02-22 02:01:27'),('4','周杰伦','长期从事考研政治课讲授和考研命题趋势与应试对策研究。考研辅导新锐派的代表。','政治学博士、管理学博士后，北京师范大学马克思主义学院副教授。多年来总结出了一套行之有效的应试技巧与答题方法，针对性和实用性极强，能帮助考生在轻松中应考，在激励的竞争中取得高分，脱颖而出。',1,'',1,0,'2018-04-03 14:13:51','2019-02-22 02:01:28');
insert  into edu_teacher(id,name,intro,career,level,avatar,sort,is_deleted,gmt_create,gmt_modified) values ('5','陈伟霆','人大附中2009届毕业生','北京大学数学科学学院2008级本科生，2012年第八届学生五四奖章获得者，在数学领域取得多项国际国内奖项，学术研究成绩突出。曾被两次评为北京大学三好学生、一次评为北京大学三好标兵，获得过北京大学国家奖学金、北京大学廖凯原奖学金、北京大学星光国际一等奖学金、北京大学明德新生奖学金等。',1,'',1,0,'2018-04-03 14:15:36','2019-02-22 02:01:29'),('6','姚晨','华东师范大学数学系硕士生导师，中国数学奥林匹克高级教练','曾参与北京市及全国多项数学活动的命题和组织工作，多次带领北京队参加高中、初中、小学的各项数学竞赛，均取得优异成绩。教学活而新，能够调动学生的学习兴趣并擅长对学生进行思维点拨，对学生学习习惯的养成和非智力因素培养有独到之处，是一位深受学生喜爱的老师。',1,'',1,0,'2018-04-01 14:19:28','2019-02-22 02:01:29');
insert  into edu_teacher(id,name,intro,career,level,avatar,sort,is_deleted,gmt_create,gmt_modified) values ('7','胡歌','考研政治辅导实战派专家，全国考研政治命题研究组核心成员。','法学博士，北京师范大学马克思主义学院副教授，专攻毛泽东思想概论、邓小平理论，长期从事考研辅导。出版著作两部，发表学术论文30余篇，主持国家社会科学基金项目和教育部重大课题子课题各一项，参与中央实施马克思主义理论研究和建设工程项目。',2,'',8,0,'2018-04-03 14:21:03','2019-02-22 02:01:30'),('8','旦增尼玛','上海师范大学法学院副教授','上海师范大学法学院副教授、清华大学法学博士。自2004年至今已有9年的司法考试培训经验。长期从事司法考试辅导，深知命题规律，了解解题技巧。内容把握准确，授课重点明确，层次分明，调理清晰，将法条法理与案例有机融合，强调综合，深入浅出。',1,'',9,0,'2018-04-03 14:23:06','2019-02-22 02:01:31');
insert  into edu_teacher(id,name,intro,career,level,avatar,sort,is_deleted,gmt_create,gmt_modified) values ('9','谢娜','资深课程设计专家，专注10年AACTP美国培训协会认证导师','十年课程研发和培训咨询经验，曾任国企人力资源经理、大型外企培训经理，负责企业大学和培训体系搭建；曾任专业培训机构高级顾问、研发部总监，为包括广东移动、东莞移动、深圳移动、南方电网、工商银行、农业银行、民生银行、邮储银行、TCL集团、清华大学继续教育学院、中天路桥、广西扬翔股份等超过200家企业提供过培训与咨询服务，并担任近50个大型项目的总负责人。',1,'',10,0,'2018-04-03 14:23:33','2019-02-22 02:01:32');

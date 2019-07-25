#设置客户端连接服务器端编码
SET NAMES UTF8;
#丢弃数据库SMS，如果存在的话
DROP DATABASE IF EXISTS SMS;
#创建数据库SMS，设置存储的编码
CREATE DATABASE SMS CHARSET=UTF8; 
#进入数据库
USE SMS;


#1.sms_user用户模块
CREATE TABLE sms_user(
	uid			INT PRIMARY KEY NOT NULL AUTO_INCREMENT,	 #用户编号
	uname		VARCHAR(32),								#用户名
	upwd		VARCHAR(32),								#用户密码
	email		VARCHAR(64),								#用户邮箱
	u_phone		VARCHAR(16),				                #用户手机号
	avatar		VARCHAR(128),								#用户头像路径
	user_name	VARCHAR(32),								#用户真实姓名
	birthday	VARCHAR(32),								#出生日期
	sex			INT								#性别：0女  1男
);
#1.插入数据
INSERT INTO sms_user VALUES(NULL,'tom',md5('123456'),'635028856@qq.com','15845678911','img/avatar/1.jpg','张三',"1992-12-10",1);
INSERT INTO sms_user VALUES(NULL,'tom1',md5('123456'),'635028857@qq.com','15845678912','img/avatar/2.jpg','李四',"1990-11-12",1);
INSERT INTO sms_user VALUES(NULL,'tom2',md5('123456'),'635028858@qq.com','15845678913','img/avatar/3.jpg','王华',"1989-10-5",1);
INSERT INTO sms_user VALUES(NULL,'tom3',md5('123456'),'635028859@qq.com','15845678914','img/avatar/4.jpg','刘莉莉',"1993-8-4",0);
INSERT INTO sms_user VALUES(NULL,'kite',md5('123456'),'635028859@qq.com','15945678914','img/avatar/4.jpg','刘莉莉',"1993-8-4",0);
INSERT INTO sms_user VALUES(NULL,'lili',md5('123456'),'635028859@qq.com','14945678914','img/avatar/4.jpg','刘莉莉',"1993-8-4",0);


#2.sms_students学生档案信息表	
CREATE TABLE sms_students(
	sid	INT PRIMARY KEY NOT NULL AUTO_INCREMENT,	#学号2018 00 00开始
	student_name	VARCHAR(32),	#学生姓名
	cid	INT,	#班级专业，外键cid
	gender	INT,	#性别：0女  1男
	birthday	VARCHAR(32),	#出生日期
	nation	VARCHAR(32),	#民族
	nationality	VARCHAR(32),	#国籍
	ID_number	VARCHAR(32),	#身份证号
	Political_status	VARCHAR(32),	#政治面貌
	avatar	VARCHAR(128),	#头像图片路径
	Domicile_place	VARCHAR(128),	#户口所在地
	address	VARCHAR(128),	#现住址
	grade	VARCHAR(32),	#年级
	s_phone	VARCHAR(16) NOT NULL ,	#手机
	Emergency_contact	VARCHAR(32),	#紧急联系人
	Emergency_contact_phone	VARCHAR(16) NOT NULL ,	#紧急联系人电话	
	message VARCHAR(256)	#备注信息
);
#3.插入数据
INSERT INTO sms_students VALUES(20180001,"张丽丽",10,0,"2001-03-06","汉","中国","610113200103061321",
"团员","img/avatar/1.jpg","陕西西安","西安市雁塔区某某小区",2018,18213241258,"张丹",18213241259,"无");
INSERT INTO sms_students VALUES(NULL,"张美丽",10,0,"2001-03-06","汉","中国","610113200103061321",
"团员","img/avatar/1.jpg","陕西西安","西安市雁塔区某某小区",2018,17213241258,"张丹",18213241259,"无");
INSERT INTO sms_students VALUES(NULL,"王丽丽",12,0,"2001-05-06","汉","中国","610113200105061342",
"团员","img/avatar/2.jpg","陕西西安","西安市雁塔区某某小区",2018,18213241271,"王丹",18213241261,"无");
INSERT INTO sms_students VALUES(NULL,"李朝",20,1,"2001-05-06","汉","中国","610113200105061342",
"团员","img/avatar/3.jpg","陕西西安","西安市雁塔区某某小区",2018,18213241272,"李武",18213241262,"无");
INSERT INTO sms_students VALUES(NULL,"赵卓",13,1,"2001-05-06","汉","中国","610113200105061342",
"团员","img/avatar/4.jpg","陕西西安","西安市雁塔区某某小区",2018,18213241273,"赵华",18213241263,"无");
INSERT INTO sms_students VALUES(NULL,"田甜甜",12,0,"2001-05-06","汉","中国","610113200105061342",
"团员","img/avatar/5.jpg","陕西西安","西安市雁塔区某某小区",2018,18213241274,"田蜜蜜",18213241260,"无");
INSERT INTO sms_students VALUES(NULL,"周娟",11,0,"2001-05-06","汉","中国","610113200105061342",
"团员","img/avatar/6.jpg","陕西西安","西安市雁塔区某某小区",2018,18213241275,"周黄",18213241264,"无");
INSERT INTO sms_students VALUES(NULL,"吴超",14,1,"2001-05-06","汉","中国","610113200105061342",
"团员","img/avatar/5.jpg","陕西西安","西安市雁塔区某某小区",2018,18213241276,"吴越",18213241265,"无");
INSERT INTO sms_students VALUES(NULL,"郑和",12,1,"2001-05-06","汉","中国","610113200105061342",
"团员","img/avatar/4.jpg","陕西西安","西安市雁塔区某某小区",2018,18213241277,"郑州",18213241266,"无");
INSERT INTO sms_students VALUES(NULL,"李莉莉",13,0,"2001-05-06","汉","中国","610113200105061342",
"团员","img/avatar/4.jpg","陕西西安","西安市雁塔区某某小区",2018,18213241279,"李丹",18213241267,"无");
INSERT INTO sms_students VALUES(NULL,"赵阳",14,1,"2001-05-06","汉","中国","610113200105061342",
"团员","img/avatar/6.jpg","陕西西安","西安市雁塔区某某小区",2018,18213241280,"赵田",18213241268,"无");
INSERT INTO sms_students VALUES(NULL,"钱钱钱",11,1,"2001-05-06","汉","中国","610113200105061342",
"团员","img/avatar/2.jpg","陕西西安","西安市雁塔区某某小区",2018,18213241281,"钱多多",18213241269,"无");

#3.sms_grade学生年级级表		
CREATE TABLE sms_grade(
	gid	INT PRIMARY KEY NOT NULL AUTO_INCREMENT,	#编码2000开始
	status INT,			#年级状态,1毕业，2在读
	comment VARCHAR(256)			#备注
);
#3.插入数据
INSERT INTO sms_grade VALUES(2000,1,"无");
INSERT INTO sms_grade VALUES(NULL,1,"无");
INSERT INTO sms_grade VALUES(NULL,1,"无");
INSERT INTO sms_grade VALUES(NULL,1,"无");
INSERT INTO sms_grade VALUES(NULL,1,"无");
INSERT INTO sms_grade VALUES(NULL,1,"无");
INSERT INTO sms_grade VALUES(NULL,1,"无");
INSERT INTO sms_grade VALUES(NULL,1,"无");
INSERT INTO sms_grade VALUES(NULL,1,"无");
INSERT INTO sms_grade VALUES(NULL,1,"无");
INSERT INTO sms_grade VALUES(NULL,1,"无");
INSERT INTO sms_grade VALUES(NULL,1,"无");
INSERT INTO sms_grade VALUES(NULL,1,"无");
INSERT INTO sms_grade VALUES(NULL,1,"无");
INSERT INTO sms_grade VALUES(NULL,1,"无");
INSERT INTO sms_grade VALUES(NULL,2,"无");
INSERT INTO sms_grade VALUES(NULL,2,"无");
INSERT INTO sms_grade VALUES(NULL,2,"无");
INSERT INTO sms_grade VALUES(NULL,2,"无");



#3.sms_class学生专业班级表		
CREATE TABLE sms_class(
	cid	INT PRIMARY KEY NOT NULL AUTO_INCREMENT,	#班级代码10开始
	special	        VARCHAR(32)	#专业名称
);
#3.插入数据
INSERT INTO sms_class VALUES(11,"计算机专业");
INSERT INTO sms_class VALUES(NULL,"美术专业");
INSERT INTO sms_class VALUES(NULL,"音乐专业");
INSERT INTO sms_class VALUES(NULL,"物理专业");
INSERT INTO sms_class VALUES(NULL,"计算机专业");
INSERT INTO sms_class VALUES(NULL,"美术专业");
INSERT INTO sms_class VALUES(NULL,"音乐专业");
INSERT INTO sms_class VALUES(NULL,"物理专业");
INSERT INTO sms_class VALUES(NULL,"计算机专业");
INSERT INTO sms_class VALUES(NULL,"美术专业");
INSERT INTO sms_class VALUES(NULL,"音乐专业");
INSERT INTO sms_class VALUES(NULL,"物理专业");
		
#4.sms_score学生成绩表
CREATE TABLE sms_score(		
	scid	INT PRIMARY KEY NOT NULL AUTO_INCREMENT,	#成绩单编号
	csid	VARCHAR(32),	#课程，外键cid
	sid	INT,	#学生id，外键关联sid学号
	score	VARCHAR(32)	#成绩
);		
#4.插入数据
INSERT INTO sms_score VALUES(NULL,1001,20180001,84);
INSERT INTO sms_score VALUES(NULL,1011,20180001,80);
INSERT INTO sms_score VALUES(NULL,1021,20180001,74);
INSERT INTO sms_score VALUES(NULL,1031,20180001,69);
INSERT INTO sms_score VALUES(NULL,1001,20180002,84);
INSERT INTO sms_score VALUES(NULL,1011,20180002,80);
INSERT INTO sms_score VALUES(NULL,1021,20180002,74);
INSERT INTO sms_score VALUES(NULL,1031,20180002,69);
INSERT INTO sms_score VALUES(NULL,1001,20180003,84);
INSERT INTO sms_score VALUES(NULL,1002,20180003,80);
INSERT INTO sms_score VALUES(NULL,1003,20180003,74);
INSERT INTO sms_score VALUES(NULL,1011,20180003,69);
INSERT INTO sms_score VALUES(NULL,1012,20180003,84);
INSERT INTO sms_score VALUES(NULL,1013,20180003,80);
INSERT INTO sms_score VALUES(NULL,1021,20180003,74);
INSERT INTO sms_score VALUES(NULL,1023,20180003,69);
INSERT INTO sms_score VALUES(NULL,1031,20180004,69);
INSERT INTO sms_score VALUES(NULL,1001,20180004,84);
INSERT INTO sms_score VALUES(NULL,1002,20180004,80);
INSERT INTO sms_score VALUES(NULL,1003,20180004,74);
INSERT INTO sms_score VALUES(NULL,1011,20180004,69);
INSERT INTO sms_score VALUES(NULL,1012,20180004,84);
INSERT INTO sms_score VALUES(NULL,1013,20180004,80);
INSERT INTO sms_score VALUES(NULL,1021,20180004,74);
INSERT INTO sms_score VALUES(NULL,1023,20180004,69);
INSERT INTO sms_score VALUES(NULL,1031,20180004,69);
		

#5.sms_class_schedule学生课程表	
CREATE TABLE sms_class_schedule(	
	csid	INT PRIMARY KEY NOT NULL AUTO_INCREMENT,	#课程编号1001开始
	csname	VARCHAR(32),	#课程名称
	credit	INT	#课程学分
);
#5.插入数据
INSERT INTO sms_class_schedule VALUES(1001,"高等数学1",1);
INSERT INTO sms_class_schedule VALUES(NULL,"高等数学2",1);
INSERT INTO sms_class_schedule VALUES(NULL,"线性代数",1);
INSERT INTO sms_class_schedule VALUES(NULL,"大学语文1",1);
INSERT INTO sms_class_schedule VALUES(NULL,"大学语文2",1);
INSERT INTO sms_class_schedule VALUES(NULL,"大学语文3",1);
INSERT INTO sms_class_schedule VALUES(NULL,"大学英语1",1);
INSERT INTO sms_class_schedule VALUES(NULL,"大学英语2",1);
INSERT INTO sms_class_schedule VALUES(NULL,"大学英语3",1);
INSERT INTO sms_class_schedule VALUES(NULL,"计算机基础",1);
		
#6.sms_dormitory 宿舍信息表	
CREATE TABLE sms_dormitory(	
	did	INT PRIMARY KEY NOT NULL AUTO_INCREMENT,	#宿舍编号
	TYPE	INT,	#宿舍类型4人，6人,4.4人，6.6人	
	STATUS	INT,	#宿舍状态1.有空闲，2.已满	
	d_sex	INT2	#男女生宿舍0,女生宿舍，1男生宿舍
);
#6.插入数据
INSERT INTO sms_dormitory VALUES(101,4,2,0);
INSERT INTO sms_dormitory VALUES(NULL,4,1,0);
INSERT INTO sms_dormitory VALUES(NULL,4,1,0);
INSERT INTO sms_dormitory VALUES(NULL,4,1,0);
INSERT INTO sms_dormitory VALUES(NULL,4,1,0);
INSERT INTO sms_dormitory VALUES(NULL,6,1,1);
INSERT INTO sms_dormitory VALUES(NULL,6,1,1);
INSERT INTO sms_dormitory VALUES(NULL,6,1,1);
INSERT INTO sms_dormitory VALUES(NULL,6,1,1);
INSERT INTO sms_dormitory VALUES(NULL,6,1,1);
		
#7.sms_people宿舍人员表	
CREATE TABLE sms_people(	
	Student_id	INT PRIMARY KEY,	#住的学生1，外键sid学号
	Pid	INT	#外键did，宿舍编号
);
#7.插入数据
INSERT INTO sms_people VALUES(20180001,101);	
INSERT INTO sms_people VALUES(20180002,101);
INSERT INTO sms_people VALUES(20180005,101);
INSERT INTO sms_people VALUES(20180006,101);
INSERT INTO sms_people VALUES(20180009,102);
INSERT INTO sms_people VALUES(20180003,106);
INSERT INTO sms_people VALUES(20180004,106);
INSERT INTO sms_people VALUES(20180007,106);
INSERT INTO sms_people VALUES(20180008,106);
INSERT INTO sms_people VALUES(20180010,106);
INSERT INTO sms_people VALUES(20180011,106);



#学校通知infrom表	
CREATE TABLE inform(	
	iid	INT PRIMARY KEY AUTO_INCREMENT,	#通知编号
	title VARCHAR(32),	#通知标题
	content VARCHAR(256),#通知内容
	date  INT	#通知时间
);
INSERT INTO inform VALUES(NULL,"关于2018年元旦放假通知","Vue.js 使用了基于 HTML 的模板语法，允许开发者声明式地将 DOM 绑定至底层 Vue 实例的数据。所有 Vue.js 的模板都是合法的 HTML ，所以能被遵循规范的浏览器和 HTML 解析器解析。

在底层的实现上，Vue 将模板编译成虚拟 DOM 渲染函数。结合响应系统，Vue 能够智能地计算出最少需要重新渲染多少组件，并把 DOM 操作次数减到最少。
如果你熟悉虚拟 DOM 并且偏爱 JavaScript 的原始力量，你也可以不用模板，直接写渲染 (render) 函数，使用可选的 JSX 语法。","2017-12-25");
INSERT INTO inform VALUES(NULL,"关于2019年收假通知","Mustache 标签将会被替代为对应数据对象上 msg 属性的值。无论何时，绑定的数据对象上 msg 属性发生了改变，插值处的内容都会更新。

通过使用 v-once 指令，你也能执行一次性地插值，当数据改变时，插值处的内容不会更新。但请留心这会影响到该节点上的其它数据绑定：","2019-1-20");
INSERT INTO inform VALUES(NULL,"关于2019年端午放假通知","关于2017年元旦放假通知关于2017年元旦放假通知关于2017年元旦放假通知关于2017年元旦放假通知关于2017年元旦放假通知关于2017年元旦放假通知关于2017年元旦放假通知关于2017年元旦放假通知","2019-6-3");
INSERT INTO inform VALUES(NULL,"关于2019年暑假放假通知","关于2017年元旦放假通知关于2017年元旦放假通知关于2017年元旦放假通知关于2017年元旦放假通知关于2017年元旦放假通知关于2017年元旦放假通知关于2017年元旦放假通知关于2017年元旦放假通知","2019-6-25");

#用户的通知状态表informCheck
CREATE TABLE informCheck(	
	icid	INT PRIMARY KEY AUTO_INCREMENT,	#编号
	uid INT,	 #用户id
	iid INT,	#关联infrom的消息
	status  INT	#1已读，2未读
);
INSERT INTO informCheck VALUES(NULL,1,1,2);
INSERT INTO informCheck VALUES(NULL,1,2,1);
INSERT INTO informCheck VALUES(NULL,1,3,1);
INSERT INTO informCheck VALUES(NULL,1,4,1);
INSERT INTO informCheck VALUES(NULL,2,1,1);
INSERT INTO informCheck VALUES(NULL,2,2,1);
INSERT INTO informCheck VALUES(NULL,2,3,2);
INSERT INTO informCheck VALUES(NULL,2,4,2);
INSERT INTO informCheck VALUES(NULL,3,1,1);
INSERT INTO informCheck VALUES(NULL,3,2,2);
INSERT INTO informCheck VALUES(NULL,3,3,2);
INSERT INTO informCheck VALUES(NULL,3,4,1);
INSERT INTO informCheck VALUES(NULL,5,1,1);
INSERT INTO informCheck VALUES(NULL,5,2,2);
INSERT INTO informCheck VALUES(NULL,5,3,1);
INSERT INTO informCheck VALUES(NULL,5,4,1);



#用户message状态表
CREATE TABLE message(	
	mid	INT PRIMARY KEY AUTO_INCREMENT,	#message编号
	uid INT,	#哪个user的信息
	sender VARCHAR(32),	#发送人
	content VARCHAR(256),#通知内容
	date  INT,	#通知时间
	status INT   #已读状态,1已读，2未读
);
INSERT INTO message VALUES(NULL,1,"天蓝蓝","周末去逛街","2019-6-22",2);
INSERT INTO message VALUES(NULL,1,"lalala","电风扇","2019-6-22",2);
INSERT INTO message VALUES(NULL,1,"lilili"," 发的方式告诉告诉","2019-6-22",2);
INSERT INTO message VALUES(NULL,2,"aaaaa","大V搜索","2019-6-22",2);
INSERT INTO message VALUES(NULL,3,"dddd","周末去逛街","2019-6-22",2);
INSERT INTO message VALUES(NULL,4,"发发发","周末去逛街","2019-6-22",2);
INSERT INTO message VALUES(NULL,4,"应用于","周末去逛街","2019-6-22",2);
INSERT INTO message VALUES(NULL,5,"一一","周末去逛街","2019-6-22",2);
INSERT INTO message VALUES(NULL,5,"李丽丽","周末去逛街","2019-6-22",2);
INSERT INTO message VALUES(NULL,5,"缓一缓","周末去逛街","2019-6-22",2);
INSERT INTO message VALUES(NULL,5,"露露","周末去逛街","2019-6-22",2);
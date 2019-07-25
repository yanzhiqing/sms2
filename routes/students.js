//引入express
const express=require('express');
//引入连接池模块  // ./同级，..上一级
const pool=require('../pool.js');
//创建路由器
var router=express.Router();

//添加路由
//学生信息
//1.1学生每页列表list
//http://127.0.0.1:3000/student/StudentList?pno=2&count=4
router.get("/StudentList",function(req,res){
	//console.log(req.query);
	var pno=req.query.pno;
	var count=req.query.count;
	//如果页码pno是空，设置默认值1
	if(!pno) pno=1;
	//如果数量为空，设置默认值2
	if(!count) count=2;
	//将数据转为整型
	pno=parseInt(pno);
	count=parseInt(count);
	//console.log(pno,count);
	//根据页码和数据计算开始查询的值
	var start=(pno-1)*count;
	//执行SQL语句
	pool.query('SELECT * FROM sms_students AS s,sms_class AS c WHERE s.cid=c.cid ORDER BY s.sid LIMIT ?,?',[start,count],function(err,result){
		if(err) throw err;
		res.send(result);
		console.log(result[0]);
	});	
})
//1.2模糊查询学生信息
//http://127.0.0.1:3000/student/search?uname=李
router.get("/search",(req,res)=>{
	var uname=req.query.uname;
	var sql="SELECT * FROM sms_students WHERE student_name LIKE '%'+?+'%'";
	pool.query(sql,[uname],(err,result)=>{
		//console.log(result.length);
		res.send(result);
	});
});
//1.2查询学生列表总数量
//http://127.0.0.1:3000/student/total
router.get("/total",(req,res)=>{
	var sql="SELECT sid FROM sms_students";
	pool.query(sql,(err,result)=>{
		//console.log(result.length);
		res.send(result);
	});
});
//2.根据id查询学生个人信息
//http://127.0.0.1:3000/student/detail?sid=20180001
router.get("/detail",(req,res)=>{
	var $sid=req.query.sid;
	//console.log($sid);
	var sql=`SELECT * FROM sms_students WHERE sid=?`;
	pool.query(sql,[$sid],(err,result)=>{
		//console.log(result);
		res.send(result);
	});
});
//3.查询学生成绩、
//http://127.0.0.1:3000/student/score?sid=20180001
router.get("/score",(req,res)=>{
	var $sid=req.query.sid;
	//var sql=`SELECT c.scid,c.csid,c.sid,c.score,s.sid,s.sid,s.student_name,cs.csid,cs.csname,cs.credit FROM sms_score AS c,sms_students AS s,sms_class_schedule AS cs WHERE c.csid=cs.csid,c.sid=s.sid=?`;
	var sql=`SELECT c.scid,c.csid,c.sid,c.score,cs.csid,cs.csname,cs.credit,s.sid,s.student_name FROM sms_score AS c,sms_class_schedule AS cs,sms_students AS s WHERE c.csid=cs.csid AND c.sid=s.sid AND c.sid=?`;
	pool.query(sql,[$sid],(err,result)=>{
		//console.log(result);
		res.send(result);
	});
});
//1.2查询学生专业（班级）总数量
//http://127.0.0.1:3000/student/majortotal
router.get("/majorTotal",(req,res)=>{
	var sql="SELECT cid FROM sms_class";
	pool.query(sql,(err,result)=>{
		//console.log(result.length);
		res.send(result);
	});
});

//查询各科成绩的平均值

//年级信息列表
//http://127.0.0.1:3000/student/grade?pno=2&count=4
router.get("/grade",(req,res)=>{
	var pno=req.query.pno;
	var count=req.query.count;
	//如果页码pno是空，设置默认值1
	if(!pno) pno=1;
	//如果数量为空，设置默认值2
	if(!count) count=2;
	//将数据转为整型
	pno=parseInt(pno);
	count=parseInt(count);
	//console.log(pno,count);
	//根据页码和数据计算开始查询的值
	var start=(pno-1)*count;
	var sql="SELECT * FROM sms_grade ORDER BY gid DESC LIMIT ?,?";
	pool.query(sql,[start,count],(err,result)=>{
		if(err)throw err;
		//console.log(result);
		res.send(result);
	});
});
//年级总数量
//http://127.0.0.1:3000/student/gradeTotal
router.get("/gradeTotal",(req,res)=>{
	var sql="SELECT gid FROM sms_grade";
	pool.query(sql,(err,result)=>{
		//console.log(result.length);
		res.send(result);
	});
});



//专业信息列表
//http://127.0.0.1:3000/student/major?pno=2&count=4
router.get("/major",(req,res)=>{
	var pno=req.query.pno;
	var count=req.query.count;
	//如果页码pno是空，设置默认值1
	if(!pno) pno=1;
	//如果数量为空，设置默认值2
	if(!count) count=2;
	//将数据转为整型
	pno=parseInt(pno);
	count=parseInt(count);
	//console.log(pno,count);
	//根据页码和数据计算开始查询的值
	var start=(pno-1)*count;
	var sql="SELECT * FROM sms_class LIMIT ?,?";
	pool.query(sql,[start,count],(err,result)=>{
		if(err)throw err;
		//console.log(result);
		res.send(result);
	});
});


//课程列表
//年级信息列表
//http://127.0.0.1:3000/student/schedule?pno=2&count=4
router.get("/schedule",(req,res)=>{
	var pno=req.query.pno;
	var count=req.query.count;
	//如果页码pno是空，设置默认值1
	if(!pno) pno=1;
	//如果数量为空，设置默认值2
	if(!count) count=2;
	//将数据转为整型
	pno=parseInt(pno);
	count=parseInt(count);
	//console.log(pno,count);
	//根据页码和数据计算开始查询的值
	var start=(pno-1)*count;
	var sql="SELECT * FROM sms_class_schedule  LIMIT ?,?";
	pool.query(sql,[start,count],(err,result)=>{
		if(err)throw err;
		//console.log(result);
		res.send(result);
	});
});
//课程总数量
//http://127.0.0.1:3000/student/scheduleTotal
router.get("/scheduleTotal",(req,res)=>{
	var sql="SELECT csid FROM sms_class_schedule";
	pool.query(sql,(err,result)=>{
		console.log(result);
		res.send(result);
	});
});



//各科成绩平均值
//http://127.0.0.1:3000/student/scoreAVG
router.get("/scoreAVG",(req,res)=>{
	var sql="SELECT AVG(score) FROM sms_score WHERE csid=1001";
	pool.query(sql,(err,result)=>{
		console.log(result);
		res.send(result);
	});
});

//学生列表
//成绩管理

//统计分析
//男生宿舍
//女生宿舍







//1.添加学生信息
/*router.post('/',function(req,res){
	//获取数据
	console.log(req.body);
	//验证数据是否为空
	if(!req.body.uname){
		res.send({code:401,msg:'uname required'});
		//阻止往后执行
		return;
	}
	if(!req.body.upwd){
		res.send({code:402,msg:'upwd required'});
		return;
	}
	if(!req.body.email){
		res.send({code:403,msg:'email required'});
		return;
	}
	if(!req.body.phone){
		res.send({code:404,msg:'phone required'});
		return;
	}
	//把数据插入到数据库
	//执行SQL语句
	pool.query('INSERT INTO xz_user SET ?',[req.body],function(err,result){
		if(err) throw err;
		if(result.affectedRows>0){
			res.send({code:200,msg:'register'});
		}
	});

	res.send('注册成功');
})*/
//2.删除学生信息
//3.修改学生信息
router.post('/',function(req,res){
	//获取数据
	console.log(req.body);
	var obj=req.body;
	//验证数据是否为空
	//遍历对象中的属性，如果属性值为空，提示属性名这一项必须的
	var num=400;
	for(var key in obj){
		num++;
		//console.log(key,obj[key]);
		if(!obj[key]){
			res.send({code:num,msg:key+'  required'});
			return;
		}
	}
	//连接池，执行SQL语句,修改编号对应的数据
	pool.query('UPDATE sms_students SET email=?,phone=?,user_name=?,gender=? WHERE uid=?',
		[obj.email,obj.phone,obj.user_name,obj.gender,obj.uid],
		function(err,result){
		if(err) throw err;
		if(result.affectedRows>0){
			res.send({code:200,msg:'update suc'});
		}else{
			res.send({code:301,msg:'update err'});
		}
	});	
});
//4.查询学生信息
//年级
//班级
//课表
//成绩





module.exports=router;



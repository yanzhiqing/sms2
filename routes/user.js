//引入express
const express=require('express');
//引入连接池模块  // ./同级，../上一级
const pool=require('../pool.js');
//创建路由器
var router=express.Router();




//添加路由
//1.用户登录login
//http://127.0.0.1:3000/user/login?uname=tom&upwd=123456
router.get('/login',function(req,res){
	if(!req.query.uname){
		res.send({code:401,msg:'uname required'});
		return;
	};
	if(!req.query.upwd){
		res.send({code:402,msg:'upwd required'});
		return;
	}
	
	pool.query('SELECT uid from sms_user WHERE uname=? AND upwd=md5(?)',
		[req.query.uname,req.query.upwd],function(err,result){
		if(err) throw err;
			//如果数组中有元素说明成功，没有元素失败
			if(result.length>0){
				req.session.uid=result[0].uid;
				res.send({code:200,msg:'login suc'});
			}else{
				res.send({code:301,msg:'login err'});
			}
		}
	)
});
//
//2.验证用户名是否存在http://127.0.0.1:3000/user/reguser?uname=tom
router.get('/exist',function(req,res){
	var $uname=req.query.uname;
	if(!$uname){
		res.send("没有获取到用户名");
		return;
	};
	//查询sql语句
	var sql="SELECT * from sms_user WHERE uname=?";
	pool.query(sql,[$uname],function(err,result){
		//console.log(result)
		if(result.length>0){
			//console.log(1);
			res.send("1");//用户名已存在
		}else{
			res.send("0");//用户名可注册
			//console.log(2);
		};
	})
})
//3.用户注册
router.get('/reg',function(req,res){
	console.log(req.query);
	//验证数据是否为空
	if(!req.query.uname){
		res.send({code:401,msg:'uname required'});
		//阻止往后执行
		return;
	}
	if(!req.query.upwd){
		res.send({code:402,msg:'upwd required'});
		return;
	}
	if(!req.query.email){
		res.send({code:403,msg:'email required'});
		return;
	}
	//把数据插入到数据库
	//执行SQL语句
	var sql="INSERT INTO sms_user SET uname=?,upwd=md5(?),email=?";
	pool.query(sql,[req.query.uname,req.query.upwd,req.query.email],function(err,result){
		if(err) throw err;
		if(result.length>0){
			res.send({code:200,msg:'register'});
		}
	});

	res.send('注册成功');
});


//学校通知接口,用户未读消息，倒叙
//http://127.0.0.1:3000/user/inform2?uid=1
router.get('/inform1',function(req,res){
	//console.log(req.query);   i.title,i.content,i.date,ic.icid,ic.uidic.status=2  i.title,i.iid,ic.uid,ic.iid,ic.icid
	var $uid=req.session.uid;
	var sql="SELECT * FROM inform AS i,informCheck AS ic WHERE i.iid=ic.iid AND ic.uid=? AND ic.status=2 ORDER BY i.iid DESC";
	pool.query(sql,[$uid],function(err,result){
		//console.log(result)
		res.send(result)
	})
});
//学校通知接口,用户已读消息，正序
//http://127.0.0.1:3000/user/inform1?uid=1
router.get('/inform2',function(req,res){
	var $uid=req.session.uid;
	var sql="SELECT * FROM inform AS i,informCheck AS ic WHERE i.iid=ic.iid AND ic.uid=? AND ic.status=1 ORDER BY i.iid";
	pool.query(sql,[$uid],function(err,result){
		//console.log(result)
		res.send(result)
	})
});


//用户信息表未读信息表1已读，2未读
//http://127.0.0.1:3000/user/message?uid=1
router.get('/message',function(req,res){
	var $uid=req.session.uid;
	var sql="SELECT m.mid,m.uid,m.sender,u.uid,u.avatar FROM message AS m,sms_user AS u WHERE m.uid=u.uid AND m.status=2 AND m.uid=? ORDER BY m.mid DESC";
	pool.query(sql,[$uid],function(err,result){
		//console.log(result)
		res.send(result)
	})
});



//获取用户总数
//http://127.0.0.1:3000/user/usertotal
router.get('/usertotal',function(req,res){
	var sql="SELECT uid FROM sms_user";
	pool.query(sql,function(err,result){
		console.log(result)
		res.send(result)
	})
});


//网页头部验证用户是否登录
//http://127.0.0.1:3000/user/userIslogin
router.get('/userIslogin',function(req,res){
	var $uid=req.session.uid;
	var sql="SELECT * FROM sms_user WHERE uid=?";
	pool.query(sql,[$uid],function(err,result){
		//如果数组中有元素说明成功，没有元素失败
		if(result.length>0){
			req.session.uid=result[0].uid;
			res.send(result);
		}else{
			res.send("1");
			console.log("1")
		}
	})
});

module.exports=router;



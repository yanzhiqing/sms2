//1.引入两个模块 
const express=require('express');
const mysql=require('mysql');
const user=require('./routes/user.js');
const student=require('./routes/students.js');
const dormitory=require('./routes/dormitory.js');
//const dormitory=require('./routes/dormitory.js');
const bodyParser=require('body-parser');
//2.引入连接池
const pool=require('./pool.js');
//3.创建服务器
var server=express();
server.listen(5050);
//4.托管静态资源到public img目录下
server.use(express.static('public'));
//（在路由前）使用body-parser中间件
server.use(bodyParser.urlencoded({
	extended:false
}));

//5.cors中间件解决跨域的问题
const cors=require('cors');
server.use(cors({
	origin:["http://127.0.0.1:8080","http://localhost:8080"],
    credentials:true
}));
//6.添加session功能
const session=require("express-session");
server.use(session({
    secret:"128位字符串",       //自定义字符串
    resave:true,                //每次请求更新数据
    saveUninitialized:true      //保存初始化数据
}))

/*
//1.用户登录login
//http://127.0.0.1:3000/login?uname=lili&upwd=123456
server.get("/login",(req,res)=>{
	console.log(111)
    //1.接收脚手架的参数 uname upass
    var $uname=req.query.uname;
    var $upwd=req.query.upwd;
	//2.SQL语句
	console.log(222)
    var sql="SELECT id FROM sms_user WHERE uname=? AND upwd=md5(?)";
	//3.返回结果
	console.log(33)
    pool.query(sql,[$uname,$upwd],(err,result)=>{
		if(err) throw err;
		console.log(444)
        if(result.length==0){
			res.send({code:-1,msg:"用户名或密码有误"});
			console.log(55)
        }else{
            //result=[{id:1},{uname:tom},{upass:123}]
            req.session.uid=result[0].id;
            res.send({code:1,msg:"登录成功"});
        }
    });
})
*/



//挂载/user
server.use('/user',user);
server.use('/student',student);
server.use('/dormitory',dormitory);



















//引入express
const express=require('express');
//引入连接池模块  // ./同级，../上一级
const pool=require('../pool.js');
//创建路由器
var router=express.Router();

//添加路由
//获取宿舍总数
//http://127.0.0.1:3000/dormitory/total
router.get('/total',function(req,res){
	var sql="SELECT did FROM sms_dormitory";
	pool.query(sql,function(err,result){
		console.log(result.length)
		res.send(result)
	})
});










//1.增加宿舍
router.post('/reg',function(req,res){
	console.log(req.body);
	res.send('注册成功');
});
//2.删除宿舍
//3.修改宿舍信息
//4.查询宿舍信息


module.exports=router;



const mysql=require('mysql');
//创建连接池对象
var pool=mysql.createPool({
	host:'w.rdc.sae.sina.com.cn',
	port:'3306',
	user:'43o0lyx3y3',
	password:'5m3ikhhlh2lk4mkzw41540xm2yl513w2z5w24ixm',
	database:'app_smstest',
	connectionLimit:15
});

//导出连接池
module.exports=pool;














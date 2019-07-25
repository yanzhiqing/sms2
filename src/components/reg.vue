<template>
    <div class="container-fluid">
        <div class="mt-2">
            <div>
                <img class="w-100" src="../assets/logo.png" alt="">
            </div>
            <div class="mt-2">
                <form class="bg-white" method="post" action="/user/login">
                    <div class="f-color">
                        <strong>用户注册</strong>
                        <span id="uspan" class="ml-2"></span>
                    </div>
                    <div id="uInput">
                        <input v-model="uname" type="text" class="form-control" placeholder="请输入3位以上用户名">
                    </div>
                    <div>
                        <input v-model="email" type="email" class="form-control" placeholder="请输入邮箱">
                    </div>
                    <div>
                        <input v-model="upwd" type="password" class="form-control" placeholder="请输入6-12位密码">
                    </div>

                    <div>
                        <input v-model="upwd2" type="password" class="form-control" placeholder="请再次输入上边的密码">
                    </div>
                    <div class="row small">
                        <label @click="checked" class="col-6 f-color" >
                            <input type="checkbox" v-model="checked" :checked="checked">我已阅读并接受已下条款：
                        </label>
                        <div>
                            <a href="#">&lt;&lt;服务条款&gt;&gt;</a>
                            <a href="#">&lt;&lt;隐私条款&gt;&gt;</a>
                        </div>

                    </div>
                    <div class="mt-1">
                        <button @click="reg"  class="btn btn-primary w-100" :disabled="disabled">立即注册</button>
                    </div>

                    <div class="text-center small">
                        <p class="mb-0 f-color">已注册可
                            <a @click="login"  href="/#/Login" class="text-danger">直接登录</a>
                        </p>
                    </div>
                </form>
            </div>
        </div>

    </div>
</template>
<script>
export default {
    data(){
        return {
            uname:"",
            upwd:"",
            upwd2:"",
            email:"",
            checked:false,
            disabled:true
        }
    },
    methods: {
        //uname失去焦点验证用户名是否已经存在
        search(){
            //获取this.uname
            //console.log(this.uname)
            //发送ajax验证用户名是否存在
            var uspan=document.getElementById("uspan");
             uspan.innerHTML="";
            //console.log(uspan)
            this.axios.get("user/exist",{params:{uname:(this.uname)}}).then(result=>{
                console.log(result.data);
                if(result.data==1){
                    uspan.innerHTML="该用户名已存在";
                    uspan.style.color="red"
                    console.log("该用户名已存在");
                }
            });
            
        },
        //验证是否接受条款，当勾选时，注册可点击，否则，注册按钮禁用
        checkbox(){
            if(this.checked==true){
                this.disabled=false;
            }else{
                this.disabled=true;
            }
        },   
        reg(e){
            e.preventDefault();
            //console.log(111)
            //获取用户输入的uname、upwd、email、upwd2
            var n=this.uname;
            var p=this.upwd;
            var p2=this.upwd2;
            var e=this.email;
            //创建正则表达式规定用户名、邮箱和密码格式
            var regn=/^\w{3,}$/;    //请输入用3-12位户名
            var regp=/^\w{6,12}$/;   //请输入6-12位密码
            var rege=/^([a-zA-Z]|[0-9])(\w|\-)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/;
            if(!regn.test(n)){
                this.$toast("请输入3位以上用户名");
                return;
            }else if(!rege.test(e)){
                 this.$toast("请输入正确的邮箱");
                return;
            }else if(!regn.test(p)){
                 this.$toast("请输入6-12位密码");
                return;
            };
            //验证upwd和ypwd2是否一样
            if(p!=p2){
                this.$toast("两次输入密码不相同");
                return;
            };
            console.log(222);
            //发送ajax请求注册
            var url="user/reg";
            var obj={uname:n,upwd:p,email:e};
            this.axios.get(url,{params:obj})
            .then(result=>{
                console.log("ok");
                this.$router.push("Login");
            })
        },
        login(){
            this.$router.push("./Login")
        }
    },
    //监听对象
    watch:{
        uname(){
            this.search();
        },
        checked(){
            this.checkbox();
        }
    }
}
</script>
<style scoped>
    .container-fluid{
        display:flex;
        align-items:center;
        height:100%;
        background-color:gray;
}
form{
    padding: 2rem;
}
form>div+div{
    margin-top:1.5rem;
}
.small{
    font-size:0.8rem;
}

/*@media screen and (min-width:992px){
    .container-fluid>div{
        width:50%;
        margin:0 auto;
    }
}
@media screen and (max-width:991px) and (min-width:768px){
    .container-fluid>div{
        width:50%;
        margin:0 auto;
    }
}
@media screen and (max-width:767px){
    .container-fluid>div{
        width:75%;
        margin:0 auto;
    }
}*/
.container-fluid>div{
    width:35rem;
    min-width:35rem;
    margin:0 auto;
}
a:hover{
    text-decoration: none;
}
.f-color{
    color:#878787;
    text-decoration: none;
}
</style>
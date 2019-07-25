<template>
    <div class="container-fluid">
        <div>
            <div>
                <img class="w-100" src="../assets/logo.png" alt="">
            </div>
            <div class="mt-2">
                <form class="bg-white" method="post" action="/user/login">
                    <div>
                        <strong>密码登录</strong>
                    </div>
                    <div>
                        <input v-model="uname" type="text" @keyup.13="login" class="form-control" placeholder="请输入用户名">
                    </div>
                    <div>
                        <input v-model="upwd" type="password" @keyup.13="login" class="form-control" placeholder="请输入密码">
                    </div>
                    <div class="row small">
                        <label class="col-6" ><input type="checkbox">记住密码</label>
                        <a href="/#/forget" class="col-6 text-right text-danger">忘记密码?</a>
                    </div>
                    <div>
                        <a @click="login" class="btn btn-success w-100">登录</a>
                    </div>
                    <div>
                        <a class="btn btn-primary w-100" href="/#/reg">注册</a>
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
            upwd:""
        }
    },
    methods: {
        //点击登录事件
        login(){
            //console.log(111);
            //获取用户输入的用户名，密码
            var n=this.uname;
            var p=this.upwd;
            //验证用户名和密码不能为空
            //判断用户名、密码格式是否正确
            if(n==""){
                this.$toast("用户名不能为空");
                return;
            };
            if(p==""){
                this.$toast("密码不能为空");
                return;
            }
            //发送ajax请求
            var url="user/login";
            var obj={uname:n,upwd:p};
            this.axios.get(url,{params:obj}).then(result=>{
                //console.log(result.data.code);
                if(result.data.code==200){
                    this.$router.push("/");
                }else{
                    this.$messagebox("用户名或密码错误");
                }
            })
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
}
</style>
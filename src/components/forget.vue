<template>
    <div class="container-fluid">
        <div>
            <div>
                <img class="w-100" src="../assets/logo.png" alt="">
            </div>
            <div id="content" class="mt-2 bg-white">
                <div>
                    <strong>邮箱地址</strong>
                </div>
                <div>
                    <input v-model="email" type="email" @keyup.13="login" class="form-control" placeholder="请输入邮箱地址">
                </div>
                <div>
                    <a class="btn btn-primary w-100" href="#">提交</a>
                </div>
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
       
    }
}
</script>
<style scoped>
    .container-fluid{
        display:flex;
        height:100%;
        padding-top:10rem;
        background-color:gray;
}
.container-fluid>div{
    width:35rem;
    min-width:35rem;
    margin:0 auto;
}
#content{
    padding: 2rem;
    color:#666;
}
#content>div{
    margin-top:1rem;
}
.f-color{
    color:#878787;
}
</style>
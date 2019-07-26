<template>
    <div class="container-fluid">
        <!--    header    -->
        <div class="row">
            <!--header 左-->
            <div class="col-lg-4 col-md-5 col-sm-12 pl-0">
                <div id="header-left" class="row">
                    <!--左img logo-->
                    <div @click="goIndex" class="col-10">
                        <img src="../../assets/logo.png" alt="">
                    </div>
                    <!--左button  bars-->
                    <div id="bars" class="col-2 mt-2">
                        <div @click="menu">
                            <img src="../../assets/bars.png" alt="">
                        </div>
                        
                    </div>
                </div>
            </div>
             <div class="col-lg-4 col-md-2"></div>
            <!-- header 右-->
            <div id="header-right" class="col-lg-4 col-md-5 col-sm-12 pr-0">
                    <ul>
                        <!--search 图标-->
                        <li  >
                            <a >
                                <img src="../../assets/search.png" alt="">
                            </a>
                        </li>
                        <!--bear 图标-->
                        <li @mouseenter="enter(1)" @mouseleave="leave">
                            <a>
                                <img src="../../assets/bell.png" alt="">
                                <span class="badge badge-danger">{{iLen}}</span>
                            </a>
                            <ul class="one" v-show="sean&&current==1">
                                <li v-for="(item,index) of iList" :key="index">{{index+1}}.{{item.title}}</li>
                            </ul>
                        </li>
                        <!--envelope 图标-->
                        <li @mouseenter="enter(2)" @mouseleave="leave">
                            <a>
                                <img src="../../assets/envelope.png" alt="">
                                <span class="badge badge-primary">{{mLen}}</span>
                             </a>
                             <ul class="two" v-show="sean&&current==2">
                                <li v-for="(item,index) of mList" :key="index">{{index+1}}.来自“{{item.sender}}”的新消息</li>
                             </ul>
                        </li>
                        <!--登录按钮-->
                        <li v-show="!islogin">
                            <a href="/#/login">请登录</a> 
                        </li>
                        <li v-show="islogin" @mouseenter="enter(3)" @mouseleave="leave">
                            <a >
                                <img :src="userAvatar" alt="">
                            </a>
                            <ul class="three" v-show="sean&&current==3">
                                <li>设置</li>
                                <li>退出</li>
                                <li></li>
                            </ul>
                        </li>
                    </ul>
            </div>
        </div>
        <asidenav class="row" 
            :isActive="isActive"
        ></asidenav>
    </div>
</template>
<script>
import Aside from './Aside.vue';
export default {
    data(){
        return{
            isActive:false,
            sean:false,
            current:0,
            userAvatar:"",
            iLen:"",     //未读通知数量
            iList:[],   //未读通知列表
            mList:[],   //未读message列表
            mLen:"",     //未读message数量
            uid:"",
            islogin:false  //false未登录，true登录
        }
    },
    created() {
         this.login()
    },
    methods: {
        //点击bars图片，显示和隐藏侧边栏
        menu(){
            if(this.isActive==true){
                this.isActive=false;
            }else{
                this.isActive=true;
            }
           
        },

        //是否登录值传递给父组件
        login(){
            var obj={uid:this.uid}
            this.axios.get("user/userIslogin")
            .then(result=>{
                //console.log(result.data==1)
                if(result.data==1){
                    return;
                }else{
                    this.islogin=true;
                    this.userAvatar="http://smstest.applinzi.com/"+result.data[0].avatar;
                    console
                    .log(result.data[0].avatar)
                }
                 
            })  
            //false未登录，true登录,登录后调用通知和信息函数
                this.imform();
                this.message();
                this.$emit('userIsLogin',(this.islogin));
        },

        //鼠标移入
        enter(index){
            this.sean=true;
            this.current=index;
        },
        //鼠标移出
        leave(){
            this.sean=false;
        },

        //imform通知，未读(1,已读2),
        imform(){
            var obj={uid:this.uid}
            this.axios.get("user/inform1")
            .then(result=>{
                this.iLen=result.data.length;
                this.iList=result.data;
                //console.log(this.iLen);
            })  
        },

        //message通知，未读1,(已读2),
        message(){
            var obj={uid:this.uid}
            //console.log(this.uid)
            this.axios.get("user/message")
            .then(result=>{
                //console.log(result.data)
                this.mLen=result.data.length;;
                this.mList=result.data;
            })  
        },
        //页头admin图片点击跳转到首页
        goIndex(){
            this.$router.push("/")
        }
    },
    components:{
      "asidenav":Aside
  },
  watch: {
      //监听是否登录状态
      islogin(){
          //给父组件传登录状态
          this.login()
      }
  },
}
</script>
<style scoped>
    .container-fluid>{
        height:100%;
        
    }
    asidenav{
        height:100%;
    }
    .container-fluid>div:first-child{
         background-color:#fff;
         padding:0rem 2rem;
    }
    .container-fluid>div:last-child{
        height:100%;
    }
    @media screen and (max-width:767px){
   
    }
    /*头左侧login图标 */
    #header-left>div:first-child>img{
        width:15rem;
    }
    /*头左侧样式 */
    #header-left{
        display:flex;
        justify-content:space-between;
        align-items:center;
    }
    /*header左侧bars图标 */
    #bars{text-align:end;}
    /*header右侧样式 */
    #header-right{
        display:flex;
        justify-content:flex-end;
        align-items:center;
    }
    /*登录后头像的样式 */
    #header-right>ul>li:last-child>a>img{
        width:2rem;
        border-radius:50%
    }
    .my_small{
        font-size: 0.3rem;
    }
    /*ul去点 */
    #header-right>ul{
        list-style:none;
        display: flex;
        align-items: center;
        margin:0;
    }
    #header-right>ul>li{
        margin:0 1rem;
        position:relative;
    }
    #header-right>ul>li a{
        text-decoration: none;
    }
    /*右侧图标大小 */
    #header-right>ul>li img{
        width:1.2rem;
    }
    #header-right>ul>li span{
        border-radius: 50%;
        font-weight: 400;
        padding:0.1rem 0.25rem;
        position: absolute;
        bottom:0.4rem;
    }
     /*头部右侧鼠标移入显示和隐藏的ul样式 */
    #header-right>ul>li>ul{
        position: absolute;
        z-index:9;
        padding:0.5rem;
        background-color:#fff;
        /*display:none;*/
    }
     #header-right>ul>li>ul>li{
         overflow:auto;
        font-size:12px;
     }
   
    .one{
        width:10rem;
        left:-4rem;
    }
    .two{
        width:10rem;
        left:-4rem; 
    }
    .three{
        width:3rem;
        left:-0.5rem; 
    }
    #header-right ul>li ul>li:hover {
        background-color:#007bff30;
    }
</style>
<template>
    <div>
        <headtile
             @userIsLogin="userIsLogin"
        ></headtile>
        <div class="row">
            <div id="content" class="col mt-2">
                <div class="row m-3 p-3 bg-white">
                    <div class="col-sm-12">
                        <h4>学生列表</h4>
                        <div class="row mb-2 ">
                            <div class="col-8">
                                 <span>每页显示数量</span>
                                <select v-model="count">
                                    <option v-for="(item,index) of arr" :key="index">{{item}}</option>
                                </select>
                            </div>
                            <div class="col-4 w-100">
                                <input v-model="name"  type="text" placeholder="请输入要查找的姓名">
                                <span @click="search">
                                    <img src="../assets/search.png">
                                </span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 table-responsive">
                                <table class="table table-striped">
                                    <tr>
                                        <th>序号</th>
                                        <th>学号</th>
                                        <th>姓名</th>
                                        <th>性别</th>
                                        <th>年级</th>
                                        <th>专业</th>
                                        <th>联系电话</th>
                                        <th>成绩</th>
                                        <th>个人详情</th>
                                    </tr>
                                    <tr v-for="(item,index) in list" :key="index">
                                        <!--每一页起始数据编号(pno-1)*count+1-->
                                        <td>{{(pno-1)*count+1+index}}</td>
                                        <td>{{item.sid}}</td>
                                        <td>{{item.student_name}}</td>
                                        <td>{{item.gender==0?"女":"男"}}</td>
                                        <td>{{item.grade}}级</td>
                                        <td>{{item.special}}</td>
                                        <td>{{item.Emergency_contact_phone}}</td>
                                        <td>
                                            <a :href="`/#/score?sid=${item.sid}`">查看</a>
                                        </td>
                                        <td> 
                                            <a :href="`/#/sdetail?sid=${item.sid}`">查看</a>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <pages 
                            :count="count"
                            :totalcount="totalcount"
                            @pnoselect="pnoFromPages"
                        ></pages>
                    </div>
                </div>
            </div> 
        </div>
    </div>
</template>
<script>
import Header from './common/Header.vue';
import pages from './common/pages.vue';
export default {
    data(){
        return{
            list:[],
            arr:[5,10,15,20],
            pno:"1",//页码
            count:5,//每页页数量
            totalcount:"",//页码总数量
            isLogin:false, //判断用户是否登录
            name:"",  //查询条件名字
        }
    },
     components:{
      "headtile":Header,
      "pages":pages
    },
    created(){
        this.total();
        this.loadList();
        this.userIsLogin();
    },
    computed: {
    },
    methods:{
        //获取header分页栏中判断用户是否登录
        userIsLogin:function(data){
            //console.log("data:"+data)
            this.isLogin=data;
            console.log(data)
        },
        //获取分页栏子组件通过点击事件传来的pno值
        pnoFromPages:function(data){
            //console.log("父组件内"+data);
            this.pno=data;
        },


        //获取总的学生数量
        total(){
            //发送ajax，获取列表数量。
            var url="student/total";
            this.axios.get(url).then(result=>{
                //console.log(result.data.length);
                this.totalcount=result.data.length;
            })
        },
        //加载学生列表
        loadList(){
            //console.log(111);
             //1：获取当前页码加this.pno
            //2：创建url 请求地址
           if(this.isLogin==false){
               return;
           }else{
                var url="student/StudentList";
                //3：创建参数对象
                var obj={pno:this.pno,count:this.count};
                //4：发送ajax
                this.axios.get(url,{params:obj})
                .then(result=>{
                    console.log(result.data[0].student_name);
                    var arr=[]
                    for(var i=0;i<result.data.length;i++){
                        if(result.data[i].student_name.indexOf(this.name)!=-1){//不等于-1就是找到
                            arr.push(result.data[i])
                        }
                    }
                    this.list=arr;
                });
            }
            //获取当前行的学号
            //发送ajax请求，获取年级和班级信息
        },
        //根据查询条件，点击search查询学生
        search(){
            console.log(this.name)
            this.loadList()
        }
    },
    watch:{
        //监控count
        count(){
            this.loadList();
        },
        pno(){
            this.loadList();
        },
         isLogin(){
             this.loadList();
         }
    }
};
</script>
<style scoped>
    #content{
        height: 93vh;
        overflow-y:scroll;
    }
    th,td{
        /* border:1px solid #000; */
        text-align:center;
    }
    a{
        text-decoration: none;
    }
    h4{
        text-align:center;
    }
    /*奇偶行颜色*/      
    .table-striped>tr:nth-of-type(odd){
        background-color:#f2f2f2
        }
    /* 划过时的颜色 */
    .table-striped>tr:hover{background-color:#FAFAD2}

</style>
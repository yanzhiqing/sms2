<template>
    <div>
        <headtile></headtile>
        <!-- 成绩表 -->
        <div class="row" id="content">
            <div class="col table-responsive">
                <h4 class="title">{{name}}成绩表</h4>
                
                <table class="table table-striped">
                    <tr>
                        <th>序号</th>
                        <th>课程</th>
                        <th>成绩</th>
                        <th>班级排名</th>
                        <th>年级排名</th>
                    </tr>
                    <tr v-for="(item,index) of list" :key="index">
                        <td>{{index+1}}</td>
                        <td>{{item.csname}}</td>
                        <td>{{item.score}}</td>
                        <td>班级排名</td>
                        <td>年级排名</td>
                    </tr>
                </table>
                </div>
        </div>
    </div>
</template>
<script>
import Header from './common/Header.vue';
export default {
    data(){
        return{
            sid:20180001,
            name:"",
            list:[]  //学生成绩列表
        }
    },
    created() {
        this.score();
    },
    methods: {
        score(){
            //获取地址栏穿过来的sid
            var URL=location.href;
            var arr=URL.split("=");
            //地址栏的sid
            var id=arr[1];
            //console.log(id);
            this.sid=id;
            var url="student/score";
            var obj={sid:this.sid};
            this.axios.get(url,{params:obj})
            .then(result=>{
                //console.log(result.data)
                this.list=result.data;
                //console.log(result.data[0].student_name)
                this.name=result.data[0].student_name;
            })
        }
    },
    computed: {
    },
     components:{
      "headtile":Header
    },
}
</script>
<style scoped>
    #content{
        padding-top:2rem;
        padding-right:2rem;
        padding-left:3rem;
        height: 93vh;
        overflow-y:scroll;
    }
    #content>div{
        padding:2rem;
        background-color:#fff;
    }
    .title{
        text-align: center;
    }
</style>
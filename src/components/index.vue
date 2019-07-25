<template>
    <div>
        <headtile></headtile>
        <!-- 首页 -->
        <div class="row" id="content">
            <div class="col-lg-3 col-md-6 col-sm-12">
                <div>学生{{studentTotle}}人</div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12">
                <div>老师{{teacherTotle}}人</div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12">
                <div>宿舍{{dormitoryTotle}}个</div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12">
                <div>专业{{majorTotle}}个</div>
            </div>
             <div id="main" style="width:100%;height:30rem;"></div>
        </div>
       
    </div>
</template>
<script>
import Header from './common/Header.vue';
export default {
    data(){
        return{
            studentTotle:1,
            teacherTotle:1,
            dormitoryTotle:1,
            majorTotle:1,
            
        }
    },
    created() {
        this.getTotle();
         
    },
    methods: {
        getTotle(){
            //获取用户（老师）总数
            this.axios.get("user/userTotal")
            .then(result=>{
                //console.log(result.data.length);
                this.teacherTotle=result.data.length;
                //console.log(this.teacherTotle);
            })
            //获取学生总数
            this.axios.get("student/total")
            .then(result=>{
                //console.log(result.data.length);
                this.studentTotle=result.data.length;
                //console.log(this.studentTotle);
            })
             //获取宿舍总数
            this.axios.get("dormitory/total")
            .then(result=>{
                //console.log(result.data.length);
                this.dormitoryTotle=result.data.length;
                //console.log(this.dormitoryTotle);
            })
             //获取专业（班级）总数
            this.axios.get("student/majortotal")
            .then(result=>{
                //console.log(result.data.length);
                this.majorTotle=result.data.length;
                //console.log(this.result.data.length);
            })
        },
        getMycharts(){
            //页面开始时加载首页折现统计图
            var main = document.getElementById("main");
            var mycharts = echarts.init(main);
            var option = {
            title:{text:"各科平均成绩统计图"},
            xAxis:{data:["高等数学1","高等数学1","计算机基础","大学语文","线性代数"]},
            yAxis:{},
            series:[
                {type:"line",data:[62,88,77,85,66]},
                //{type:"line",smooth:true,data:[30,1,15,2]},
                //{type:"bar",data:[30,1,15,2]}
            ]
            };
            mycharts.setOption(option);
        }
    },
    mounted(){
        //初始化执行
       this.getMycharts();
    },
     components:{
      "headtile":Header
    },
    watch: {
       
    },
}
</script>
<style scoped>
   
    #content{
        padding-top:2rem;
        padding-right:2rem;
        padding-left:3rem;
    }
    #content>div{
        /*padding-left:0rem;
        padding-right:0rem;*/
        padding-bottom:1rem;
    }
     /*画布颜色 */
     #content #main{
         background-color: #fff;
         padding:1rem;
    }
     
     #content>div>div{
         height:5rem;
         text-align: center;
         line-height: 5rem;
         background-color:#fff;
     }
</style>
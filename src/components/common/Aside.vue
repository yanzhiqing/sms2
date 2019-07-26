<template>
    <div id="aside" :style="isActive==true?stylewidth:''" >
        <ul class="pl-1">
            <li>
                <button data-toggle="collapse" data-target="#ul1" class="btn btn-outline-primary btn-lg border-0">基础信息管理</button>
                <ul class="collapse show" id="ul1">
                    <li class="">
                        <a class="btn btn-outline-primary btn-md border-0" href="/#/grade">年级信息</a>
                    </li>
                    <li>
                        <a class="btn btn-outline-primary btn-md border-0" href="/#/major">专业信息</a>
                    </li>
                    <li>
                        <a class="btn btn-outline-primary btn-md border-0" href="/#/schedule">课程列表</a>
                    </li>
                </ul>
            </li>
            <li>
                <button data-toggle="collapse" data-target="#ul2" class="btn btn-outline-primary btn-lg border-0">学生信息管理</button>
                <ul class="collapse show" id="ul2">
                    <li class="">
                        <a class="btn btn-outline-primary btn-md border-0" href="/#/StudentList">学生列表</a>
                    </li>
                    <li>
                        <a class="btn btn-outline-primary btn-md border-0" href="#">成绩管理</a>
                    </li>
                    <li>
                        <a class="btn btn-outline-primary btn-md border-0" href="#">统计分析</a>
                    </li>
                </ul>
            </li>
            <li>
                <button data-toggle="collapse" data-target="#ul3" class="btn btn-outline-primary btn-lg border-0">宿舍信息管理</button>
                <ul class="collapse show" id="ul3">
                    <li class="">
                        <a class="btn btn-outline-primary btn-md border-0" href="#">男生宿舍</a>
                    </li>
                    <li>
                        <a class="btn btn-outline-primary btn-md border-0" href="#">女生宿舍</a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</template>
<script>
//import bus from '../../bus.js'
export default {
    props:["isActive"],
    data(){
        return{
            //isActive:false
            stylewidth:{
                "width":"0rem"
            }
        }
    },
    methods: {
        
    },
    created() {
    },
}
</script>
<style scoped>
    ul{
        margin-top:1rem;
        list-style:none;
        height: 100%;
    }
    #aside{
        float:left;
        background-color: #fff;
        padding: 0px;
        height: 95vh;
        text-align:center;
        transition:width 0.5s linear;
        overflow:hidden;
         width:10rem;
    }
    /*.active{
        display:none;
    }*/
    

</style>
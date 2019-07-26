<template>
    <div>
        <headtile></headtile>
        <!-- 个人详情表 -->
        <div class="row table-responsive" id="content">
            <div class="col">
            <table class="table table-striped">
                <tr>
                    <td>姓名</td>
                    <td>{{detail.student_name}}</td>
                    <td>性别</td>
                    <td>{{detail.gender==0?"女":"男"}}</td>
                    <td rowspan="3">
                        <img class="w-100" :src="`http://smstest.applinzi.com/${detail.avatar}`" alt="">
                    </td>
                </tr>
                <tr>
                    <td>学号</td>
                    <td>{{sid}}</td>
                    <td>民族</td>
                    <td>{{detail.nation}}</td>
                </tr>
                <tr>
                    <td>政治面貌</td>
                    <td>{{detail.Political_status}}</td>
                    <td>手机</td>
                    <td>{{detail.s_phone}}</td>
                </tr>
                <tr>
                    <td>出生日期</td>
                    <td>{{detail.birthday}}</td>
                    <td>国籍</td>
                    <td colspan="2">{{detail.nationality}}</td>
                </tr>
                <tr>
                    <td>紧急联系人</td>
                    <td>{{detail.Emergency_contact}}</td>
                    <td>联系人电话</td>
                    <td colspan="2">{{detail.Emergency_contact_phone}}</td>
                </tr>
                <tr>
                    <td>身份证号</td>
                    <td colspan="4">{{detail.ID_number}}</td>
                </tr>
                <tr>
                    <td>户口所在地</td>
                    <td colspan="4">{{detail.Domicile_place}}</td>
                </tr>
                <tr>
                    <td>现住址</td>
                    <td colspan="4">{{detail.address}}</td>
                </tr>
                <tr>
                    <td>备注信息</td>
                    <td colspan="4">{{detail.message}}</td>
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
            detail:""
        }
    },
     components:{
      "headtile":Header
    },
    created() {
        this.sdetail();
    },
    methods: {
        //ajax发送请求获取学生详细信息
        sdetail(){
            var URL=location.href;
            var arr=URL.split("=");
            //地址栏的sid
            var id=arr[1];
            console.log(id);
            this.sid=id;
            var url="student/detail";
            var obj={sid:this.sid};
            this.axios.get(url,{params:obj})
            .then(result=>{
                console.log(result.data)
                this.detail=result.data[0];
            })
        }
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
        padding:2rem;
        background-color:#fff;
    }
    td{
        width:20%;
      border:1px solid #000;  
    }
</style>
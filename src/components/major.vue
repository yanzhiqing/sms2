<template>
    <div>
        <headtile></headtile>
        <div class="row">
            <div id="content" class="col mt-2">
                <div class="row m-3 p-3 bg-white">
                    <div class="col-sm-12">
                        <h4>专业列表</h4>
                        <div class="mb-2">
                            <span>每页显示数量</span>
                            <select v-model="count">
                                <option v-for="(item,index) of arr" :key="index">{{item}}</option>
                            </select>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 table-responsive">
                                <table class="table table-striped">
                                    <tr>
                                        <th>序号</th>
                                        <th>专业名称</th>
                                        <th>专业代码</th>
                                        <th>备注</th>
                                        <th>查看</th>
                                    </tr>
                                    <tr v-for="(item,index) in list" :key="index">
                                        <!--每一页起始数据编号(pno-1)*count+1-->
                                        <td>{{(pno-1)*count+1+index}}</td>
                                        <td>{{item.special}}级</td>
                                        <td>{{item.cid}}</td>
                                        <td>无</td>
                                        <td>
                                           <a>查看</a>
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
            totalcount:""//页码总数量
        }
    },
     components:{
      "headtile":Header,
      "pages":pages
    },
    created(){
        this.total();
        this.loadList();

    },
    computed: {
    },
    methods:{
        pnoFromPages:function(data){
            //console.log("父组件内"+data);
            this.pno=data;
        },
        //获取总的年级数量
        total(){
            //发送ajax，获取列表数量。
            var url="student/majorTotal";
            this.axios.get(url).then(result=>{
                //console.log(result.data.length);
                this.totalcount=result.data.length;
            })
        },
        //加载年级列表
        loadList(){
            //console.log(111);
             //1：获取当前页码加this.pno
            //2：创建url 请求地址
            var url="/student/major";
            //3：创建参数对象
            var obj={pno:this.pno,count:this.count};
            //4：发送ajax
            this.axios.get(url,{params:obj})
            .then(result=>{
                //console.log(result.data);
                this.list=result.data;
            });
            //获取当前行的学号
            //发送ajax请求，获取年级和班级信息
        }
    },
    watch:{
        //监控count
        count(){
            this.loadList();
        },
        pno(){
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
<template>
    <!-- 分页栏 -->
    <div class="pages">
        <span>第{{pno}}页/共{{totalpno}}页</span> 
        <ul>
            <li @click="select(1)"  class="btn" >首页</li>
            <li @click="select(pno-1)" class="btn" :class="{'disabled':pno<=1}">上一页</li>
            <li :class="{'active':n==pno}" @click="select(n)" v-for="n of totalpno" :key="n">{{n}}</li>
            <li @click="select(pno+1)"  class="btn"  :class="{'disabled':pno>=totalpno}">下一页</li>
            <li @click="select(totalpno)"  class="btn" >末页</li>
        </ul>
    </div>
</template>
<script>
export default {
    props:["count","totalcount"],  //count每页数量
    data(){
        return{
            pno:1,      //第几页
            //count:5,    //每页数量
            //totalpno:4, //总页数
            //totalcount:16,   //总数量
            show:{
                hide:true
            }
        }
    },
    created() {
    },
    computed:{
        totalpno(){  //计算属性算的总页数
            //计算总页数
            var Tpno=Math.ceil(this.totalcount/this.count);
            //console.log(Tpno);
            return Tpno;
        }
    },
    methods: {
       select(e){
            //console.log(e);
           if(e>=1&&e<=this.totalpno){
                this.pno=e;
            //console.log(this.pno);//点击当前的li
            //e.target.class("active");
            this.$emit('pnoselect',e);
            console.log(this.pno);
           }
       }
  },
  watch: {
  },
}
</script>
<style scoped>
    /* 分页栏样式 */
    .pages{
        margin-top:30px;
        font-size:14px;
        display:flex;
        justify-content:center;
    }
    .pages>ul{
        list-style:none;
        display: flex;
        flex-direction:row;;
        justify-content: center;
        flex-wrap: wrap;
        padding: 0px;
    }
    .pages>ul>li{
        font-size:14px;
        border:1px solid #007bff;
        border-radius: 5px;
        margin:0 7px;
        padding:2px 10px;
    }
    .active{
        background-color:#007bff;
    }
    li:hover{
            background-color:#007bff30;
    }
    .active{
        background-color:#007bff30;
    }
    .hide{
        display:none;
    }
</style>
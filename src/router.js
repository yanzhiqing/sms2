import Vue from 'vue'
import Router from 'vue-router'
import HelloContainer from "./components/HelloWorld.vue"
import Home from "./components/Home.vue"
import Login from "./components/Login.vue"
import reg from "./components/reg.vue"
import forget from "./components/forget.vue"
import StudentList from "./components/StudentList.vue"
import Header from "./components/common/Header.vue"
import Aside from "./components/common/Aside.vue"
//import menu from "./components/jianfeicaipu/menu.vue"
import index from "./components/index.vue"
import score from "./components/score.vue"
import sdetail from "./components/sdetail.vue"
import grade from "./components/grade.vue"
import major from "./components/major.vue"
import schedule from "./components/schedule.vue"

Vue.use(Router)
export default new Router({
  routes: [
    {path:'/schedule',component:schedule},
    {path:'/major',component:major},
    {path:'/grade',component:grade},
    {path:'/sdetail',component:sdetail},
    {path:'/score',component:score},
    {path:'/',component:index},
    //{path:'/menu',component:menu},
    {path:'/Aside',component:Aside},
    {path:'/Header',component:Header},
    {path:'/StudentList',component:StudentList},
    {path:'/forget',component:forget},
    {path:'/reg',component:reg},
    {path:'/Login',component:Login},
    //{path:'/',component:HelloContainer},
    {path:'/Home',component:Home}
  ]
})

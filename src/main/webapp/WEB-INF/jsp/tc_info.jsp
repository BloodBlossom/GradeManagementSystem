<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>教师</title>
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <!-- 先引入 Vue -->
    <script src="https://unpkg.com/vue/dist/vue.js"></script>
    <!-- 引入组件库 -->
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">

</head>

<body class="body" style="margin: 0">
<div id="app" v-cloak>
        <el-container style="height: 100%;">
            <el-header>成绩管理系统--教师端
            <el-button id="btn_header" size="small" round="true" type="primary" @click="logout">退出登陆</el-button>
            </el-header>
            <el-container>
                <el-aside width="200px" style="background-color: #545c64">
                    <el-menu
                            default-active="1"
                            background-color="#545c64"
                            active-text-color="#ffd04b"
                            text-color="#fff">

                        <a onclick="go_tc_info()">
                            <el-menu-item index="1">
                                <template slot="title"><i class="el-icon-user"></i>个人信息</template>
                            </el-menu-item>
                        </a>

                        <a onclick="go_tc_sub()">
                            <el-menu-item index="2">
                                <template slot="title"><i class="el-icon-s-management"></i>学科管理</template>
                            </el-menu-item>
                        </a>

                    </el-menu>
                </el-aside>

                <el-main v-model="tc_info">
                    <el-card class="box-card">
                        姓名：{{tc_info.tc_name}}
                    </el-card>
                    <el-card class="box-card">
                        性别：{{tc_info.tc_gender}}
                    </el-card>
                    <el-card class="box-card">
                        工号：{{tc_info.tc_id}}
                    </el-card>
                    <el-card class="box-card">
                        年龄：{{tc_info.tc_age}}
                    </el-card>
                    <el-card class="box-card">
                        学院：{{tc_info.tc_college}}
                    </el-card>
                    <el-card class="box-card">
                        职位：{{tc_info.tc_position}}
                    </el-card>
                    <el-card class="box-card">
                        邮箱：{{tc_info.tc_email}}
                    </el-card>
                    
                </el-main>
            </el-container>
        </el-container>

</div>
<style>

    [v-cloak] {
        display: none;
    }

    .el-header {
        background-color: #1d2731;
        color: #ffffff;
        line-height: 60px;
        font-family: unset;
    }
    #btn_header{
        position: absolute;
        top: 1.5%;
        right: 2%;
        background-color: black;
        border: none;
    }
    .el-container.is-vertical{
        height: 100%;
    }
    .el-aside {
        color: #333;
    }
    .el-card.box-card.is-always-shadow {
        margin-top: 10px;
        margin-bottom: 10px;
        margin-right: 100px;
    }

    .box-card{
        margin-left: 30px;
        width: 40%;
    }
    a {
        text-decoration: none;
    }
</style>

<script type="text/javascript">
    function go_tc_info(){
        $.get("/tc_info",function (d) {
            window.location.href='./tc_info'
        })

    }

    function go_tc_sub(){
        $.get("/tc_sub",function (d) {
            window.location.href='./tc_sub'
        })

    }
    var app=new Vue( {
        el:'#app',
        data:{
            tabPosition: 'left',
            tc_info:{
                tc_id:'',
                tc_name:'',
                tc_gender:'',
                tc_age:'',
                tc_college:'',
                tc_position:'',
                tc_email:''
            }
        },
        created:function () {
            this.tc_info.tc_id=parseInt(this.getCookie("account"));
            // console.log(this.tc_info.tc_id);
            $.ajax({
                type:'GET',
                url:'/gettc_info',
                data:{
                    tc_id:this.tc_info.tc_id
                },
                dataType:"json",
                success:function (data) {
                    console.log(data);
                    app.tc_info.tc_age=data.tc_age;
                    app.tc_info.tc_gender=data.tc_gender;
                    app.tc_info.tc_name=data.tc_name;
                    app.tc_info.tc_college=data.tc_college;
                    app.tc_info.tc_position=data.tc_position;
                    app.tc_info.tc_email=data.tc_email;
                    if(data.tc_gender=='0'){
                        app.tc_info.tc_gender='男';
                    }else{app.tc_info.tc_gender='女';}
                }
                }

            )
        },
        methods:{
            setCookie: function (cname,cvalue)
            {
                document.cookie = cname + "=" + cvalue + "; ";
            },
            getCookie: function (cname)
            {
                let name = cname + "=";
                let ca = document.cookie.split(';');
                for(let i=0; i<ca.length; i++)
                {
                    let c = ca[i].trim();
                    console.log(c);
                    if (c.indexOf(name)==0) return c.substring(name.length,c.length);

                }
                return "";
            },
            delCookie: function(name)
            {
                let exp = new Date();
                exp.setTime(exp.getTime() - 1);
                let cval = app.getCookie(name);
                if (cval != null)
                    document.cookie = name + "=" + cval + ";expires=" + exp.toGMTString();
            },
            logout: function () {
                app.delCookie("account");
                app.delCookie("type");
                window.location.href = './login'
            }
        }
    })
</script>


</body>
<script src="https://unpkg.com/vue/dist/vue.js"></script>

</html>
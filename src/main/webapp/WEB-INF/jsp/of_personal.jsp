<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员</title>
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <!-- 先引入 Vue -->
    <script src="https://unpkg.com/vue/dist/vue.js"></script>
    <!-- 引入组件库 -->
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">

</head>
<body class="body" style="margin: 0">

<div id="app" v-cloak>
    <el-container style="height: 100%; border: 0px solid #eee">
        <el-header>成绩管理系统--管理员端
            <el-button id="btn_header" size="small" round="true" type="primary" @click="logout">退出登陆</el-button>
        </el-header>
        <el-container>
            <el-aside width="200px" style="background-color: #545c6a">
                <el-menu
                        default-active="1"
                        background-color="#545c64"
                        active-text-color="#ffd04b"
                        text-color="#fff"
                >

                    <a onclick="go_personal()">
                        <el-menu-item index="1">
                            <template slot="title"><i class="el-icon-user"></i>个人信息</template>
                        </el-menu-item>
                    </a>

                    <a onclick="go_user()">
                        <el-menu-item index="2">
                            <template slot="title"><i class="el-icon-s-custom"></i>用户信息管理</template>
                        </el-menu-item>
                    </a>

                    <a onclick="go_subject()">
                        <el-menu-item index="3">
                            <template slot="title"><i class="el-icon-s-management"></i>学科信息管理</template>
                        </el-menu-item>
                    </a>

                    <a onclick="go_grade()">
                        <el-menu-item index="4">
                            <template slot="title"><i class="el-icon-medal-1"></i>成绩信息管理</template>
                        </el-menu-item>
                    </a>

                </el-menu>
            </el-aside>

            <el-main v-model="of_info">
                <el-card class="box-card">
                    姓名：{{of_info.of_name}}
                </el-card>
                <el-card class="box-card">
                    性别：{{of_info.of_gender}}
                </el-card>
                <el-card class="box-card">
                    工号：{{of_info.of_id}}
                </el-card>
                <el-card class="box-card">
                    年龄：{{of_info.of_college}}
                </el-card>
                <el-card class="box-card">
                    年龄：{{of_info.of_age}}
                </el-card>
                <el-card class="box-card">
                    邮箱：{{of_info.of_email}}
                </el-card>
            </el-main>
        </el-container>
    </el-container>
</div>
<style>
    [v-cloak] {
        display: none;
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

    .el-header {
        background-color: #1d2731;
        color: #ffffff;
        line-height: 60px;
        font-family: unset;
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
    .block{
        display: flex;
        justify-content: center;
    }
    a {
        text-decoration: none;
    }
</style>
<script type="text/javascript">

    function go_personal(){
            window.location.href='./of_personal'
    }

    function go_user(){
            window.location.href='./of_user'
    }

    function go_subject(){
            window.location.href='./of_subject'
    }

    function go_grade(){
            window.location.href='./of_grade'
    }

    var app=new Vue( {
        el:'#app',
        data:{
            tabPosition: 'left',
            of_info:{
                of_name:'',
                of_gender:'',
                of_id:'',
                of_college:'',
                of_age:'',
                of_email:''
            }
        },
        created:function(){
            this.of_info.of_id = parseInt(this.getCookie("account"));
            $.ajax({
                type: 'GET',
                url: '/getAdInfo',
                data: {
                    account: this.of_info.of_id
                },
                dataType: "json",
                success: function (data) {
                    //console.log(data)
                    app.of_info.of_name = data.ad_name;
                    app.of_info.of_college = data.ad_college;
                    app.of_info.of_age = data.ad_age;
                    app.of_info.of_email = data.ad_email;
                    if (data.ad_gender == 0){
                        app.of_info.of_gender = '男';
                    }
                    else {
                        app.of_info.of_gender = '女';
                    };
                }
            })

        },
        mounted: function () {
        },
        methods:{
            setCookie: function (cname,cvalue)
            {
                let exp = new Date();
                exp.setTime(exp.getTime()+ 7*24*60*60*1000);
                document.cookie = cname + "=" + cvalue + ";expires=" + exp.toGMTString();
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
    });


</script>
</body>
</html>

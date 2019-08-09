<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户</title>
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
                        default-active="2"
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

            <el-main>

                <el-form :inline="true" :model="form" class="demo-form-inline" style="align: center">
                    <el-form-item label="工号">
                        <el-input v-model="form.user_id" placeholder="无"></el-input>
                    </el-form-item>
                    <el-form-item label="姓名">
                        <el-input v-model="form.user_name" placeholder="无"></el-input>
                    </el-form-item>
                    <el-form-item label="密码">
                        <el-input v-model="form.password" placeholder="无"></el-input>
                    </el-form-item>
                    <el-form-item label="类型" stytle="width=500px">
                        <el-select v-model="form.type" placeholder="无">
                            <el-option label="学生" value="1"></el-option>
                            <el-option label="教师" value="0"></el-option>
                            <el-option label="管理员" value="2"></el-option>
                        </el-select>
                    </el-form-item>
                    <el-form-item>
                        <el-button type="primary" @click="Select_user">查询</el-button>
                    </el-form-item>
                    <el-form-item>
                        <el-button type="primary" @click="Add_user">增添</el-button>
                    </el-form-item>
                </el-form>

                <el-divider></el-divider>

                <el-table :data="displayData" style="width: 100%;height: 68%;">

                    <el-table-column sortable prop="account"  label="工号" width="250" align="center"></el-table-column>
                    <el-table-column sortable prop="name"     label="姓名" width="250" align="center"></el-table-column>
                    <el-table-column sortable prop="password" label="密码" width="250" align="center"></el-table-column>
                    <el-table-column sortable prop="type"     label="类型" width="250" align="center"></el-table-column>

                    <el-table-column align="center">
                        <template slot-scope="scope">
                            <el-button size="mini" @click="Delete_user(scope.$index)">删除</el-button>
                        </template>
                    </el-table-column>
                </el-table>

                <div class="block">
                    <el-row style="justify: center;">
                        <el-pagination
                                @current-change="handleCurrentChange"
                                layout="prev, pager, next"
                                :total="total_message"
                                :page-size="9">
                        </el-pagination>
                    </el-row>
                </div>

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

    .el-header {
        background-color: #1d2731;
        color: #ffffff;
        line-height: 60px;
        font-family: unset;
    }
    .el-aside {
        color: #333;
    }
    .block{
        display: flex;
        justify-content: center;
    }
    a {
        text-decoration: none;
    }

    .el-input__inner{
        width: 180px;
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

    var app=new Vue({
        el:'#app',
        data:{
            tabPosition: 'left',
            pageNow:0,
            total_message:0,
            form:{
                user_id:'',
                user_name:'',
                password:'',
                type:''
            },
            subjectData:[],
            displayData:[],
        },
        created:function(){
            $.ajax({
                type: 'GET',
                url: '/selectUser',
                data: {
                    user_id: this.form.user_id,
                    user_name: this.form.user_name,
                    password: this.form.password,
                    type: this.form.type
                },
                dataType:'json',
                success: function (data) {
                    for(let i=0;i<data.length;i++)
                    {
                        if(data[i].type == 0){
                            data[i].type = "教师";
                        }
                        else if(data[i].type == 1) {
                            data[i].type = "学生";
                        }
                        else {
                            data[i].type = "管理员";
                        }
                    }
                    app.subjectData = data;
                    app.total_message = app.subjectData.length;
                    app.displayData = app.subjectData.slice(0,9);
                }
            })
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
            Select_user:function () {
                console.log(app.form);
                $.ajax({
                    type: 'GET',
                    url: '/selectUser',
                    data: {
                        user_id: app.form.user_id,
                        user_name: app.form.user_name,
                        password: app.form.password,
                        type: app.form.type
                    },
                    dataType:'json',
                    success: function (data) {
                        for(let i=0;i<data.length;i++)
                        {
                            if(data[i].type == 0){
                                data[i].type = "教师";
                            }
                            else if(data[i].type == 1) {
                                data[i].type = "学生";
                            }
                            else {
                                data[i].type = "管理员";
                            }
                        }
                        app.subjectData = data;
                        app.total_message = app.subjectData.length;
                        app.displayData = app.subjectData.slice(0,9);
                    },
                    error:function (e) {
                        app.$message.error('查询失败! >_<');
                    }
                })
            },
            Add_user:function () {
                console.log(app.form);
                $.ajax({
                    type: 'POST',
                    url: '/addUser',
                    data: {
                        user_id: app.form.user_id,
                        user_name: app.form.user_name,
                        password: app.form.password,
                        type: app.form.type
                    },
                    success:function (data) {
                        app.$message.success('增添成功！^.^')
                        app.clear();
                        app.Select_user();
                    },
                    error:function (e) {
                        app.$message.error('增添失败! >_<');
                    }
                })
            },
            Delete_user:function (index) {
                index = app.pageNow * 9 + index;

                if(app.subjectData[index].type == "教师"){
                    app.subjectData[index].type = 0;
                }
                else if(app.subjectData[index].type == "学生") {
                    app.subjectData[index].type = 1;
                }
                else {
                    app.subjectData[index].type = 2;
                }

                $.ajax({
                    type: 'POST',
                    url: '/deleteUser',
                    data: {
                        user_id: app.subjectData[index].account,
                        user_name: app.subjectData[index].name,
                        password: app.subjectData[index].password,
                        type: app.subjectData[index].type,
                    },
                    success:function (data) {
                        app.$message.success('删除成功！^.^')
                        app.clear();
                        app.Select_user();
                    },
                    error:function (e) {
                        app.$message.error('删除失败! >_<');
                    }
                })
            },
            handleCurrentChange:function(val){
                app.displayData = [];
                console.log(app.displayData);
                app.displayData = app.subjectData.slice((val-1)*9,val*9);
                console.log(app.subjectData);
                console.log(app.displayData);
            },
            clear:function () {
                app.form.user_id='';
                app.form.user_name='';
                app.form.password='';
                app.form.type='';
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


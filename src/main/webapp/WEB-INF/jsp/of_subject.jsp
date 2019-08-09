<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学科</title>
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
                        default-active="3"
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
                    <el-form-item label="学科编号">
                        <el-input v-model="form.su_id" placeholder="无"></el-input>
                    </el-form-item>
                    <el-form-item label="学科名称">
                        <el-input v-model="form.su_name" placeholder="无"></el-input>
                    </el-form-item>
                    <el-form-item label="教师编号">
                        <el-input v-model="form.tc_id" placeholder="无"></el-input>
                    </el-form-item>
                    <el-form-item label="教师姓名">
                        <el-input v-model="form.tc_name" placeholder="无"></el-input>
                    </el-form-item>
                    <el-form-item label="学分">
                        <el-input v-model="form.credit" placeholder="无"></el-input>
                    </el-form-item>
                    <el-form-item>
                        <el-button type="primary" @click="Select_subject">查询</el-button>
                    </el-form-item>
                    <el-form-item>
                        <el-button type="primary" @click="Add_subject">增添</el-button>
                    </el-form-item>
                </el-form>

                <el-divider></el-divider>

                <el-table :data="displayData" style="width: 100%;height: 68%;">

                    <el-table-column sortable prop="su_no"      label="学科编号" width="200" align="center"></el-table-column>
                    <el-table-column sortable prop="su_name"    label="学科名称" width="200" align="center"></el-table-column>
                    <el-table-column sortable prop="tc_id"      label="教师编号" width="200" align="center"></el-table-column>
                    <el-table-column sortable prop="tc_name"    label="教师姓名" width="200" align="center"></el-table-column>
                    <el-table-column sortable prop="su_credit"  label="学分"     width="200" align="center"></el-table-column>

                    <el-table-column align="center">
                        <template slot-scope="scope">
                            <el-button size="mini" @click="Delete_subject(scope.$index)">删除</el-button>
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
        width: 110px;
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
                su_id:'',
                su_name:'',
                tc_id:'',
                tc_name:'',
                credit:''
            },
            subjectData:[],
            displayData:[],
        },
        created:function(){
            $.ajax({
                type: 'GET',
                url: '/selectSubject',
                data: {
                    su_no: this.form.su_id,
                    su_name: this.form.su_name,
                    tc_id: this.form.tc_id,
                    tc_name: this.form.tc_name,
                    credit: this.form.credit
                },
                dataType:'json',
                success: function (data) {
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
            Select_subject:function () {
                $.ajax({
                    type: 'GET',
                    url: '/selectSubject',
                    data: {
                        su_no: app.form.su_id,
                        su_name: app.form.su_name,
                        tc_id: app.form.tc_id,
                        tc_name: app.form.tc_name,
                        credit: app.form.credit
                    },
                    dataType:'json',
                    success: function (data) {
                        app.subjectData = data;
                        app.total_message = app.subjectData.length;
                        app.displayData = app.subjectData.slice(0,9);
                    }
                })
            },
            Add_subject:function () {
                $.ajax({
                    type: 'POST',
                    url: '/addSubject',
                    data: {
                        su_no: app.form.su_id,
                        su_name: app.form.su_name,
                        tc_id: app.form.tc_id,
                        tc_name: app.form.tc_name,
                        credit: app.form.credit
                    },
                    success:function (data) {
                        app.$message.success('增添成功！^.^');
                        app.clear();
                        app.Select_subject();
                    },
                    error:function (e) {
                        app.$message.error('增添失败! >_<');
                        app.clear();
                    }
                })
            },
            Delete_subject:function (index) {
                index = app.pageNow * 9 + index;
                console.log(app.subjectData);
                console.log(index);
                $.ajax({
                    type: 'POST',
                    url: '/deleteSubject',
                    data: {
                        su_no: app.subjectData[index].su_no,
                        su_name: app.subjectData[index].su_name,
                        tc_id: app.subjectData[index].tc_id,
                        tc_name: app.subjectData[index].tc_name,
                        credit: app.subjectData[index].su_credit
                    },
                    success:function (data) {
                        app.$message.success('删除成功！^.^')
                        app.clear();
                        app.Select_subject();
                    },
                    error:function (e) {
                        app.$message.error('删除失败! >_<');
                    }
                })
            },
            handleCurrentChange:function(val){
                app.displayData = [];
                app.pageNow = val-1;
                console.log(app.displayData);
                app.displayData = app.subjectData.slice((val-1)*9,val*9);
                console.log(app.subjectData);
                console.log(app.displayData);
            },
            clear:function () {
                app.form.su_id='';
                app.form.su_name='';
                app.form.tc_id='';
                app.form.tc_name='';
                app.form.credit=''
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


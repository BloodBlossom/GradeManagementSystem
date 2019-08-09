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
                        default-active="4"
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
                        <el-input v-model="form.su_no" placeholder="无"></el-input>
                    </el-form-item>
                    <el-form-item label="学科名称">
                        <el-input v-model="form.su_name" placeholder="无"></el-input>
                    </el-form-item>
                    <el-form-item label="学生编号">
                        <el-input v-model="form.st_id" placeholder="无"></el-input>
                    </el-form-item>
                    <el-form-item label="学生姓名">
                        <el-input v-model="form.st_name" placeholder="无"></el-input>
                    </el-form-item>
                    <el-form-item label="分数">
                        <el-input v-model="form.score" placeholder="无"></el-input>
                    </el-form-item>
                    <el-form-item label="核查状态">
                        <el-select v-model="form.state" placeholder="无">
                            <el-option label="未核查" value="0"></el-option>
                            <el-option label="正在核查" value="1"></el-option>
                            <el-option label="核查通过" value="2"></el-option>
                            <el-option label="核查不通过" value="3"></el-option>
                        </el-select>
                    </el-form-item>
                    <el-form-item>
                        <el-button type="primary" @click="Select_grade">查询</el-button>
                    </el-form-item>
                </el-form>

                <el-divider></el-divider>

                <el-table :data="displayData" style="width: 100%;height: 68%;">

                    <el-table-column sortable prop="su_no"      label="学科编号" width="150" align="center"></el-table-column>
                    <el-table-column sortable prop="su_name"    label="学科名称" width="150" align="center"></el-table-column>
                    <el-table-column sortable prop="st_id"      label="学生编号" width="150" align="center"></el-table-column>
                    <el-table-column sortable prop="st_name"    label="学生姓名" width="150" align="center"></el-table-column>
                    <el-table-column sortable prop="score"      label="分数"     width="150" align="center"></el-table-column>
                    <el-table-column sortable prop="su_state"   label="核查状态" width="150" align="center"></el-table-column>

                    <el-table-column align="center">
                        <template slot-scope="scope">
                            <el-button size="mini" @click="Accept(scope.$index)">通过</el-button>
                            <el-button size="mini" @click="Refuse(scope.$index)">驳回</el-button>
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
        width: 100px;
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
                su_name:'',
                st_name:'',
                su_no:'',
                st_id:'',
                score:'',
                state:''
            },
            subjectData:[],
            displayData:[],
        },
        created:function(){
            $.ajax({
                type: 'GET',
                url: '/selectGrade',
                data: {
                    su_no: this.form.su_no,
                    su_name:this.form.su_name,
                    st_id: this.form.st_id,
                    st_name:this.form.st_name,
                    score: this.form.score,
                    state: this.form.state,
                },
                dataType:'json',
                success: function (data) {
                    console.log(data);
                    for(let i=0;i<data.length;i++)
                    {
                        if(data[i].su_state == 0){
                            data[i].su_state = "未核查";
                        }
                        else if(data[i].su_state == 1) {
                            data[i].su_state = "正在核查";
                        }
                        else if(data[i].su_state == 2) {
                            data[i].su_state = "核查通过";
                        }
                        else {
                            data[i].su_state = "核查不通过";
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
            Select_grade:function () {
                console.log(app.form);
                $.ajax({
                    type: 'GET',
                    url: '/selectGrade',
                    data: {
                        su_no: app.form.su_no,
                        su_name: app.form.su_name,
                        st_id: app.form.st_id,
                        st_name: app.form.st_name,
                        score: app.form.score,
                        state: app.form.state,
                    },
                    dataType:'json',
                    success: function (data) {
                        console.log(data);
                        for(let i=0;i<data.length;i++)
                        {
                            if(data[i].su_state == 0){
                                data[i].su_state = "未核查";
                            }
                            else if(data[i].su_state == 1) {
                                data[i].su_state = "正在核查";
                            }
                            else if(data[i].su_state == 2) {
                                data[i].su_state = "核查通过";
                            }
                            else {
                                data[i].su_state = "核查不通过";
                            }
                        }
                        app.subjectData = data;
                        app.total_message = app.subjectData.length;
                        app.displayData = app.subjectData.slice(0,9);
                    },
                    error:function (e) {
                        app.$message.error('查询失败! >_<');
                        // app.clear();
                    }
                })
            },
            // Add_grade:function () {
            //     $.ajax({
            //         type: 'POST',
            //         url: '/addGrade',
            //         data: {
            //             su_no: app.form.su_no,
            //             st_id: app.form.st_id,
            //             score: app.form.score,
            //             state: app.form.state,
            //         },
            //         success:function (data) {
            //             app.$message.success('增添成功！^.^');
            //             app.clear();
            //             app.Select_grade();
            //         },
            //         error:function (e) {
            //             app.$message.error('增添失败! >_<');
            //             app.clear();
            //         }
            //     })
            // },
            handleCurrentChange:function(val){
                app.displayData = [];
                app.pageNow = val-1;
                console.log(app.displayData);
                app.displayData = app.subjectData.slice((val-1)*9,val*9);
                console.log(app.subjectData);
                console.log(app.displayData);
            },
            clear:function () {
                app.form.su_no='';
                app.form.st_id='';
                app.form.score='';
                app.form.state='';
                app.form.st_name='';
                app.form.su_name='';
            },
            logout: function () {
                app.delCookie("account");
                app.delCookie("type");
                window.location.href = './login'
            },
            Accept:function (index) {
                index = app.pageNow * 9 + index;

                if(app.subjectData[index].su_state == "未核查"){
                    app.subjectData[index].su_state = 0;
                }
                else if(app.subjectData[index].su_state == "正在核查") {
                    app.subjectData[index].su_state = 1;
                }
                else if(app.subjectData[index].su_state == "核查通过") {
                    app.subjectData[index].su_state = 2;
                }
                else {
                    app.subjectData[index].su_state = 3;
                }
                console.log(app.subjectData[index]);
                $.ajax({
                    type: 'POST',
                    url: '/AcceptGrade',
                    data: {
                        su_no: app.subjectData[index].su_no,
                        st_id: app.subjectData[index].st_id,
                    },
                    success:function (data) {
                        app.$message.success('成功！^.^')
                        if(app.subjectData[index].su_state == 0){
                            app.subjectData[index].su_state = "未核查";
                        }
                        else if(app.subjectData[index].su_state == 1) {
                            app.subjectData[index].su_state = "正在核查";
                        }
                        else if(app.subjectData[index].su_state == 2) {
                            app.subjectData[index].su_state = "核查通过";
                        }
                        else {
                            app.subjectData[index].su_state = "核查不通过";
                        }
                        app.Select_grade();
                    },
                    error:function (e) {
                        app.$message.error('失败! >_<');
                    }
                })
            },
            Refuse:function (index) {
                index = app.pageNow * 9 + index;

                if(app.subjectData[index].su_state == "未核查"){
                    app.subjectData[index].su_state = 0;
                }
                else if(app.subjectData[index].su_state == "正在核查") {
                    app.subjectData[index].su_state = 1;
                }
                else if(app.subjectData[index].su_state == "核查通过") {
                    app.subjectData[index].su_state = 2;
                }
                else {
                    app.subjectData[index].su_state = 3;
                }
                console.log(app.subjectData[index]);
                $.ajax({
                    type: 'POST',
                    url: '/RefuseGrade',
                    data: {
                        su_no: app.subjectData[index].su_no,
                        st_id: app.subjectData[index].st_id,
                    },
                    success:function (data) {
                        app.$message.success('成功！^.^')
                        if(app.subjectData[index].su_state == 0){
                            app.subjectData[index].su_state = "未核查";
                        }
                        else if(app.subjectData[index].su_state == 1) {
                            app.subjectData[index].su_state = "正在核查";
                        }
                        else if(app.subjectData[index].su_state == 2) {
                            app.subjectData[index].su_state = "核查通过";
                        }
                        else {
                            app.subjectData[index].su_state = "核查不通过";
                        }
                        app.Select_grade();
                    },
                    error:function (e) {
                        app.$message.error('失败! >_<');
                    }
                })
            }
        }
    });
</script>
</body>
</html>


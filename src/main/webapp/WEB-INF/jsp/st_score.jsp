<%--
  Created by IntelliJ IDEA.
  User: wangx
  Date: 2019/8/4
  Time: 9:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生</title>
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <!-- 先引入 Vue -->
    <script src="https://unpkg.com/vue/dist/vue.js"></script>
    <!-- 引入组件库 -->
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
</head>
<body style="margin: 0">
<div id="app" v-cloak>
    <el-container style="height: 100%;">
        <el-header>成绩管理系统--学生端
            <el-button id="btn_header" size="small" round="true" type="primary" @click="logout">退出登陆</el-button>
        </el-header>
        <el-container>
            <el-aside width="200px" style="background-color: #545c64">
                <el-menu
                        default-active="3"
                        background-color="#545c64"
                        active-text-color="#ffd04b"
                        text-color="#fff">

                    <a onclick="go_personal()">
                        <el-menu-item index="1">
                            <template slot="title"><i class="el-icon-user"></i>个人信息</template>
                        </el-menu-item>
                    </a>

                    <a onclick="go_course()">
                        <el-menu-item index="2">
                            <template slot="title"><i class="el-icon-s-management"></i>课程信息</template>
                        </el-menu-item>
                    </a>


                    <a onclick="go_score()">
                        <el-menu-item index="3">
                            <template slot="title"><i class="el-icon-s-management"></i>成绩信息</template>
                        </el-menu-item>
                    </a>

                </el-menu>
            </el-aside>

            <el-main >
                <el-table
                        :data="scoreData"
                        style="width: 100%;height: 70%;">
                    <el-table-column
                            prop="su_name"
                            label="课程名称"
                            align="center"
                            width="350">
                    </el-table-column>
                    <el-table-column
                            prop="su_credit"
                            label="课程学分"
                            align="center"
                            width="250">
                    </el-table-column>
                    <el-table-column
                            prop="tc_name"
                            label="任课教师"
                            align="center"
                            width="270">
                    </el-table-column>
                    <el-table-column
                            prop="score_display"
                            label="课程得分"
                            align="center"
                            width="250">
                    </el-table-column>
                </el-table>
                <div class="foot" v-model = "grade_info">
                    <el-row>已公布成绩数：{{grade_info.cnt}}</el-row>
                    <el-row>加权平均分为：{{grade_info.grade}}</el-row>
                </div>
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

    .foot{
        margin-top: 30px;
        margin-right: 10%;
        display: flex;
        flex-direction: column;
        justify-items: center;
        align-items: flex-end;

    }

    .el-row{
        margin: 10px;
    }

    a {
        text-decoration: none;
    }
</style>

<script>
    function go_course(){
        window.location.href='./st_course'
    }

    function go_personal(){
        window.location.href='./st_personal'
    }

    function go_score(){
        window.location.href='./st_score'
    }
    var app=new Vue( {
        el:'#app',
        data:{
            account : 0,
            scoreData: [],
            grade_info: {
                grade:0,
                cnt: 0
            }
        },
        created:function(){

            // ???
            this.account = parseInt(this.getCookie("account"));
            console.log(this.account);
            $.ajax({
                type: 'GET',
                url: '/getStScore',
                data: {
                    account: this.account
                },
                dataType: "json",
                success: function (data) {
                    console.log(data);
                    let credit = 0;
                    let credit_get = 0;
                    for(let i = 0; i <data.length;i++){
                        if(data[i].su_state == 2){
                            data[i].score_display = data[i].score.toFixed(2).toString();
                            app.grade_info.cnt++;
                            credit_get += data[i].score * data[i].su_credit;
                            credit += data[i].su_credit;
                        }
                        else{
                            data[i].score_display = "暂未公布"
                        }
                    }
                    app.grade_info.grade = (credit_get / credit).toFixed(2);
                    app.scoreData = data;
                }
            })

        },
        mounted: function () {
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
    });
</script>
</body>
</html>

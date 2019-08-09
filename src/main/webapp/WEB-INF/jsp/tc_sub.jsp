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
                        default-active="2"
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
            <el-main>
                <el-table :data="tableData" style="width: 100%;">

                    <el-table-column prop="tc_id" align="center" label="教师工号" width="110"></el-table-column>
                    <el-table-column prop="su_no" align="center" label="课程编号" width="110"></el-table-column>
                    <el-table-column prop="su_name" align="center" label="课程名称" width="150"></el-table-column>
                    <el-table-column prop="su_credit" align="center" label="学分" width="100"></el-table-column>
                    <el-table-column prop="se_time" align="center" label="选课时间" width="260"></el-table-column>
                    <el-table-column prop="ma_time" align="center" label="登分时间" width="260"></el-table-column>
                    <el-table-column align="center" label="操作">
                        <template slot-scope="scope">
                            <a @click="go_su_score(scope.$index)"><el-button
                                    size="mini"
                                    >进入登分</el-button></a>
                        </template>
                    </el-table-column>
                </el-table>

                <el-button type="text"  style="display:block;margin:0 auto" @click="dialogFormVisible = true" icon="el-icon-plus">新增科目</el-button>

                <el-dialog title="新增科目" :visible.sync="dialogFormVisible">
                    <el-form :model="form">
                        <%--<el-form-item label="教师工号" :label-width="formLabelWidth">--%>
                            <%--<el-input v-model="form.tcno" auto-complete="off"></el-input>--%>
                        <%--</el-form-item>--%>
                        <%--<el-form-item label="教师名字" :label-width="formLabelWidth">--%>
                            <%--<el-input v-model="form.tc_name" auto-complete="off"></el-input>--%>
                        <%--</el-form-item>--%>
                        <el-form-item label="课程编号" :label-width="formLabelWidth">
                            <el-input v-model="form.no" auto-complete="off"></el-input>
                        </el-form-item>
                        <el-form-item label="课程名称" :label-width="formLabelWidth">
                            <el-input v-model="form.name" auto-complete="off"></el-input>
                        </el-form-item>
                        <el-form-item label="学分" :label-width="formLabelWidth">
                            <el-input v-model="form.credit" auto-complete="off"></el-input>
                        </el-form-item>
                        <el-form-item label="选课时间" :label-width="formLabelWidth">
                            <el-date-picker
                                    v-model="form.sebegin"
                                    type="date"
                                    placeholder="选择日期">
                            </el-date-picker>
                            <a>至</a>
                            <el-date-picker
                                    v-model="form.seend"
                                    type="date"
                                    placeholder="选择日期">
                            </el-date-picker>
                        </el-form-item>
                        <el-form-item label="登分时间" :label-width="formLabelWidth">
                            <el-date-picker
                                    v-model="form.mabegin"
                                    type="date"
                                    placeholder="选择日期">
                            </el-date-picker>
                            <a>至</a>
                            <el-date-picker
                                    v-model="form.maend"
                                    type="date"
                                    placeholder="选择日期">
                            </el-date-picker>
                        </el-form-item>
                        </el-form>
                        <div slot="footer" class="dialog-footer">
                            <el-button @click="dialogFormVisible = false">取 消</el-button>
                            <el-button type="primary" @click='plus'>确 定</el-button>
                        </div>
                </el-dialog>


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
    .el-aside {
        color: #333;
    }

    a {
        text-decoration: none;
    }
</style>
<script type="text/javascript">
    function go_tc_info(){
        window.location.href='./tc_info'
    }
    function go_tc_sub(){
        $.get("/tc_sub",function (d) {
            window.location.href='./tc_sub'
        })
    }

    function repairZero(num){
        if(num < 10){
            num = "0" + num;
        }
        return num;
    }
    function getDateTime(d1,d2){
        console.log(d1);
        var date1 = new Date(d1);
        console.log(date1);
        var date2 = new Date(d2);
        var res = date1.getFullYear() + "-" + repairZero(date1.getMonth()+1) + "-" + repairZero(date1.getDate())
            + " 至 " +date2.getFullYear() + "-" + repairZero(date2.getMonth()+1) + "-" + repairZero(date2.getDate())
        console.log(res);
        return res;
    }
        var app = new Vue({
            el: '#app',
            data: {
                tc_id:'',
                tc_name:'',
                tableData: [],
                dialogFormVisible: false,
                form: {
                    tcno:'',
                    no: '',
                    name: '',
                    credit: '',
                    sebegin:'',
                    seend:'',
                    mabegin:'',
                    maend:'',
                    tc_name:'',
                    date1: '',
                    date2: '',
                    delivery: false,
                    type: [],
                    resource: '',
                    desc: ''
                },
                formLabelWidth: '120px'
            },
            created:function () {
                this.tc_id=parseInt(this.getCookie("account"));
                $.ajax({
                        type:'GET',
                        url:'/gettc_sub',
                        data:{
                            tc_id:this.tc_id
                        },
                        dataType:"json",
                        success:function (data) {
                            console.log(data);
                            for(var i=0;i<data.length;i++){
                                data[i].se_time=getDateTime(data[i].se_begin,data[i].se_end);
                                data[i].ma_time=getDateTime(data[i].ma_begin,data[i].ma_end);
                            }
                            app.tableData=data;
                        }
                    }
                );

                $.ajax({
                        type:'GET',
                        url:'/gettc_info',
                        data:{
                            tc_id:this.tc_id
                        },
                        dataType:"json",
                        success:function (data) {
                            console.log(data);
                            app.tc_name = data.tc_name;
                        }
                })
            },
            methods:{
                plus:function(){

                    console.log(app.form.mabegin);
                    $.ajax({
                            type:'POST',
                            url:'insertSub',
                            data:{
                                su_name:this.form.name,
                                tc_id:this.tc_id,
                                su_no: this.form.no,
                                su_credit: this.form.credit,
                                se_begin:this.form.sebegin,
                                se_end:this.form.seend,
                                ma_begin:this.form.mabegin,
                                ma_end:this.form.maend,
                                tc_name:this.tc_name
                            },
                            success:function (data) {
                                console.log(data);
                                app.$message.success("插入成功! ^.^")
                                location.reload();
                            },
                            error:function (e) {
                                console.log(e)
                                app.dialogFormVisible = false;
                                app.$message.error("插入失败! >_<")
                            }
                        }
                    )
                },
                go_su_score: function(index) {
                    this.setCookieSu_no("su_no",app.tableData[index].su_no);
                    window.location.href='./su_score'
                },
                setCookie: function (cname,cvalue)
                {
                    var exp = new Date();
                    exp.setTime(exp.getTime()+ 7*24*60*60*1000);
                    document.cookie = cname + "=" + cvalue + ";expires=" + exp.toGMTString();
                },
                setCookieSu_no: function (cname,cvalue)
                {
                    document.cookie = cname + "=" + cvalue + ";expires=" + '-1';
                },
                getCookie: function (cname)
                {
                    var name = cname + "=";
                    var ca = document.cookie.split(';');
                    for(var i=0; i<ca.length; i++)
                    {
                        var c = ca[i].trim();
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

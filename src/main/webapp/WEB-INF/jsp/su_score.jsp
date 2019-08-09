<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/8/1
  Time: 14:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>单科成绩册</title>
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
        <el-header>单科成绩册
        <el-button id="btn_header" size="small" round="true" type="primary" @click="logout">退出登陆</el-button>
        </el-header>
        <el-container>
            <el-aside width="200px" style="background-color: #545c64">
                <el-menu
                        default-active="1"
                        background-color="#545c64"
                        active-text-color="#ffd04b"
                        text-color="#fff">
                    <a >
                        <el-menu-item index="1">
                            <template slot="title"><i class="el-icon-s-management"></i>详细信息</template>
                        </el-menu-item>
                    </a>
                </el-menu>
            </el-aside>
            <el-main>
                <el-table :data="tableData" style="width: 100%;">

                    <el-table-column prop="su_no" align="center" label="学科编号" width="350"></el-table-column>
                    <el-table-column prop="st_id" align="center" label="学生工号" width="300"></el-table-column>
                    <el-table-column prop="score" align="center" label="成绩" width="200">

                        <template slot-scope="scope">
                            <el-button type="text" @click="edit(scope.$index,scope.row)">{{ tableData[scope.$index].score }}</el-button>
                            <el-dialog title="修改" :visible.sync="dialogedit">
                                <el-form>
                            <el-form-item label="成绩" :label-width="formLabelWidth">
                                <el-input v-model="score_input" autocomplete="off"></el-input>
                            </el-form-item>
                                </el-form>
                                <div slot="footer" class="dialog-footer">
                                    <el-button @click="dialogedit = false">取 消</el-button>
                                    <el-button type="primary" @click="editOk">确 定</el-button>
                                </div>
                            </el-dialog>
                        </template>

                    </el-table-column>
                    <el-table-column prop="su_state" align="center" label="核查状态" width="350"></el-table-column>

                </el-table>
                <el-button type="text"  style="display:block;margin:0 auto" @click="go_tc_sub" icon="el-icon-back">
                    退出登分
                </el-button>
<%--                <el-button>保存登分</el-button>--%>
<%--                <el-button type="text"  style="display:block;margin:0 auto" @click="dialogFormVisible = true" icon="el-icon-plus">添加成绩</el-button>--%>
<%--                <el-dialog title="添加成绩" :visible.sync="dialogFormVisible">--%>
<%--                    <el-form :model="form">--%>
<%--                        <el-form-item label="学科编号" :label-width="formLabelWidth">--%>
<%--                            <el-input v-model="form.no" auto-complete="off"></el-input>--%>
<%--                        </el-form-item>--%>
<%--                        <el-form-item label="学生工号" :label-width="formLabelWidth">--%>
<%--                            <el-input v-model="form.num" auto-complete="off"></el-input>--%>
<%--                        </el-form-item>--%>
<%--                        <el-form-item label="成绩" :label-width="formLabelWidth">--%>
<%--                            <el-input v-model="form.score" auto-complete="off"></el-input>--%>
<%--                        </el-form-item>--%>

<%--                    </el-form>--%>
<%--                    <div slot="footer" class="dialog-footer">--%>
<%--                        <el-button @click="dialogFormVisible = false">取 消</el-button>--%>
<%--                        <el-button type="primary" @click="dialogFormVisible = false">确 定</el-button>--%>
<%--                    </div>--%>
<%--                </el-dialog>--%>

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
        var app = new Vue({
        el: '#app',
        data: {
            i:0,
            score_input:'',
            su_num:0,
            tableData: [],
            dialogedit:false,
            // dialogFormVisible: false,
            // form: {
            //     tcno:'',
            //     no: '',
            //     num: '',
            //     score: '',
            //     date1: '',
            //     date2: '',
            //     delivery: false,
            //     type: [],
            //     resource: '',
            //     desc: ''
            // },

            formLabelWidth: '120px'
        },
            created:function () {
                // this.setCookie("account","71232")
                this.su_num=parseInt(this.getCookie("su_no"));
                $.ajax({
                        type:'GET',
                        url:'/getsu_sco',
                        data:{
                            su_no:this.su_num
                        },
                        dataType:"json",
                        success:function (data) {
                            console.log(data);
                            app.tableData=data;
                            //1正在核查，2通过，3未通过
                            for(let j = 0;j < app.tableData.length;j++){
                                if(data.su_state=='0'){
                                    app.tableData[j].su_state='未核查';
                                }else if(data.su_state=='1'){
                                    app.tableData[j].su_state='正在核查';
                                }else if(data.su_state=='2'){
                                    app.tableData[j].su_state='通过';
                                }else{
                                    app.tableData[j].su_state='未通过';
                                }
                            }
                        }
                    }
                )
        },
            methods:{
                edit:function(index,row){
                    app.dialogedit = true;
                    app.i = index;
                    //app.mark=tableData[app.i].st_id;
                    console.log(index, row);
                },
                editOk: function(){
                    app.dialogedit = false;
                    app.tableData[app.i].score = app.score_input;
                   //
                    console.log(app.score_input);
                    $.ajax({
                            type:'POST',
                            url:'insertSco',
                            data:{
                                score: app.tableData[app.i].score,
                                st_id:app.tableData[app.i].st_id,
                                su_no: app.tableData[app.i].su_no
                            },
                            success: function (data) {
                                console.log(data)
                            },
                            error: function (e) {
                                console.log(e)
                            }
                        }
                    )
                    //
                    app.score_input = ''
                },
                setCookie: function (cname,cvalue)
                {
                    document.cookie = cname + "=" + cvalue + "; ";
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
                },
                go_tc_sub:function(){
                    $.get("/tc_sub",function (d) {
                        window.location.href='./tc_sub'
                    })
                }
            }
        })
</script>

</body>
<script src="https://unpkg.com/vue/dist/vue.js"></script>

</html>
</body>
</html>

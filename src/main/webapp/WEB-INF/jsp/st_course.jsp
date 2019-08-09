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
<body class="body" style="margin: 0">

<div id="app" v-cloak>
	<el-container style="height: 100%; border: 0px solid #eee">
	<el-header>成绩管理系统--学生端
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

		<el-main>

			<el-form :inline="true" :model="form" class="demo-form-inline" style="align: center">
					<el-form-item label="任课教师">
						<el-input v-model="form.teacher" placeholder="无"></el-input>
					</el-form-item>
					<el-form-item label="课程名称" >
						<el-input v-model="form.subject" placeholder="无"></el-input>
					</el-form-item>
					<el-form-item label="选课情况">
						<el-select v-model="form.isSelect" placeholder="无">
							<el-option label="已选" value="1"></el-option>
							<el-option label="未选" value="0"></el-option>
						</el-select>
					</el-form-item>
					<el-form-item>
						<el-button type="primary" @click="onSubmit">查询</el-button>
					</el-form-item>
				</el-form>

				<el-divider></el-divider>

				<el-table
						:data="displayData"
						style="width: 100%;height: 68%;">
					<el-table-column
							prop="su_name"
							label="课程名称"
							align="center"
							width="200">
					</el-table-column>
					<el-table-column
							prop="tc_name"
							label="任课教师"
							align="center"
							width="200">
					</el-table-column>
					<el-table-column
							prop="se_time"
							label="选课时间"
							align="center"
							width="250">
					</el-table-column>
					<el-table-column
							prop="is_select"
							label="是否选课"
							align="center"
							width="180">
					</el-table-column>
					<el-table-column align="center">
						<template slot-scope="scope">
							<el-button
									size="mini"
									@click="selectSubject(scope.$index)">选课</el-button>
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
</style>
<script type="text/javascript">

	function go_course(){
		window.location.href='./st_course'
	}

	function go_personal(){
		window.location.href='./st_personal'
	}

	function go_score(){
		window.location.href='./st_score'
	}

	function repairZero(num){
		if(num < 10){
			num = "0" + num;
		}
		return num;
	}
	function getDateTime(d1,d2){
		// console.log(d1);
		let date1 = new Date(d1);
		// console.log(date1);
		let date2 = new Date(d2);
		let res = date1.getFullYear() + "-" + repairZero(date1.getMonth()+1) + "-" + repairZero(date1.getDate())
				+ " 至 " +date2.getFullYear() + "-" + repairZero(date2.getMonth()+1) + "-" + repairZero(date2.getDate())
		// console.log(res);
		return res;
	}

	var app=new Vue( {
		el:'#app',
		data:{
			total_message:0,
			pageNow: 0,
			st_info:{
				st_id:'',
				st_name:'',
				st_gender:'',
				st_age:'',
				st_pro:'',
				st_college:'',
				st_degree:'',
				st_email:''
			},
			form:{
				teacher:'',
				subject: '',
				isSelect:''
			},
			subjectData:[],
			displayData:[]

		},
		created:function(){
			 this.setCookie("account","1120170000");
			 this.setCookie("sub","1111");
			this.st_info.st_id = parseInt(this.getCookie("account"));
			console.log(this.getCookie("sub"));
			$.ajax({
				type: 'GET',
				url: '/getStInfo',
				data: {
					account: this.st_info.st_id
				},
				dataType: "json",
				success: function (data) {
					console.log(data);
					app.st_info.st_age =data.st_age;
					app.st_info.st_name = data.st_name;
					app.st_info.st_pro = data.st_pro;
					app.st_info.st_college = data.st_college;
					app.st_info.st_email = data.st_email;
					if (data.st_gender == '0'){
						app.st_info.st_gender = '男';
					}
					else {
						app.st_info.st_gender = '女';
					};;

					if(data.st_degree == '0'){
						app.st_info.st_degree = '本科';
					}
					else if (data.st_degree == '1'){
						app.st_info.st_degree = '硕士'
					}
					else {
						app.st_info.st_degree = '博士';
					};
				}
			})
			this.onSubmit();
		},
		mounted: function () {

		},
		methods: {

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
			onSubmit:function () {
				console.log("Submit!");
				console.log(this.st_info);
				$.ajax({
					type: 'GET',
					url: 'filterSub',
					data: {
						su_name: this.form.subject,
						tc_name: this.form.teacher,
						is_select: this.form.isSelect,
						st_id: this.st_info.st_id
					},
					dataType: "json",
					success: function (data) {
						console.log(data);
						for(let i=0;i<data.length;i++){
							data[i].se_time = getDateTime(data[i].se_begin , data[i].se_end);
							if(data[i].is_select == 1){
								data[i].is_select = "是";
							}
							else {
								data[i].is_select = "否";
							}
						}
						app.subjectData = data;
						app.total_message = app.subjectData.length;
						//这里是浅拷贝
						app.displayData = app.subjectData.slice(0,9);
						console.log(app.displayData);
						console.log(app.total_message);
					}
				})
			},
			handleCurrentChange:function(val){
				app.displayData = [];
				app.pageNow = val-1;
				console.log(app.pageNow);
				// console.log(app.displayData);
				app.displayData = app.subjectData.slice((val-1)*9,val*9);
				// console.log(app.subjectData);
				// console.log(app.displayData);
			},
			selectSubject:function (index) {
				console.log("===Select Begin!===");
				// console.log(index);
				let i = app.pageNow * 9 + index;
				let now = new Date();
				let begin = new Date(app.subjectData[i].se_begin);
				let end = new Date(app.subjectData[i].se_end);


				if(app.subjectData[i].is_select == "是"){
					app.$message.error("已选课程不可重复选择")
				}
				else{
					if(begin < now ){
						if(now < end){
							//选课请求
							console.log(app.st_info.st_id);
							console.log(app.subjectData[i]);
						$.ajax({
							type: "POST",
							url: "selectSubject",
							data: {
								su_no: parseInt(app.subjectData[i].su_no),
								st_id: parseInt(app.st_info.st_id)
							},
							success: function (data) {
								app.displayData[index].is_select = "是";
								app.subjectData[i].is_select = "是";

								console.log(app.displayData);
								console.log(index);
								app.$message.success("选课成功！^.^")
							},
							error:function (e) {
								app.$message.error("选课失败! >_<")
								console.log(e);
							}
						})
						}
						else{
							app.$message.error("选课已结束! >_<")
						}
					}
					else{
						app.$message.error("选课未开始! >_<")
					}
				}
				console.log("===Select Finish!===");
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


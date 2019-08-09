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
	<el-container style="height: 100%;">
	<el-header>成绩管理系统--学生端
		<el-button id="btn_header" size="small" round="true" type="primary" @click="logout">退出登陆</el-button>
	</el-header>
	<el-container>
		<el-aside width="200px" style="background-color: #545c64">
			<el-menu
				default-active="1"
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

				<a onclick="go_score()">
					<el-menu-item index="3">
						<template slot="title"><i class="el-icon-s-management"></i>成绩信息</template>
					</el-menu-item>
				</a>
				</a>

			</el-menu>
		</el-aside>

		<el-main v-model="st_info">
			<el-card class="box-card">
				姓名：{{st_info.st_name}}
			</el-card>
			<el-card class="box-card">
				性别：{{st_info.st_gender}}
			</el-card>
			<el-card class="box-card">
				学号：{{st_info.st_id}}
			</el-card>
			<el-card class="box-card">
				年龄：{{st_info.st_age}}
			</el-card>
			<el-card class="box-card">
				学院：{{st_info.st_college}}
			</el-card>
			<el-card class="box-card">
				专业：{{st_info.st_pro}}
			</el-card>
			<el-card class="box-card">
				学位：{{st_info.st_degree}}
			</el-card>
			<el-card class="box-card">
				邮箱：{{st_info.st_email}}
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
			st_info:{
				st_id:'',
				st_name:'',
				st_gender:'',
				st_age:'',
				st_pro:'',
				st_college:'',
				st_degree:'',
				st_email:''
			}
		},
		created:function(){
			this.st_info.st_id = parseInt(this.getCookie("account"));
			$.ajax({
				type: 'GET',
				url: '/getStInfo',
				data: {
					account: this.st_info.st_id
				},
				dataType: "json",
				success: function (data) {
					// console.log(data);
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

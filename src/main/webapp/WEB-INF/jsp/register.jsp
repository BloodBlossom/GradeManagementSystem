<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>Register</title>
	<link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="../css/login.css">
	<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
	<!-- 先引入 Vue -->
	<script src="https://unpkg.com/vue/dist/vue.js"></script>
	<!-- 引入组件库 -->
	<script src="https://unpkg.com/element-ui/lib/index.js"></script>
	<link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
	<style type="text/css">
		body{
		background-image:url("../images/bg.jpg");
		background-size: 100% 100%;
		background-repeat: no-repeat;
		width: 100%;
		height: 100%;
		}																							/*嵌入式css样式  */
		</style>

</head>

<body>
	
	<div id="tt" style="height: 25%;">
		<img src="../images/title.png"></a>
	</div>
	<div id="login">
		<form>
			<el-input  type="text" v-model="user_info.user_id" placeholder="ID"></el-input>
			<el-input  type="password" v-model="user_info.user_password1" placeholder="Password"></el-input>
			<el-input  type="password" v-model="user_info.user_password2" placeholder="Repeat Password"></el-input>
			<el-input  type="text" v-model="user_info.user_name" placeholder="Name"></el-input>
			<el-select v-model="user_info.user_gender" placeholder="Gender">
				<el-option
						v-for="item in options"
						:key="item.value"
						:label="item.label"
						:value="item.value">
				</el-option>
			</el-select>
			<el-input  type="text" v-model="user_info.user_age" placeholder="Age"></el-input>
			<el-select v-model="user_info.user_degree" placeholder="Degree">
				<el-option
						v-for="item in options1"
						:key="item.value"
						:label="item.label"
						:value="item.value">
				</el-option>
			</el-select>
			<el-input  type="text" v-model="user_info.user_college" placeholder="College"></el-input>
			<el-input  type="text" v-model="user_info.user_pro" placeholder="Major"></el-input>
			<el-input  type="text" v-model="user_info.user_email" placeholder="E-mail"></el-input>
			<div class="btn">
				<el-button  class="button1" type="primary" @click="register">Register</el-button>
				<el-button  class="button1" type="primary" @click="goLogin">Already have an account</el-button>
			</div>
		</form>
	</div>
	<style>

		.btn{
			display: flex;
			justify-content: center;
			margin-top: 5px;
		}
		.button1{
			width: 100%;
			flex-grow: 1;
		}
		#login > form{
			display: flex;
			flex-direction: column;
			align-items: center;
		}
		.el-input{
			width: 28%;
			margin-bottom: 2px;

		}
		#login > form > div > input{
			background-color: rgba(0,0,0,0.6);
			color: white;
		}

		#login > form > div.el-select > div.el-input.el-input--suffix > input{
			background-color: rgba(0,0,0,0.6);
		}

		.el-select{
			width: 28%;
		}
		body > div.el-select-dropdown.el-popper > div.el-scrollbar > div.el-select-dropdown__wrap.el-scrollbar__wrap > ul{
			background-color: rgba(0,0,0,0.6);
		}


		.el-select-dropdown__item{
			color: white;
		}
		.el-select-dropdown__item.hover, .el-select-dropdown__item:hover{
			background-color: darkgray;
		}
		#login > form > div.el-select > div > input{
			color: white;
		}
		#login > form > div.el-select > div{
			width: 100%;
		}
	</style>
	<script>
		var app = new Vue({
			el: '#login',
			data:{
				user_info:{
					user_id:'',
					user_name:'',
					user_gender:'',
					user_age:'',
					user_pro:'',
					user_college:'',
					user_degree:'',
					user_email:'',
					user_password1:'',
					user_password2:''
				},
				options: [{
					value: 1,
					label: 'Male'
				},{
					value: 2,
					label: 'Female'
				}
				],
				options1:[{
					value:1,
					label:'本科'
				},{
					value:2,
					label:'硕士'
				},{
					value:3,
					label:'博士'
				}],

			},
			methods:{
				goLogin: function () {
					window.location.href='./login'
				},
				register: function () {
					console.log(app.user_info)
					if(app.user_info.user_id != ''){
						if(app.user_info.user_password1 == ''||app.user_info.user_password2 == ''){
							app.$message.error("Please Enter Your Login Password! >.<");
						}
						else {
							if(app.user_info.user_password1 != app.user_info.user_password2){
								app.$message.error("The Passwords You Entered Differ！>.<");
							}
							else{
								if(app.user_info.user_age==''
								||app.user_info.user_college==''
								||app.user_info.user_degree==''
								||app.user_info.user_email==''
								||app.user_info.user_gender==''
								||app.user_info.user_name==''
								||app.user_info.user_pro==''){
									app.$message.error("Incomplete User Information！>.<");
								}
								else{
									$.ajax({
										type: 'POST',
										url: "register",
										data: {
											user_id : app.user_info.user_id,
											user_name: app.user_info.user_name,
											user_gender: app.user_info.user_gender,
											user_age: app.user_info.user_age,
											user_pro: app.user_info.user_pro,
											user_college: app.user_info.user_college,
											user_degree: app.user_info.user_degree,
											user_email: app.user_info.user_email,
											user_password: app.user_info.user_password1,
										},
										success:function (data) {
											app.$message.success("Register Success！^.^");
												window.location.href='./login';
										},
										error:function (e) {
											app.$message.error("Register Failed！>.<");
										}
									})
								}
							}
						}
					}
					else{
						app.$message.error("Please Enter User ID！>.<");
					}
				}
			}
		})
	</script>
</body>
</html>

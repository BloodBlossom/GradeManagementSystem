<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>Login</title>
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
	
	<div id="tt">
		<img src="../images/title.png"></a>
	</div>
	<div id="login">
		<form>
			<el-input  type="text" v-model="user_info.account" placeholder="ID"></el-input>
			<el-input  type="password" v-model="user_info.password" placeholder="Password"></el-input>
			<el-select v-model="user_info.type" placeholder="Type">
				<el-option
						v-for="item in options"
						:key="item.value"
						:label="item.label"
						:value="item.value">
				</el-option>
			</el-select>
			<br><br>
			<el-button  class="button1" type="primary" @click="login">Login</el-button>
		</form>
		<br>
		<div id="reg">
			<span><a @click="goRegist">Register an account</a></span>
		</div>
	</div>
	<style>
		.btn{
			display: flex;
			justify-content: center;
			margin-top: 5px;
		}
		.button1{
			width: 28%;
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
				account:'',
				password:'',
				type:'',
			},
			options:[{
				value:2,
				label:'学生'
			},{
				value:1,
				label:'教师'
			},{
				value:3,
				label:'管理员'
			}],
		},
		created:function(){
			if(this.getCookie("account") != ''&& this.getCookie("type") != ''){
				if(this.getCookie("type") == '0'){
					//跳转至教师界面
					window.location.href='./tc_info'
				}
				else if(this.getCookie("type") == '1'){
					window.location.href='./st_personal'
				}
				else{
					//跳转至管理员界面
				}
			}
		},
		methods:{
			redirect: function(){
				if(this.getCookie("account") != ''&& this.getCookie("type") != ''){
					if(this.getCookie("type") == '0'){
						//跳转至教师界面
						window.location.href='./tc_info'
					}
					else if(this.getCookie("type") == '1'){
						window.location.href='./st_personal'
					}
					else{
						//跳转至管理员界面
						window.location.href='./of_personal'
					}
				}
			},
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
			goRegist: function() {
				window.location.href='./register'
			},
			login:function () {
				console.log(app.user_info);
				$.ajax({
					type:'GET',
					url:"loginCheck",
					data:{
						account: app.user_info.account,
						password: app.user_info.password,
						type: app.user_info.type-1
					},
					// dataType:"json",
					success:function (data) {
						console.log(data);
						if(data == -1){
							app.$message.error('ID/Type Error! >_<');
						}
						else if(data == -2){
							app.$message.error('Password Error! >_<');
						}
						else{
							app.setCookie("account",app.user_info.account);
							app.setCookie("type",app.user_info.type-1);
							app.redirect();
						}

					}
				})
			}
		}
	})
	</script>
</body>
</html>

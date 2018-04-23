window.onload=function(){
	var txtUser=document.getElementById("txtUser");
	var txtPaw=document.getElementById("txtPaw");
	var txtRpt=document.getElementById("txtRpt");
	var txtName=document.getElementById("txtName");
	var idCard=document.getElementById("idCard");
	var txtPhn=document.getElementById("txtPhn");
	txtUser.addEventListener("focus",checkUser);
	txtUser.addEventListener("blur",checkUser);
	txtPaw.addEventListener("focus",checkPaw);
	txtPaw.addEventListener("blur",checkPaw);
	txtRpt.addEventListener("focus",checkRpt);
	txtRpt.addEventListener("change",checkRpt);
	txtName.addEventListener("focus",checkName);
	txtName.addEventListener("blur",checkName);
	idCard.addEventListener("focus",checkId);
	idCard.addEventListener("blur",checkId);
	txtPhn.addEventListener("focus",checkPhn);
	txtPhn.addEventListener("blur",checkPhn);


}
//验证用户长度
function checkUser(){
	//console.log(txtUser.value);
	var check = false;
	if(txtUser.value.length<5||txtUser.value.length>18){
		//txtUser.style.background='#FDD2D2';
		document.getElementById("tips_username").innerHTML="<b style='color:#F72929'>用户名由6-18位字符组成</b>";
		//txtUser.focus();
		check = false; 
	}
	else{
		document.getElementById("tips_username").innerText="OK!";
		txtUser.style.background='#FFFAFA';
		check = true;
	}
	return check;
}
//验证密码合法性
function checkPaw(){
	var regs= /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,21}$/;
	//验证密码长度，正则化
	var check = false;
	if (txtPaw.value.length<6||txtPaw.value.length>18||regs.test(txtPaw.value)) {
		//txtPaw.style.background='#FDD2D2';
		document.getElementById("tips_password").innerHTML="<b style='color:#F72929'>密码必须由6-18个字符组成，且必须包含字母、数字、标点符号</b>"
		//txtPaw.focus();
		check = false; 
	}
	else{
		document.getElementById("tips_password").innerText="OK!";
		txtPaw.style.background='#FFFAFA';
		check = true;
	}
	return check;
}
//检验两次输入的密码是否一致
function checkRpt(){
	var check = false;
	if($("#txtRpt").val()!=$("#txtPaw").val()){
		document.getElementById("tips_repeat").innerHTML="<b style='color:#F72929'>两次输入的密码不一样</b>";
		//txtRpt.focus();
		check = false;
	}
	else{
		document.getElementById("tips_repeat").innerText="OK!";
		txtRpt.style.background='#FFFAFA';
		check = true;
	}
	return check;
}
//验证是否填写姓名
function checkName(){
	var check = false;
	if($("#txtName".val()=="")){
		document.getElementById("tips_name").innerHTML="<b style='color:#F72929'>请填写真实姓名</b>";
		//txtName.focus();
		check = false;
	}
	else{
		document.getElementById("tips_name").innerText="OK!";
		txtName.style.background='#FFFAFA';
		check = true;
	}
	return check;
}
function checkId(){
	var check = false;
	if($("#idCard").val()==""){
		document.getElementById("tips_idcard").innerHTML="<b style='color:#F72929'>请填写正确的证件号</b>";
		//idCard.focus();
		check = false;
	}
	else{
		document.getElementById("tips_idcard").innerText="OK!";
		idCard.style.background='#FFFAFA';
		check = true;
	}
	return check;
}
function checkPhn(){
	var check = false;
	if($("#txtPhn").val()==""){
		document.getElementById("tips_phone").innerHTML="<b style='color:#F72929'>请正确填写手机号码</b>";
		//txtPhn.focus();
		check = false;
	}
	else{
		document.getElementById("tips_phone").innerText="OK!";
		txtPhn.style.background='#FFFAFA';
		check = true;
	}
	return check;
}
function check(form){
	var check=checkUser()&&checkPaw()&&checkRpt()&&checkName()&&checkId()&&checkPhn();
	return check;
}
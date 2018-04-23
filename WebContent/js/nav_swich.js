window.onload=function(){
	var olis=$(".selection");
	//console.log(olis);
	for(i=0;i<olis.length;i++){
		olis[i].onmouseover=function(){
			this.style.background='#D5DEE7';
			addClass(this,"inActive");

		}
		olis[i].onmouseout=function(){
			this.style.background='#f8f8f8'
		}
		olis[i].onclick=function(){}
	}
}
function addClass(element,value) {
    if (!element.className) {
        element.className = value;
    } else {
        newClassName = element.className;
        newClassName += " "; //这句代码追加的类名分开
        newClassName += value;
        element.className = newClassName;
    }
}
function hasClass(ele, cls) {
    return ele.className.match(new RegExp("(\\s|^)" + cls + "(\\s|$)"));
}
function removeClass(ele, cls) {
    if (hasClass(ele, cls)) {
        var reg = new RegExp("(\\s|^)" + cls + "(\\s|$)");
        ele.className = ele.className.replace(reg, " ");
    }
}
function getDate1(ele){
    var d=new Date();
    date=d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate();
    //alert(date);
    ele.value=date;
}
function RadDisa(){
    var fcr=document.getElementById("fcr");
    fcr.setAttribute('disabled','disabled');
}
function RadAble(){
    document.getElementById("fcr").removeAttribute("disabled");
}
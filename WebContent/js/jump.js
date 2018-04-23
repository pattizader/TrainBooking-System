function ulrHtml(num){
    var toUrl = "guide.jsp?"+num;   
    window.open(toUrl);         
}
setTimeout(function(){
	                
	var location = window.location.href;
	var href= location+"";
	var href_part=href.split('?');
	  
	var num=(href_part[1])*1;
	//alert (num);
	var olis=document.getElementById("tab_ul").getElementsByTagName("li");
	var arr=Array.prototype.slice.call(olis);
	var actnode=olis[num].firstChild;
	var othlis=arr.splice(num,1);
	console.log(actnode);
	addClass(olis[num],"active")
	actnode.setAttribute('aria-expanded','true');
	for(i=0;i<arr.length;i++){
		removeClass(arr[i],"active");
		actnode.setAttribute('aria-expanded','false');
	}
	var pals=document.getElementsByClassName("tab-pane");
	var arr1=Array.prototype.slice.call(pals);
	var othpals=arr1.splice(num,1);
	addClass(pals[num],"active");
	for(i=0;i<arr1.length;i++){
		removeClass(arr1[i],"active");
}



	  /*var oLis=document.getElementById("ulbody").getElementsByTagName("li");
	  oLis[hanshu].className="listyle";
	  
	  var oDivs=document.getElementsByTagName('div');
	  oDivs[hanshu].style.display="block";*/
  
},100)
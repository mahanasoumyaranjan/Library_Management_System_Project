function validate(){
	var fname = document.getElementById("first-name");
	var lname = document.getElementById("last-name");
	var email = document.getElementById("email");
	var password = document.getElementById("password");
	if(!isNaN(fname)){
		document.getElementById("field-error").innerHTML="Should n't caontain any integers!!";
		return false;
	}
	if(!isNaN(lname)){
		document.getElementById("field-error").innerHTML="Should n't caontain any integers!!";
		return false;
	}
	let dotPos = email.indexOf('.');
	if(dotPos<=0){
		document.getElementById("field-error").innerHTML="Email contains one . position !!!";
		return false;
	}
	if(password.length<8 || password.length>15){
		document.getElementById("field-error").innerHTML="Password contains 8 to 15 characters!!!";
		return false;
	}
}
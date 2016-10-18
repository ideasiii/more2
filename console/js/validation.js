function Trim(x) {
	return x.replace(/^\s+|\s+$/gm, '');
}

function formSubmit(formName) {
	var form = document.getElementById(formName);
	form.submit();
}



function checkSignUpData(formName){
	var foorm = document.getElementById(formName);
	var errMsg = '';
	re = /\W/;
	
	
	
	
}
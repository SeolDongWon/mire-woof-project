<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
$(document).ready(function() {
	var urlString = window.location.href
	if (urlString.includes('?')) {
		urlString = window.location.href.substring(window.location.href.lastIndexOf('/') + 1,window.location.href.lastIndexOf('?'));
	} else {
		urlString = window.location.href.substring(window.location.href.lastIndexOf('/') + 1);
	}
	console.log(urlString);
	switch(urlString){
	case "getAbout":
	document.getElementById("getAbout").classList.add("show");
	break;
	case "getLocation":
		document.getElementById("getAbout").classList.add("show");
		break;
	case "getNoticeList":
		document.getElementById("getAbout").classList.add("show");
		break;
	case "getNotice":
		document.getElementById("getAbout").classList.add("show");
		break;
	default:
	}
	
});
</script>
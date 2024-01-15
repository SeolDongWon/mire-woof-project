<script type="text/javascript">
$(document).ready(function() {
	var lastSegment = window.location.href.substring(window.location.href.lastIndexOf('/') + 1);
	console.log(lastSegment);
	switch(lastSegment){
	case "getAbout":
	document.getElementById("getAbout").classList.add("show");
	break;
	case "getLocation":
		document.getElementById("getAbout").classList.add("show");
		break;
	case "getNoticeList":
		document.getElementById("getAbout").classList.add("show");
		break;
	default:
	}
	
});
</script>
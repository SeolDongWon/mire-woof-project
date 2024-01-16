<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(document).ready(function() {
		/* document.getElementById("petMenu").click(); */
		var startIndex = window.location.href.indexOf('/', 15) + 1;
		var endIndex = window.location.href.indexOf('/', 22);
		var urlString = window.location.href.substring(startIndex, endIndex);

		console.log(urlString);

		switch (urlString) {
		case "notice":
			document.getElementById("aboutMenu").click();
			break;
		case "pet":
			document.getElementById("petMenu").click();
			break;
		case "item":
			document.getElementById("itemMenu").click();
			break;
		case "service":
			document.getElementById("serviceMenu").click();
			break;
		default:
		}

	});
</script>
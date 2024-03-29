<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mire Woof</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<%@ include file="/WEB-INF/views/common/style.jsp"%>
<%@ include file="/WEB-INF/views/common/script.jsp"%>

<script>
function modifyItem(itemNo) {
	var selectedItemNo = itemNo
	
	if(selectedItemNo){
		$.ajax({
			url: "/item/getModifyItemForm",
			type: "GET",
			data: { itemNo : selectedItemNo },
			success: function(response) {
				$("#modifyFormContainer").html(response);
			},
			error: function(error) {
				console.error("Error loading form: ", error);
			}
		});
	} else {
		$("#modifyFormContainer").empty();
	}
}

    $(document).ready(function() {
    	var formObj = $("#item");
    	
	    	var responseItemNo = document.getElementById('responseItemNo').value;
	    	
			if(responseItemNo!= 0) {
		    	modifyItem(responseItemNo);
    		}
	    	
    	 $("#selectedItem").on("change", function() {
    		var selectedItemNo = $(this).val();
    		
    		if(selectedItemNo){
    			$.ajax({
    				url: "/item/getModifyItemForm",
    				type: "GET",
    				data: { itemNo : selectedItemNo },
    				success: function(response) {
    					$("#modifyFormContainer").html(response);
    				},
    				error: function(error) {
    					console.error("Error loading form: ", error);
    				}
    			});
    		} else {
    			$("#modifyFormContainer").empty();
    		}
    	}); 

        $("#btnGetItemList").on("click", function() {
            self.location = "/item/itemList";
        });
        
        $("#btnInsertItem").on("click", function() {
        	self.location = "/item/admin/insertItem"
        });
    });
    
    function confirmClose(itemStatus) {
    	if(itemStatus === 'CLOSED') {
    		alert("<spring:message code='item.alert.alreadyClosed'/>");
    		return false;
    	}
        if (confirm("<spring:message code='item.alert.confirmClose'/>")) {
        	return true;
        } 
        return false;
    }
    
    function confirmOpen(itemStatus) {
    	if(itemStatus === 'OPEN') {
    		alert("<spring:message code='item.alert.alreadyOpen'/>");
    		return false;
    	}
        if (confirm("<spring:message code='item.alert.confirmOpen'/>")) {
        	return true;
        } 
        return false;
    }
    
	function checkValues() {
		
		var priceValue = document.getElementById("itemPrice").value;
		/* var stockValue = document.getElementById("itemStock").value; */
		console.log("Price value:", priceValue);
		
		if(document.getElementById("itemName").value == "") {
	        alert("<spring:message code='item.alert.enterName'/>");
	        document.getElementById("itemName").focus();
	        return false;
		}
		if(parseInt(priceValue) <= 0 || isNaN(priceValue)) {
			alert("<spring:message code='item.alert.enterPrice'/>");
	        document.getElementById("itemPrice").focus();
	        return false;
		}
		/* if(parseInt(stockValue) <= 0 || isNaN(stockValue)) {
			alert("<spring:message code='item.alert.enterStock'/>");
	        document.getElementById("itemStock").focus();
	        return;
		} */
		if(document.getElementById("itemType").value == "") {
			alert("<spring:message code='item.alert.enterType'/>")
	        document.getElementById("itemType").focus();
	        return false;
		}
		if(document.getElementById("itemMainPic").value == "") {
			alert("<spring:message code='item.alert.enterMainPic'/>")
	        document.getElementById("itemMainPic").focus();
	        return false;
		}
		if(document.getElementById("itemSubPic").value == "") {
			alert("<spring:message code='item.alert.enterSubPic'/>")
	        document.getElementById("itemSubPic").focus();
	        return false;
		}
		if(document.getElementById("itemDesc").value == "") {
			alert("<spring:message code='item.alert.enterDescription'/>")
	        document.getElementById("itemDesc").focus();
	        return false;
		}
		return true;
	}
</script>
</head>
<body>
	<!-- Header Area -->
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<!-- Menu Area -->
	<%@ include file="/WEB-INF/views/common/mainMenu.jsp"%>
	<!-- subMenu Area -->
	<main>
		<!-- 자기가 만든 페이지그룹에 해당하는 메뉴만 남길것 -->
		<!-- ================================================Content Area======================================================== -->
		<input type="hidden" id="responseItemNo" value="${item.itemNo}" readonly="readonly">
		<div class="table-responsive">
            <table class="table table-sm table-smaller">
            	<tr>
            		<td class="p-3">
            			<h5><b><spring:message code="item.selectItem"/></b></h5>
            			<div class="input-group w-25">
							<select class="form-select" name="selectedItem" id="selectedItem">
									<option value=""><spring:message code="item.itemPH"/></option>
										<c:forEach items="${itemList}" var="item">
									<option value="${item.itemNo}">${item.itemNo}
									</option>
								</c:forEach>
							</select>
						</div>
					</td>
				</tr>
			</table>
		</div>
		<div id="modifyFormContainer"></div>
		 <div class="d-flex justify-content-end">
	        <button class="btn btn-light btn-outline-secondary text-dark m-2" type="submit" id="btnInsertItem"><spring:message code="item.insertItem"/></button>
	        <button class="btn btn-light btn-outline-secondary text-dark m-2" type="submit" id="btnGetItemList"><spring:message code="item.viewItemList"/></button>
    	</div>
	</main>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>
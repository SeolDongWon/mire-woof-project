<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mire Woof</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- css common Area 헤더 푸터에 쓸 css 경로-->
<%@ include file="/WEB-INF/views/common/style.jsp"%>
<!-- script common Area 헤더 푸터에 쓸 script 경로-->
<%@ include file="/WEB-INF/views/common/script.jsp"%>
<!-- css local Area 각 개별페이지 css 경로는 여기다가 쓸 것-->
<%-- <%@ include file="" %> --%>
<!-- script local Area  각 개별페이지 script 경로는 여기다가 쓸 것 -->
<script>
    $(document).ready(function() {
    	var formObj = $("#item");
    	
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
        
    	$("#btnModifyItem").on("click", function() {
    	    if (checkValues()) {
    	        formObj.submit();
    	    }
    	});

        $("#btnGetItemList").on("click", function() {
            self.location = "/item/itemList";
        });
        
    });
    
    function confirmClose(itemStatus) {
    	if(itemStatus === 'CLOSED') {
    		alert("The item is already closed");
    		return false;
    	}
        if (confirm("Are you sure you want to close this item?")) {
        	return true;
        } 
        return false;
    }
    
    function confirmOpen(itemStatus) {
    	if(itemStatus === 'OPEN') {
    		alert("The item is already open");
    		return false;
    	}
        if (confirm("Are you sure you want to open this item?")) {
        	return true;
        } 
        return false;
    }
    
	function checkValues() {
		if(document.getElementById("itemName").value == "") {
	        alert("Please enter an item name");
	        document.getElementById("itemName").focus();
	        return;
		}
		if(document.getElementById("itemPrice").value <= "0") {
			alert("Please enter a price");
	        document.getElementById("itemPrice").focus();
	        return;
		}
		if(document.getElementById("itemStock").value <= "0") {
			alert("Please enter the item stock");
	        document.getElementById("itemStock").focus();
	        return;
		}
		if(document.getElementById("itemType").value == "") {
			alert("Please select the item category")
	        document.getElementById("itemType").focus();
	        return;
		}
		if(document.getElementById("itemMainPic").value == "") {
			alert("Please select a main picture")
	        document.getElementById("itemMainPic").focus();
	        return;
		}
		if(document.getElementById("itemSubPic").value == "") {
			alert("Please select a secondary picture")
	        document.getElementById("itemSubPic").focus();
	        return;
		}
		if(document.getElementById("itemDesc").value == "") {
			alert("Please select an item description")
	        document.getElementById("itemDesc").focus();
	        return;
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
	        <button class="btn btn-light btn-outline-secondary text-dark m-2" type="submit" id="btnGetItemList"><spring:message code="item.viewItemList"/></button>
    	</div>
	</main>
	<!-- Footer Area -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>
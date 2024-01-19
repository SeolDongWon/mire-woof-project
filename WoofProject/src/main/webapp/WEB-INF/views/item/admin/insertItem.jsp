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
        $("#btnInsertItem").on("click", function() {
        	if(checkValues()){
	            formObj.attr("action", "/item/admin/insertItem");
	            formObj.attr("method", "post");
	            formObj.submit();
        	}
        });
        $("#btnGetItemList").on("click", function() {
            self.location = "/item/itemList";
        });
    });
    
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
		<form:form modelAttribute="item" action="insertItem" enctype="multipart/form-data">
			<table class="table mx-auto table-striped">
				<tr>
					<td><spring:message code="item.itemName"/></td>
					<td><form:input class="form-control" path="itemName" name="itemName" id="itemName"/></td>
				</tr>
				<tr>
					<td><spring:message code="common.price"/></td>
					<td><form:input class="form-control" path="itemPrice" name="itemPrice" id="itemPrice"/></td>
				</tr>
				<tr>
					<td><spring:message code="item.itemStock"/></td>
					<td><form:input class="form-control" path="itemStock" name="itemStock" id="itemStock"/></td>
				</tr>
				<tr>
					<td><spring:message code="item.itemType"/></td>
					<td>
						<select class="form-control" name="itemType" id="itemType">
							<option value=""><spring:message code="item.itemTypePH"/></option>
							<option value="clothing"><spring:message code="common.itemType1"/></option>
							<option value="toy"><spring:message code="common.itemType2"/></option>
							<option value="food"><spring:message code="common.itemType3"/></option>
							<option value="accessory"><spring:message code="common.itemType4"/></option>
						</select>
					</td>
				</tr>
				<tr>
					<td><spring:message code="common.mainPic"/></td>
					<td><input type="file" name="pictures" id="itemMainPic"/></td>
				</tr>
				<tr>
					<td><spring:message code="common.subPic"/></td>
					<td><input type="file" name="pictures" id="itemSubPic"/></td>
				</tr>
				<tr>
					<td><spring:message code="common.description"/></td>
					<td><form:textarea class="form-control" rows="10" path="itemDesc" name="itemDesc" id="itemDesc"/></td>
				</tr>
				<tr>
					<td><spring:message code="item.itemStatus"/></td>
					<td>
						<select class="form-control" name="itemStatus" id="itemStatus">
							<option value="OPEN"><spring:message code="common.open"/></option>
							<option value="CLOSED"><spring:message code="common.closed"/></option>
						</select>
					</td>
				</tr>
			</table>
		</form:form>
		 <div class="d-flex justify-content-end">
	        <button class="btn btn-light btn-outline-secondary text-dark m-2" type="submit" id="btnGetItemList"><spring:message code="item.viewItemList"/></button>
	        <button class="btn btn-light btn-outline-secondary text-dark m-2" type="submit" id="btnInsertItem"><spring:message code="item.registerItem"/></button>
    	</div>
		
		<!-- unused variables -->
		<input type="hidden" value="${itemList.itemNo}" name="itemNo" />
		<input type="hidden" value="${itemList.itemRegDate}" name="itemRegDate" />
		<!-- <td align="center"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${itemList.itemRegDate}" /></td>  -->

	</main>
	<!-- Footer Area -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>
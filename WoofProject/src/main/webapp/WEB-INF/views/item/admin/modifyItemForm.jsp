<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<form:form modelAttribute="item" action="/item/modifyItem" method="post" enctype="multipart/form-data">
    <table class="table mx-auto table-striped">
        <tr>
            <td class="w-50"><spring:message code="item.no"/></td>
            <td class="w-50">${item.itemNo}</td>
        </tr>
        <tr>
        	<td><spring:message code="item.itemStatus"/></td>
        	<td>${item.itemStatus}</td>
        </tr>
        <tr>
            <td><spring:message code="item.itemName"/></td>
            <td><form:input class="form-control" path="itemName" name="itemName" id="itemName" value="${item.itemName}"/></td>
        </tr>
        <tr>
            <td><spring:message code="common.price"/></td>
            <td><form:input class="form-control" path="itemPrice" name="itemPrice" id="itemPrice" value="${item.itemPrice}"/></td>
        </tr>
        <tr>
            <td><spring:message code="item.itemType"/></td>
            <td>
                <select class="form-control" name="itemType" id="itemType">
                    <option value="${item.itemType}"><spring:message code="item.itemTypePH"/></option>
                    <option value="Clothing"><spring:message code="common.itemType1"/></option>
                    <option value="Toy"><spring:message code="common.itemType2"/></option>
                    <option value="Food"><spring:message code="common.itemType3"/></option>
                    <option value="Accessory"><spring:message code="common.itemType4"/></option>
                </select>
            </td>
        </tr>
        <tr>
            <td><spring:message code="common.mainPic"/></td>
            <td>
	            <a href="${pageContext.request.contextPath}/item/getItem?itemNo=${item.itemNo}">
	            	<img src="${pageContext.request.contextPath}/item/getItemMainPic?itemNo=${item.itemNo}" style="width:30%; height: 30%;" class="m-1">
	            </a><br>
	            <input type="file" name="pictures" id="itemMainPic" />
            </td>
        </tr>
        <tr>
            <td><spring:message code="common.subPic"/></td>
            <td>
            	<a href="${pageContext.request.contextPath}/item/getItem?itemNo=${item.itemNo}">
	            	<img src="${pageContext.request.contextPath}/item/getItemSubPic?itemNo=${item.itemNo}" style="width:20%; height: 20%;" class="m-1">
	            </a><br>
            	<input type="file" name="pictures" id="itemSubPic" />
            </td>
        </tr>
        <tr>
             <td><spring:message code="common.description"/></td>
            <td><form:textarea class="form-control" rows="10" path="itemDesc" name="itemDesc" id="itemDesc" value="${item.itemDesc}"/></td>
        </tr>
    </table>

    <form:hidden path="itemNo" id="itemNo" />
    <form:hidden path="itemMainPic" id="itemMainPic" />
    <form:hidden path="itemSubPic" id="itemSubPic" />

    <button class="btn btn-primary m-2" type="submit" id="btnModifyItem"><spring:message code="common.saveChanges"/></button>
	<a href="/item/toggleItemStatus?itemNo=${item.itemNo}" class="btn btn-success m-2" onclick="return confirmOpen('${item.itemStatus}');"><spring:message code="item.openItem"/></a>
	<a href="/item/toggleItemStatus?itemNo=${item.itemNo}" class="btn btn-danger m-2" onclick="return confirmClose('${item.itemStatus}');"><spring:message code="item.closeItem"/></a>
	<hr>
</form:form>
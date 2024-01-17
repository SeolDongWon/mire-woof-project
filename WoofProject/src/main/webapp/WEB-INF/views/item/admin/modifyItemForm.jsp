<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<form:form modelAttribute="item" action="/item/modifyItem" method="post" enctype="multipart/form-data">
    <table class="table mx-auto table-striped">
        <tr>
            <td>Item No</td>
            <td>${item.itemNo}</td>
        </tr>
        <tr>
        	<td>Item Status</td>
        	<td>${item.itemStatus}</td>
        </tr>
        <tr>
            <td>Item Name</td>
            <td><form:input class="form-control" path="itemName" name="itemName" id="itemName" value="${item.itemName}"/></td>
        </tr>
        <tr>
            <td>Price</td>
            <td><form:input class="form-control" path="itemPrice" name="itemPrice" id="itemPrice" value="${item.itemPrice}"/></td>
        </tr>
        <tr>
            <td>Item Category</td>
            <td>
                <select class="form-control" name="itemType" id="itemType">
                    <option value="${item.itemType}">Select item type</option>
                    <option value="toy">Toy</option>
                    <option value="food">Food</option>
                    <option value="clothing">Clothing</option>
                    <option value="accessory">Accessory</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>Main Photo</td>
            <td>
	            <a href="${pageContext.request.contextPath}/item/getItem?itemNo=${item.itemNo}">
	            	<img src="${pageContext.request.contextPath}/item/getItemMainPic?itemNo=${item.itemNo}" style="width:30%; height: 30%;" class="m-1">
	            </a><br>
	            <input type="file" name="pictures" id="itemMainPic" />
            </td>
        </tr>
        <tr>
            <td>Secondary Photo</td>
            <td>
            	<a href="${pageContext.request.contextPath}/item/getItem?itemNo=${item.itemNo}">
	            	<img src="${pageContext.request.contextPath}/item/getItemSubPic?itemNo=${item.itemNo}" style="width:20%; height: 20%;" class="m-1">
	            </a><br>
            	<input type="file" name="pictures" id="itemSubPic" />
            </td>
        </tr>
        <tr>
             <td>Description</td>
            <td><form:textarea class="form-control" rows="10" path="itemDesc" name="itemDesc" id="itemDesc" value="${item.itemDesc}"/></td>
        </tr>
    </table>

    <form:hidden path="itemNo" id="itemNo" />
    <form:hidden path="itemMainPic" id="itemMainPic" />
    <form:hidden path="itemSubPic" id="itemSubPic" />

    <button class="btn btn-primary m-2" type="submit" id="btnModifyItem">Save Changes</button>
	<a href="/item/toggleItemStatus?itemNo=${item.itemNo}" class="btn btn-success m-2" onclick="return confirmOpen('${item.itemStatus}');">Open Item</a>
	<a href="/item/toggleItemStatus?itemNo=${item.itemNo}" class="btn btn-danger m-2" onclick="return confirmClose('${item.itemStatus}');">Close Item</a>
	<hr>
</form:form>
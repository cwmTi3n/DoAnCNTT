<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value="/templates/" var="url"></c:url>

<form action="verifycode" method="post" style="position: relative; top: 100px;">
	<input name="currentCode">
	<button type="submit">send</button>
	<c:if test="${not empty verifysuccess}">
		<p class="text-danger my-0">${verifysuccess}</p>
	</c:if>
	<c:if test="${not empty notverifysuccess}">
		<p class="text-danger my-0">${notverifysuccess}</p>
	</c:if>
</form>
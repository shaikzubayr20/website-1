<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<% request.setCharacterEncoding("utf-8"); %>
	<c:choose>
		<c:when test='${mode == "CREATE"}'>
			<c:set var="actionValue"
				value="${pageContext.request.contextPath}/signup" />
			<c:set var="formMethod" value="post" />
			<c:set var="submitValue" value="Зарегистрировать" />
			<c:set var="title" value="Регистрация пользователя" />
		</c:when>
		<c:when test='${mode == "EDIT"}'>
			<c:set var="actionValue"
				value="${pageContext.request.contextPath}/user/${userCommand.id}/save" />
			<c:set var="formMethod" value="post" />
			<c:set var="submitValue" value="Сохранить" />
			<c:set var="title" value="Редактирование пользователя" />
		</c:when>
		<c:otherwise>
			<c:set var="actionValue"
				value="${pageContext.request.contextPath}/user/${userCommand.id}/edit" />
			<c:set var="formMethod" value="get" />
			<c:set var="submitValue" value="Редактировать" />
			<c:set var="title" value="Сохранение пользователя" />
		</c:otherwise>
	</c:choose>   
<!--  bullshit bug with jsp:include and encodding -->
<jsp:include page="header.jsp">
	<jsp:param name="title" value="${title}" />    
</jsp:include>

        <!-- main -->
        <div id="main">
            <!-- registration -->
            <div class="registration_form">
				<form:form action="${actionValue}" method="${formMethod}"
					commandName="userCommand" class="jNice">
			       	<fieldset class="reg_data">
			           	<c:choose>
							<c:when test='${mode == "CREATE"}'>
								<form:errors path="userName" cssStyle="color: #ff0000" />	
								<form:input type="text" class="text_inp" placeholder="Логин" path="userName" />
							</c:when>
							<c:otherwise>
								<label>${userCommand.userName}</label>
							</c:otherwise>
						</c:choose>
			           	
						<c:choose>
							<c:when test='${mode != "VIEW"}'>
								<form:errors path="name" cssStyle="color: #ff0000" />
								<form:input type="text" class="text_inp" placeholder="Имя пользователя" path="name" />
							</c:when>
							<c:otherwise>
								<label>${userCommand.name}</label>
							</c:otherwise>
						</c:choose>           	
			            <label>Пол</label>
			            <input type="radio" name="sex" id="male" /><span class="label">M</span>
			            <input type="radio" name="sex" id="female" /><span class="label">Ж</span>
			           	
						<c:choose>
							<c:when test='${mode != "VIEW"}'>
								<form:errors path="email" cssStyle="color: #ff0000" />
								<form:input type="text" class="text_inp" placeholder="Email" path="email" />
							</c:when>
							<c:otherwise>
								<label>${userCommand.email}</label>
							</c:otherwise>
						</c:choose>           	
						<c:if test="${mode != Modes.MODE_VIEW}">
							<form:errors path="password" cssStyle="color: #ff0000" />
							<form:password class="text_inp pass_inp" placeholder="Пароль" path="password" />
							<form:errors path="confirmPassword" cssStyle="color: #ff0000" />
							<form:password class="text_inp" placeholder="Пароль еще раз" path="confirmPassword" />
						</c:if>
			       		  <input type='submit' value='${submitValue}' />
			           </fieldset>
				</form:form>
            </div>
            <!-- end registration -->
        </div>
        <!-- end main -->

<%@ include file="footer.jsp" %>
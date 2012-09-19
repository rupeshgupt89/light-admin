<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<%@ taglib prefix="light" uri="http://www.lightadmin.org/tags" %>

<tiles:useAttribute name="domainTypeName"/>

<jsp:useBean id="entityMetadata" type="org.springframework.data.rest.repository.EntityMetadata" scope="request"/>
<jsp:useBean id="entity" type="java.lang.Object" scope="request"/>

<c:set var="entityAttributes" value="<%= entityMetadata.embeddedAttributes().values() %>"/>

<ul class="breadcrumb">
	<li><a href="<spring:url value="/"/>"><spring:message code="application.menu.dashboard"/></a></li><span class="divider">/</span><li class="active">Edit <c:out value="${domainTypeName}"/></li>
</ul>

<form class="form-horizontal">
	<div class="control-group">
		<label class="control-label" for="inputEmail">Email</label>
		<div class="controls">
			<input type="text" id="inputEmail" placeholder="Email" class="input-large">
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="inputPassword">Password</label>
		<div class="controls">
			<input type="password" id="inputPassword" placeholder="Password" class="input-large">
		</div>
	</div>
	<div class="control-group">
		<div class="controls">
			<label class="checkbox">
				<input type="checkbox"> Remember me
			</label>
			<button type="submit" class="btn">Sign in</button>
		</div>
	</div>
</form>

<table class="table table-striped table-bordered table-hover">
	<thead>
	<tr>
		<th>Attribute Name</th>
		<th>Attribute Type</th>
		<th>Attribute Value</th>
	</tr>
	</thead>

	<tbody>
	<tr>
		<td><c:out value="<%= entityMetadata.idAttribute().name()%>"/></td>
		<td><c:out value="<%= entityMetadata.idAttribute().type().getName() %>"/></td>
		<td><c:out value="<%= entityMetadata.idAttribute().get( entity ) %>"/></td>
	</tr>
	<c:forEach var="attributeEntry" items="${entityAttributes}">
		<jsp:useBean id="attributeEntry" type="org.springframework.data.rest.repository.jpa.JpaAttributeMetadata"/>
		<tr>
			<td><c:out value="<%= attributeEntry.name()%>"/></td>
			<td><c:out value="<%= attributeEntry.type().getName() %>"/></td>
			<td><c:out value="<%= attributeEntry.get( entity ) %>"/></td>
		</tr>
	</c:forEach>
	</tbody>
</table>
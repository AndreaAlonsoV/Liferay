<%@ include file="/init.jsp" %>

<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>

<p>
	<b><liferay-ui:message key="fecha1.caption"/></b>
</p>

<p>
	<b>¡Ha funcionado!</b>
</p>

 <p>
 	<liferay-portlet:renderURL var="openPortletURL">
		<liferay-portlet:param name="mvcPath" value= "/view.jsp"/>
	</liferay-portlet:renderURL>
	
<a href="${openPortletURL}"> Volver</a>


<%@ include file="/init.jsp" %>


<%@page import="java.util.Date"%>
<%@ taglib uri="http://liferay.com/tld/portlet" prefix="liferay-portlet" %>



<p>
	<b><liferay-ui:message key="fecha1.caption"/></b>
</p>

<%
	Date now = new Date();
%>

<%= now %>

<p>

<span><a id="refresh" href="">Refrescar</a></span>
<aui:script>
	AUI().use('aui-base', function(A){
			A.one("#refresh").on('click',function(){
				Liferay.Portlet.refresh();
			});
	});
</aui:script>

 <p>
 	<liferay-portlet:renderURL var="openPortletURL">
		<liferay-portlet:param name="mvcPath" value= "/page.jsp"/>
	</liferay-portlet:renderURL>
	
<a href="${openPortletURL}"> Cambiar vista</a>
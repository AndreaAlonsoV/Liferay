
<%@ include file="/init.jsp" %>

<%@page import="java.util.Date"%>
<%@ taglib uri="http://liferay.com/tld/theme" prefix="theme" %>
<%@ taglib prefix="clay" uri="http://liferay.com/tld/clay" %>
<%@ taglib uri="http://liferay.com/tld/portlet" prefix="liferay-portlet" %>
<%@ taglib uri="http://liferay.com/tld/portlet" prefix="liferay-portlet" %>

<theme:defineObjects/>

<%
	Date now = new Date();
	String name = portletDisplay.getPortletName();
	String id = "p_p_id_"+ name + "_";
	String cosas = "http://localhost:8080/web/guest/algo";
%>


<p>
	<b><liferay-ui:message key="fecha2.caption"/></b>
</p>

<%= now %>

<p><%=portletDisplay.getNamespace()%>

<p>


<a
	href="javascript:;"
	id="refresh"
	onclick="Liferay.Portlet.refresh('#p_p_id<%=portletDisplay.getNamespace()%>'); return false;"
	role="menuitem"
	tabindex="0">
		<clay:icon symbol="reload" />
</a>

<p>
 	<liferay-portlet:renderURL var="openPortletURL">
		<liferay-portlet:param name="mvcPath" value= "/page.jsp"/>
	</liferay-portlet:renderURL>
	
<a href="${openPortletURL}" target="<%= cosas %>"> Cambiar vista</a>
<%@ include file="/init.jsp" %>


<%@page import="java.util.Date"%>
<%@ taglib uri="http://liferay.com/tld/theme" prefix="theme" %>
<%@ taglib prefix="clay" uri="http://liferay.com/tld/clay" %>
<%@ taglib uri="http://liferay.com/tld/portlet" prefix="liferay-portlet" %>
<%@ page import="com.liferay.portal.kernel.util.ParamUtil" %>
<%@ page import="com.liferay.portal.kernel.util.PortalUtil" %>

<portlet:defineObjects/>
<theme:defineObjects/>


<%
long getPlid = layout.getPlid();	
HttpServletRequest httpReq = PortalUtil.getOriginalServletRequest(PortalUtil.getHttpServletRequest(renderRequest));
String color = httpReq.getParameter("_reciver_color");
%>




<p>
	<b><liferay-ui:message key="reciver.caption"/></b>
</p>


<p> El Plid es: <%= getPlid %> </p>

<p> La información que me has pasado es <%= color %> </p>


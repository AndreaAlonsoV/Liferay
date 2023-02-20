
<%@ page import="com.liferay.portal.kernel.util.PortalUtil" %>
<%@ taglib uri="http://liferay.com/tld/theme" prefix="theme" %>

<%@ include file="init.jsp"%>


<%
	HttpServletRequest httpReq = PortalUtil.getOriginalServletRequest(PortalUtil.getHttpServletRequest(renderRequest));
	String portlet = httpReq.getParameter("_miTableroReciver_portlet");
	long getPlid = layout.getPlid();

%>
<c:choose>
	<c:when test="<%=portlet == null%>">
		<p> El plid de esta página es: <%= getPlid %>
	</c:when>
	<c:when test="<%=portlet.equals("actividades")%>">
		<%@ include file="/actividades.jsp"%>
	</c:when>
	<c:when test="<%=portlet.equals("azul")%>">
		<%@ include file="/colores.jsp"%>
	</c:when>
		<c:otherwise>
		<p>
			El cielo es de color <%=portlet%>.
		</p>
	</c:otherwise>
</c:choose>



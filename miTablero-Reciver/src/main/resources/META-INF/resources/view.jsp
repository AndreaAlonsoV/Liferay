
<%@ page import="com.liferay.portal.kernel.util.PortalUtil" %>

<%@ include file="init.jsp"%>


<%
	HttpServletRequest httpReq = PortalUtil.getOriginalServletRequest(PortalUtil.getHttpServletRequest(renderRequest));
	String portlet = httpReq.getParameter("_miTableroReciver_portlet");
%>
<c:choose>
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



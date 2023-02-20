<%@ include file="/init.jsp"%>


<%@page import="java.util.Date"%>
<%@ taglib uri="http://liferay.com/tld/theme" prefix="theme"%>
<%@ page import="com.liferay.portal.kernel.util.PortalUtil"%>
<%@ taglib prefix="liferay-util" uri="http://liferay.com/tld/util"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="liferay-ui" uri="http://liferay.com/tld/ui"%>

<theme:defineObjects />


<%
	HttpServletRequest httpReq = PortalUtil.getOriginalServletRequest(PortalUtil.getHttpServletRequest(renderRequest));
	String color = httpReq.getParameter("_reciver_color");
%>
<c:choose>
	<c:when test="<%=color.equals("actividades")%>">
		<%@ include file="/actividades.jsp"%>
	</c:when>
	<c:when test="<%=color.equals("azul")%>">
		<%@ include file="/colores.jsp"%>
	</c:when>
	<c:otherwise>
		<p>
			El cielo es de color <%=color%>.
		</p>
	</c:otherwise>
</c:choose>


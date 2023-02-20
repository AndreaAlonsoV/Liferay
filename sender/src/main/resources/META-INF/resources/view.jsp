<%@ include file="/init.jsp" %>

<p>
	<b><liferay-ui:message key="sender.caption"/></b>
</p>


 	<liferay-portlet:actionURL plid="28" portletName="miTableroReciver" var="openPortletURL">
 		<portlet:param name="portlet" value="azul" />
 	</liferay-portlet:actionURL>

	
	<a href="${openPortletURL}" > ver más </a>


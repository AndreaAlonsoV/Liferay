<%@ include file="/init.jsp" %>

<p>
	<b><liferay-ui:message key="sender.caption"/></b>
</p>


 	<liferay-portlet:actionURL plid="28" portletName="reciver" var="openPortletURL">
 		<portlet:param name="color" value="azul" />
 	</liferay-portlet:actionURL>

	
	<a href="${openPortletURL}" > ver más </a>


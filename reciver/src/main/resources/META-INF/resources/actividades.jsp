<%@ include file="/init.jsp" %>

<h1> Esto es una lista con actividades</h1>

<p> Alguien ha hecho una cosa.</p>

<p> Alguien ha hecho otra cosa.</p>

<p> Alguien ha hecho una cosa donde Alguien había hecho ya otra cosa.</p>


<h4> Haciendo pruebas </h4>

<c:set var="configurationString">
	configurationParam=<c:out value="${config}" />
</c:set>
<liferay-portlet:runtime portletName="fecha2_Fecha2Portlet" queryString="${configurationString}"/>"
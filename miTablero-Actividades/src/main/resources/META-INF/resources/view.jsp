<%@page
	import="com.iconsulto.miTablero.actividades.interpreter.IConsultoSocialActivityDescriptor"%>
<%@page import="com.liferay.portal.kernel.util.DateUtil"%>
<%@page
	import="com.liferay.portal.kernel.util.FastDateFormatFactoryUtil"%>
<%@page import="com.liferay.social.kernel.model.SocialActivityFeedEntry"%>
<%@page import="com.liferay.social.kernel.util.SocialActivityDescriptor"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.Format"%>
<%@page import="com.liferay.portal.kernel.service.ServiceContext"%>
<%@page import="com.liferay.portal.kernel.service.ServiceContextFactory"%>
<%@page import="com.liferay.portal.kernel.util.ListUtil"%>
<%@page import="com.liferay.petra.string.StringPool"%>
<%@ taglib prefix="clay" uri="http://liferay.com/tld/clay"%>

<%@ include file="init.jsp"%>

<%
	List<IConsultoSocialActivityDescriptor> activityDescriptors = (List<IConsultoSocialActivityDescriptor>) renderRequest
			.getAttribute("activityDescriptorsList");
	Format dateFormatDate = FastDateFormatFactoryUtil.getSimpleDateFormat("MMMM d", locale, timeZone);
	Format yearDateFormatDate = FastDateFormatFactoryUtil.getSimpleDateFormat("dd/MM/yyyy", locale, timeZone);
	Format timeFormatDate = FastDateFormatFactoryUtil.getTime(locale, timeZone);

	ServiceContext serviceContext = ServiceContextFactory.getInstance(request);
	Date now = new Date();
	String selector = StringPool.BLANK;
	int daysBetween = -1;
%>

<div class="taglib-social-activities">

	<liferay-portlet:renderURL varImpl="iteratorTabURL" />

	<liferay-ui:search-container total="4" delta="4"
		emptyResultsMessage="there-are-no-recent-activities"
		deltaConfigurable="false" deltaParam="false"
		iteratorURL="<%=iteratorTabURL%>" curParam="curTabParam">
		<%
			List<IConsultoSocialActivityDescriptor> activityDescriptorsPag = ListUtil.subList(activityDescriptors,
						searchContainer.getStart(), searchContainer.getEnd());
		%>
		<liferay-ui:search-container-results
			results="<%= activityDescriptorsPag %>" />

		<%-- Titulo --%>
		<h3>
			Mis últimas actividades
			<%-- botón refrescar --%>
			<a href="javascript:;" id="refresh"
				onclick="Liferay.Portlet.refresh('#p_p_id<%=portletDisplay.getNamespace()%>'); return false;"
				role="menuitem" tabindex="0"> <clay:icon symbol="reload" />
			</a>
		</h3>
		<liferay-ui:search-container-row
			className="com.iconsulto.miTablero.actividades.interpreter.IConsultoSocialActivityDescriptor"
			modelVar="activityDescriptor" keyProperty="userId">

			<%
				SocialActivityFeedEntry activityFeedEntry = activityDescriptor.interpret(selector, serviceContext);
						Date activityDate = new Date(activityDescriptor.getCreateDate());
						int pos = activityDescriptorsPag.indexOf(activityDescriptor);
			%>

			<div class="card-body">
				<div class="card-col-content card-col-gutters">
					<%=yearDateFormatDate.format(activityDescriptor.getCreateDate())%>

					<%=timeFormatDate.format(activityDescriptor.getCreateDate())%>

					<%=activityFeedEntry.getTitle()%>

					<%=activityFeedEntry.getBody()%>
				</div>
			</div>
			<%-- 
			<liferay-ui:search-container-column-text value="<%=yearDateFormatDate.format(activityDescriptor.getCreateDate())%>" />
			<liferay-ui:search-container-column-text value="<%=timeFormatDate.format(activityDescriptor.getCreateDate())%>" />
			<liferay-ui:search-container-column-text value="<%=activityFeedEntry.getTitle()%>" />
			--%>

		</liferay-ui:search-container-row>
		<liferay-ui:search-iterator searchContainer="<%=searchContainer%>"
			markupView="lexicon" />
	</liferay-ui:search-container>

	<liferay-portlet:actionURL plid="28" portletName="miTableroReciver"
		var="openPortletURL">
		<portlet:param name="portlet" value="actividades" />
	</liferay-portlet:actionURL>


	<a href="${openPortletURL}"> Ver todo </a>

</div>
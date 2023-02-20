
<%@page import="com.iConsulto.miTablero.Reciver.interpreter.IConsultoSocialActivityDescriptor"%>
<%@page import="com.liferay.portal.kernel.util.DateUtil"%>
<%@page import="com.liferay.portal.kernel.util.FastDateFormatFactoryUtil"%>
<%@page import="com.liferay.social.kernel.model.SocialActivityFeedEntry"%>
<%@page import="com.liferay.social.kernel.util.SocialActivityDescriptor"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.Format"%>
<%@page import="com.liferay.portal.kernel.service.ServiceContext"%>
<%@page import="com.liferay.portal.kernel.service.ServiceContextFactory"%>
<%@page import="com.liferay.portal.kernel.util.ListUtil"%>
<%@page import="com.liferay.petra.string.StringPool"%>
<%@ page import="com.liferay.portal.kernel.util.PortalUtil" %>

<%@ include file="init.jsp"%>

<%
	List<IConsultoSocialActivityDescriptor> activityDescriptors = (List<IConsultoSocialActivityDescriptor>)renderRequest.getAttribute("activityDescriptorsList");
	Format dateFormatDate = FastDateFormatFactoryUtil.getSimpleDateFormat("MMMM d", locale, timeZone);
	Format yearDateFormatDate = FastDateFormatFactoryUtil.getSimpleDateFormat("MMMM d, yyyy", locale, timeZone);
	Format timeFormatDate = FastDateFormatFactoryUtil.getTime(locale, timeZone);
	
	ServiceContext serviceContext = ServiceContextFactory.getInstance(request);
	Date now = new Date();
	String selector = StringPool.BLANK;
	int daysBetween = -1;
%>

<div class="taglib-social-activities">

	<h1> Mis últimas actividades</h1>
	<liferay-portlet:renderURL varImpl="iteratorTabURL" />
	
	<liferay-ui:search-container total="<%= activityDescriptors.size() %>" delta="10"
			emptyResultsMessage="there-are-no-recent-activities" deltaConfigurable="false"
			deltaParam="false" iteratorURL="<%=iteratorTabURL%>" curParam="curTabParam">
		<%      	
      	List<IConsultoSocialActivityDescriptor> activityDescriptorsPag = ListUtil.subList(activityDescriptors, searchContainer.getStart(), searchContainer.getEnd());	
   		%>
   		<liferay-ui:search-container-results results="<%= activityDescriptorsPag %>" />
   		<liferay-ui:search-container-row className="com.iConsulto.miTablero.Reciver.interpreter.IConsultoSocialActivityDescriptor"
				modelVar="activityDescriptor" keyProperty="userId">
				
			<%
			SocialActivityFeedEntry activityFeedEntry = activityDescriptor.interpret(selector, serviceContext);
			Date activityDate = new Date(activityDescriptor.getCreateDate());
			int curDaysBetween = DateUtil.getDaysBetween(activityDate, now, timeZone);
			int pos = activityDescriptorsPag.indexOf(activityDescriptor);
			%>
			
					
					<li class="list-group-item">
						
							<div class="card-body">
								<div class="card-col-content card-col-gutters">
									<%=yearDateFormatDate.format(activityDescriptor.getCreateDate())%>
									
									<%= timeFormatDate.format(activityDescriptor.getCreateDate()) %>
									
									<%= activityFeedEntry.getTitle() %>
			
									<%= activityFeedEntry.getBody() %>
								</div>
							</div>
					</li>
					
			<c:if test="<%= pos == 9 %>">
				</ul>
			</c:if>
			
		</liferay-ui:search-container-row>
		<liferay-ui:search-iterator searchContainer="<%=searchContainer %>" markupView="lexicon" />
	</liferay-ui:search-container>
</div>
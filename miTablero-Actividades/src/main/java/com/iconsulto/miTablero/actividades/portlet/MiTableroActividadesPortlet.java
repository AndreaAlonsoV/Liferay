package com.iconsulto.miTablero.actividades.portlet;

import com.iconsulto.miTablero.actividades.constants.MiTableroActividadesPortletKeys;
import com.iconsulto.miTablero.actividades.interpreter.IConsultoSocialActivityDescriptor;

import com.liferay.portal.kernel.portlet.bridges.mvc.MVCPortlet;

import javax.portlet.Portlet;

import org.osgi.service.component.annotations.Component;

import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.util.PortalUtil;
import com.liferay.social.kernel.model.SocialActivity;
import com.liferay.social.kernel.service.SocialActivityService;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


import javax.portlet.PortletException;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.osgi.service.component.annotations.Reference;


/**
 * @author andrea.alonso
 */
@Component(
	immediate = true,
	property = {
		"com.liferay.portlet.display-category=MiTablero",
		"com.liferay.portlet.header-portlet-css=/css/main.css",
		"com.liferay.portlet.instanceable=true",
		"javax.portlet.display-name=MiTableroActividades",
		"javax.portlet.init-param.template-path=/",
		"javax.portlet.init-param.view-template=/view.jsp",
		"javax.portlet.name=" + MiTableroActividadesPortletKeys.MITABLEROACTIVIDADES,
		"javax.portlet.resource-bundle=content.Language",
		"javax.portlet.security-role-ref=power-user,user"
	},
	service = Portlet.class
)
public class MiTableroActividadesPortlet extends MVCPortlet {
	
private static final Log LOGGER = LogFactoryUtil.getLog(MiTableroActividadesPortlet.class);
	
	@Reference
	private SocialActivityService socialActivityService;
	
	
	@Override
	public void doView(RenderRequest renderRequest, RenderResponse renderResponse)
			throws PortletException, IOException {


		long idUser=PortalUtil.getUserId(renderRequest);

		List<IConsultoSocialActivityDescriptor> activityDescriptorsList = new ArrayList<IConsultoSocialActivityDescriptor>();
    	 try {
	    	
			List<SocialActivity> activitiesList=  socialActivityService.getUserActivities(idUser, 0,1000);
			
			activityDescriptorsList = new ArrayList<IConsultoSocialActivityDescriptor>(activitiesList.size());
			for (SocialActivity activity : activitiesList) {
				activityDescriptorsList.add(new IConsultoSocialActivityDescriptor(activity));
			}

		} catch (PortalException e ) {
			
			LOGGER.error("Error getting user activities");
		}

		renderRequest.setAttribute("activityDescriptorsList", activityDescriptorsList);
	
		super.doView(renderRequest, renderResponse);

	}
}
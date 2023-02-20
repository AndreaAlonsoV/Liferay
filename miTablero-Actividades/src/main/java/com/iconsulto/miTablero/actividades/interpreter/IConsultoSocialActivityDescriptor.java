package com.iconsulto.miTablero.actividades.interpreter;

import com.liferay.document.library.kernel.model.DLFileEntry;
import com.liferay.document.library.kernel.service.DLFileEntryLocalServiceUtil;
import com.liferay.knowledge.base.model.KBArticle;
import com.liferay.knowledge.base.model.KBComment;
import com.liferay.knowledge.base.service.KBArticleLocalServiceUtil;
import com.liferay.knowledge.base.service.KBCommentLocalServiceUtil;
import com.liferay.message.boards.model.MBMessage;
import com.liferay.message.boards.service.MBMessageLocalServiceUtil;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.service.ServiceContext;
import com.liferay.portal.util.PropsUtil;
import com.liferay.social.kernel.model.SocialActivity;
import com.liferay.social.kernel.model.SocialActivityFeedEntry;
import com.liferay.social.kernel.model.SocialActivitySet;
import com.liferay.social.kernel.service.SocialActivityInterpreterLocalServiceUtil;

import java.text.MessageFormat;

import com.iconsulto.miTablero.actividades.constants.MiTableroActividadesPortletKeys;

public class IConsultoSocialActivityDescriptor {
	
	private static final Log logger = LogFactoryUtil.getLog(IConsultoSocialActivityDescriptor.class);

	public IConsultoSocialActivityDescriptor(SocialActivity activity) {
		_activity = activity;

		_activitySet = null;
	}

	public IConsultoSocialActivityDescriptor(SocialActivitySet activitySet) {
		_activitySet = activitySet;

		_activity = null;
	}

	public long getCreateDate() {
		if (_activity != null) {
			return _activity.getCreateDate();
		}

		return _activitySet.getCreateDate();
	}

	public long getUserId() {
		if (_activity != null) {
			return _activity.getUserId();
		}

		return _activitySet.getUserId();
	}

	public SocialActivityFeedEntry interpret(String selector, ServiceContext serviceContext) {
		if (_activity != null) {
			SocialActivityFeedEntry feedEntry = SocialActivityInterpreterLocalServiceUtil.interpret(selector, _activity,
					serviceContext);

			try {
				if (_activity.getClassName().equals(KBArticle.class.getName())
						|| _activity.getClassName().equals(KBComment.class.getName())) {
					long articlePK = _activity.getClassPK();
					if (_activity.getClassName().equals(KBComment.class.getName())) {
						KBComment kbComment = KBCommentLocalServiceUtil.fetchKBComment(_activity.getClassPK());
						articlePK = kbComment.getClassPK();
					}
					KBArticle kbArticle = KBArticleLocalServiceUtil.fetchLatestKBArticle(articlePK,
							_activity.getGroupId());

					String feedEntryTitleValue = getFeedEntryFieldValue(serviceContext.getLayoutFullURL(),
							MiTableroActividadesPortletKeys.KNOWLEGE_BASE_URI, feedEntry.getTitle(),
							MiTableroActividadesPortletKeys.KNOWLEGE_BASE_ID, kbArticle.getUrlTitle());
					feedEntry.setTitle(feedEntryTitleValue);
				} else if (_activity.getClassName().equals(MBMessage.class.getName())) {
					MBMessage mbMessage = MBMessageLocalServiceUtil.getMBMessage(_activity.getClassPK());

					String feedEntryTitleValue = getFeedEntryFieldValue(serviceContext.getLayoutFullURL(),
							MiTableroActividadesPortletKeys.MESSAGE_BOARDS_URI, feedEntry.getTitle(),
							MiTableroActividadesPortletKeys.MESSAGE_BOARDS_MESSAGE_ID, String.valueOf(mbMessage.getMessageId()));
					feedEntry.setTitle(feedEntryTitleValue);

					String feedEntryBodyValue = getFeedEntryFieldValue(serviceContext.getLayoutFullURL(),
							MiTableroActividadesPortletKeys.MESSAGE_BOARDS_URI, feedEntry.getBody(),
							MiTableroActividadesPortletKeys.MESSAGE_BOARDS_CATEGORY_ID,
							String.valueOf(mbMessage.getCategoryId()));
					feedEntry.setBody(feedEntryBodyValue);
				} else if (_activity.getClassName().equals(DLFileEntry.class.getName())) {
					DLFileEntry dlFileEntry = DLFileEntryLocalServiceUtil.getDLFileEntry(_activity.getClassPK());

					String docLibraryInstanceId = PropsUtil.get(MiTableroActividadesPortletKeys.DOCUMENT_LIBRARY_INSTANCE_ID);
					String docLibraryFileId = MessageFormat.format(MiTableroActividadesPortletKeys.DOCUMENT_LIBRARY_FILE_ID,
							docLibraryInstanceId);
					String docLibraryFolderId = MessageFormat.format(MiTableroActividadesPortletKeys.DOCUMENT_LIBRARY_FOLDER_ID,
							docLibraryInstanceId);

					String feedEntryTitleValue = getFeedEntryFieldValue(serviceContext.getLayoutFullURL(),
							MiTableroActividadesPortletKeys.DOCUMENT_LIBRARY_URI, feedEntry.getTitle(), docLibraryFileId,
							String.valueOf(dlFileEntry.getFileEntryId()));
					feedEntry.setTitle(feedEntryTitleValue);

					String feedEntryBodyValue = getFeedEntryFieldValue(serviceContext.getLayoutFullURL(),
							MiTableroActividadesPortletKeys.DOCUMENT_LIBRARY_URI, feedEntry.getBody(), docLibraryFolderId,
							String.valueOf(dlFileEntry.getFolderId()));
					feedEntry.setBody(feedEntryBodyValue);
				}
			} catch (Exception e) {
				logger.error(e, e);
			}

			return feedEntry;
		}

		return SocialActivityInterpreterLocalServiceUtil.interpret(selector, _activitySet, serviceContext);
	}

	private String getFeedEntryFieldValue(String fullUrl, String uri, String feedEntryFieldValue, String id,
			String paramValue) {
		String url = fullUrl.substring(0, fullUrl.lastIndexOf("/")) + uri;
		int posHrefValue = feedEntryFieldValue.lastIndexOf(MiTableroActividadesPortletKeys.HREF) + 6;
		String href = feedEntryFieldValue.substring(posHrefValue, feedEntryFieldValue.indexOf("\"", posHrefValue));

		if (href.indexOf(MiTableroActividadesPortletKeys.RECYCLE_BIN) == -1) {
			return feedEntryFieldValue.replace(href, url + "/-/" + id + "/" + paramValue);
		}
		return feedEntryFieldValue;
	}

	private final SocialActivity _activity;
	private final SocialActivitySet _activitySet;

}

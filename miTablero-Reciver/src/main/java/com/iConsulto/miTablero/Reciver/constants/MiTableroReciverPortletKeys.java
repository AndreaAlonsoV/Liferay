package com.iConsulto.miTablero.Reciver.constants;

import java.text.SimpleDateFormat;

/**
 * @author andrea.alonso
 */
public class MiTableroReciverPortletKeys {

	public static final String MITABLERORECIVER = "miTablero_MiTableroReciverPortlet";

	public static final String SEARCH_CONTAINER_TRAZ = "solicitudesContainer";
	public static final String SEARCH_CONTAINER_TAREASS = "solicitudesTareasContainer";

	/* BUSQUEDAS */
	public static final String ATTRIBUTE_TITULO = "titulo";
	public static final String ATTRIBUTE_KEYWORDS = "keywords";
	public static final String ATTRIBUTE_STATUS = "estadoFilter";

	public static final String ATTRIBUTE_KEYWORDS_TAREAS = "keywordsTasks";
	public static final String ATTRIBUTE_STATUS_TAREAS = "estadoTasks";

	public static final String SOLICITUDES_PARAM_TITULO = "titulo";
	public static final String SOLICITUDES_PARAM_DESCRIPCION = "descripcion";
	public static final String SOLICITUDES_PARAM_TAREA_DESCRIPCION = "tarea_descripcion";
	public static final String SOLICITUDES_PARAM_FAMILIA = "familia";
	public static final String SOLICITUDES_PARAM_FECHACREACION = "fechaCreacion";
	public static final String SOLICITUDES_PARAM_FECHARESOLUCION = "fechaResolucion";
	public static final String SOLICITUDES_PARAM_IDSOLICITUD = "idSolicitud";
	public static final String SOLICITUDES_PARAM_IDTAREA = "idTarea";
	public static final String SOLICITUDES_PARAM_COMENTARIOS = "comentario";
	public static final String SOLICITUDES_PARAM_USUARIO_ASIGNADO = "usuarioAsignado";
	public static final String SOLICITUDES_PARAM_ESTADO = "estado";
	public static final String SOLICITUDES_PARAM_REQID = "reqId";
	public static final String SOLICITUDES_PARAM_TAREAID = "tareaReqId";

	public static final String SOLICITUDES_PARAM_FAMILIA_SE = "SE";
	public static final String SOLICITUDES_PARAM_FAMILIA_SOVI = "SOVI";

	public static final int ESTADO_PENDIENTE = 1;
	public static final int ESTADO_ENREVISION = 2;
	public static final int ESTADO_COMPLETADA = 3;
	public static final int ESTADO_ANULADA = 4;

	public static final int IDACTIVITY_CREAR_SOLICITUD = 1;
	public static final int IDACTIVITY_CANCELAR_SOLICITUD = 2;
	public static final int IDACTIVITY_FINALIZAR_SOLICITUD = 3;
	public static final int IDACTIVITY_MODIFICAR_SOLICITUD = 4;
	public static final int IDACTIVITY_CREAR_TAREA = 5;
	public static final int IDACTIVITY_COMENTARIO_SOLICITUD = 6;
	public static final int IDACTIVITY_COMENTARIO_TAREA = 7;
	public static final int IDACTIVITY_CANCELAR_TAREA = 8;
	public static final int IDACTIVITY_FINALIZAR_TAREA = 9;

	public static final String ERROR_SOLICITUDES = "iconsulto.solicitudes.solicitud.errorFormTs";

	public static final String SOLICITUD_MODEL = "solicitud";
	public static final String LISTA_USERS = "listaUsers";
	public static final String SOLICITUD_DOCUMENTOS_MODEL = "documentos";
	public static final String SOLICITUD_REQID = "solicitudReqIds";
	public static final String SOLICITUD_TAREAID = "solicitudTareaIds";
	public static final String SOLICITUD_DISABLEDFIELDS = "disabledFlds";
	public static final String TAREA_MODEL = "tarea";
	public static final String TAREA_DOCUMENTOS_MODEL = "tareasDocumentos";

	public static final String FAMILIA_FIELDS = "Familia";

	public static final String ROLE_COORDINADOR = "Coordinador";
	public static final String ROLE_ELABORADOR = "Elaborador";

	public static SimpleDateFormat SDF = new SimpleDateFormat("dd-MM-yyyy");

	public static final String KNOWLEGE_BASE_URI = "/base-de-conocimiento";
	public static final String KNOWLEGE_BASE_ID = "knowledge_base";
	public static final String MESSAGE_BOARDS_URI = "/foro";
	public static final String MESSAGE_BOARDS_MESSAGE_ID = "message_boards/message";
	public static final String MESSAGE_BOARDS_CATEGORY_ID = "message_boards/category";
	public static final String DOCUMENT_LIBRARY_URI = "/documentacion";
	public static final String DOCUMENT_LIBRARY_FILE_ID = "document_library/{0}/view_file";
	public static final String DOCUMENT_LIBRARY_FOLDER_ID = "document_library/{0}/view";
	public static final String HREF = "href=";
	public static final String RECYCLE_BIN = "/recycle_bin/";
	public static final String DOCUMENT_LIBRARY_INSTANCE_ID = "documents.and.media.instance.id";

	private MiTableroReciverPortletKeys() {
		/** Constructor privado **/
	}

}
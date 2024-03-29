package net.plumbing.msgbus;

import net.plumbing.msgbus.model.MessageTemplateVO;
import net.plumbing.msgbus.model.MessageType;
import org.slf4j.Logger;
import net.plumbing.msgbus.model.MessageTypeVO;

public class MakeDBupdates {

    public static int Processing_MessageTypes( String HrmsSchema, Logger MessegeSend_Log ) {
        int MessageTemplateVOkey = -1;
        for (int i = 0; i < MessageType.AllMessageType.size(); i++) {
            MessageTypeVO messageTypeVO = MessageType.AllMessageType.get(i);

            String SQLinsert= "insert into " + HrmsSchema + ".MESSAGE_TYPES (\n" +
                    "  interface_id   ," +
                    "  operation_id  ," +
                    "  msg_type    ," +
                    "  msg_type_own  ," +
                    "  msg_typedesc  ," +
                    "  msg_direction  ," +
                    "  msg_handler   ," +
                    "  url_soap_send  ," +
                    "  url_soap_ack    ," +
                    "  max_retry_count ," +
                    "  max_retry_time  ," +
                    "  last_update_dt ) \n" +
                    "values (" +
                    messageTypeVO.getInterface_Id() + "," +
                    messageTypeVO.getOperation_Id() + ",'" +
                    messageTypeVO.getMsg_Type() + "','" +
                    messageTypeVO.getMsg_Type_own() + "','" +
                    messageTypeVO.getMsg_TypeDesc() + "','" +
                    messageTypeVO.getMsg_Direction() + "'," +
                    messageTypeVO.getMsg_Handler() + ",'" +
                    messageTypeVO.getURL_SOAP_Send() + "','" +
                    messageTypeVO.getURL_SOAP_Ack() + "'," +
                    messageTypeVO.getMax_Retry_Count() + "," +
                    messageTypeVO.getMax_Retry_Time() + "," +
                    " current_timestamp );" ;

            String SQLupdate="update " + HrmsSchema + ". MESSAGE_TYPES set\n" +
                    "  msg_type  = '" + messageTypeVO.getMsg_Type() + ",'" +
                    "  msg_type_own  ='" + messageTypeVO.getMsg_Type_own() + "'," +
                    "  msg_typedesc  ='" + messageTypeVO.getMsg_TypeDesc() + "'," +
                    "  msg_direction  ='" + messageTypeVO.getMsg_Direction() + "'," +
                    "  msg_handler = " + messageTypeVO.getMsg_Handler() + ", " +
                    "  url_soap_send = '" + messageTypeVO.getURL_SOAP_Send() + "'," +
                    "  url_soap_ack  = '" + messageTypeVO.getURL_SOAP_Ack() + "'," +
                    "  max_retry_count = " + messageTypeVO.getMax_Retry_Count() + "," +
                    "  max_retry_time  = " + messageTypeVO.getMax_Retry_Time() + "," +
                    "  last_update_dt = current_timestamp\n" +
                    "  where interface_id=" + messageTypeVO.getInterface_Id() + " and  operation_id=" + messageTypeVO.getOperation_Id() + " ;";

            ;
            String nulableSQLinsert = SQLinsert.replace("'null'", "NULL");
            // MessegeSend_Log.info(nulableSQLinsert);
            String nulableSQLupdate = SQLupdate.replace("'null'", "NULL");
            // MessegeSend_Log.info(nulableSQLupdate);

        }
        return MessageType.AllMessageType.size();
    }

    public static String Processing_MessageType( String HrmsSchema, Logger MessegeSend_Log, int MessageTypeVOkey ) {

        MessegeSend_Log.warn("MessageTypeVOkey=" + MessageTypeVOkey );
            MessageTypeVO messageTypeVO = MessageType.AllMessageType.get(MessageTypeVOkey);
            if (messageTypeVO == null ) return ";";

            String SQLinsert= "insert into " + HrmsSchema + ".MESSAGE_TYPES (" +
                    " interface_id," +
                    " operation_id," +
                    " msg_type," +
                    " msg_type_own," +
                    " msg_typedesc," +
                    " msg_direction," +
                    " msg_handler," +
                    " url_soap_send," +
                    " url_soap_ack," +
                    " max_retry_count," +
                    " max_retry_time," +
                    " last_update_dt ) " +
                    "values (" +
                    messageTypeVO.getInterface_Id() + "," +
                    messageTypeVO.getOperation_Id() + ",'" +
                    messageTypeVO.getMsg_Type() + "','" +
                    messageTypeVO.getMsg_Type_own() + "','" +
                    messageTypeVO.getMsg_TypeDesc() + "','" +
                    messageTypeVO.getMsg_Direction() + "'," +
                    messageTypeVO.getMsg_Handler() + ",'" +
                    messageTypeVO.getURL_SOAP_Send() + "','" +
                    messageTypeVO.getURL_SOAP_Ack() + "'," +
                    messageTypeVO.getMax_Retry_Count() + "," +
                    messageTypeVO.getMax_Retry_Time() + "," +
                    " current_timestamp ) ;\n\n" ;

            String SQLupdate="update " + HrmsSchema + ".MESSAGE_TYPES set" +
                    " msg_type= '" + messageTypeVO.getMsg_Type() + "'," +
                    " msg_type_own='" + messageTypeVO.getMsg_Type_own() + "'," +
                    " msg_typedesc='" + messageTypeVO.getMsg_TypeDesc() + "'," +
                    " msg_direction='" + messageTypeVO.getMsg_Direction() + "'," +
                    " msg_handler= " + messageTypeVO.getMsg_Handler() + ", " +
                    " url_soap_send= '" + messageTypeVO.getURL_SOAP_Send() + "'," +
                    " url_soap_ack= '" + messageTypeVO.getURL_SOAP_Ack() + "'," +
                    " max_retry_count= " + messageTypeVO.getMax_Retry_Count() + "," +
                    " max_retry_time= " + messageTypeVO.getMax_Retry_Time() + "," +
                    " last_update_dt= current_timestamp" +
                    " where interface_id=" + messageTypeVO.getInterface_Id() + " and operation_id=" + messageTypeVO.getOperation_Id() + "; \n\n";

            ;
            String nulableSQLinsert = SQLinsert.replace("'null'", "NULL");
            //MessegeSend_Log.info(nulableSQLinsert);
            String nulableSQLupdate = SQLupdate.replace("'null'", "NULL");
            //MessegeSend_Log.info(nulableSQLupdate);

        return nulableSQLinsert + nulableSQLupdate;
    }

    public static String Processing_MessageTemplate( String HrmsSchema, Logger MessegeSend_Log , MessageTemplateVO messageTemplateVO) {

       // MessageTemplateVO messageTemplateVO = MessageTemplate.AllMessageTemplate.get(MessageTemplateVOkey );
        if (messageTemplateVO == null ) return ";";
        String SQLinsert= "insert into " + HrmsSchema + ".Message_Templates (\n" +
                "Template_Id, " +
                "Interface_Id, " +
                "Operation_Id, " +
                "Msg_Type, " +
                "Msg_Type_Own, " +
                "Template_Name, " +
                "Template_Dir, " +
                "Source_Id, " +
                "Destin_Id, " +
                "Src_Subcod, " +
                "Dst_Subcod, " +
                "Lastmaker, " +
                "Lastdate) select max(Template_Id)+1, " +
                // messageTemplateVO.getTemplate_Id() + ", " +
                messageTemplateVO.getInterface_Id() + ", " +
                messageTemplateVO.getOperation_Id() + ", '" +
                messageTemplateVO.getMsg_Type() + "', '" +
                messageTemplateVO.getMsg_Type_own() + "', '" +
                messageTemplateVO.getTemplate_name() + "', '" +
                messageTemplateVO.getTemplate_Dir() + "', " +
                messageTemplateVO.getSource_Id() + ", " +
                messageTemplateVO.getDestin_Id() + ", '" +
                messageTemplateVO.getSrc_SubCod() + "', '" +
                messageTemplateVO.getDst_SubCod() + "', '" +
                // messageTemplateVO.getLastMaker() + "', " +
                "sysTemplater"  + "', '" + // для сравнения каталогов
                " current_timestamp from artx_proj.Message_Templates;" ;
        //String SQLupdate="";
        String nulableSQLinsert = SQLinsert.replace("'null'", "NULL");
        MessegeSend_Log.info(nulableSQLinsert);
        //String nulableSQLupdate = SQLupdate.replace("'null'", "NULL");
        //MessegeSend_Log.info(nulableSQLupdate);

        return nulableSQLinsert; // + nulableSQLupdate;


        }

}

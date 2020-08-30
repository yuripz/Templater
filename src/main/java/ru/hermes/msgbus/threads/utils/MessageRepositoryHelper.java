package ru.hermes.msgbus.threads.utils;

import org.slf4j.Logger;
import ru.hermes.msgbus.model.*;

public class MessageRepositoryHelper {

    public static  int look4MessageDirectionsVO_2_Perform(int MessageMsgDirection_id, String MessageSubSys_cod, Logger messegeSend_log) {
        int MsgDirectionVO_Key=-1;
        int MsgDirectionVO_4_Direction_Key=-1;
        int MsgDirectionVO_4_Direction_SubSys_Id=-1;

        for (int j = 0; j < MessageDirections.AllMessageDirections.size(); j++) {
            MessageDirectionsVO messageDirectionsVO = MessageDirections.AllMessageDirections.get(j);
            if ( messageDirectionsVO.getMsgDirection_Id() == MessageMsgDirection_id )
            { String DirectionsSubSys_Cod = messageDirectionsVO.getSubsys_Cod();
                if ( (DirectionsSubSys_Cod == null) || (DirectionsSubSys_Cod).equals("0") ) {
                    //  заполнен код ПодСистемы : MESSAGE_DIRECTIONS.subsys_cod == '0' OR MESSAGE_DIRECTIONS.subsys_cod is NULL )
                    MsgDirectionVO_4_Direction_Key = j;
                }
                else {
                    if ( DirectionsSubSys_Cod.equals( MessageSubSys_cod ))
                        MsgDirectionVO_4_Direction_SubSys_Id = j;
                }

            }
        }
        if (MsgDirectionVO_4_Direction_Key > 0 ) MsgDirectionVO_Key = MsgDirectionVO_4_Direction_Key;
        if (MsgDirectionVO_4_Direction_SubSys_Id > 0 ) MsgDirectionVO_Key = MsgDirectionVO_4_Direction_SubSys_Id;
        return  MsgDirectionVO_Key;
    }

    public static  int look4MessageTypeVO_2_Perform(int Operation_Id,  Logger messegeSend_log) {
        for (int i = 0; i < MessageType.AllMessageType.size(); i++) {
            MessageTypeVO messageTypeVO = MessageType.AllMessageType.get(i);
            if ( messageTypeVO.getOperation_Id() == Operation_Id ) {    //  нашли операцию,
                return  i;
            }
        }
        return -1;
    }

    public static  int look4MessageTypeVO_4_Interface_operation_id (int Interface_Id, int Operation_Id,   Logger messegeSend_log) {
        for (int i = 0; i < MessageType.AllMessageType.size(); i++) {
            MessageTypeVO messageTypeVO = MessageType.AllMessageType.get(i);
            if ( messageTypeVO.getOperation_Id() == Operation_Id ) {    //  нашли операцию,
                if ( messageTypeVO.getInterface_Id() == Interface_Id ) // совпал штекфейс!
                    return  i;
            }
        }
        return -1;
    }

    public static int look4MessageTemplate( int look4Template_Id,
                                            Logger MessegeSend_Log) {
        int MessageTemplateVOkey=-1;

        for (int i = 0; i < MessageTemplate.AllMessageTemplate.size(); i++) {
            MessageTemplateVO messageTemplateVO = MessageTemplate.AllMessageTemplate.get( i );
            int Template_Id = messageTemplateVO.getTemplate_Id();

            if (Template_Id == look4Template_Id) {
                // №№ Шаблонов совпали,  Template_Id = i;
                MessageTemplateVOkey = i;
                MessegeSend_Log.info( "look4MessageTemplate: Обновляем [" + MessageTemplateVOkey +"]: Template_Id=" + MessageTemplate.AllMessageTemplate.get(MessageTemplateVOkey).getTemplate_Id());
                return MessageTemplateVOkey;
            }
        }
            MessegeSend_Log.info("look4MessageTemplate, получаем MessageTemplateVOkey=[" + MessageTemplateVOkey +"]: значит, не нашли");

        return MessageTemplateVOkey;
    }

    public static int look4MessageTemplateVO_2_Perform( int Operation_Id,
                                                  int MsgDirection_Id,
                                                  String  SubSys_Cod  , Logger MessegeSend_Log) {
        int Template_Id=-1;
        int Template_All_Id=-1;
        int Template_4_Direction_Id=-1;
        int Template_4_Direction_SubSys_Id=-1;

        int Type_Id = -1;
        int TemplateOperation_Id ;
        int TemplateMsgDirection_Id;
        String  TemplateSubSys_Cod;
        // 1) пробегаем по Типам сообщений
        for (int i = 0; i < MessageType.AllMessageType.size(); i++)
        {
            MessageTypeVO  messageTypeVO = MessageType.AllMessageType.get(i);
            if ( messageTypeVO.getOperation_Id() == Operation_Id )
            {
                //  нашли операцию,
                Type_Id = i;
            }
        }

        if ( Type_Id < 0) {
            MessegeSend_Log.info("Operation[" + Operation_Id + "] is not found in any MessageType");
            return Template_Id;
        }
        for (int i = 0; i < MessageTemplate.AllMessageTemplate.size(); i++) {
            MessageTemplateVO messageTemplateVO = MessageTemplate.AllMessageTemplate.get( i );
            TemplateOperation_Id = messageTemplateVO.getOperation_Id();
            TemplateMsgDirection_Id = messageTemplateVO.getDestin_Id();
            TemplateSubSys_Cod = messageTemplateVO.getDst_SubCod();

            // MessegeSend_Log.info("[" + i + "] № операции (" + TemplateOperation_Id + ") TemplateMsgDirection_Id =[" + TemplateMsgDirection_Id + "], TemplateSubSys_Cod=" + TemplateSubSys_Cod );

            if (TemplateOperation_Id == Operation_Id) {
                // № операции совпали,  Template_Id = i;
                //  MessegeSend_Log.info("[" + i + "] № операции (" + Operation_Id + ") совпали =[" + TemplateOperation_Id + "], " + messageTemplateVO.getTemplate_name() );
                //  MessegeSend_Log.info("[" + i + "] Template_Id (" + messageTemplateVO.getTemplate_Id() + ") смотрим TemplateSubSys_Cod =[" + TemplateSubSys_Cod + "]" );

                if ( (TemplateSubSys_Cod == null) || (TemplateSubSys_Cod).equals("0") || (TemplateSubSys_Cod).equals("") )
                { // в Шаблоне не заполнен код ПодСистемы : MESSAGE_templateS.dst_subcod == '0' OR MESSAGE_templateS.dst_subcod is NULL )
                    // сравниваем по коду сисмемы Шаблона MESSAGE_templateS.destin_id и сообщения MESSAGE_QUEUE.MsgDirection_Id
                    //     MessegeSend_Log.info("сравниваем по коду сисмемы Шаблона MESSAGE_templateS.destin_id " + TemplateMsgDirection_Id + " и сообщения MESSAGE_QUEUE.MsgDirection_Id");

                    if (( TemplateMsgDirection_Id != 0 ) && (TemplateMsgDirection_Id == MsgDirection_Id )){
                        // совпали Идентификаторы систем
                        Template_4_Direction_Id= i;
                        //       MessegeSend_Log.info("Идентификаторы систем (" + MsgDirection_Id + ") совпали[" + TemplateMsgDirection_Id + "]=" + messageTemplateVO.getTemplate_name() );
                    }
                    if ( ( TemplateMsgDirection_Id == 0 )) {
                        // Шаблон для любой системы
                        Template_All_Id = i;
                        //     MessegeSend_Log.info("Шаблон для любой системы(" + messageTemplateVO.getDestin_Id() + ") совпали[" + messageTemplateVO.getTemplate_Id() + "]=" + messageTemplateVO.getTemplate_name() );
                    }

                }
                else { // в Шаблоне Заполнен код ПодСистемы : MESSAGE_templateS.dst_subcod is NOT null -> MESSAGE_templateS.destin_id is NOT null too !
                    // проверяем на полное совпадение
                    //    MessegeSend_Log.info("сравниваем по коду ПОДсистемы Шаблона "+ TemplateSubSys_Cod + " и MESSAGE_templateS.destin_id " + TemplateMsgDirection_Id +
                    //            " с сообщением MESSAGE_QUEUE.SubSys_Cod(" + SubSys_Cod + ") MESSAGE_QUEUE.MsgDirection_Id(" + MsgDirection_Id + ")");
                    if ( (TemplateSubSys_Cod.equals(SubSys_Cod) ) && (TemplateMsgDirection_Id == MsgDirection_Id ) ) {
                        Template_4_Direction_SubSys_Id = i;
                        //     MessegeSend_Log.info("Идентификаторы систем (" + MsgDirection_Id + ") совпали[" + messageTemplateVO.getTemplate_Id() + "]=" + " коды подСистем тоже совпали (" + SubSys_Cod + ") " + messageTemplateVO.getTemplate_name());
                    }
                }

            }
        }
        // уточняем точность находки в порядке широты применения
        if ( Template_All_Id > 0 ) Template_Id = Template_All_Id;
        if ( Template_4_Direction_Id > 0 ) Template_Id = Template_4_Direction_Id;
        if ( Template_4_Direction_SubSys_Id > 0 ) Template_Id = Template_4_Direction_SubSys_Id;
        if ( Template_Id >= 0 )
            MessegeSend_Log.info("Итого, используем [" + Template_Id +"]: Template_Id=" + MessageTemplate.AllMessageTemplate.get(Template_Id).getTemplate_Id());
        else
            MessegeSend_Log.error("Итого, получаем Template_Id=[" + Template_Id +"]: значит, не нашли");

        return Template_Id;

    }
}

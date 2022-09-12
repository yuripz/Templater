package net.plumbing.msgbus;
import net.plumbing.msgbus.common.DataAccess;
import net.plumbing.msgbus.model.MessageTemplate;
import net.plumbing.msgbus.model.MessageTemplateVO;
import net.plumbing.msgbus.model.MessageType;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.attribute.FileTime;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.concurrent.TimeUnit;
import java.util.function.Consumer;

import org.apache.commons.io.FileUtils;
import net.plumbing.msgbus.threads.utils.MessageRepositoryHelper;

public class PerformTemplates {

    private static Logger PerformTemplates_Log = LoggerFactory.getLogger(PerformTemplates.class);;


    public static Integer Processing( Logger MessegeSend_Log ){
        int MessageTemplateVOkey=-1;

        String File_separator="/";
        if ( PerformTemplates_Log == null ) PerformTemplates_Log = MessegeSend_Log;
        boolean isWindows = System.getProperty("os.name")
                .toLowerCase().startsWith("windows");

        String fullDirPath;
        if ( System.getProperty("ExternalStorageDirectory") == null )
            if ( isWindows )
                fullDirPath = "/var/templates-xxx";
            else
            fullDirPath = "/var/templates_xxx";
        else
            fullDirPath =  System.getProperty("ExternalStorageDirectory") + File_separator + "Templates";

        PerformTemplates_Log.info("PerformTemplates:Processing, готовим каталог [" + fullDirPath + "]");
        File folder;
        folder = new File( fullDirPath );

        try {
            PerformTemplates_Log.info("PerformTemplates, forceDelete[" + fullDirPath + "]");
            FileUtils.forceDelete(folder);
            PerformTemplates_Log.info("PerformTemplates, forceMkdir[" + fullDirPath + "]");
            FileUtils.forceMkdir( folder);
        }
        catch ( FileNotFoundException ee ) {
            PerformTemplates_Log.info("PerformTemplates, folder.mkdir()[" + fullDirPath + "]");
            folder.mkdir();
        }

        catch ( IOException e) {
            e.printStackTrace();
            PerformTemplates_Log.error("Не смогли зачистить " + fullDirPath);
            return -21;
        }


        if (!folder.exists()) {
            folder.mkdir();
        }
        else {
            folder.delete();
            folder.mkdir();
        }
        File subFolder;
        Long  creationDate;

        DateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
        Path somePath;

        for (int i = 0; i < MessageTemplate.AllMessageTemplate.size(); i++) {

            MessageTemplateVO messageTemplateVO = MessageTemplate.AllMessageTemplate.get( i );

            Integer Interface_Id = messageTemplateVO.getInterface_Id();
            Integer Operation_Id= messageTemplateVO.getOperation_Id();
            String Msg_Type = messageTemplateVO.getMsg_Type();
            String InitDate = messageTemplateVO.getLastDate();
            if ( InitDate == null )  InitDate = "2001.01.01 01:01:01";
            // InitDate = "2019.03.11 16:29:12"; //"2001.01.01 12:01:01";
            PerformTemplates_Log.info("PerformTemplates, получаем [" + messageTemplateVO.getTemplate_name() +"] с датой ->" + InitDate);
            try  {

                creationDate = dateFormat.parse(InitDate).getTime() + 3 * 60 * 60 * 1000 ;
                creationDate.toString();

            int  MessageType_Key = MessageRepositoryHelper.look4MessageTypeVO_4_Interface_operation_id(Interface_Id, 0, MessegeSend_Log );
            if ( MessageType_Key < 0 ) {
                PerformTemplates_Log.error("look4MessageTypeVO_4_Interface_operation_id(" + Interface_Id + "," + 0 + ") не нашла тип Операции" );

            }
            String subDirPath;
            if ( MessageType_Key < 0 )
                subDirPath = fullDirPath  + File_separator + Interface_Id.toString() + ".";
            else {
                if ( MessageType.AllMessageType.get(MessageType_Key).getMsg_TypeDesc() != null )
                    subDirPath = fullDirPath + File_separator + Interface_Id.toString() + "." +
                            MessageType.AllMessageType.get(MessageType_Key).getMsg_TypeDesc()
                                    .replace("\"", " ")
                                    .replace("\\", "-")
                                    .replace("/", "-")
                                    .replace(":", "-")
                                    .trim()
                            ;
                else
                    subDirPath = fullDirPath + File_separator + Interface_Id.toString() + ".";
            }
            subFolder = new File( subDirPath );
            if (!subFolder.exists()) {
                subFolder.mkdir();
            }
            else {
                subFolder.delete();
                subFolder.mkdir();
            }

            String fileNamePath = subDirPath  + File_separator + Interface_Id.toString()
            + ".BO_" + Operation_Id.toString() + "." ;
                //MessegeSend_Log.warn("Готовим для записи файл [" + fileNamePath );
                        Integer Template_Id = messageTemplateVO.getTemplate_Id();
                String MsgDirections;
            if ( messageTemplateVO.getTemplate_Dir().equalsIgnoreCase("OUT"))
                 MsgDirections = DataAccess.SelectMsgDirectionsOUT(MessegeSend_Log, Template_Id );
            else
                MsgDirections = DataAccess.SelectMsgDirectionsIN(MessegeSend_Log, Template_Id );
            String preFileName = fileNamePath + "_" +
                    MsgDirections + "_" + "." + Msg_Type.trim() + ".";

            FileTime time = FileTime.from(creationDate, TimeUnit.MILLISECONDS );
                PerformTemplates_Log.info("PerformTemplates, задаём [" + time.toString() +"] из даты ->" + InitDate + " " + dateFormat.parse(InitDate).toString()   );
                MessageType_Key = MessageRepositoryHelper.look4MessageTypeVO_4_Interface_operation_id(Interface_Id, Operation_Id, MessegeSend_Log );
                if ( MessageType_Key < 0 ) {
                    PerformTemplates_Log.error("look4MessageTypeVO_4_Interface_operation_id(" + Interface_Id + "," + Operation_Id + ") не нашла тип Операции" );

                }
                else {
                    //MessegeSend_Log.warn("Формируем SQLDMLcommand для MessageType_Key[" + MessageType_Key + "] Нашли из( " + Interface_Id + "," + Operation_Id + ")" );
                    String SQLDMLcommand = MakeDBupdates.Processing_MessageType(MessegeSend_Log, MessageType_Key);
                    MessegeSend_Log.warn("SQLDMLcommand, пишем [" + fileNamePath + "SQL" + "]=>(" + SQLDMLcommand + ")" );
                    writeUsingOutputStream(SQLDMLcommand,
                            fileNamePath + "SQL",
                            time
                    );
                }
                String SQLinsertMessageTemplate = MakeDBupdates.Processing_MessageTemplate(MessegeSend_Log, messageTemplateVO);
                writeUsingOutputStream(SQLinsertMessageTemplate,
                        preFileName + "SQL",
                        time
                );
            MessegeSend_Log.info("PerformTemplates, пишем [" + preFileName + "]");
            writeUsingOutputStream( messageTemplateVO.getHeaderInXSLT(), preFileName + "HeaderInXSLT.xslt", time );
            writeUsingOutputStream( messageTemplateVO.getWsdlInterface(), preFileName + "WsdlInterface.wsdl", time  );
            writeUsingOutputStream( messageTemplateVO.getWsdlXSD1(), preFileName + "WsdlXSD1.xsd", time  );
            writeUsingOutputStream( messageTemplateVO.getWsdlXSD2(), preFileName + "WsdlXSD2.xsd", time  );
            writeUsingOutputStream( messageTemplateVO.getWsdlXSD3(), preFileName + "WsdlXSD3.xsd", time  );
            writeUsingOutputStream( messageTemplateVO.getWsdlXSD4(), preFileName + "WsdlXSD4.xsd", time  );
            writeUsingOutputStream( messageTemplateVO.getWsdlXSD5(), preFileName + "WsdlXSD5.xsd", time  );
            writeUsingOutputStream( messageTemplateVO.getWsdlXSD6(), preFileName + "WsdlXSD6.xsd", time  );
            writeUsingOutputStream( messageTemplateVO.getWsdlXSD7(), preFileName + "WsdlXSD7.xsd", time  );
            writeUsingOutputStream( messageTemplateVO.getWsdlXSD8(), preFileName + "WsdlXSD8.xsd", time  );
            writeUsingOutputStream( messageTemplateVO.getWsdlXSD9(), preFileName + "WsdlXSD9.xsd", time  );


            writeUsingOutputStream( messageTemplateVO.getMessageXSD(), preFileName + "MessageXSD.xsd", time  );
            writeUsingOutputStream( messageTemplateVO.getMessageXSLT(), preFileName + "MessageXSLT.xslt", time  );
            writeUsingOutputStream( messageTemplateVO.getAckXSLT(), preFileName + "AckXSLT.xslt", time  );
            writeUsingOutputStream( messageTemplateVO.getMsgAnswXSLT(), preFileName + "MsgAnswXSLT.xslt", time  );
            writeUsingOutputStream( messageTemplateVO.getEnvelopeXSLTPost(), preFileName + "EnvelopeXSLTPost.xslt", time  );
            writeUsingOutputStream( messageTemplateVO.getConfigExecute(), preFileName + "ConfigExecute.prop", time  );
            writeUsingOutputStream( messageTemplateVO.getConfigPostExec(), preFileName + "ConfigPostExec.prop", time  );
            writeUsingOutputStream( messageTemplateVO.getHeaderXSLT(), preFileName + "HeaderXSLT.xslt", time  );
            writeUsingOutputStream( messageTemplateVO.getEnvelopeInXSLT(), preFileName + "EnvelopeInXSLT.xslt", time  );


            writeUsingOutputStream( messageTemplateVO.getEnvelopeXSLTExt(), preFileName + "EnvelopeXSLTExt.xslt", time  );
            writeUsingOutputStream( messageTemplateVO.getEnvelopeNS(), preFileName + "EnvelopeNS.xslt", time  );
            writeUsingOutputStream( messageTemplateVO.getMessageAnswAck(), preFileName + "MessageAnswAck.xslt", time  );
            writeUsingOutputStream( messageTemplateVO.getMessageAnswMsgXSLT(), preFileName + "MessageAnswMsgXSLT.xslt", time  );

            writeUsingOutputStream( messageTemplateVO.getMessageAnswerXSD(), preFileName + "MessageAnswerXSD.xslt", time  );

            writeUsingOutputStream( messageTemplateVO.getAckAnswXSLT(), preFileName + "AckAnswXSLT.xslt", time  );

            writeUsingOutputStream( messageTemplateVO.getErrTransXSLT(), preFileName + "ErrTransXSLT.xslt", time  );
            writeUsingOutputStream( messageTemplateVO.getErrTransXSD(), preFileName + "ErrTransXSD.xsd", time  );
            } catch (Exception e) {
                e.printStackTrace();
            }
        }


        return MessageTemplateVOkey;
    }
    private static void setFileTime( String fullFilePath, FileTime time ) {
        Path somePath = Paths.get( fullFilePath ) ;
        boolean isWindows = System.getProperty("os.name")
                .toLowerCase().startsWith("windows");
/*
        if ((isWindows) && (false)) {
            Process os_process = null;
            try {
                if ( isWindows ) {
                    PerformTemplates_Log.info("exec for:'" + String.format("cmd /c dir \"" + fullFilePath + "\" /tc") + "'");
                    os_process = Runtime.getRuntime()
                            .exec(String.format("cmd /c dir \"" + fullFilePath + "\" /tc"));
                } else {
                    os_process = Runtime.getRuntime()
                            .exec(String.format("sh -c ls %s", fullFilePath));
                }
            } catch (IOException e) {
                e.printStackTrace();
                PerformTemplates_Log.error("Runtime.getRuntime for:'" + fullFilePath + "' failed:" + e.getMessage());
            }
            Process process = os_process;
            try {
                StreamGobbler streamGobbler =
                        new StreamGobbler(process.getInputStream(), PerformTemplates_Log::error);
                //        System.out::println );
                Executors.newSingleThreadExecutor().submit(streamGobbler);
                int exitCode = process.waitFor();
                assert exitCode == 0;
            } catch (java.lang.InterruptedException e) {
                e.printStackTrace();
                PerformTemplates_Log.error("Runtime.getRuntime for:'" + fullFilePath + "' failed:" + e.getMessage());
            }

        }
        else
            */
        // System.out.println(output);
        try {
            //if (!isWindows)
            PerformTemplates_Log.info( "try setAttribute=creationTime, setLastModifiedTime for:'" + fullFilePath + "' ->" + time.toString()   );
            Files.setAttribute( somePath,  "creationTime", time);
            Files.setLastModifiedTime(somePath  , time);


        }catch (IOException e) {
            e.printStackTrace();
            PerformTemplates_Log.error( "setFileTime for:'" + fullFilePath + "' failed:" + e.getMessage());
        }
    }


    private static void writeUsingOutputStream(String data, String fullFilePath, FileTime time) {
        OutputStream os = null;
        OutputStreamWriter writer = null;
        if ( data == null ) return;
        // if ( data.length() < 6 ) return; // Пустую секцию лучше выгрузить как файл 0й длинны
        try {
            os = new FileOutputStream(new File(fullFilePath));
            writer = new OutputStreamWriter( os, StandardCharsets.UTF_8 );
            writer.write(data, 0, data.length() );
            /*
            byte RowBytes[] =  data.getBytes("UTF-8");
            os.write(RowBytes , 0, RowBytes.length);
            */
        } catch (IOException e) {
            PerformTemplates_Log.error( "write to " + fullFilePath + " failed:" + e.getMessage());
            e.printStackTrace();
        }finally{
            try {
                if ( writer != null )
                {
                 {  writer.flush();
                    writer.close();
                 }
            /*    if ( os != null ) {
                    {   os.flush();
                        os.close();
                    }

             */
                    setFileTime(fullFilePath, time);
                }
            } catch (IOException e) {
                e.printStackTrace();
                PerformTemplates_Log.error( "close " + fullFilePath + " failed:" + e.getMessage());
            }
        }
    }

    private static class StreamGobbler implements Runnable {
        private InputStream inputStream;
        private Consumer<String> consumer;

        public StreamGobbler(InputStream inputStream, Consumer<String> consumer) {
            this.inputStream = inputStream;
            this.consumer = consumer;
        }

        @Override
        public void run() {
            new BufferedReader(new InputStreamReader(inputStream)).lines()
                    .forEach(consumer);
        }
    }

}

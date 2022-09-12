package net.plumbing.msgbus;

import net.plumbing.msgbus.config.ConnectionProperties;
import net.plumbing.msgbus.init.InitMessageRepository;
import net.plumbing.msgbus.model.MessageDirections;
import net.plumbing.msgbus.model.MessageTemplate;
import net.plumbing.msgbus.model.MessageType;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.boot.CommandLineRunner;
import net.plumbing.msgbus.common.DataAccess;


import java.sql.Connection;
import java.util.Properties;
@SpringBootApplication
public class TemplaterApplication implements CommandLineRunner {

    public static final Logger AppThead_log = LoggerFactory.getLogger(TemplaterApplication.class);

    @Autowired
    public ConnectionProperties connectionProperties;

    public static void main(String[] args) {
        SpringApplication.run(TemplaterApplication.class, args);
        return;
    }
    public void run(String... strings) throws Exception {

       // ApplicationContext context = new AnnotationConfigApplicationContext(Sender_AppConfig.class);

        AppThead_log.info("Hellow for TemplaterApplication ");
        Properties props = System.getProperties();
        String DoExecMode = System.getProperty("DoExecMode");
        if (DoExecMode == null ) return;
        if (!DoExecMode.equalsIgnoreCase("true"))
            return;

        AppThead_log.info( connectionProperties.toString() );
        //taskPollProperties.settotalNumTasks("10");
        //AppThead_log.info( taskPollProperties.toString() );
 /*
        String propLongRetryCount = connectionProperties.getlongRetryCount();
        if (propLongRetryCount == null) propLongRetryCount = "12";
        String propShortRetryCount = connectionProperties.getshortRetryCount();
        if (propShortRetryCount == null) propShortRetryCount = "3";

        String propLongRetryInterval = connectionProperties.getlongRetryInterval();
        if (propLongRetryInterval == null) propLongRetryInterval = "600";
        String propShortRetryInterval = connectionProperties.getshortRetryInterval();
        if (propShortRetryInterval == null) propShortRetryInterval = "30";

        int ShortRetryCount = Integer.parseInt( connectionProperties.getshortRetryCount() );
        int LongRetryCount = Integer.parseInt( connectionProperties.getlongRetryCount()  );
        int ShortRetryInterval = Integer.parseInt( connectionProperties.getshortRetryInterval() );
        int LongRetryInterval = Integer.parseInt( connectionProperties.getlongRetryInterval() );

        int WaitTimeBetweenScan = Integer.parseInt( connectionProperties.getwaitTimeScan() );
        int NumMessageInScan = Integer.parseInt( connectionProperties.getnumMessageInScan() );
        int ApiRestWaitTime = Integer.parseInt( connectionProperties.getapiRestWaitTime() );
        int FirstInfoStreamId = 101;
        if ( connectionProperties.getfirstInfoStreamId() != null)
            FirstInfoStreamId = Integer.parseInt( connectionProperties.getfirstInfoStreamId() );
        String psqlFunctionRun = connectionProperties.getpsqlFunctionRun();
*/
        String HrmsSchema =  connectionProperties.gethrmsDbSchema() ;
        // Установаливем "техническое соединение" , что бы считать конфигурацию из БД в public static HashMap'Z
        Connection Target_Connection = DataAccess.make_Hermes_Connection( HrmsSchema,  connectionProperties.gethrmsPoint(),
                connectionProperties.gethrmsDbLogin(),
                connectionProperties.gethrmsDbPasswd(),
                AppThead_log
        );
if ( Target_Connection == null ) {
    AppThead_log.error( "DataAccess.make_Hermes_Connection() fault " );
    return;
}

        // InitMessageRepository.SelectMsgDirections(ShortRetryCount, ShortRetryInterval, LongRetryCount, LongRetryInterval,
        InitMessageRepository.SelectMsgDirections(3, 30, 2, 200,
                AppThead_log );
        AppThead_log.info("keysAllMessageDirections: " + MessageDirections.AllMessageDirections.get(1).getMsgDirection_Desc() );



        InitMessageRepository.SelectMsgTypes( AppThead_log );
        AppThead_log.info("keysAllMessageType: " + MessageType.AllMessageType.get(0).getMsg_TypeDesc() );
        MakeDBupdates.Processing_MessageTypes(AppThead_log);

        InitMessageRepository.SelectMsgTemplates( AppThead_log );
        AppThead_log.info("keysAllMessageTemplates: " + MessageTemplate.AllMessageTemplate.get(0).getTemplate_name() );

        // int totalTasks = Integer.parseInt( "1" ); // TotalNumTasks; //Integer.parseInt( "50" ); //
        // Long CurrentTime;
        // CurrentTime = DataAccess.getCurrentTime( AppThead_log );
        // DataAccess.InitDate.setTime( CurrentTime );
        // AppThead_log.info(" New InitDate=" +  DataAccess.dateFormat.format( DataAccess.InitDate ) );

        PerformTemplates.Processing( AppThead_log );

        return;

    }

}

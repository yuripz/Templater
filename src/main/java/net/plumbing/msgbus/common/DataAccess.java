package net.plumbing.msgbus.common;

// import com.sun.istack.internal.NotNull;
import org.jetbrains.annotations.NotNull;
import org.slf4j.Logger;
import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;

public  class DataAccess {

    public static Connection  Hermes_Connection;
    public  static Date InitDate;
    public static DateFormat dateFormat;

    @Autowired
    /*
    static JdbcTemplate jdbcTemplate;
    static DriverManagerDataSource dataSource;
    */
    private static PreparedStatement stmtCurrentTimeStringRead;
    private static PreparedStatement stmtCurrentTimeDateRead;
    public static  String HrmsSchema="orm";
    public static  String rdbmsVendor="oracle";

    public static  Connection make_Hermes_Connection( String DbSchema, String dst_point, String db_userid , String db_password, Logger dataAccess_log) {
        Connection Target_Connection = null;
        String connectionUrl ;
        if ( dst_point==null) {
            connectionUrl = "jdbc:oracle:thin:@//10.242.36.8:1521/hermes12"; // Test-Capsul !!!
            //connectionUrl = "jdbc:oracle:thin:@//10.32.245.4:1521/hermes"; // Бой !!!
        }
        else {
            connectionUrl = dst_point;
        }
        // попробуй ARTX_PROJ / rIYmcN38St5P
        // hermes / uthvtc
        //String db_userid = "HERMES";
        //String db_password = "uthvtc";
        String ClassforName;
        if ( connectionUrl.indexOf("oracle") > 0 )
            ClassforName = "oracle.jdbc.driver.OracleDriver";
        else ClassforName = "org.postgresql.Driver";
        HrmsSchema =  DbSchema;
        if ( connectionUrl.contains("oracle") ) rdbmsVendor="oracle";
        else rdbmsVendor="postgresql";
        HrmsSchema =  DbSchema;

        dataAccess_log.info( "Try DataBase getConnection: " + connectionUrl + " as " + db_userid + " to RDBMS " + rdbmsVendor + " DbSchema:" + DbSchema);

        try {
            // Establish the connection.
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Target_Connection = DriverManager.getConnection(connectionUrl, db_userid, db_password);
            // Handle any errors that may have occurred.
            Target_Connection.setAutoCommit(false);
            PreparedStatement stmt_SetTimeZone = Target_Connection.prepareStatement("set SESSION time zone 3");//.nativeSQL( "set SESSION time zone 3" );
            stmt_SetTimeZone.execute();
            stmt_SetTimeZone.close();
            /*dataSource = new DriverManagerDataSource(connectionUrl);
            dataSource.setDriverClassName("oracle.jdbc.OracleDriver");
            dataSource.setPassword(db_password);
            dataSource.setUsername(db_userid);
            */
            DataAccess.Hermes_Connection = Target_Connection;
            dateFormat = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
            stmtCurrentTimeStringRead = DataAccess.Hermes_Connection.prepareStatement(SQLCurrentTimeStringRead );
            stmtCurrentTimeDateRead = DataAccess.Hermes_Connection.prepareStatement(SQLCurrentTimeDateRead );
            stmtLook_2_MessageDirectionsOUT = DataAccess.Hermes_Connection.prepareStatement(sqlLook_2_MessageDirectionsOUT );
            dataAccess_log.info( "Hermes sqlLook_2_MessageDirectionsIN:{ " +
            sqlLook_2_MessageDirectionsIN + " }" );
            stmtLook_2_MessageDirectionsIN = DataAccess.Hermes_Connection.prepareStatement(sqlLook_2_MessageDirectionsIN );
            ResultSet rs = null;
            rs = stmtCurrentTimeDateRead.executeQuery();
            while (rs.next()) {
                InitDate = rs.getDate("InitTime");
                dataAccess_log.info( "Hermes CurrentTime: LocalDate ="+ InitDate.toLocalDate().toString() + " getTime=" + InitDate.getTime()  + " mSec., " + dateFormat.format( InitDate )  );
            }
            rs.close();
            // stmtInitTimeDateRead.close();
        } catch (Exception e) {
            e.printStackTrace();
            return ( (Connection) null );
        }

        dataAccess_log.info( "Hermes getConnection: " + connectionUrl + " as " + db_userid + " at " + dateFormat.format( InitDate ) + " done" );
        /*
        jdbcTemplate = new JdbcTemplate( dataSource );
        InitDate = jdbcTemplate.queryForObject(
                "SELECT sysdate FROM dual", Date.class);
        */
      if ( InitDate != null)
        dataAccess_log.info( "Hermes sysdate: LocalDate ="+ InitDate.toLocalDate().toString() + " getTime=" + InitDate.getTime() + " mSec., " + dateFormat.format( InitDate )  );


        return Target_Connection;
    }

    private static final String SQLCurrentTimeStringRead= "SELECT to_char(current_timestamp, 'YYYYMMDDHHMISS') as InitTime FROM dual";
    private static final String SQLCurrentTimeDateRead= "SELECT current_timestamp as InitTime FROM dual";
    //private static final String SQLCurrentTimeStringRead= "SELECT to_char(sysdate, 'YYYYMMDDHHMISS') as InitTime FROM dual";
    //private static final String SQLCurrentTimeDateRead= "SELECT sysdate as InitTime FROM dual";
    private static final String sqlLook_2_MessageDirectionsOUT = "SELECT " + HrmsSchema + ".x_templates$_look_2_messagedirections(t.destin_id::Integer, t.dst_subcod::Varchar) as messagedirection" +
            " from " + HrmsSchema + ".MESSAGE_templateS t where t.template_id= ?";
    private static final String sqlLook_2_MessageDirectionsIN = "SELECT " + HrmsSchema + ".x_templates$_look_2_messagedirections( t.SOURCE_ID::Integer, t.SRC_SUBCOD::Varchar) as messagedirection" +
            " from " + HrmsSchema + ".MESSAGE_templateS t where t.template_id= ?";
    private static PreparedStatement stmtLook_2_MessageDirectionsOUT;
    private static PreparedStatement stmtLook_2_MessageDirectionsIN;

    public static String SelectMsgDirectionsOUT(@NotNull Logger dataAccess_log, Integer p_Template_Id ) {
        String CurrentTime="0-0-X-0-0";
        try {

            ResultSet rs = null;
            stmtLook_2_MessageDirectionsOUT.setInt(1, p_Template_Id );
            rs = stmtLook_2_MessageDirectionsOUT.executeQuery();
            while (rs.next()) {
                CurrentTime = rs.getString(1);
            }
            rs.close();
            dataAccess_log.info( "Hermes MsgDirections ="+ CurrentTime );
        } catch (Exception e) {
            dataAccess_log.error("getMsgDirections {" + sqlLook_2_MessageDirectionsOUT + "} fault: " + sStackTracе.strInterruptedException(e));

        }
        return ( CurrentTime );
    }

    public static String SelectMsgDirectionsIN(@NotNull Logger dataAccess_log, Integer p_Template_Id ) {
        String CurrentTime="0-0-Y-0-0";
        try {

            ResultSet rs = null;
            stmtLook_2_MessageDirectionsIN.setInt(1, p_Template_Id );
            rs = stmtLook_2_MessageDirectionsIN.executeQuery();
            while (rs.next()) {
                CurrentTime = rs.getString(1);
            }
            rs.close();
            dataAccess_log.info( "Hermes MsgDirections ="+ CurrentTime );
        } catch (Exception e) {
            dataAccess_log.error("getMsgDirections {" + sqlLook_2_MessageDirectionsIN + "} fault: " + sStackTracе.strInterruptedException(e));

        }
        return ( CurrentTime );
    }
    public static String getCurrentTimeString(@NotNull Logger dataAccess_log ) {
        String CurrentTime="00000000000000";
        try {

            ResultSet rs = null;
            rs = stmtCurrentTimeStringRead.executeQuery();
            while (rs.next()) {
                CurrentTime = rs.getString("InitTime");
            }
            rs.close();
            dataAccess_log.info( "Hermes CurrentTime: LocalDate ="+ CurrentTime );
        } catch (Exception e) {
            dataAccess_log.error("getCurrentTimeString fault: " + sStackTracе.strInterruptedException(e));

        }
        return ( CurrentTime );

    }

    public static Long getCurrentTime(@NotNull Logger dataAccess_log ) {
        Date CurrentTime=null;
        try {
            ResultSet rs = null;
            rs = stmtCurrentTimeDateRead.executeQuery();
            while (rs.next()) {
                CurrentTime = rs.getDate("InitTime");
            }
            rs.close();
            if ( CurrentTime != null)
                dataAccess_log.info( "Hermes CurrentTime: LocalDate ="+ CurrentTime.toLocalDate().toString() + " getTime=" + CurrentTime.getTime()  + " mSec., " + dateFormat.format( CurrentTime )  );
            return CurrentTime.getTime();

        } catch (Exception e) {
            dataAccess_log.error("getCurrentTimeDate fault: " + sStackTracе.strInterruptedException(e));
            return null;
        }
    }

    public static Integer moveERROUT2RESOUT(@NotNull String pSQL_function, @NotNull Logger dataAccess_log ) {
        CallableStatement callableStatement =null;
        Integer count;

        // # HE-5467 Необходимо обеспечить обработку ПРИЁМА ответов на ИСХОДЯЩИЕ события для инициации вызова прикладного обработчика при любых ошибках и сбоях внешней системы при интеграции
        try {
             callableStatement = DataAccess.Hermes_Connection.prepareCall (pSQL_function);


        } catch (Exception e) {
            dataAccess_log.error("prepareCall(" + pSQL_function + " fault: " + sStackTracе.strInterruptedException(e));
            return null;
        }
        try {
            dataAccess_log.info("try executeCall(" + pSQL_function);
        // register OUT parameter
        callableStatement.registerOutParameter(1, Types.INTEGER);

        // Step 2.C: Executing CallableStatement
            try {
        callableStatement.execute();
            } catch (SQLException e) {
                dataAccess_log.error(", SQLException callableStatement.execute(" + pSQL_function + " ):=" + e.toString());
                callableStatement.close();
                return -3;
            }

        // get count and print in console
        count = callableStatement.getInt(1);
            dataAccess_log.info( pSQL_function + " = " + count);

            callableStatement.close();

        } catch (Exception e) {
            dataAccess_log.error("executeCall(" + pSQL_function + " fault: " + sStackTracе.strInterruptedException(e));
            return null;
        }

        return count;
    }
/*
    public static String getCurrentTimeString(@NotNull Logger dataAccess_log ) {
        if ( jdbcTemplate !=null ) {
            String CurrentTime = jdbcTemplate.queryForObject(
                    "SELECT to_char(sysdate, 'YYYYMMDDHHMISS' ) FROM dual", String.class);
            if ( CurrentTime != null)
                dataAccess_log.info( "Hermes CurrentTime: LocalDate ="+ CurrentTime );
            return CurrentTime;
        }
        else
            return null;
    }

    public static Long getCurrentTime(@NotNull Logger dataAccess_log ) {
        if ( jdbcTemplate !=null ) {
            Date CurrentTime = jdbcTemplate.queryForObject(
                    "SELECT sysdate FROM dual", Date.class);
            if ( CurrentTime != null)
                dataAccess_log.info( "Hermes CurrentTime: LocalDate ="+ CurrentTime.toLocalDate().toString() + " getTime=" + CurrentTime.getTime()  + " mSec., " + dateFormat.format( CurrentTime )  );
            return CurrentTime.getTime();
        }
        else
            return null;
    }
    */
}



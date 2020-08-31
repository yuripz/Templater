<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
      <xsl:for-each select="syncCentralOfficeResponse">
   <Confirmation>
   
     <ResultCode><xsl:value-of select="orderResult/orderResultCode"/></ResultCode>
    <Message><xsl:value-of select="orderResult/orderResultText"/></Message>

     <xsl:for-each select="payload">
       <DetailList>
  <timestamp><xsl:value-of select="timestamp"/></timestamp>
       <xsl:for-each select="centralOffices">
          <centralOffices>
               <xsl:for-each select="centralOffice">
               <centralOffice>
                  <id><xsl:value-of select="id"/></id>
                  <name><xsl:value-of select="name"/></name>
                     <locationId><xsl:value-of select="address/locationId"/></locationId>
                     <locationCategory><xsl:value-of select="address/locationCategory"/></locationCategory>
                  <lastChangeDate><xsl:value-of select="lastChangeDate"/></lastChangeDate>
                  <isDeleted><xsl:value-of select="isDeleted"/></isDeleted>
<!-- <xsl:value-of select=""/> -->

               </centralOffice>
            </xsl:for-each> <!--  centralOffice-->
          </centralOffices>
     </xsl:for-each>
       </DetailList> 
     </xsl:for-each>
     <Next>RESOUT</Next>
   </Confirmation>
  </xsl:for-each> <!--  orderResult -->
  <xsl:for-each select="Fault">
      <xsl:choose>
        <xsl:when test="ResultCode > 0">
          <Result>
            <Cod>
              <xsl:value-of select="ResultCode"/>
            </Cod>
            <Text>
              <xsl:value-of select="Message"/>
            </Text>
            <Next>ERROUT</Next>
          </Result>
        </xsl:when>
        <xsl:otherwise>
          <Result>
            <Cod>6666</Cod>
            <Text>
              <xsl:copy-of select="/Fault"/>
            </Text>
            <Next>ERROUT</Next>
          </Result>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 <xsl:template match="/">
  <xsl:for-each select="syncCentralOfficeResponse">
  <xsl:for-each select="orderResult">
   <Confirmation>
     <ResultCode><xsl:value-of select="orderResultCode"/></ResultCode>
     <Message><xsl:value-of select="orderResultText"/></Message>
     <xsl:for-each select="payload">
       <DetailList>
       <xsl:for-each select="centralOffices">
          <Detail>
               <xsl:for-each select="centralOffice">
               <centralOffice>
                  <id><xsl:value-of select="name"/></id>
                  <name><xsl:value-of select="name"/></name>
                  <address>
                     <!--type: LocationCategory - enumeration: [SHORTADDRESS,FULLADDRESS,HERMES,GEO,GID]-->
                     <locationCategory>GEO</locationCategory>
                     <!--Optional:-->
			<locationAttributes>
				<attribute name="Latitude" status="AC" isChanged="false">55.685659</attribute>
				<attribute name="Longitude" status="AC" isChanged="false">55.685659</attribute>
				<attribute name="room" status="AC" isChanged="false">101</attribute>
			</locationAttributes>
                  </address>
                  <!--type: dateTime-->
                  <lastChangeDate><xsl:value-of select="lastChangeDate"/></lastChangeDate>
                  <!--type: boolean-->
                  <isDeleted><xsl:value-of select="isDeleted"/></isDeleted>
               </centralOffice>
            </xsl:for-each> <!--  centralOffice-->
          </Detail>
     </xsl:for-each>
       </DetailList> 
     </xsl:for-each>
     <Next>RESOUT</Next>
   </Confirmation>
  </xsl:for-each> <!--  orderResult -->
  </xsl:for-each> <!--syncCentralOfficeResponse -->
 </xsl:template>
</xsl:stylesheet>
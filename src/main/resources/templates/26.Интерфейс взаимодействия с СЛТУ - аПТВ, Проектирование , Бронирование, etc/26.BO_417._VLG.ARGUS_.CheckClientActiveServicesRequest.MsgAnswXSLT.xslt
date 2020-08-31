<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
  		<xsl:for-each select="checkClientActiveServicesResponse">
   <Confirmation>
   <xsl:choose>
<xsl:when test="orderResult/orderResultCode!=''">

       <ResultCode><xsl:value-of select="orderResult/orderResultCode"/></ResultCode>
    <Message><xsl:value-of select="payload/serviceList/service/client/partyName"/>
    </Message>
       <DetailList>
                 <ResultCode><xsl:value-of select="orderResult/orderResultCode"/></ResultCode>
    <Message><xsl:value-of select="orderResult/orderResultText"/></Message> 
    <xsl:for-each select="payload">
    <payload>
    <xsl:for-each select="serviceList">
    <serviceList>
    <xsl:for-each select="service">
    <service>
    <xsl:for-each select="client">
    <client>
    <xsl:copy-of select="partyRole"/>
    <xsl:copy-of select="partyId"/>
    <xsl:copy-of select="partyName"/>
    <xsl:for-each select="partyAttributes">

    <partyAttributes>
    
    <xsl:for-each select="attribute">
    <xsl:element name="{@name}">
      <xsl:value-of select="."/>
    </xsl:element>
  </xsl:for-each>
  
    </partyAttributes>
     </xsl:for-each>   <!--partyAttributes-->
    </client>
    </xsl:for-each> <!--client -->
    <xsl:copy-of select="technology"/>
    
	<xsl:copy-of select="serviceItem"/>
	</service>
	</xsl:for-each> <!--service -->
	</serviceList>
	</xsl:for-each> <!--serviceList-->
	<!--/checkClientActiveServicesResponse/payload/resourceList-->
	<xsl:copy-of select="resourceList"/>
</payload>	
</xsl:for-each> <!-- payload-->
	
       </DetailList> 

</xsl:when>    
  <xsl:otherwise>
  <ResultCode>-1020304</ResultCode>
    <Message>Пришло пустое сообщение о сервисах</Message>
  </xsl:otherwise>
 </xsl:choose>
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
						<Next>RESOUT</Next>
					</Result>
				</xsl:when>
				<xsl:otherwise>
					<Result>
						<Cod>6666</Cod>
						<Text>
							<xsl:copy-of select="/Fault"/>
						</Text>
						<Next>RESOUT</Next>
					</Result>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>

	</xsl:template>
</xsl:stylesheet>
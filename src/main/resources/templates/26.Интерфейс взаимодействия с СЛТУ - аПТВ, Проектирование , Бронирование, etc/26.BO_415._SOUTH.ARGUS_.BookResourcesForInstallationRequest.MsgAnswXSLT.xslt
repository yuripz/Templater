<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
  		<xsl:for-each select="bookResourcesForInstallationResponse">
   <Confirmation>
       <ResultCode><xsl:value-of select="orderResult/orderResultCode"/></ResultCode>
    <Message><xsl:value-of select="orderResult/orderResultText"/></Message>
       <DetailList>
	<xsl:copy-of select="payload"/>
       </DetailList> 
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
   <Confirmation>
       <ResultCode>60606</ResultCode>
    <Message><xsl:value-of select="Message"/></Message>
       <DetailList>
							<Cod>60606</Cod>
						<Text>
							<xsl:copy-of select="/Fault"/>
						</Text>
       </DetailList> 
     <Next>RESOUT</Next>
   </Confirmation>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>

	</xsl:template>
</xsl:stylesheet>
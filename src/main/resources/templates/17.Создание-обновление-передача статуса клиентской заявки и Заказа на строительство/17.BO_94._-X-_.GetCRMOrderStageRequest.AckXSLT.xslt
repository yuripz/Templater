<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 <xsl:template match="/">
  <xsl:for-each select="Confirmation">
  
 <xsl:choose> 
 
   <xsl:when test="ResultCode=0">
<tns:SuccessResponseGetStage xsi:schemaLocation="urn:ru:rt:hrms:successresponse" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:tns="urn:ru:rt:hrms:successresponse">
<xsl:for-each select="SuccessResponseGetStage">

	<SuccessResponse><xsl:value-of select="SuccessResponse"/></SuccessResponse>
	<SYSOrderNum><xsl:value-of select="SYSOrderNum"/></SYSOrderNum>
	<SYSOrderURL><xsl:value-of select="SYSOrderURL"/></SYSOrderURL>
	<StageName><xsl:value-of select="StageName"/></StageName>
	 <xsl:for-each select="HermesStageList">
	<HermesStageList>
	 <xsl:for-each select="HermesStage">
		<HermesStage>
			<GoToNumber><xsl:value-of select="GoToNumber"/></GoToNumber>
			<GoToName><xsl:value-of select="GoToName"/></GoToName>
		</HermesStage>
		 </xsl:for-each> <!-- HermesStage -->
	</HermesStageList>
 </xsl:for-each> <!-- HermesStageList -->
     </xsl:for-each> <!-- SuccessResponseGetStage -->
     </tns:SuccessResponseGetStage>
        </xsl:when>
        
<xsl:when test="ResultCode=-6001">
<tns:SuccessResponseGetStage xsi:schemaLocation="urn:ru:rt:hrms:successresponse" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:tns="urn:ru:rt:hrms:successresponse">
<xsl:for-each select="SuccessResponseGetStage">

	<SuccessResponse><xsl:value-of select="SuccessResponse"/></SuccessResponse>
	<SYSOrderNum><xsl:value-of select="SYSOrderNum"/></SYSOrderNum>
	<SYSOrderURL><xsl:value-of select="SYSOrderURL"/></SYSOrderURL>
	<StageName><xsl:value-of select="StageName"/></StageName>
     </xsl:for-each> <!-- SuccessResponseGetStage -->
     </tns:SuccessResponseGetStage>	   
</xsl:when>
   
   <xsl:otherwise>
<tns:Fault xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:tns="urn:ru:rt:crm:fault">
    	<ResultCode><xsl:value-of select="ResultCode"/></ResultCode>
	<Message><xsl:value-of select="Message"/></Message>
</tns:Fault>
   </xsl:otherwise>

</xsl:choose>
  </xsl:for-each>
  
  
  <xsl:for-each select="Fault">
  <tns:Fault xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:tns="urn:ru:rt:crm:fault">
     <Result><Cod>1666</Cod><Text>AckXSLT: <xsl:value-of select="faultstring"/></Text><Next>ERROUT</Next></Result>
    </tns:Fault> 
  </xsl:for-each>
 </xsl:template>
</xsl:stylesheet>
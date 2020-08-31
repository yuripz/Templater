<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
 <xsl:template match="/">
  <xsl:for-each select="Confirmation">
<Response type="json">
	<ResultCode><xsl:value-of select="ResultCode"/></ResultCode>
	<ResultMessage><xsl:value-of select="Message"/></ResultMessage>
	<PayLoad>
		<Queue_ID><xsl:value-of select="PayLoad/AppResponse"/></Queue_ID>
	</PayLoad>
</Response>
  </xsl:for-each>
  <xsl:for-each select="Fault">
<urn1:Fault xmlns:urn1="urn:ru:rt:hrms:fault">
   <ResultCode><xsl:value-of select="ResultCode"/></ResultCode> 
   <ResultMessage><xsl:value-of select="ResultMessage"/></ResultMessage> 
</urn1:Fault>
  </xsl:for-each>
 </xsl:template>
</xsl:stylesheet>
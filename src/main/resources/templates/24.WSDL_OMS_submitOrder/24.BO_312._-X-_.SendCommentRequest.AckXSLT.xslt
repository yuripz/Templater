<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 <xsl:template match="/">
   <xsl:for-each select="Confirmation">
<tns:SendCommentResponse xmlns:tns="http://crm.rt.ru/SendCommentResponse">
	<originator>HRMS</originator>
	<receiver><xsl:value-of select="receiver"/></receiver>
	<orderResult>
		<orderResultCode><xsl:value-of select="ResultCode"/></orderResultCode>
		<orderResultText><xsl:value-of select="Message"/></orderResultText>
	</orderResult>
</tns:SendCommentResponse>
</xsl:for-each>
  
  <xsl:for-each select="Fault">
<oms:Fault xmlns:oms="http://oms.rt.ru/">
   <faultcode><xsl:value-of select="ResultCode"/></faultcode>
<faultstring><xsl:value-of select="Message"/></faultstring>
   <ResultCode><xsl:value-of select="ResultCode"/></ResultCode> 
   <Message><xsl:value-of select="Message"/></Message> 
</oms:Fault>
  </xsl:for-each>
 </xsl:template>
</xsl:stylesheet>
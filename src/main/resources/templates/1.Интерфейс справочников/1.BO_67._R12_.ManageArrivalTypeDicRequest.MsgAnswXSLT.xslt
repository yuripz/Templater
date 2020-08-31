<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 <xsl:template match="/">
  <xsl:for-each select="SuccessResponse">
<urn1:SuccessResponse xmlns:urn1="urn:ru:rt:hrms:successresponse">
    <SuccessResponse>0</SuccessResponse>
</urn1:SuccessResponse>
  </xsl:for-each>
  <xsl:for-each select="Fault">
<urn1:Fault xmlns:urn1="urn:ru:rt:hrms:fault">
   <ResultCode><xsl:value-of select="ResultCode"/></ResultCode> 
   <Message><xsl:value-of select="Message"/></Message> 
</urn1:Fault>
  </xsl:for-each>
 </xsl:template>
</xsl:stylesheet>
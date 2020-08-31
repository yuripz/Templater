<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 <xsl:template match="/">
  <xsl:for-each select="SuccessResponse">
<urn2:SuccessResponse xmlns:urn2="urn:ru:rt:fuip:successresponse">
    <SuccessResponse>0</SuccessResponse>
</urn2:SuccessResponse>
  </xsl:for-each>
  <xsl:for-each select="Fault">
<urn2:Fault xmlns:urn2="urn:ru:rt:fuip:fault">
   <ResultCode><xsl:value-of select="ResultCode"/></ResultCode> 
   <Message><xsl:value-of select="Message"/></Message> 
</urn2:Fault>
  </xsl:for-each>
 </xsl:template>
</xsl:stylesheet>
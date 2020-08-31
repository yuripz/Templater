<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<urn1:ConfirmManageOrderStatusRequest xmlns:urn1="urn:ru:rt:fuip:confirmationmessageinr12">
<xsl:for-each select="Result">
 <Confirmation xmlns:ns2="urn:ru:rt:fuip:confirmation">
  <ResultCode><xsl:value-of select="Cod"/></ResultCode>
 <xsl:if test="Cod > 0">
  <Message><xsl:value-of select="Text"/></Message>
 </xsl:if>  
 </Confirmation>
</xsl:for-each>
</urn1:ConfirmManageOrderStatusRequest>
</xsl:template>
</xsl:stylesheet>
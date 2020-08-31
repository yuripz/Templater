<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<ns1:ConfirmManageAssetsCostRequest xmlns:ns1="urn:ru:rt:fuip:confirmationmessageinr12">
<xsl:for-each select="Result">
  <Confirmation>
    <ResultCode><xsl:value-of select="Cod"/></ResultCode>
 <xsl:if test="Cod > 0">
    <Message><xsl:value-of select="Text"/></Message>
 </xsl:if>  
  </Confirmation>
</xsl:for-each>
</ns1:ConfirmManageAssetsCostRequest>
</xsl:template>
</xsl:stylesheet>
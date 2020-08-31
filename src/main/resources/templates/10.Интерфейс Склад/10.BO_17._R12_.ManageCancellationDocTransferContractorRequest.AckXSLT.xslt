<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<urn1:ConfirmManageCancellationDocTransferContractorRequest xmlns:urn1="urn:ru:rt:fuip:confirmationmessageinr12">
<xsl:for-each select="Result">
 <DetailConfirmation>
  <ResultCode><xsl:value-of select="Cod"/></ResultCode>
 <xsl:if test="Cod > 0">
  <Message><xsl:value-of select="Text"/></Message>
 </xsl:if>  
 </DetailConfirmation>
</xsl:for-each>
</urn1:ConfirmManageCancellationDocTransferContractorRequest>
</xsl:template>
</xsl:stylesheet>
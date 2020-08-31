<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 <xsl:template match="/">
  <xsl:for-each select="ConfirmManageOrderRequest">
  <xsl:for-each select="Confirmation">
   <Confirmation>
     <ResultCode><xsl:value-of select="ResultCode"/></ResultCode>
     <Message><xsl:value-of select="Message"/></Message>
     <Next>RESOUT</Next>
   </Confirmation>
  </xsl:for-each>
  </xsl:for-each>
 </xsl:template>
</xsl:stylesheet>
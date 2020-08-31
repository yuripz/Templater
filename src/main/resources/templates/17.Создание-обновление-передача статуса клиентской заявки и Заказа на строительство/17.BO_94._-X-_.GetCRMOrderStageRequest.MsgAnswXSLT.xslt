<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 <xsl:template match="/">
  <xsl:for-each select="Confirmation">
   <xsl:if test="ResultCode=0">
    <Result><Cod>0</Cod><Text>MsgAnswXSLT: Success</Text><Next>DELOUT</Next></Result>
   </xsl:if>
  </xsl:for-each>
  <xsl:for-each select="Fault">
     <Result><Cod>1666</Cod><Text><xsl:value-of select="faultstring"/></Text><Next>ERROUT</Next></Result>
  </xsl:for-each>
 </xsl:template>
</xsl:stylesheet>
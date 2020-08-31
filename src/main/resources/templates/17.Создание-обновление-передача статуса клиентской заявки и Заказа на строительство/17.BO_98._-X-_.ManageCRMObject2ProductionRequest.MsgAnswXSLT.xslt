<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 <xsl:template match="/">
  <xsl:for-each select="SuccessResponse">
   <xsl:if test="SuccessResponse=0">
    <Result><Cod>0</Cod><Text>Success</Text><Next>EXEOUT</Next></Result>
   </xsl:if>
  </xsl:for-each>
  <xsl:for-each select="Fault">
    <xsl:choose>
     <xsl:when test="ResultCode > 0">
       <Result><Cod><xsl:value-of select="ResultCode"/></Cod><Text><xsl:value-of select="Message"/></Text><Next>ERROUT</Next></Result>
     </xsl:when>
     <xsl:otherwise>
       <Result><Cod>6666</Cod><Text><xsl:copy-of select="/Fault"/></Text><Next>ERROUT</Next></Result>
     </xsl:otherwise>
   </xsl:choose> 
  </xsl:for-each>
 </xsl:template>
</xsl:stylesheet>
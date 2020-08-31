<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
  <xsl:for-each select="Envelope">
    <xsl:for-each select="Header">
<SQLRequest>
 <SQLStatement type="function" snum="1">
   <PSTMT>{ ? = call artx_proj.x_getsqlconfirm(?,?) }</PSTMT>
   <Param pnum="1" dir="out" ></Param>
   <Param pnum="2"><xsl:value-of select="MsgId"/></Param>
   <Param pnum="3">SELECT 1 AS p1,  2  AS p2
   FROM DUAL
      UNION ALL
      SELECT 3, 4
        FROM DUAL
       UNION ALL
      SELECT 5, 6
        FROM DUAL UNION ALL
      SELECT 7, 8
        FROM DUAL</Param>
   <ResultSet>
    <Result rnum="1" type="number">ResultCode</Result>
   </ResultSet>
 </SQLStatement>
 <Return>
  <Normal>
   <Confirmation>
     <ResultCode>0</ResultCode>
   </Confirmation>
  </Normal>
  <Fault>
  </Fault>
 </Return>
</SQLRequest>
    </xsl:for-each>
  </xsl:for-each>
</xsl:template>
</xsl:stylesheet>
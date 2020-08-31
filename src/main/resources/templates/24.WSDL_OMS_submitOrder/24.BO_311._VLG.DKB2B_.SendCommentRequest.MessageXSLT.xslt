<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <SendCommentRequest xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
      <originator>HRMS</originator>
      <receiver>
        <xsl:value-of select="/SendCommentRequest/receiver"/>
      </receiver>
      <xsl:for-each select="SendCommentRequest">
        <xsl:copy-of select="/SendCommentRequest/payload"/>
      </xsl:for-each>
    </SendCommentRequest>
  </xsl:template>
</xsl:stylesheet>
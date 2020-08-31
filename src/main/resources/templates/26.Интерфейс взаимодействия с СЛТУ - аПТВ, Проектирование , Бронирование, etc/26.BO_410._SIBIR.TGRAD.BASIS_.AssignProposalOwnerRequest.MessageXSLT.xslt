<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/" xmlns:proj="http://nri.rt.ru/ProjectProposalSevice">

  <proj:AssignProposalOwnerRequest>
  <xsl:for-each select="AssignProposalOwnerRequest">
    <proj:originator>HERMES</proj:originator>
    <proj:receiver><xsl:value-of select="receiver"/></proj:receiver>
    <proj:payload>
    <xsl:for-each select="payload">
      <proj:orderId><xsl:value-of select="orderId"/></proj:orderId>
                <proj:personId><xsl:value-of select="personId"/></proj:personId>
    </xsl:for-each> <!-- payload -->    
    </proj:payload>
    </xsl:for-each> <!-- AssignProposalOwnerRequest-->    
  </proj:AssignProposalOwnerRequest>
  </xsl:template>

</xsl:stylesheet>
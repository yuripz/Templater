<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 <xsl:template match="/">
 <xsl:for-each select="Envelope">
  <xsl:for-each select="Body">

<Context>
 <EventInitiator>CRM_MRFSZ</EventInitiator>
 <EventKey>-1</EventKey> 
 <Source>CRM_MRFSZ</Source>
 <Destination>HRMS</Destination>
 <BusOperationId>507</BusOperationId>
</Context>


</xsl:for-each> <!-- Body -->
</xsl:for-each>

 </xsl:template>
</xsl:stylesheet>
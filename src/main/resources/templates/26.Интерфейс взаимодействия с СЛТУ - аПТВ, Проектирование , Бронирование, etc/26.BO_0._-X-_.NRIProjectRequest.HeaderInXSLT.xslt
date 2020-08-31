<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 <xsl:template match="/">
 <xsl:for-each select="Envelope">
  <xsl:for-each select="Body">
  <xsl:for-each select="ProjectCompleteNotificationRequest">
<Context>
 <EventInitiator><xsl:value-of select="originator"/></EventInitiator>
 <EventKey>-1</EventKey> 
 <Source><xsl:value-of select="originator"/></Source>
 <Destination>HRMS</Destination>
 <BusOperationId>423</BusOperationId>
</Context>
</xsl:for-each> <!-- ProjectCompleteNotificationRequest -->

  <xsl:for-each select="ExternalAssignProposalOwnerRequest">
<Context>
 <EventInitiator><xsl:value-of select="originator"/></EventInitiator>
 <EventKey>-1</EventKey> 
 <Source><xsl:value-of select="originator"/></Source>
 <Destination>HRMS</Destination>
 <BusOperationId>425</BusOperationId>
</Context>
</xsl:for-each> <!-- ExternalAssignProposalOwnerRequest -->

<xsl:for-each select="externalAssignProposalOwnerRequest">
<Context>
 <EventInitiator><xsl:value-of select="originator"/></EventInitiator>
 <EventKey>-1</EventKey> 
 <Source><xsl:value-of select="originator"/></Source>
 <Destination>HRMS</Destination>
 <BusOperationId>425</BusOperationId>
</Context>
</xsl:for-each> 

</xsl:for-each> <!-- Body -->
</xsl:for-each>

 </xsl:template>
</xsl:stylesheet>
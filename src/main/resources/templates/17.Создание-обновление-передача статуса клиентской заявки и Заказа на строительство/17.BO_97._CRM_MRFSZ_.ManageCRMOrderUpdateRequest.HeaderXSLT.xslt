<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<urn:Context xmlns:urn="ru:rt:crm:context">
<xsl:for-each select="Request">
 <EventInitiator>HRMS</EventInitiator>
 <EventKey>-1</EventKey> 
 <Source>HRMS</Source>
 <Destination>HRMS</Destination>
 <BusOperationId>531</BusOperationId>
</xsl:for-each>
</urn:Context>
</xsl:template>
</xsl:stylesheet>
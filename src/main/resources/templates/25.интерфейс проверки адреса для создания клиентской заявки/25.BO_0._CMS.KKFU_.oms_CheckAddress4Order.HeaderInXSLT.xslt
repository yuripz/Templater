<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 <xsl:template match="/">
 <xsl:for-each select="Envelope">
  <xsl:for-each select="Body">
  <xsl:for-each select="CheckAddress4OrderRequest">
<Context>
 <EventInitiator>CMS.KKFU</EventInitiator>
 <EventKey>-1</EventKey> 
 <Source>CMS.KKFU</Source>
 <Destination>HRMS</Destination>
 <BusOperationId>321</BusOperationId>
</Context>
</xsl:for-each> <!-- CheckAddress4OrderRequest -->

  <xsl:for-each select="GetDate4OrderRequest">
<Context>
 <EventInitiator>CMS.KKFU</EventInitiator>
 <EventKey>-1</EventKey> 
 <Source>CMS.KKFU</Source>
 <Destination>HRMS</Destination>
 <BusOperationId>323</BusOperationId>
</Context>
</xsl:for-each> <!-- GetDate4OrderRequest -->


  <xsl:for-each select="GetCurrDate4OrderRequest">
<Context>
 <EventInitiator>CMS.KKFU</EventInitiator>
 <EventKey>-1</EventKey> 
 <Source>CMS.KKFU</Source>
 <Destination>HRMS</Destination>
 <BusOperationId>325</BusOperationId>
</Context>
</xsl:for-each> <!-- GetDate4OrderRequest -->

  <xsl:for-each select="RestDate4OrderRequest">
<Context>
 <EventInitiator>CMS.KKFU</EventInitiator>
 <EventKey>-1</EventKey> 
 <Source>CMS.KKFU</Source>
 <Destination>HRMS</Destination>
 <BusOperationId>329</BusOperationId>
</Context>
</xsl:for-each> <!-- RestDate4OrderRequest -->


</xsl:for-each> <!-- Body -->
</xsl:for-each>

 </xsl:template>
</xsl:stylesheet>
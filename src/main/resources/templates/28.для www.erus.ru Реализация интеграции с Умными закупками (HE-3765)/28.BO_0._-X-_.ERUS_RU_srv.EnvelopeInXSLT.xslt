<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
<Envelope>
   <Header>
      <Context>
         <EventInitiator>ERUS.RU</EventInitiator>
         <EventKey>-1</EventKey>
         <Source>ERUS.RU</Source>
         <Destination>HRMS</Destination>
         <BusOperationId>282</BusOperationId>
      </Context>
   </Header>
   <Body>
   <PutResultXmRequest>
	<xsl:copy-of select="Envelope/Body"/>
   </PutResultXmRequest>
  </Body>   
</Envelope>
	</xsl:template>
</xsl:stylesheet>
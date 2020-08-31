<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
<Envelope>
   <Header>
      <Context>
         <EventInitiator>GET.HRMS</EventInitiator>
         <EventKey>-1</EventKey>
         <Source>GET.HRMS</Source>
         <Destination>HRMS</Destination>
         <BusOperationId>511</BusOperationId>
      </Context>
   </Header>
   <Body>
   <HTTP_Get_IN>
	<xsl:copy-of select="Envelope/Body"/>
   </HTTP_Get_IN>
  </Body>   
</Envelope>
	</xsl:template>
</xsl:stylesheet>
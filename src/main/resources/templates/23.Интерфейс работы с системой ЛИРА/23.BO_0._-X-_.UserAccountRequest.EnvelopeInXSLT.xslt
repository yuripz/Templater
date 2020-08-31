<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
<Envelope>
   <Header>
      <Context>
         <EventInitiator>URAL.LIRA</EventInitiator>
         <EventKey>-1</EventKey>
         <Source>URAL.LIRA.OMS</Source>
         <Destination>HRMS</Destination>
         <BusOperationId>342</BusOperationId>
      </Context>
   </Header>
   <Body>
   <OrderItemCompleteNotification>
	<xsl:copy-of select="Envelope/Body/DATA"/>
 </OrderItemCompleteNotification>
  </Body>
   
</Envelope>
	</xsl:template>
</xsl:stylesheet>
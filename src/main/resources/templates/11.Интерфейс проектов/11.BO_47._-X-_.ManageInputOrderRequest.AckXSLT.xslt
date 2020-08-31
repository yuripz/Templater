<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 <xsl:template match="/">
  <xsl:for-each select="ConfirmManageInputOrderRequest">
  <xsl:for-each select="InputOrderConfirmation">
   <Confirmation>
     <ResultCode><xsl:value-of select="ResultCode"/></ResultCode>
     <Message><xsl:value-of select="Message"/></Message>
     <xsl:for-each select="InputOrderDetailList">
       <DetailList>
       <xsl:for-each select="InputOrderDetail">
          <Detail>
             <SourceOrderId><xsl:value-of select="SourceOrderId"/></SourceOrderId>
             <DestinationOrderId><xsl:value-of select="DestinationOrderId"/></DestinationOrderId>
             <ResultCode><xsl:value-of select="ResultCode"/></ResultCode>
             <Message><xsl:value-of select="Message"/></Message>
          </Detail>
     </xsl:for-each>
       </DetailList>
     </xsl:for-each>
     <Next>RESOUT</Next>   
    </Confirmation>
  </xsl:for-each>
  </xsl:for-each>
 </xsl:template>
</xsl:stylesheet>
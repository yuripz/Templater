<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 <xsl:template match="/">
<tns:Fault xmlns:tns="http://oms.rt.ru/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <ResultCode>-20202</ResultCode>
  <Message>submitOrderRequest не содержит тег 'originator' , в котором прописан код вызывающей системы ( Лира , ККФУ, etc ) </Message>

</tns:Fault>

 </xsl:template>
</xsl:stylesheet>
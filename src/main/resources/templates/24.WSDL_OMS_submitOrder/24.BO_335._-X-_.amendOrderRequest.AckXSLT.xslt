<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 <xsl:template match="/">
 <xsl:if test="Confirmation!=''">
 

  <xsl:for-each select="Confirmation">
  <xsl:for-each select="submitOrderResponse">
<tns:submitOrderResponse  xmlns:tns="http://oms.rt.ru/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
<!--<xsl:copy-of select="../../Confirmation"/> -->
  <originator>HRMS</originator>
  <receiver><xsl:value-of select="receiver"/></receiver>

   <orderResult>
    <orderResultCode><xsl:value-of select="order/OrderResult/orderResultCode"/></orderResultCode>
    <orderResultText><xsl:value-of select="order/OrderResult/orderResultText"/></orderResultText>

   </orderResult>

        <xsl:if test="requestId!=''">
		<requestId><xsl:value-of select="requestId"/></requestId>
        </xsl:if>
        <xsl:if test="requestId=''">
		<requestId>0-0-0-0</requestId>
        </xsl:if>

  <xsl:for-each select="order">
  <order>
  <acknowledgement>
   <orderId><xsl:value-of select="orderId"/></orderId>
   <orderOMSId><xsl:value-of select="orderOMSId"/></orderOMSId>
<!--        <xsl:if test="orderOMSurl!=''">
		<orderOMSurl><xsl:value-of select="orderOMSurl"/></orderOMSurl>
        </xsl:if>
        <xsl:if test="orderOMSur=''">-->
		<orderOMSurl>https://hermes-test.rt.ru/aggregator/<xsl:value-of select="orderOMSId"/></orderOMSurl>
<!--        </xsl:if>-->
<xsl:if test="acknowledgement/orderStartDate!=''">
        			<orderStartDate><xsl:value-of select="acknowledgement/orderStartDate"/></orderStartDate>
  </xsl:if>      	
  <xsl:if test="acknowledgement/orderExpectedCompletionDate!=''">		
			<orderExpectedCompletionDate><xsl:value-of select="acknowledgement/orderExpectedCompletionDate"/></orderExpectedCompletionDate>
 </xsl:if>     		
    <orderState><xsl:value-of select="OrderResult/orderState"/></orderState>
</acknowledgement>
  </order>
</xsl:for-each> <!-- order -->
</tns:submitOrderResponse>
</xsl:for-each> <!-- submitOrderResponse -->
</xsl:for-each>
  <xsl:for-each select="Fault">
<urn1:Fault xmlns:urn1="urn:ru:rt:hrms:fault">
   <ResultCode><xsl:value-of select="ResultCode"/></ResultCode> 
   <Message><xsl:value-of select="Message"/></Message> 
</urn1:Fault>
  </xsl:for-each>
 </xsl:if> 
 <xsl:if test="Confirmation=''">
 <urn1:Fault xmlns:urn1="urn:ru:rt:hrms:fault">
   <ResultCode><xsl:value-of select="ResultCode"/></ResultCode> 
   <Message><xsl:value-of select="Message"/></Message> 
</urn1:Fault>
 </xsl:if> 
 </xsl:template>
</xsl:stylesheet>
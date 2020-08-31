<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ws="http://oms.rt.ru/">
 <xsl:template match="/">
  <xsl:for-each select="Confirmation">
  <xsl:for-each select="queryOrderResponse">
<ws:queryOrderResponse>
	<originator><xsl:value-of select="originator"/></originator>
	<receiver><xsl:value-of select="receiver"/></receiver>
	<orderResult>
	<orderResultCode><xsl:value-of select="orderResult/orderResultCode"/></orderResultCode>
	<orderResultText><xsl:value-of select="orderResult/orderResulText"/></orderResultText>
	</orderResult>
	<requestId><xsl:value-of select="requestId"/></requestId>
	<xsl:if test="/Confirmation/ResultCode!='0'">
		<order>
		<orderId>0</orderId>
		<orderOMSId>0</orderOMSId>
		<orderState>REJECTED</orderState>
		</order>
	</xsl:if>
	<xsl:if test="/Confirmation/ResultCode='0'">	
	<order>
		<orderId><xsl:value-of select="order/orderId"/></orderId>
		<orderOMSId><xsl:value-of select="order/orderOMSId"/></orderOMSId>
		<orderState><xsl:value-of select="order/orderState"/></orderState>
   <orderParties>
    <orderParty>
     <partyRole>KP</partyRole>
     <partyId><xsl:value-of select="order/orderParties/orderParty/partyId"/></partyId>
     <partyAttributes>
     <attribute name="Project"><xsl:value-of select="order/orderParties/orderParty/Project"/></attribute>
     <attribute name="PONR"><xsl:value-of select="order/orderParties/orderParty/PONR"/></attribute>
     </partyAttributes>
    </orderParty>
   </orderParties>
		
		<orderItems>
			<orderItem>
				<orderItemId><xsl:value-of select="order/orderItems/orderItem/orderItemId"/></orderItemId>
				<orderItemInstanceId></orderItemInstanceId>
				<orderItemAttributes>
					<attribute name="ReservationNumber"><xsl:value-of select="order/orderItems/orderItem/orderItemAttributes/ReservationNumber"/></attribute>
					<attribute name="ListNumber"><xsl:value-of select="order/orderItems/orderItem/orderItemAttributes/ListNumber"/></attribute>
					<attribute name="externalServiceId"><xsl:value-of select="order/orderItems/orderItem/orderItemAttributes/externalServiceId"/></attribute>
					<attribute name="reservationId"><xsl:value-of select="order/orderItems/orderItem/orderItemAttributes/reservationId"/></attribute>
					<attribute name="serviceItemId"><xsl:value-of select="order/orderItems/orderItem/orderItemAttributes/serviceItemId"/></attribute>
					<attribute name="ldn"><xsl:value-of select="order/orderItems/orderItem/orderItemAttributes/ldn"/></attribute>
				</orderItemAttributes>
				<orderItemResult>
					<orderItemResultCode><xsl:value-of select="order/orderItems/orderItem/orderItemResult/orderItemResultCode"/></orderItemResultCode>
					<orderItemResultText><xsl:value-of select="order/orderItems/orderItem/orderItemResult/orderItemResultText"/></orderItemResultText>
				</orderItemResult>
			</orderItem>
		</orderItems>
	</order>
	</xsl:if>
</ws:queryOrderResponse>
  </xsl:for-each>
  </xsl:for-each>
  <xsl:for-each select="Fault">
<urn1:Fault xmlns:urn1="urn:ru:rt:hrms:fault">
   <ResultCode><xsl:value-of select="ResultCode"/></ResultCode> 
   <ResultMessage><xsl:value-of select="ResultMessage"/></ResultMessage> 
</urn1:Fault>
  </xsl:for-each>
 </xsl:template>
</xsl:stylesheet>
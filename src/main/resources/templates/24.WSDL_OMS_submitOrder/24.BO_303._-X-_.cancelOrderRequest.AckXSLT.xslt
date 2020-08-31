<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<xsl:for-each select="Confirmation">
			<xsl:for-each select="cancelOrderResponse">
				<tns:cancelOrderResponse xmlns:tns="http://oms.rt.ru/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
					<originator>HRMS</originator>
					<receiver><xsl:value-of select="/Confirmation/cancelOrderResponse/receiver"/></receiver>
					<xsl:for-each select="OrderResult">
						<orderResult>
							<orderResultCode>
								<xsl:value-of select="orderResultCode"/>
							</orderResultCode>
							<orderResultText>
								<xsl:value-of select="orderResultText"/>
							</orderResultText>
						</orderResult>
					</xsl:for-each>
					<!-- OrderResult -->
					<requestId><xsl:value-of select="/Confirmation/cancelOrderResponse/requestId"/></requestId>
					<xsl:for-each select="order">
						<order>
							<orderId>
								<xsl:value-of select="orderId"/>
							</orderId>
							<orderOMSId>
								<xsl:value-of select="orderOMSId"/>
							</orderOMSId>
							<orderState>
								<xsl:value-of select="orderState"/>
							</orderState>
							<orderStartDate>
								<xsl:value-of select="orderStartDate"/>
							</orderStartDate>
						</order>
					</xsl:for-each>
					<!-- order -->
				</tns:cancelOrderResponse>
			</xsl:for-each>
			<!-- submitOrderResponse -->
		</xsl:for-each>
		<xsl:for-each select="Fault">
			<urn1:Fault xmlns:urn1="urn:ru:rt:hrms:fault">
				<ResultCode>
					<xsl:value-of select="ResultCode"/>
				</ResultCode>
				<Message>
					<xsl:value-of select="Message"/>
				</Message>
			</urn1:Fault>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
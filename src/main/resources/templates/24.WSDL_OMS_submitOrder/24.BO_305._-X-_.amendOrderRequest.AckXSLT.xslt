<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<xsl:if test="Confirmation!=''">
			<xsl:for-each select="Confirmation">
				<xsl:for-each select="amendOrderResponse">
					<tns:amendOrderResponse xmlns:tns="http://oms.rt.ru/">
						<originator>HRMS</originator>
						<receiver>
							<xsl:value-of select="receiver"/>
						</receiver>
						<orderResult>
							<orderResultCode>
								<xsl:value-of select="order/OrderResult/orderResultCode"/>
							</orderResultCode>
							<orderResultText>
								<xsl:value-of select="order/OrderResult/orderResultText"/>
							</orderResultText>
						</orderResult>
						<requestId>
							<xsl:value-of select="/Confirmation/amendOrderResponse/requestId"/>
						</requestId>
						<xsl:for-each select="order">
							<order>
								<orderId>
									<xsl:value-of select="orderId"/>
								</orderId>
								<orderOMSId>
									<xsl:value-of select="orderOMSId"/>
								</orderOMSId>
									<xsl:choose>
										<xsl:when test="/Confirmation/ResultCode='0'">
											<orderState>AMENDING</orderState>
										</xsl:when>
										<xsl:otherwise>
											<orderState>REJECTED</orderState>
										</xsl:otherwise>
									</xsl:choose><!-- -->
							</order>
						</xsl:for-each>
						<!-- order -->
					</tns:amendOrderResponse>
				</xsl:for-each>
				<!-- submitOrderResponse -->
			</xsl:for-each>
			<xsl:for-each select="Fault">
				<tns:Fault xmlns:tns="http://oms.rt.ru/">
					<ResultCode>
						<xsl:value-of select="ResultCode"/>
					</ResultCode>
					<Message>
						<xsl:value-of select="Message"/>
					</Message>
				</tns:Fault>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="Confirmation=''">
			<tns:Fault xmlns:tns="http://oms.rt.ru/">
				<ResultCode>
					<xsl:value-of select="ResultCode"/>
				</ResultCode>
				<Message>
					<xsl:value-of select="Message"/>
				</Message>
			</tns:Fault>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
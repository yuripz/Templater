<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<xsl:if test="Confirmation!=''">
			<xsl:for-each select="Confirmation">
				<xsl:for-each select="submitOrderResponse">
					<tns:submitOrderResponse xmlns:tns="http://oms.rt.ru/">
						<!--<xsl:copy-of select="../../Confirmation"/> -->
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
						<xsl:if test="requestId!=''">
							<requestId>
								<xsl:value-of select="requestId"/>
							</requestId>
						</xsl:if>
						<xsl:if test="requestId=''">
							<requestId>0-0-0-0</requestId>
						</xsl:if>
						<xsl:for-each select="order">
							<order>
								<acknowledgement>
									<orderId>
										<xsl:value-of select="orderId"/>
									</orderId>
									<orderOMSId>
										<xsl:value-of select="orderOMSId"/>
									</orderOMSId>
									<xsl:if test="acknowledgement/orderStartDate!=''">
										<orderStartDate>
											<xsl:value-of select="acknowledgement/orderStartDate"/>
										</orderStartDate>
									</xsl:if>
									<xsl:if test="acknowledgement/orderExpectedCompletionDate!=''">
										<orderExpectedCompletionDate>
											<xsl:value-of select="acknowledgement/orderExpectedCompletionDate"/>
										</orderExpectedCompletionDate>
									</xsl:if>
									<xsl:choose>
										<xsl:when test="/Confirmation/submitOrderResponse/orderResult/orderResultCode='0'">
											<orderState>ACKNOWLEDGED</orderState>
										</xsl:when>
										<xsl:otherwise>
											<orderState>REJECTED</orderState>
										</xsl:otherwise>
									</xsl:choose>
								</acknowledgement>
							</order>
						</xsl:for-each>
						<!-- order -->
					</tns:submitOrderResponse>
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
		<xsl:if test="Result!=''">
					<tns:Fault xmlns:tns="http://oms.rt.ru/">
				<ResultCode>-10203</ResultCode>
				<Message>возврат из прикладного обработчика был произведен ранее, чем был сформирован ответ. Сбой синхронизации потоков
				</Message>
			</tns:Fault>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
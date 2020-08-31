<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<xsl:for-each select="Confirmation">
			<xsl:choose>
				<xsl:when test="ResultCode!=60606">
					<tns:ProjectCompleteNotificationResponse xmlns:tns="http://nri.rt.ru/NotificationSuccessResponse">
						<xsl:for-each select="ProjectCompleteNotificationResponse">
							<originator>
								<xsl:value-of select="originator"/>
							</originator>
							<receiver>
								<xsl:value-of select="receiver"/>
							</receiver>
							<orderResult>
								<orderResultCode>
									<xsl:value-of select="orderResult/orderResultCode"/>
								</orderResultCode>
								<orderResultText>
									<xsl:value-of select="orderResult/orderResulText"/>
								</orderResultText>
							</orderResult>
						</xsl:for-each>
					</tns:ProjectCompleteNotificationResponse>
				</xsl:when>
				<xsl:when test="ResultCode=60606">
					<oms:Fault xmlns:oms="http://oms.rt.ru/">
						<ResultCode>
							<xsl:value-of select="ResultCode"/>
						</ResultCode>
						<Message>
							<xsl:value-of select="Message"/>
						</Message>
					</oms:Fault>
				</xsl:when>
				<xsl:otherwise>
					<oms:Fault xmlns:oms="http://oms.rt.ru/">
						<ResultCode>
							<xsl:value-of select="ResultCode"/>
						</ResultCode>
						<Message>
							<xsl:value-of select="Message"/>
						</Message>
					</oms:Fault>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		<xsl:for-each select="Fault">
			<oms:Fault xmlns:oms="http://oms.rt.ru/">
				<Result>
					<Cod>160606</Cod>
					<Text>AckXSLT: <xsl:value-of select="faultstring"/>
					</Text>
					<Next>ERRIN</Next>
				</Result>
			</oms:Fault>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
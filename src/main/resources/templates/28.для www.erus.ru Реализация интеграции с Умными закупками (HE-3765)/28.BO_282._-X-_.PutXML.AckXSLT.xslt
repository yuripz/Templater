<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<tns:AcceptResponse xmlns:tns="urn:ru:rt:hrms:successresponse">
			<xsl:if test="Confirmation!=''">
				<xsl:for-each select="Confirmation">
					<xsl:for-each select="SuccessResponse">
						<ResultCode>
							<xsl:value-of select="/Confirmation/ResultCode"/>
						</ResultCode>
						<Message>
							<xsl:value-of select="/Confirmation/Message"/>
						</Message>
						<PutXmlResult>
							<ResultCode>
								<xsl:value-of select="/Confirmation/SuccessResponse/PutXmlResult/ResultCode"/>
							</ResultCode>
							<ArrayOfString>
								<String>
									<xsl:value-of select="/Confirmation/Message"/>
								</String>
							</ArrayOfString>
							<xsl:if test="PutXmlResult/HermesOrderNum!=''"><HermesOrderNum>
								<xsl:value-of select="PutXmlResult/HermesOrderNum"/>
							</HermesOrderNum></xsl:if>
							<xsl:if test="PutXmlResult/ResultUrl!=''"><ResultUrl>
								<xsl:value-of select="PutXmlResult/ResultUrl"/>
							</ResultUrl></xsl:if>
						</PutXmlResult>
					</xsl:for-each><!-- SuccessResponse -->
				</xsl:for-each>
				<xsl:for-each select="Fault">
					<tns:Fault xmlns:tns="urn:ru:rt:hrms:faul/">
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
				<tns:Fault xmlns:tns="urn:ru:rt:hrms:faul">
					<ResultCode>6006
					</ResultCode>
					<Message>Вызов прикладного обработчика завершен с внутренной технической ошибкой ( свяжитесь со службой технической поддержки )
					</Message>
				</tns:Fault>
			</xsl:if>
		</tns:AcceptResponse>
	</xsl:template>
</xsl:stylesheet>
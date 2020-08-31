<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<xsl:for-each select="Confirmation">
		<Confirmation>
			<ResultCode>
				<xsl:value-of select="ResultCode"/>
			</ResultCode>
			<Message>
				<xsl:value-of select="Message"/>
			</Message>
			<xsl:for-each select="DetailList">
				<DetailList>
					<xsl:for-each select="Detail">
						<Detail>
							<SYSOrderNum>
								<xsl:value-of select="SUSOrderNum"/>
							</SYSOrderNum>
							<LTC>
								<xsl:value-of select="SUSLtcName"/>
							</LTC>
							<SYSOrderURL/>
							<SYSProjectURL/>
						</Detail>
					</xsl:for-each>
					<!-- order -->
				</DetailList>
			</xsl:for-each>
			<!-- DetailList -->
					</Confirmation>
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
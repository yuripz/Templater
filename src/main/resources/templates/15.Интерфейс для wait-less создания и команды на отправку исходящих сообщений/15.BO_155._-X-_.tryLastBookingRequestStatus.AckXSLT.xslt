<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<xsl:for-each select="Confirmation">
			<Response>
				<ResultCode>
					<xsl:value-of select="ResultCode"/>
				</ResultCode>
				<ResultMessage>
					<xsl:value-of select="Message"/>
				</ResultMessage>
				<PayLoad>
					<Queue_ID>
						<xsl:value-of select="PayLoad/AppResponse"/>
					</Queue_ID>
					<Queue_Direction>
						<xsl:value-of select="PayLoad/Queue_Direction"/>
					</Queue_Direction>
					<Msg_Date>
						<xsl:value-of select="PayLoad/Msg_Date"/>
					</Msg_Date>
					<Msg_Reason>
						<xsl:value-of select="PayLoad/Msg_Reason"/>
					</Msg_Reason>
					<Msg_Result>
						<xsl:value-of select="PayLoad/Msg_Result"/>
					</Msg_Result>
				</PayLoad>
			</Response>
		</xsl:for-each>
		<xsl:for-each select="Fault">
			<Fault>
				<ResultCode>
					<xsl:value-of select="ResultCode"/>
				</ResultCode>
				<ResultMessage>
					<xsl:value-of select="Message"/>
				</ResultMessage>
			</Fault>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>

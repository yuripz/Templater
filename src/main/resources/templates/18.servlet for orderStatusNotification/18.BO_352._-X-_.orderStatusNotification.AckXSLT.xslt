<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<xsl:if test="Confirmation!=''">
			<xsl:for-each select="Confirmation">
				<tns:orderStatusResponse xmlns:tns="http://oms.rt.ru/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
					<originator>HRMS</originator>
					<receiver>
						<xsl:value-of select="receiver"/>
					</receiver>
					<result>
						<resultCode>
							<xsl:value-of select="ResultCode"/>
						</resultCode>
						<resultText>
							<xsl:value-of select="Message"/>
						</resultText>
					</result>
				</tns:orderStatusResponse>
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

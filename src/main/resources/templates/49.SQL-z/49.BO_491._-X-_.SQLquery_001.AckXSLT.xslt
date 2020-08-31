<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<xsl:for-each select="Confirmation">
			<xsl:choose>
				<xsl:when test="ResultCode=0">
      <SuccessResponse type="json">
         <SuccessResponse>0</SuccessResponse>
          <Message>ВСЁ ХОРОШО</Message>
          <xsl:for-each select="DetailList">
          <xsl:copy-of select="../DetailList"/>
          </xsl:for-each>
      </SuccessResponse>
				</xsl:when>
				<xsl:when test="ResultCode=60606">
<tns:Fault xsi:schemaLocation="urn:ru:rt:hrms:fault Fault.xsd" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:tns="urn:ru:rt:hrms:fault">
	<ResultCode>60606</ResultCode>
	<Message><xsl:value-of select="Message"/></Message>
</tns:Fault>
				</xsl:when>
				<xsl:otherwise>
					<tns:Fault xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:tns="urn:ru:rt:crm:fault">
						<ResultCode>60606</ResultCode>
						<Message>Ошибка во входных данных</Message>
					</tns:Fault>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		<xsl:for-each select="Fault">
			<tns:Fault xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:tns="urn:ru:rt:crm:fault">
				<Result>
					<Cod>160606</Cod>
					<Text>AckXSLT: <xsl:value-of select="faultstring"/>
					</Text>
					<Next>ERRIN</Next>
				</Result>
			</tns:Fault>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
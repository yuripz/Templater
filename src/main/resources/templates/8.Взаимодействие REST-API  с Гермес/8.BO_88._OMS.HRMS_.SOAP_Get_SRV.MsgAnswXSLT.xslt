<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<xsl:for-each select="SuccessResponse">
			<xsl:if test="SuccessResponse=0">
				<Confirmation>
					<ResultCode>0</ResultCode>
					<Message>Ответ HermesSOAPService/GetHttpRequest в массиве</Message>
					<DetailList>
						<xsl:copy-of select="."/>
						<Result>
							<Cod>0</Cod>
							<Text>Success</Text>
							<NextNext>OUT</NextNext>
						</Result>
					</DetailList>
				<Next>RESOUT</Next>	
				</Confirmation>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="Fault">
			<xsl:choose>
				<xsl:when test="ResultCode > 0">
					<Result>
						<Cod>
							<xsl:value-of select="ResultCode"/>
						</Cod>
						<Text>Resporse Message: 
							<xsl:value-of select="Message"/>
						</Text>
						<Next>ERROUT</Next>
					</Result>
				</xsl:when>
				<xsl:otherwise>
					<Result>
						<Cod>6666</Cod>
						<Text>
							<xsl:copy-of select="/Fault"/>
						</Text>
						<Next>ERROUT</Next>
					</Result>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<xsl:for-each select="SaveGeoObjectResponse">
			<Confirmation>
				<ResultCode>
					<xsl:value-of select="ResponseCode"/>
				</ResultCode>
				<Message>
					<xsl:value-of select="ResponseMessage"/> CreatedObjectGlobalID=<xsl:value-of select="CreatedObjectGlobalID"/>
				</Message>
				<DetailList>
					<Detail>
						<ResponseCode><xsl:value-of select="ResponseCode"/>
						</ResponseCode>
						<CreatedObjectGlobalID><xsl:value-of select="CreatedObjectGlobalID"/>
						</CreatedObjectGlobalID>
					</Detail>
				</DetailList>
				<Next>RESOUT</Next>
			</Confirmation>
		</xsl:for-each>
		<xsl:for-each select="Fault">
			<xsl:choose>
				<xsl:when test="faultcode > 0">
					<Result>
						<Cod>
							<xsl:value-of select="faultcode"/>
						</Cod>
						<Text>
							<xsl:value-of select="faultstring"/>
						</Text>
						<Next>ERROUT</Next>
					</Result>
				</xsl:when>
				<xsl:otherwise>
					<Result>
						<Cod>66066</Cod>
						<Text>
							<!--<xsl:copy-of select="/Fault"/>-->
							<xsl:text disable-output-escaping="yes">&lt;![CDATA[</xsl:text>
							<xsl:copy-of select="/Fault"/>
							<xsl:text disable-output-escaping="yes">]]&gt;</xsl:text>
						</Text>
						<Next>ERROUT</Next>
					</Result>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
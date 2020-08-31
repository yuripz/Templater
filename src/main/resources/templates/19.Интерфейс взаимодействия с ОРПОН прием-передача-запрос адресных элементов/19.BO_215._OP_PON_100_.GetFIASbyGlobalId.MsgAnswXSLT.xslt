<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<xsl:for-each select="Response">
			<Confirmation>
				<ResultCode>0</ResultCode>
				<Message><xsl:value-of select="fiasId"/></Message>
				<Next>RESOUT</Next>
			</Confirmation>
		</xsl:for-each>
		<xsl:for-each select="Fault">
			<xsl:choose>
				<xsl:when test="ResultCode > 0">
					<Result>
						<Cod>
							<xsl:value-of select="faultcode"/>
						</Cod>
						<Text>
							<xsl:text disable-output-escaping="yes">&lt;![CDATA[</xsl:text>
							<xsl:copy-of select="/Fault"/>
							<xsl:text disable-output-escaping="yes">]]&gt;</xsl:text>
						</Text>
						<Next>ERROUT</Next>
					</Result>
				</xsl:when>
				<xsl:otherwise>
					<Result>
						<Cod>6666</Cod>
						<Text>
							<xsl:text disable-output-escaping="yes">&lt;![CDATA[</xsl:text>
							<xsl:copy-of select="/Fault"/>
							<xsl:text disable-output-escaping="yes">]]&gt;</xsl:text>
						</Text>
						<Next>ATTOUT</Next>
					</Result>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
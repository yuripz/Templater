<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<xsl:for-each select="DOACTIONResponse">
			<xsl:choose>
				<xsl:when test="DOACTIONReturn='Success'">
					<Result>
						<Cod>0</Cod>
						<Text>Success</Text>
						<Next>DELOUT</Next>
					</Result>
				</xsl:when>
				<xsl:otherwise>
					<Result>
						<Cod>6666</Cod>
						<Text>
							<xsl:copy-of select="concat(/Fault/faultcode, ' ( ', /Fault/faultstring, ' ) ' )"/>
						</Text>
						<Next>ATTOUT</Next>
					</Result>
				</xsl:otherwise>
			</xsl:choose>
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
						<Cod>6666</Cod>
						<Text>
							<xsl:copy-of select="concat(/Fault/faultcode, ' ( ', /Fault/faultstring, ' ) ' )"/>
						</Text>
						<Next>ATTOUT</Next>
					</Result>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
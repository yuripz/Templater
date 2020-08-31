<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:variable name="outermostElementName" select="name(/*)"/>
	<xsl:template match="/">
		<xsl:choose>
			<xsl:when test="PutXmlResponse/PutXmlResult!=''">
				<Confirmation>
					<xsl:choose>
						<xsl:when test="/PutXmlResponse/PutXmlResult/Status!='Fail'">
							<ResultCode>0</ResultCode>
						</xsl:when>
						<xsl:otherwise>
							<ResultCode>60606</ResultCode>
						</xsl:otherwise>
					</xsl:choose>
					<Message>
						<xsl:value-of select="/PutXmlResponse/PutXmlResult/Messages/string[1]"/>
					</Message>
					<DetailList>
						<xsl:copy-of select="/PutXmlResponse/PutXmlResult"/>
					</DetailList>
				<Next>RESOUT</Next>
				</Confirmation>
			</xsl:when>
			<xsl:when test="Fault!=''">
				<Result>
					<Cod>
						<xsl:value-of select="ResultCode"/>
					</Cod>
					<Text>
						<xsl:value-of select="Message"/>
					</Text>
					<Next>ERROUT</Next>
				</Result>
			</xsl:when>
			<!-- </xsl:for-each> -->
			<!--  orderResult -->
			<xsl:otherwise>
				<Result>
					<Cod>6666</Cod>
					<Text>
						<xsl:value-of select="$outermostElementName"/>
					</Text>
					<Confirmation>
						<!--<xsl:copy-of select="@outermostElementName"/>-->
						<xsl:copy-of select="/*"/>
					</Confirmation>
					<Next>ERROUT</Next>
				</Result>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
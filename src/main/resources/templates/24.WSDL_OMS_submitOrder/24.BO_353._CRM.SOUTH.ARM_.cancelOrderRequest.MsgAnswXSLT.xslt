<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<xsl:choose>
			<xsl:when test="cancelOrderResponse!=''">
				<Confirmation>
					<ResultCode>
						<xsl:value-of select="/cancelOrderResponse/orderResult/orderResultCode"/>
					</ResultCode>
					<Message>
						<xsl:value-of select="/cancelOrderResponse/orderResult//orderResultText"/>
					</Message>
					<DetailList>
						<xsl:copy-of select="cancelOrderResponse"/>
					</DetailList>
					<Next>RESOUT</Next>
				</Confirmation>
			</xsl:when>
			<xsl:when test="Fault!=''">
				<xsl:for-each select="Fault">
					<xsl:choose>
						<xsl:when test="ResultCode > 0">
						<Confirmation>
								<ResultCode>
									<xsl:value-of select="ResultCode"/>
								</ResultCode>
								<Message>
<xsl:text disable-output-escaping="yes">&lt;![CDATA[</xsl:text><xsl:copy-of select="/Fault"/>
<xsl:text disable-output-escaping="yes">]]&gt;</xsl:text>
								</Message>
								<DetailList>
						<xsl:copy-of select="/Fault"/>
					        </DetailList>
								<Next>RESOUT</Next>
							</Confirmation>
						</xsl:when>
						<xsl:otherwise>
							<Confirmation>
								<ResultCode>66066</ResultCode>
								<Message>
<xsl:text disable-output-escaping="yes">&lt;![CDATA[</xsl:text><xsl:copy-of select="/Fault"/>
<xsl:text disable-output-escaping="yes">]]&gt;</xsl:text>
								</Message>
								<DetailList>
						<xsl:copy-of select="/Fault"/>
					        </DetailList>
								<Next>RESOUT</Next>
							</Confirmation>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</xsl:when>
			<xsl:otherwise>
							<Confirmation>
								<ResultCode>60006</ResultCode>
								<Message>неизвестный корневой тег, см.DetailList</Message>
								<DetailList>
						<xsl:copy-of select="/*"/>
					        </DetailList>
								<Next>RESOUT</Next>
							</Confirmation>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
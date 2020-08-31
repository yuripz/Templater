<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<ws:LocalIDByGlobalIDData xmlns:ws="http://www.informatica.com/dis/ws/ws_">
			<xsl:for-each select="LocalIDByGlobalIDData">
				<xsl:for-each select="LocalIDByGlobalIDGroupIn">
					<ws:LocalIDByGlobalIDGroupIn>
						<ws:AddressElementLevel>
							<xsl:value-of select="AddressElementLevel"/>
						</ws:AddressElementLevel>
						<ws:GlobalID>
							<xsl:value-of select="GlobalID"/>
						</ws:GlobalID>
						<ws:TargetSystemCode>
							<xsl:value-of select="TargetSystemCode"/>
						</ws:TargetSystemCode>
					</ws:LocalIDByGlobalIDGroupIn>
				</xsl:for-each>
			</xsl:for-each>
			<!--ws:LocalIDByGlobalIDData-->
		</ws:LocalIDByGlobalIDData>
	</xsl:template>
</xsl:stylesheet>
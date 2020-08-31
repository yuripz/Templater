<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<ws:AddressElementLocalIDData xmlns:ws="http://www.informatica.com/dis/ws/ws_">
			<!-- для получения ГИД by ЛИД -->
			<xsl:for-each select="AddressElementLocalIDData">
				<xsl:for-each select="AddressElementLocalIDGroup">
					<ws:AddressElementLocalIDGroup>
						<ws:LocalID>
							<xsl:value-of select="LocalID"/>
						</ws:LocalID>
						<ws:AddrElementLevel>
							<xsl:value-of select="AddressElementLevel"/>
						</ws:AddrElementLevel>
						<ws:SystemCode>
							<xsl:value-of select="SystemCode"/>
						</ws:SystemCode>
					</ws:AddressElementLocalIDGroup>
				</xsl:for-each>
			</xsl:for-each>
			<!--ws:AddressElementLocalIDData -->
		</ws:AddressElementLocalIDData>
	</xsl:template>
</xsl:stylesheet>
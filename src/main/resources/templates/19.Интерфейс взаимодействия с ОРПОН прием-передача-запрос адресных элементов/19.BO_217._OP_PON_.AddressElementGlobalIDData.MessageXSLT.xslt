<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<ws:AddressElementGlobalIDData xmlns:ws="http://www.informatica.com/dis/ws/ws_">
			<xsl:for-each select="AddressElementGlobalIDData">
				<xsl:for-each select="AddrElementGlobalIDGroup">
					<ws:AddrElementGlobalIDGroup>
						<ws:GlobalID>
							<xsl:value-of select="GlobalID"/>
						</ws:GlobalID>
						<ws:AddressElementLevel>
							<xsl:value-of select="AddressElementLevel"/>
						</ws:AddressElementLevel>
						<ws:SystemCode>FE_Germes_AR</ws:SystemCode>
					</ws:AddrElementGlobalIDGroup>
				</xsl:for-each>
			</xsl:for-each>
			<!--ws:AddressElementGlobalIDData-->
		</ws:AddressElementGlobalIDData>
	</xsl:template>
</xsl:stylesheet>
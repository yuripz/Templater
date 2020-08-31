<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<ws:Request xmlns:ws="http://www.informatica.com/dis/ws/ws_">
			<xsl:for-each select="GetPropertyByAddressGlobalID">
				<AddressGlobalID>
					<xsl:value-of select="AddressGlobalID"/>
				</AddressGlobalID>
				<SystemCode>FE_Germes_AR</SystemCode>
			</xsl:for-each>
			<!--ws:Request -->
		</ws:Request>
	</xsl:template>
</xsl:stylesheet>
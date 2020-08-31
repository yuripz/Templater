<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<ws:Request xmlns:ws="http://orpon.rt.ru/GetFIASbyGlobalId/">
			<xsl:for-each select="Request">
						<globalId>
							<xsl:value-of select="GlobalID"/>
						</globalId>
						<level>
							<xsl:value-of select="AddressElementLevel"/>
						</level>
			</xsl:for-each>
			<!--ws:Request-->
		</ws:Request>
	</xsl:template>
</xsl:stylesheet>
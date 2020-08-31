<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<ws:ReverseGeocodeLocalityRequest xmlns:ws="http://www.informatica.com/dis/ws/ws_">
			<xsl:for-each select="ReverseGeocodeLocalityRequest">
				<ws:Latitude><xsl:value-of select="Latitude"/></ws:Latitude>
				<ws:Longtitude><xsl:value-of select="Longitude"/></ws:Longtitude>
				<ws:SystemCode>FE_Germes_AR</ws:SystemCode>
  			</xsl:for-each>
		</ws:ReverseGeocodeLocalityRequest>
	</xsl:template>
</xsl:stylesheet>
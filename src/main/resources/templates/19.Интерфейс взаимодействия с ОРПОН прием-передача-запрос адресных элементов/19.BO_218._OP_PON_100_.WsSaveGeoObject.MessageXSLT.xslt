<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<ws:saveGeoObject xmlns:ws="http://www.informatica.com/dis/ws/ws_">
			<xsl:for-each select="saveGeoObject">
				<SystemCode>FE_Germes_AR</SystemCode>
				<ParentGlobalID><xsl:value-of select="ParentGlobalID"/></ParentGlobalID>
				<Latitude><xsl:value-of select="Latitude"/></Latitude>
				<Longitude><xsl:value-of select="Longitude"/></Longitude>
				<LocationDescription><xsl:value-of select="LocationDescription"/></LocationDescription>
  			</xsl:for-each>
		</ws:saveGeoObject>
	</xsl:template>
</xsl:stylesheet>
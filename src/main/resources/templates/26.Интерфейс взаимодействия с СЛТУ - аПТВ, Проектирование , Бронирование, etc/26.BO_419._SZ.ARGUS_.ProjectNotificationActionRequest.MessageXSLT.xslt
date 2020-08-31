<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/" xmlns:proj="http://nri.rt.ru/NetworkCapability">
	<proj:projectStatusNotificationRequest>
	<xsl:for-each select="ProjectNotificationActionRequest">
		<originator>HERMES</originator>
		<receiver><xsl:value-of select="receiver"/></receiver>
		<proj:payload>
		<xsl:for-each select="payload">
			<proj:projectId><xsl:value-of select="projectId"/></proj:projectId>
        		<proj:projectState><xsl:value-of select="projectState"/></proj:projectState>
			<proj:expectedDate><xsl:value-of select="expectedDate"/></proj:expectedDate>
    </xsl:for-each> <!-- payload -->		
		</proj:payload>
    </xsl:for-each> <!-- ProjectStatusNotificationRequest-->		
	</proj:projectStatusNotificationRequest>
	</xsl:template>

</xsl:stylesheet>
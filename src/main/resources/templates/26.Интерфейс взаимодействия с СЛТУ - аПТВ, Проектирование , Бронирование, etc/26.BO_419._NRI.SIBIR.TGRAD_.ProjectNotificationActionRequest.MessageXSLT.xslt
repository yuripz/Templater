<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/" xmlns:proj="http://nri.rt.ru/ProjectProposalSevice">
	<proj:ProjectStatusNotificationRequest>
	<xsl:for-each select="ProjectNotificationActionRequest">
		<proj:originator>HERMES</proj:originator>
		<proj:receiver><xsl:value-of select="receiver"/></proj:receiver>
		<proj:payload>
		<xsl:for-each select="payload">
			<proj:projectId><xsl:value-of select="projectId"/></proj:projectId>
        		<proj:projectState><xsl:value-of select="projectState"/></proj:projectState>
			<proj:expectedDate><xsl:value-of select="expectedDate"/></proj:expectedDate>
    </xsl:for-each> <!-- payload -->		
		</proj:payload>
    </xsl:for-each> <!-- ProjectStatusNotificationRequest-->		
	</proj:ProjectStatusNotificationRequest>
	</xsl:template>

</xsl:stylesheet>
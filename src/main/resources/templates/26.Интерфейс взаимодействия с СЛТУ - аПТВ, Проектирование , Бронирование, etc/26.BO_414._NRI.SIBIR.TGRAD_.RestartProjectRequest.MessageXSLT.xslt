<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/" xmlns:proj="http://nri.rt.ru/ProjectProposalSevice">
	<proj:RestartProjectRequest>
	<xsl:for-each select="RestartProjectRequest">
		<proj:originator>HERMES</proj:originator>
		<proj:receiver><xsl:value-of select="receiver"/></proj:receiver>
		<proj:payload>
		<xsl:for-each select="payload">
			<proj:projectId><xsl:value-of select="projectId"/></proj:projectId>
            		<proj:dueDate><xsl:value-of select="dueDate"/></proj:dueDate>
            		<proj:restartReason><xsl:value-of select="restartReason"/></proj:restartReason>
    </xsl:for-each> <!-- payload -->		
		</proj:payload>
    </xsl:for-each> <!-- RestartProjectRequest-->		
	</proj:RestartProjectRequest>
	</xsl:template>

</xsl:stylesheet>
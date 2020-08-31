<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/" xmlns:proj="http://nri.rt.ru/NetworkCapability">

	<proj:assignProposalOwnerRequest>
	<xsl:for-each select="AssignProposalOwnerRequest">
		<originator>HERMES</originator>
		<receiver><xsl:value-of select="receiver"/></receiver>
		<proj:payload>
		<xsl:for-each select="payload">
			<proj:orderId><xsl:value-of select="orderId"/></proj:orderId>
            		<proj:personId><xsl:value-of select="personId"/></proj:personId>
    </xsl:for-each> <!-- payload -->		
		</proj:payload>
    </xsl:for-each> <!-- AssignProposalOwnerRequest-->		
	</proj:assignProposalOwnerRequest>
	</xsl:template>

</xsl:stylesheet>
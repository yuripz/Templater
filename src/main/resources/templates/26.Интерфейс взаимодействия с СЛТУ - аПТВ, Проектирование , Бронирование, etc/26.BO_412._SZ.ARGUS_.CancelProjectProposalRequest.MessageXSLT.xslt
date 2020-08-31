<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/" xmlns:proj="http://nri.rt.ru/NetworkCapability">

	<proj:cancelProjectProposalRequest>
	<xsl:for-each select="CancelProjectProposalRequest">
		<originator>HERMES</originator>
		<receiver><xsl:value-of select="receiver"/></receiver>
		<proj:payload>
		<xsl:for-each select="payload">
			<proj:orderId><xsl:value-of select="orderId"/></proj:orderId>
            		<proj:cancelReason><xsl:value-of select="cancelReason"/></proj:cancelReason>
    </xsl:for-each> <!-- payload -->		
		</proj:payload>
    </xsl:for-each> <!-- CancelProjectProposalRequest-->		
	</proj:cancelProjectProposalRequest>
	</xsl:template>

</xsl:stylesheet>
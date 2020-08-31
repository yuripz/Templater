<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/" xmlns:net="http://nri.rt.ru/NetworkCapability">

	<net:syncCentralOfficeRequest>
	<xsl:for-each select="syncCentralOfficeRequest">
		<originator>HERMES</originator>
		<receiver>URAL.ARGUS</receiver>
		<net:payload>
		<xsl:for-each select="payload">
			<!--type: RecordStatusFilter - enumeration: [ANY,ACTIVE_ONLY,DELETED_ONLY]-->
			<net:recordsStatus><xsl:value-of select="recordsStatus"/></net:recordsStatus>
			<net:changedSince><xsl:value-of select="changedSince"/></net:changedSince>
    </xsl:for-each> <!-- payload -->		
		</net:payload>
    </xsl:for-each> <!-- syncCentralOfficeRequest-->		
	</net:syncCentralOfficeRequest>
	</xsl:template>

</xsl:stylesheet>
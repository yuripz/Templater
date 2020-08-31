<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<xsl:for-each select="Envelope">
			<xsl:for-each select="Body">
				<xsl:for-each select="notifyAppointmentRequest">
					<xsl:variable name="originator" select="originator"/>
					<xsl:choose>
						<xsl:when test="$originator= 'SZ.WFMARGUS' ">
							<Context>
								<EventInitiator>SZ.WFMARGUS</EventInitiator>
								<EventKey>-1</EventKey>
								<Source>SZ.WFMARGUS</Source>
								<Destination>HRMS</Destination>
								<BusOperationId>161</BusOperationId>
							</Context>
						</xsl:when>
						<xsl:when test="$originator= 'VLG.WFMARGUS' ">
							<Context>
								<EventInitiator>VLG.WFMARGUS</EventInitiator>
								<EventKey>-1</EventKey>
								<Source>VLG.WFMARGUS</Source>
								<Destination>HRMS</Destination>
								<BusOperationId>161</BusOperationId>
							</Context>
						</xsl:when>
						<xsl:otherwise>
							<Context>
								<EventInitiator>SZ.WFMARGUS</EventInitiator>
								<EventKey>-1</EventKey>
								<Source>SZ.WFMARGUS</Source>
								<Destination>HRMS</Destination>
								<BusOperationId>161</BusOperationId>
							</Context>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
				<!-- SendCommentRequest -->
			</xsl:for-each>
			<!-- Body -->
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>

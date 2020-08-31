<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<urn1:NCCancelExtDocDeliveryInProjectRequest xmlns:urn1="urn:ru:rt:fuip:extstockmovementsmessage">
			<xsl:for-each select="CancelExtDocList">
				<CancelExtDocList>
					<xsl:for-each select="CancelExtDoc">
						<CancelExtDoc>
							<ExtDocId>
								<xsl:value-of select="ExtDocId"/>
							</ExtDocId>
							<ExtSourceLineId>
								<xsl:value-of select="ExtSourceLineId"/>
							</ExtSourceLineId>
							<HeaderId>
								<xsl:value-of select="HeaderId"/>
							</HeaderId>
							<HeaderNum>
								<xsl:value-of select="HeaderNum"/>
							</HeaderNum>
							<OrgId>
								<xsl:value-of select="OrgId"/>
							</OrgId>
							<ExtDocNum>
								<xsl:value-of select="ExtDocNum"/>
							</ExtDocNum>
						</CancelExtDoc>
					</xsl:for-each>
				</CancelExtDocList>
			</xsl:for-each>
			<!-- CycleOrder -->
		</urn1:NCCancelExtDocDeliveryInProjectRequest>
	</xsl:template>
</xsl:stylesheet>
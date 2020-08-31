<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<urn1:CancelDocTransferContractorRequest xmlns:urn1="urn:ru:rt:fuip:extstockmovementsmessage">
			<xsl:for-each select="CancelDocList">
				<CancelDocList>
					<xsl:for-each select="CancelDoc">
						<CancelDoc>
							<TransId>
								<xsl:value-of select="TransId"/>
							</TransId>
							<OrgId>
								<xsl:value-of select="OrgId"/>
							</OrgId>
						</CancelDoc>
					</xsl:for-each>
				</CancelDocList>
			</xsl:for-each>
		</urn1:CancelDocTransferContractorRequest>
	</xsl:template>
</xsl:stylesheet>
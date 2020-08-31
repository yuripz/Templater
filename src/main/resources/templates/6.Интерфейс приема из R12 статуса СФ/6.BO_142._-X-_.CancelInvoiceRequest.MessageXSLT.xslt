<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<urn1:CancelInvoiceRequest xmlns:urn1="urn:ru:rt:fuip:invoicemessage">
			<xsl:for-each select="CancelInvoice">
				<CancelInvoice>
							<ExtInvoiceId>
								<xsl:value-of select="ExtInvoiceId"/>
							</ExtInvoiceId>
							<OrgId>
								<xsl:value-of select="OrgId"/>
							</OrgId>
							<ContractId>
								<xsl:value-of select="ContractId"/>
							</ContractId>
				</CancelInvoice>
			</xsl:for-each>
			<!-- CancelInvoice -->
		</urn1:CancelInvoiceRequest>
	</xsl:template>
</xsl:stylesheet>
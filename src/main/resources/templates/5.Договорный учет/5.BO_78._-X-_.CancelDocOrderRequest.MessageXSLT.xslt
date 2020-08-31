<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<urn1:CancelDocOrderRequest xmlns:urn1="urn:ru:rt:fuip:contractaccordermessage">
			<xsl:for-each select="CancelDocOrder">
		         <SysOrderNum><xsl:value-of select="SysOrderNum"/></SysOrderNum>
			</xsl:for-each>
			<!-- CancelInvoice -->
		</urn1:CancelDocOrderRequest>
	</xsl:template>
</xsl:stylesheet>
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<urn1:nonManageCRMOrderUpdate xmlns:urn1="urn:ru:rt:crm:csmorderstatemessage">
			<nonManageCRMOrderUpdate>
				<xsl:for-each select="CRMOrderUpdate">
					<SYSOrderNum>
						<xsl:value-of select="SYSOrderNum"/>
					</SYSOrderNum>
					<SYSOrderStatus>
						<xsl:value-of select="SYSOrderStatus"/>
					</SYSOrderStatus>
					<SYSOrderStageCode>
						<xsl:value-of select="SYSOrderStageCode"/>
					</SYSOrderStageCode>
					<SYSOrderStage>
						<xsl:value-of select="SYSOrderStage"/>
					</SYSOrderStage>
					
				</xsl:for-each>
				<!--CRMOrderUpdate -->
			</nonManageCRMOrderUpdate>
		</urn1:nonManageCRMOrderUpdate>
	</xsl:template>
</xsl:stylesheet>
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<xsl:for-each select="ConfirmManageCIPRequest">
			<Confirmation>
				<xsl:for-each select="CIPConfirmation">
					<!-- Подтверждение КИП -->
					<ResultCode>
						<xsl:value-of select="ResultCode"/>
					</ResultCode>
					<Message>
						<xsl:value-of select="Message"/>
					</Message>
					<xsl:for-each select="CIPDetailList">
					<!--  Детальная информация по загрузке пакета -->
						 <DetailList> 
							<xsl:for-each select="CIP">
								<Detail>
									<ExtCIPProjectId><xsl:value-of select="ExtCIPProjectId"/></ExtCIPProjectId>
									<SysZSKNum><xsl:value-of select="SysZSKNum"/></SysZSKNum>
									<ZSKId><xsl:value-of select="ZSKId"/></ZSKId>
									<StageType><xsl:value-of select="StageType"/></StageType>
								</Detail>
							</xsl:for-each>
						</DetailList>
					</xsl:for-each>
					<Next>RESOUT</Next>
				</xsl:for-each>
			</Confirmation>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
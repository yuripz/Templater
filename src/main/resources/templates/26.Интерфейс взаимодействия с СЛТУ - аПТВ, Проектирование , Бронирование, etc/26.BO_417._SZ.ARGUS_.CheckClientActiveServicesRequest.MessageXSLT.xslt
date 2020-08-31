<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/" xmlns:proj="http://nri.rt.ru/NetworkCapability">
		<proj:checkClientActiveServicesRequest>
			<xsl:for-each select="CheckClientActiveServicesRequest">
				<originator>HERMES</originator>
				<receiver>
					<xsl:value-of select="receiver"/>
				</receiver>
				<proj:payload>
					<xsl:for-each select="payload">
						<proj:targetLocation>
							<xsl:for-each select="targetLocation">
<xsl:if test="locationCategory!='GEO'">
   <locationId><xsl:value-of select="locationId"/></locationId>   
   <locationCategory>STRICT</locationCategory>
   <locationRegister><xsl:value-of select="locationCategory"/></locationRegister>

</xsl:if>
				<xsl:if test="locationCategory='GEO'">
									<locationCategory>GEO</locationCategory>
									<locationRegister>GEO</locationRegister>
									<locationAttributes>
										<xsl:for-each select="locationAttributes">
											<attribute name="Latitude" status="AC" isChanged="false">
												<xsl:value-of select="Latitude"/>
											</attribute>
											<attribute name="Longitude" status="AC" isChanged="false">
												<xsl:value-of select="Longitude"/>
											</attribute>
											<xsl:if test="room!=''">
												<attribute name="room" status="AC" isChanged="false">
													<xsl:value-of select="room"/>
												</attribute>
											</xsl:if>
										</xsl:for-each>
										<!-- locationAttributesn-->
									</locationAttributes>
								</xsl:if>
							</xsl:for-each>
							<!-- targetLocation-->
						</proj:targetLocation>
						<xsl:for-each select="client">
							<proj:client>
								<partyRole>CLIENT</partyRole>
								<partyId>
									<xsl:value-of select="partyId"/>
								</partyId>
								<partyName>
									<xsl:value-of select="partyName"/>
								</partyName>
							</proj:client>
						</xsl:for-each>
						<!-- client -->
					</xsl:for-each>
					<!-- payload -->
				</proj:payload>
			</xsl:for-each>
			<!-- CreateProjectProposalRequest-->
		</proj:checkClientActiveServicesRequest>
	</xsl:template>
</xsl:stylesheet>
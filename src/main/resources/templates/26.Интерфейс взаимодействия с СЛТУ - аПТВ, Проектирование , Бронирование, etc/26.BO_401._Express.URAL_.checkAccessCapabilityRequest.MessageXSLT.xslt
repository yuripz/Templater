<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/" xmlns:net="http://nri.rt.ru/NetworkCapability">
		<net:checkAccessCapabilityRequest>
			<xsl:for-each select="checkAccessCapabilityRequest">
				<originator>HERMES</originator>
				<receiver>ARGUS_URAL</receiver>
				<net:payload>
					<xsl:for-each select="payload">
						<net:orderId>
							<xsl:value-of select="orderId"/>
						</net:orderId>
						<net:targetLocation>
							<xsl:for-each select="targetLocation">
								<xsl:if test="locationCategory='GID'">
									<locationId>
										<xsl:value-of select="locationId"/>
									</locationId>
									<locationCategory>STRICT</locationCategory>
									<locationRegister>GID</locationRegister>
								</xsl:if>
								<xsl:if test="locationCategory='GEO'">
									<locationId>
										<xsl:value-of select="locationId"/>
									</locationId>
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
										</xsl:for-each>
										<!-- locationAttributesn-->
									</locationAttributes>
								</xsl:if>
							</xsl:for-each>
							<!-- targetLocation-->
						</net:targetLocation>
						<net:requiredCapacity>
							<xsl:value-of select="requiredCapacity"/>
						</net:requiredCapacity>
						<xsl:if test="technology!=''">
							<net:technology>
								<xsl:value-of select="technology"/>
							</net:technology>
						</xsl:if>
						<xsl:if test="searchRadius!=''">
							<net:searchRadius>
								<xsl:value-of select="searchRadius"/>
							</net:searchRadius>
						</xsl:if>
					</xsl:for-each>
					<!-- payload -->
				</net:payload>
			</xsl:for-each>
			<!-- checkAccessCapabilityReques-->
		</net:checkAccessCapabilityRequest>
	</xsl:template>
</xsl:stylesheet>
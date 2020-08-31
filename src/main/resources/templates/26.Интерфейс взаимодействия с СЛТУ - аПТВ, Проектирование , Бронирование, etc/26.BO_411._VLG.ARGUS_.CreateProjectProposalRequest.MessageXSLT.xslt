<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/" xmlns:proj="http://nri.rt.ru/NetworkCapability">
		<proj:createProjectProposalRequest>
			<xsl:for-each select="CreateProjectProposalRequest">
				<originator>HERMES</originator>
				<receiver>
					<xsl:value-of select="receiver"/>
				</receiver>
				<proj:payload>
					<xsl:for-each select="payload">
						<proj:orderId>
							<xsl:value-of select="orderId"/>
						</proj:orderId>
						<proj:targetLocation>
							<xsl:for-each select="targetLocation">
								<xsl:if test="locationCategory='GID'">
									<locationId>
										<xsl:value-of select="locationId"/>
									</locationId>
									<locationCategory>STRICT</locationCategory>
									<locationRegister>GID</locationRegister>
								</xsl:if>
								<xsl:if test="locationCategory!='GID'">
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
						<xsl:for-each select="serviceList">
							<proj:serviceList>
								<xsl:for-each select="orderItem">
									<proj:orderItem>
										<proj:orderItemId>
											<xsl:value-of select="orderItemId"/>
										</proj:orderItemId>
										<proj:orderItemAction>CREATE</proj:orderItemAction>
										<proj:orderItemCategory>CFS</proj:orderItemCategory>
										<xsl:if test="orderItemParentId!=''">
											<proj:orderItemParentId>
												<xsl:value-of select="orderItemParentId"/>
											</proj:orderItemParentId>
										</xsl:if>
										<xsl:for-each select="orderItemSpecification">
											<proj:orderItemSpecification>
												<catalogId>HERMES</catalogId>
												<internalSpecId>
													<xsl:value-of select="internalSpecId"/>
												</internalSpecId>
												<specName>
													<xsl:value-of select="specName"/>
												</specName>
											</proj:orderItemSpecification>
										</xsl:for-each>
										<!-- orderItem  Specification-->
										<proj:orderItemComments/>
										<xsl:for-each select="orderItemAttributes">
											<proj:orderItemAttributes>
												<attribute name="portInterface">
													<xsl:value-of select="portInterface"/>
												</attribute>
												<attribute name="portSpeedValue">
													<xsl:value-of select="portSpeedValue"/>
												</attribute>
												<attribute name="portSpeedScale">
													<xsl:value-of select="portSpeedScale"/>
												</attribute>
											</proj:orderItemAttributes>
										</xsl:for-each>
									</proj:orderItem>
								</xsl:for-each>
								<!-- orderItem -->
							</proj:serviceList>
						</xsl:for-each>
						<!-- serviceList -->
						<xsl:if test="solutionId!=''">
							<proj:solutionId>
								<xsl:value-of select="solutionId"/>
							</proj:solutionId>
						</xsl:if>
						<proj:technology>
							<xsl:value-of select="technology"/>
						</proj:technology>
						<proj:dueDate><xsl:value-of select="dueDate"/></proj:dueDate>
						<!--<xsl:if test="externalServiceId!=''"> HE-4130	-->
						<proj:externalServiceId><xsl:value-of select="externalServiceId"/>
						</proj:externalServiceId>
						<!--</xsl:if>-->
					</xsl:for-each>
					<!-- payload -->
				</proj:payload>
			</xsl:for-each>
			<!-- CreateProjectProposalRequest-->
		</proj:createProjectProposalRequest>
	</xsl:template>
</xsl:stylesheet>
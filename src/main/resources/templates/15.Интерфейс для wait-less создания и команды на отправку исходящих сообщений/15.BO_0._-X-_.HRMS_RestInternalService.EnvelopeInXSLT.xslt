<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<xsl:for-each select="Envelope">
			<Envelope>
				<xsl:for-each select="Body">
					<xsl:for-each select="Parametrs">
						<xsl:variable name="originator" select="ServiceType"/>
						<xsl:choose>
							<xsl:when test="$originator= 'tryCheckAccessCapability' ">
								<Header>
									<Context>
										<EventInitiator>HTTP.HRMS</EventInitiator>
										<EventKey>-1</EventKey>
										<Source>HTTP.HRMS</Source>
										<Destination>HRMS</Destination>
										<BusOperationId>151</BusOperationId>
									</Context>
								</Header>
								<Body>
									<tryCheckAccessCapability>
										<xsl:copy-of select="/Envelope/Body/Parametrs"/>
									</tryCheckAccessCapability>
								</Body>
							</xsl:when>
							<xsl:when test="$originator= 'tryBookResourcesForInstallation' ">
								<Header>
									<Context>
										<EventInitiator>HTTP.HRMS</EventInitiator>
										<EventKey>-1</EventKey>
										<Source>HTTP.HRMS</Source>
										<Destination>HRMS</Destination>
										<BusOperationId>152</BusOperationId>
									</Context>
								</Header>
								<Body>
									<tryBookResourcesForInstallation>
										<xsl:copy-of select="/Envelope/Body/Parametrs"/>
									</tryBookResourcesForInstallation>
								</Body>
							</xsl:when>
							<xsl:when test="$originator= 'tryСancelResourcesBooking' ">
								<Header>
									<Context>
										<EventInitiator>HTTP.HRMS</EventInitiator>
										<EventKey>-1</EventKey>
										<Source>HTTP.HRMS</Source>
										<Destination>HRMS</Destination>
										<BusOperationId>153</BusOperationId>
									</Context>
								</Header>
								<Body>
									<tryСancelResourcesBooking>
										<xsl:copy-of select="/Envelope/Body/Parametrs"/>
									</tryСancelResourcesBooking>
								</Body>
							</xsl:when>
							<xsl:when test="$originator= 'tryCheckClientActiveServices' ">
								<Header>
									<Context>
										<EventInitiator>HTTP.HRMS</EventInitiator>
										<EventKey>-1</EventKey>
										<Source>HTTP.HRMS</Source>
										<Destination>HRMS</Destination>
										<BusOperationId>154</BusOperationId>
									</Context>
								</Header>
								<Body>
									<tryCheckClientActiveServices>
										<xsl:copy-of select="/Envelope/Body/Parametrs"/>
									</tryCheckClientActiveServices>
								</Body>
							</xsl:when>														
							<xsl:otherwise>
								<Header>
									<Context>
										<EventInitiator>GET.HRMS</EventInitiator>
										<EventKey>-1</EventKey>
										<Source>GET.HRMS</Source>
										<Destination>HRMS</Destination>
										<BusOperationId>491</BusOperationId>
									</Context>
								</Header>
								<Body>
									<SQLquery_001>
										<xsl:copy-of select="/Envelope/Body/Parametrs"/>
									</SQLquery_001>
								</Body>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:for-each>
					<!-- Parametrs-->
				</xsl:for-each>
				<!-- Body -->
			</Envelope>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
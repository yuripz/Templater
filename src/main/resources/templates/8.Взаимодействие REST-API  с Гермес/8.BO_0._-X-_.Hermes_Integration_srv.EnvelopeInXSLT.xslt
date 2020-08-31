<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<xsl:for-each select="Envelope">
			<Envelope>
				<xsl:for-each select="Body">
					<xsl:for-each select="Parametrs">
						<xsl:variable name="originator" select="ServiceName"/>
						<xsl:choose>
							<xsl:when test="$originator= 'SearchGeoObjectsByCoordinates' ">
								<Header>
									<Context>
										<EventInitiator>HTTP.HRMS</EventInitiator>
										<EventKey>-1</EventKey>
										<Source>HTTP.HRMS</Source>
										<Destination>HRMS</Destination>
										<BusOperationId>84</BusOperationId>
									</Context>
								</Header>
								<Body>
									<GETSearchGeoObjectsByCoordinates>
										<xsl:copy-of select="/Envelope/Body/Parametrs"/>
									</GETSearchGeoObjectsByCoordinates>
								</Body>
							</xsl:when>
							<xsl:when test="$originator= 'GetLocalityByCoordinates' ">
								<Header>
									<Context>
										<EventInitiator>HTTP.HRMS</EventInitiator>
										<EventKey>-1</EventKey>
										<Source>HTTP.HRMS</Source>
										<Destination>HRMS</Destination>
										<BusOperationId>85</BusOperationId>
									</Context>
								</Header>
								<Body>
									<GETLocalityByCoordinates>
										<xsl:copy-of select="/Envelope/Body/Parametrs"/>
									</GETLocalityByCoordinates>
								</Body>
							</xsl:when>
							<xsl:when test="$originator= 'CheckRequestByID' ">
								<Header>
									<Context>
										<EventInitiator>HTTP.HRMS</EventInitiator>
										<EventKey>-1</EventKey>
										<Source>HTTP.HRMS</Source>
										<Destination>HRMS</Destination>
										<BusOperationId>801</BusOperationId>
									</Context>
								</Header>
								<Body>
									<CheckRequestByID>
										<xsl:copy-of select="/Envelope/Body/Parametrs"/>
									</CheckRequestByID>
								</Body>
							</xsl:when>
							<xsl:otherwise>
								<Header>
									<Context>
										<EventInitiator>HTTP.HRMS</EventInitiator>
										<EventKey>-1</EventKey>
										<Source>HTTP.HRMS</Source>
										<Destination>HRMS</Destination>
										<BusOperationId>800</BusOperationId>
									</Context>
								</Header>
								<Body>
									<SearchGeoObjectsByXXX>
										<xsl:copy-of select="/Envelope/Body/Parametrs"/>
									</SearchGeoObjectsByXXX>
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
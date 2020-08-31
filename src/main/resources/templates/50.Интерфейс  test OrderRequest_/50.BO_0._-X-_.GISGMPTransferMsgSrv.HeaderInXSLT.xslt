<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<xsl:for-each select="Envelope">
			<xsl:for-each select="Body">
				<xsl:for-each select="submitOrderRequest">
<!--<xsl:variable name="originator" select="originator" />-->
<xsl:variable name="originator">URAL.LIRA</xsl:variable>
					<xsl:choose>
						<xsl:when test="$originator= 'CMS.KKFU' ">
							<Context>
								<EventInitiator>CMS.KKFU</EventInitiator>
								<EventKey>-1</EventKey>
								<Source>CMS.KKFU</Source>
								<Destination>HRMS</Destination>
								<BusOperationId>507</BusOperationId>
							</Context>
						</xsl:when>
						<xsl:when test="$originator= 'URAL.LIRA' ">
							<Context>
								<EventInitiator>URAL.LIRA</EventInitiator>
								<EventKey>-1</EventKey>
								<Source>URAL.LIRA</Source>
								<Destination>HRMS</Destination>
								<BusOperationId>507</BusOperationId>
							</Context>
						</xsl:when>
						<xsl:when test="$originator= 'COM.B2B' ">
							<Context>
								<EventInitiator>COM.B2B</EventInitiator>
								<EventKey>-1</EventKey>
								<Source>COM.B2B</Source>
								<Destination>HRMS</Destination>
								<BusOperationId>507</BusOperationId>
							</Context>
						</xsl:when>
						<xsl:when test="$originator= 'FSOM' ">
							<Context>
								<EventInitiator>FSOM</EventInitiator>
								<EventKey>-1</EventKey>
								<Source>FSOM</Source>
								<Destination>HRMS</Destination>
								<BusOperationId>507</BusOperationId>
							</Context>
						</xsl:when>
						<xsl:when test="$originator= 'URAL.CRMB2B' ">
							<Context>
								<EventInitiator>URAL.CRMB2B</EventInitiator>
								<EventKey>-1</EventKey>
								<Source>URAL.CRMB2B</Source>
								<Destination>HRMS</Destination>
								<BusOperationId>507</BusOperationId>
							</Context>
						</xsl:when>						<xsl:otherwise>
							<Context>
								<EventInitiator>GET.HRMS</EventInitiator>
								<EventKey>-1</EventKey>
								<Source>GET.HRMS</Source>
								<Destination>HRMS</Destination>
								<BusOperationId>507</BusOperationId>
							</Context>
						</xsl:otherwise>
					</xsl:choose>
					
				</xsl:for-each>
				<!-- submitOrderRequest -->
				<xsl:for-each select="cancelOrderRequest">
<!--<xsl:variable name="originator" select="originator" />-->
<xsl:variable name="originator">URAL.LIRA</xsl:variable>
					<xsl:choose>
						<xsl:when test="$originator= 'CMS.KKFU' ">
							<Context>
								<EventInitiator>CMS.KKFU</EventInitiator>
								<EventKey>-1</EventKey>
								<Source>CMS.KKFU</Source>
								<Destination>HRMS</Destination>
								<BusOperationId>508</BusOperationId>
							</Context>
						</xsl:when>
						<xsl:when test="$originator= 'URAL.LIRA' ">
							<Context>
								<EventInitiator>URAL.LIRA</EventInitiator>
								<EventKey>-1</EventKey>
								<Source>URAL.LIRA</Source>
								<Destination>HRMS</Destination>
								<BusOperationId>508</BusOperationId>
							</Context>
						</xsl:when>
						<xsl:otherwise>
							<Context>
								<EventInitiator>GET.HRMS</EventInitiator>
								<EventKey>-1</EventKey>
								<Source>GET.HRMS</Source>
								<Destination>HRMS</Destination>
						<BusOperationId>508</BusOperationId>
							</Context>
						</xsl:otherwise>
					</xsl:choose>

				</xsl:for-each>
				<!-- cancelOrderRequest -->
				<xsl:for-each select="amendOrderRequest">
<xsl:variable name="originator" select="originator" />
					<xsl:choose>
						<xsl:when test="$originator= 'CMS.KKFU' ">
							<Context>
								<EventInitiator>CMS.KKFU</EventInitiator>
								<EventKey>-1</EventKey>
								<Source>CMS.KKFU</Source>
								<Destination>HRMS</Destination>
								<BusOperationId>508</BusOperationId>
							</Context>
						</xsl:when>
						<xsl:when test="$originator= 'URAL.LIRA' ">
							<Context>
								<EventInitiator>URAL.LIRA</EventInitiator>
								<EventKey>-1</EventKey>
								<Source>URAL.LIRA</Source>
								<Destination>HRMS</Destination>
								<BusOperationId>508</BusOperationId>
							</Context>
						</xsl:when>
						<xsl:otherwise>
							<Context>
								<EventInitiator>GET.HRMS</EventInitiator>
								<EventKey>-1</EventKey>
								<Source>GET.HRMS</Source>
								<Destination>HRMS</Destination>
						<BusOperationId>508</BusOperationId>
							</Context>
						</xsl:otherwise>
					</xsl:choose>

				</xsl:for-each>
				<!-- amendOrderRequest -->

				<xsl:for-each select="queryOrderRequest">
							<Context>
								<EventInitiator>URAL.LIRA</EventInitiator>
								<EventKey>-1</EventKey>
								<Source>URAL.LIRA</Source>
								<Destination>HRMS</Destination>
								<BusOperationId>508</BusOperationId>
							</Context>
				</xsl:for-each>
				<!-- queryOrderRequest-->

				<xsl:for-each select="SendCommentRequest">
							<Context>
								<EventInitiator>CMS.KKFU</EventInitiator>
								<EventKey>-1</EventKey>
								<Source>CMS.KKFU</Source>
								<Destination>HRMS</Destination>
								<BusOperationId>508</BusOperationId>
							</Context>
				</xsl:for-each>
				<!-- SendCommentRequest -->
			</xsl:for-each>
			<!-- Body -->
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
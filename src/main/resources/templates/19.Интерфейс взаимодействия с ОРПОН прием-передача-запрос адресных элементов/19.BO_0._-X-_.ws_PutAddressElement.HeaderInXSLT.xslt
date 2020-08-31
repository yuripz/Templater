<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<xsl:for-each select="Envelope">
			<xsl:for-each select="Body">
				<xsl:for-each select="AddressList">
					<Context>
						<EventInitiator>OP_PON</EventInitiator>
						<EventKey>-1</EventKey>
						<Source>OP_PON</Source>
						<Destination>HRMS</Destination>
						<BusOperationId>201</BusOperationId>
					</Context>
				</xsl:for-each>
				<!-- AddressList передача адресных элементов-->
				<xsl:for-each select="AddressElementTypeData">
					<Context>
						<EventInitiator>OP_PON</EventInitiator>
						<EventKey>-1</EventKey>
						<Source>OP_PON</Source>
						<Destination>HRMS</Destination>
						<BusOperationId>204</BusOperationId>
					</Context>
				</xsl:for-each>
				<!-- AddressElementTypeData Типы адресных элементов-->
				<xsl:for-each select="EstStatData">
					<Context>
						<EventInitiator>OP_PON</EventInitiator>
						<EventKey>-1</EventKey>
						<Source>OP_PON</Source>
						<Destination>HRMS</Destination>
						<BusOperationId>205</BusOperationId>
					</Context>
				</xsl:for-each>
				<!-- EstStatData Признаки владения -->
				<xsl:for-each select="StrStatData">
					<Context>
						<EventInitiator>OP_PON</EventInitiator>
						<EventKey>-1</EventKey>
						<Source>OP_PON</Source>
						<Destination>HRMS</Destination>
						<BusOperationId>206</BusOperationId>
					</Context>
				</xsl:for-each>
				<!-- StrStatData Признаки строения -->
				<xsl:for-each select="PutManagementCompanyRequest">
					<Context>
						<EventInitiator>OP_PON</EventInitiator>
						<EventKey>-1</EventKey>
						<Source>OP_PON</Source>
						<Destination>HRMS</Destination>
						<BusOperationId>221</BusOperationId>
					</Context>
				</xsl:for-each>
				<xsl:for-each select="AddressListGEO">
					<Context>
						<EventInitiator>OP_PON</EventInitiator>
						<EventKey>-1</EventKey>
						<Source>OP_PON</Source>
						<Destination>HRMS</Destination>
						<BusOperationId>223</BusOperationId>
					</Context>
				</xsl:for-each>
				    <xsl:for-each select="PropertyData">
					<Context>
						<EventInitiator>OP_PON</EventInitiator>
						<EventKey>-1</EventKey>
						<Source>OP_PON</Source>
						<Destination>HRMS</Destination>
						<BusOperationId>225</BusOperationId>
					</Context>
				</xsl:for-each>
			</xsl:for-each>
			<!-- Body -->
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
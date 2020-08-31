<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<xsl:for-each select="AddressElementLocalIDResponse">
			<Confirmation>
				<ResultCode><xsl:value-of select="AddressElementGroup/House/ActualStatus"/></ResultCode>
				<Message>GlobalID: <xsl:value-of select="AddressElementGroup/House/GlobalID"/>
				</Message>
				<DetailList> 
				<House>
					<GlobalID><xsl:value-of select="AddressElementGroup/House/GlobalID"/></GlobalID>
					<ActualStatus><xsl:value-of select="AddressElementGroup/House/ActualStatus"/></ActualStatus>
                                             <EstateType><xsl:value-of select="AddressElementGroup/House/EstateType"/></EstateType>
                                             <ParentId><xsl:value-of select="AddressElementGroup/House/ParentId"/></ParentId>
                                             <ParentLevel><xsl:value-of select="AddressElementGroup/House/ParentLevel"/></ParentLevel>
                                             <HouseNumber><xsl:value-of select="AddressElementGroup/House/HouseNumber"/></HouseNumber>
                                             <BuildingType/>
				</House>
       				</DetailList> 
				<Next>RESOUT</Next>
			</Confirmation>
		</xsl:for-each>
		<xsl:for-each select="Fault">
			<xsl:choose>
				<xsl:when test="ResultCode > 0">
					<Result>
						<Cod>
							<xsl:value-of select="ResultCode"/>
						</Cod>
						<Text>
							<xsl:value-of select="Message"/>
						</Text>
						<Next>ERROUT</Next>
					</Result>
				</xsl:when>
				<xsl:otherwise>
					<Result>
						<Cod>6666</Cod>
						<Text>
							<xsl:copy-of select="/Fault"/>
						</Text>
						<Next>ERROUT</Next>
					</Result>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
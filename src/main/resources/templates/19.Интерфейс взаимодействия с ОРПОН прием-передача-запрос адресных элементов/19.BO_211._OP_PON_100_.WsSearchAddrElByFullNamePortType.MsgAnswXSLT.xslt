<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
   <xsl:for-each select="AddressElementNameResponse2">
<Confirmation>
 <ResultCode>0</ResultCode>
 <Message>Success</Message>
     <xsl:for-each select="AddressElementResponseList2">
 <DetailList>
       <xsl:for-each select="AddressElementNameGroup2">
   <Detail>
     <ParsingLevelCode> <xsl:value-of select="ParsingLevelCode"/></ParsingLevelCode>
     <QualityCode><xsl:value-of select="QualityCode"/></QualityCode>
     <CheckStatus><xsl:value-of select="CheckStatus"/></CheckStatus>
     <SystemCode><xsl:value-of select="SystemCode"/></SystemCode>
     <GlobalID><xsl:value-of select="GlobalID"/></GlobalID>
     <KLADRLocalityId><xsl:value-of select="KLADRLocalityId"/></KLADRLocalityId>
     <KLADRStreetId><xsl:value-of select="KLADRStreetId"/></KLADRStreetId>
     <Street><xsl:value-of select="Street"/></Street>
     <StreetKind><xsl:value-of select="StreetKind"/></StreetKind>
     <House><xsl:value-of select="House"/></House>
     <HouseLitera><xsl:value-of select="HouseLitera"/></HouseLitera>
     <CornerHouse><xsl:value-of select="CornerHouse"/></CornerHouse>
     <BuildingBlock> <xsl:value-of select="BuildingBlock"/></BuildingBlock>
     <BuildingBlockLitera><xsl:value-of select="BuildingBlockLitera"/></BuildingBlockLitera>
     <Building><xsl:value-of select="Building"/></Building>
     <BuildingLitera><xsl:value-of select="BuildingLitera"/></BuildingLitera>
     <Ownership> <xsl:value-of select="Ownership"/></Ownership>
     <OwnershipLitera><xsl:value-of select="OwnershipLitera"/></OwnershipLitera>
     <FIASLocalityId><xsl:value-of select="FIASLocalityId"/></FIASLocalityId>
     <FIASStreetId><xsl:value-of select="FIASStreetId"/></FIASStreetId>
     <FIASHouseId><xsl:value-of select="FIASHouseId"/></FIASHouseId>
			<Latitude><xsl:value-of select="Latitude"/></Latitude>
			<Longitude><xsl:value-of select="Longitude"/></Longitude>
   </Detail>
       </xsl:for-each>
 </DetailList>
     </xsl:for-each>
 <Next>RESOUT</Next>
</Confirmation>
   </xsl:for-each>
   <xsl:for-each select="Fault">
     <xsl:choose>
      <xsl:when test="ResultCode > 0">
<Result>
  <Cod><xsl:value-of select="ResultCode"/></Cod>
  <Text><xsl:value-of select="Message"/></Text>
  <Next>ERROUT</Next>
</Result>
     </xsl:when>
     <xsl:otherwise>
<Result>
  <Cod>66066</Cod>
  <Text><xsl:copy-of select="/Fault"/></Text>
  <Next>ERROUT</Next>
</Result>
     </xsl:otherwise>
    </xsl:choose>
   </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
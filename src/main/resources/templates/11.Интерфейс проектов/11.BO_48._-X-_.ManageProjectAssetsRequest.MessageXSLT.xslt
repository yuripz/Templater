<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
<urn1:ManageProjectAssetsRequest xmlns:urn1="urn:ru:rt:fuip:projecttaskmessage">
  <xsl:for-each select="ProjectAssetsList">
   <ProjectAssetsList>
    <xsl:for-each select="ProjectAssets">
      <ProjectAssets>
       <ObjectCode><xsl:value-of select="ObjectCode"/></ObjectCode>
       <ProjectId><xsl:value-of select="ProjectId"/></ProjectId>
       <OrgId><xsl:value-of select="OrgId"/></OrgId>
       <AssetUnits><xsl:value-of select="AssetUnits"/></AssetUnits>
       <OperationType><xsl:value-of select="OperationType"/></OperationType>
       <OrderNum><xsl:value-of select="OrderNum"/></OrderNum>
       <RealtyAttribute><xsl:value-of select="RealtyAttribute"/></RealtyAttribute>
       <EstDate><xsl:value-of select="EstDate"/></EstDate>
     <xsl:if test="MOL!=''">
       <MOL><xsl:value-of select="MOL"/></MOL>
     </xsl:if>
     <xsl:if test="SerialNum!=''">
       <SerialNum><xsl:value-of select="SerialNum"/> </SerialNum>
     </xsl:if>
     <xsl:if test="ParentAssetId!=''">
       <ParentAssetId><xsl:value-of select="ParentAssetId"/></ParentAssetId>
     </xsl:if>
     <xsl:for-each select="TOUClassificationList"> 
       <TOUClassificationList>      
      <xsl:for-each select="TOUClassification">
          <TOUClassification>
             <TOUId><xsl:value-of select="TOUId"/></TOUId>
             <TaxMos><xsl:value-of select="TaxMos"/></TaxMos>
             <Comments><xsl:value-of select="Comments"/></Comments>
             <TOUAttribute><xsl:value-of select="TOUAttribute"/></TOUAttribute>
             <BonusRule><xsl:value-of select="BonusRule"/></BonusRule>
          </TOUClassification>
      </xsl:for-each>
       </TOUClassificationList>
     </xsl:for-each>
     <xsl:for-each select="ExpAccountsList">
       <ExpAccountsList>
      <xsl:for-each select="ExpAccounts">
        <ExpAccounts>
          <ActualUnit><xsl:value-of select="ActualUnit"/></ActualUnit>
          <ExpAccount><xsl:value-of select="ExpAccount"/></ExpAccount>
          <CFO><xsl:value-of select="CFO"/></CFO>
          <Segment1><xsl:value-of select="Segment1"/></Segment1>
          <Segment2><xsl:value-of select="Segment2"/></Segment2>
        </ExpAccounts>
      </xsl:for-each>
       </ExpAccountsList>
     </xsl:for-each>
     <xsl:for-each select="LocationList">
<LocationList>
      <xsl:for-each select="Location">
        <Location>
          <OrganizationId><xsl:value-of select="OrganizationId"/></OrganizationId>
          
          
<xsl:if test="RegionKLADRCode!=''">
          <RegionKLADRCode><xsl:value-of select="RegionKLADRCode"/></RegionKLADRCode>
          <RegionAbbrev><xsl:value-of select="RegionAbbrev"/></RegionAbbrev>
          <Region><xsl:value-of select="Region"/></Region>
</xsl:if>
<xsl:if test="SubregionKLADRCode!=''">
          <SubregionKLADRCode><xsl:value-of select="SubregionKLADRCode"/></SubregionKLADRCode>
          <SubregionAbbrev><xsl:value-of select="SubregionAbbrev"/></SubregionAbbrev>
          <Subregion><xsl:value-of select="Subregion"/></Subregion>
</xsl:if>

<xsl:if test="CityKLADRCode!=''">
          <CityKLADRCode><xsl:value-of select="CityKLADRCode"/></CityKLADRCode>
          <CityAbbrev><xsl:value-of select="CityAbbrev"/></CityAbbrev>
          <City><xsl:value-of select="City"/></City>
</xsl:if>
          <xsl:if test="SettlementKLADRCode!=''">
          <SettlementKLADRCode><xsl:value-of select="SettlementKLADRCode"/></SettlementKLADRCode>
          <SettlementAbbrev><xsl:value-of select="SettlementAbbrev"/></SettlementAbbrev>
          <Settlement><xsl:value-of select="Settlement"/></Settlement>
		</xsl:if>
          <StreetKLADRCode><xsl:value-of select="StreetKLADRCode"/></StreetKLADRCode>
          <StreetAbbrev><xsl:value-of select="StreetAbbrev"/></StreetAbbrev>
          <Street><xsl:value-of select="Street"/></Street>
          <HouseNum><xsl:value-of select="HouseNum"/></HouseNum>
          <HousingNum><xsl:value-of select="HousingNum"/></HousingNum>
          <Fraction><xsl:value-of select="Fraction"/></Fraction>
          <OwnershipNum><xsl:value-of select="OwnershipNum"/></OwnershipNum>
          <BuildingNum><xsl:value-of select="BuildingNum"/></BuildingNum>
        </Location>
      </xsl:for-each>
       </LocationList>
     </xsl:for-each>
     <xsl:for-each select="PreciousMetalList">
       <PreciousMetalList>
       <xsl:for-each select="PreciousMetal">
         <PreciousMetal>
           <PreciousMetalName><xsl:value-of select="PreciousMetalName"/></PreciousMetalName>
           <Weight><xsl:value-of select="Weight"/></Weight>
         </PreciousMetal>
       </xsl:for-each>
       </PreciousMetalList>
     </xsl:for-each>
     <xsl:for-each select="NaturalIndexList">
       <NaturalIndexList>
      <xsl:for-each select="NaturalIndex">
        <NaturalIndex>
          <ResourceId><xsl:value-of select="ResourceId"/></ResourceId>
          <SchemaSUS><xsl:value-of select="SchemaSUS"/></SchemaSUS>
          <IncludCode><xsl:value-of select="IncludCode"/></IncludCode>
          <EnteredQuantity><xsl:value-of select="EnteredQuantity"/></EnteredQuantity>
        </NaturalIndex>
      </xsl:for-each>
       </NaturalIndexList>
     </xsl:for-each>            
      </ProjectAssets>
     </xsl:for-each>
    </ProjectAssetsList>
   </xsl:for-each>
</urn1:ManageProjectAssetsRequest>
</xsl:template>
</xsl:stylesheet>
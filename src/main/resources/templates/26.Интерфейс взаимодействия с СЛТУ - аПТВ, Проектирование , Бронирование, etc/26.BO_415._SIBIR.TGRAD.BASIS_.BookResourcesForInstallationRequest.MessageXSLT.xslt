<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/" xmlns:proj="http://nri.rt.ru/ProjectProposalSevice">
  <proj:BookResourcesForInstallationRequest>
  <xsl:for-each select="BookResourcesForInstallationRequest">
    <proj:originator>HERMES</proj:originator>
    <proj:receiver><xsl:value-of select="receiver"/></proj:receiver>
    <proj:payload>
    <xsl:for-each select="payload">
      <proj:orderId><xsl:value-of select="orderId"/></proj:orderId>
      <proj:targetLocation>
      <xsl:for-each select="targetLocation">
<xsl:if test="locationCategory='GID'">
   <proj:locationId><xsl:value-of select="locationId"/></proj:locationId>   
   <proj:locationCategory>STRICT</proj:locationCategory>
   <proj:locationRegister>GID</proj:locationRegister>

</xsl:if>
        <xsl:if test="locationCategory!='GID'">
   <proj:locationRegister>GEO</proj:locationRegister>
        <proj:locationAttributes>
        <xsl:for-each select="locationAttributes">
          <proj:attribute name="Latitude" status="AC" isChanged="false">
          <xsl:value-of select="Latitude"/>
          </proj:attribute>
          <proj:attribute name="Longitude" status="AC" isChanged="false">
          <xsl:value-of select="Longitude"/>
          </proj:attribute>
          <xsl:if test="room!=''">
          <proj:attribute name="room" status="AC" isChanged="false">
          <xsl:value-of select="room"/>
          </proj:attribute>
          </xsl:if>
        </xsl:for-each> <!-- locationAttributesn-->  
        </proj:locationAttributes>
        </xsl:if>  
      </xsl:for-each> <!-- targetLocation-->  
      </proj:targetLocation>
      <xsl:for-each select="client">
            <proj:client>
               <proj:partyRole>CLIENT</proj:partyRole>
               <proj:partyId><xsl:value-of select="partyId"/></proj:partyId>
               <proj:partyName><xsl:value-of select="partyName"/></proj:partyName>
            </proj:client>
            </xsl:for-each> <!-- client -->
            <xsl:for-each select="serviceList"> 
            <proj:serviceList>
            <xsl:for-each select="orderItem">
               <proj:orderItem>
            <proj:orderItemId><xsl:value-of select="orderItemId"/></proj:orderItemId>
            <proj:orderItemAction>CREATE</proj:orderItemAction>
            <proj:orderItemCategory>CFS</proj:orderItemCategory>
  <xsl:if test="orderItemParentId!=''">
            <proj:orderItemParentId><xsl:value-of select="orderItemParentId"/></proj:orderItemParentId>
  </xsl:if>
            <xsl:for-each select="orderItemSpecification">
            <proj:orderItemSpecification>
              <proj:catalogId>HERMES</proj:catalogId>
              <proj:internalSpecId><xsl:value-of select="internalSpecId"/></proj:internalSpecId>
              <proj:specName><xsl:value-of select="specName"/></proj:specName>
            </proj:orderItemSpecification>
            </xsl:for-each> <!-- orderItem  Specification-->
            <proj:orderItemComments/>
            <xsl:for-each select="orderItemAttributes">
            <proj:orderItemAttributes>
              <proj:attribute name="portInterface"><xsl:value-of select="portInterface"/></proj:attribute>
              <proj:attribute name="portSpeedValue"><xsl:value-of select="portSpeedValue"/></proj:attribute>
              <proj:attribute name="portSpeedScale"><xsl:value-of select="portSpeedScale"/></proj:attribute>
            </proj:orderItemAttributes>
            </xsl:for-each>
          </proj:orderItem>
          </xsl:for-each> <!-- orderItem -->
        </proj:serviceList>
        </xsl:for-each> <!-- serviceList -->

        <proj:externalServiceId><xsl:value-of select="externalServiceId"/></proj:externalServiceId>

        <proj:equipmentId><xsl:value-of select="equipmentId"/></proj:equipmentId>
        <proj:technology><xsl:value-of select="technology"/></proj:technology>
    </xsl:for-each> <!-- payload -->    
    </proj:payload>
    </xsl:for-each> <!-- CreateProjectProposalRequest-->    
  </proj:BookResourcesForInstallationRequest>
  </xsl:template>

</xsl:stylesheet>
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
<urn1:ManageInputOrderRequest xmlns:urn1="urn:ru:rt:fuip:projecttaskmessage">
<xsl:for-each select="InputOrderList">
<InputOrderList>

<xsl:for-each select="InputOrder">
<InputOrder>

  <OrgId><xsl:value-of select="OrgId"/></OrgId>
  <SUSOrderNum><xsl:value-of select="SUSOrderNum"/></SUSOrderNum>
  <OrderDate><xsl:value-of select="OrderDate"/></OrderDate>
  <CommOrder><xsl:value-of select="CommOrder"/></CommOrder>
  <ProjectId><xsl:value-of select="ProjectId"/></ProjectId>
   
   <xsl:if  test="Description!=''" >
  <Description><xsl:value-of select="Description"/></Description>
   </xsl:if>
<!--   
<xsl:if test="Description!=''">
    <Description><xsl:value-of select="Description"/></Description>
</xsl:if>
-->
<xsl:if test="ResourceRateList!=''">

<xsl:for-each select="ResourceRateList">
<ResourceRateList>

<xsl:for-each select="ResourceRate">
<ResourceRate>

    <ResourceId><xsl:value-of select="ResourceId"/></ResourceId>
    <SchemaSUS><xsl:value-of select="SchemaSUS"/></SchemaSUS>
    <IncludCode><xsl:value-of select="IncludCode"/></IncludCode>
    <EntQuantity><xsl:value-of select="EnteredQuantity"/></EntQuantity>
    <ExcQuantity><xsl:value-of select="ExchangedQuantity"/></ExcQuantity>
</ResourceRate>
</xsl:for-each> 

</ResourceRateList>
</xsl:for-each> 

</xsl:if>
 </InputOrder>
</xsl:for-each> 
 </InputOrderList>
</xsl:for-each>
</urn1:ManageInputOrderRequest>
</xsl:template>
</xsl:stylesheet>
<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<urn1:ManageOrderRequest  xmlns:urn1="urn:ru:rt:fuip:contractaccordermessage">
<xsl:for-each select="Order">
 <Order>
  <ExtOrderId><xsl:value-of select="ExtOrderId"/></ExtOrderId>
  <FrameContractNum><xsl:value-of select="FrameContractNum"/></FrameContractNum>
  <VendorId><xsl:value-of select="VendorId"/></VendorId>
  <VendorSiteId><xsl:value-of select="VendorSiteId"/></VendorSiteId>
  <CreationDate><xsl:value-of select="CreationDate"/></CreationDate>
  <StartDate><xsl:value-of select="StartDate"/></StartDate>
  <EndDate><xsl:value-of select="EndDate"/></EndDate>
  <ProjectId><xsl:value-of select="ProjectId"/></ProjectId>
  <TaskId><xsl:value-of select="TaskId"/></TaskId>
<xsl:if  test="ExpenditureType!=''" >
  <ExpenditureType><xsl:value-of select="ExpenditureType"/></ExpenditureType>
</xsl:if>
<xsl:if  test="AdvAmountIncTax!=''" >
  <AdvAmountIncTax><xsl:value-of select="AdvAmountIncTax"/></AdvAmountIncTax>
</xsl:if>
  <AmountNoTax><xsl:value-of select="AmountNoTax"/></AmountNoTax>
  <AmountIncTax><xsl:value-of select="AmountIncTax"/></AmountIncTax>
  <OrgId><xsl:value-of select="OrgId"/></OrgId>
  <TaxRate><xsl:value-of select="TaxRate"/></TaxRate>
<xsl:if  test="InventoryItemId!=''" >
  <InventoryItemId><xsl:value-of select="InventoryItemId"/></InventoryItemId>
</xsl:if>
 </Order>
</xsl:for-each>
</urn1:ManageOrderRequest>
</xsl:template>
</xsl:stylesheet>
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
<urn:ManageInvoiceRequest xmlns:urn="urn:ru:rt:fuip:invoicemessage">
<xsl:for-each select="InvoiceList">
 <InvoiceList>
<xsl:for-each select="Invoice">
  <Invoice>
  <InvoiceId><xsl:value-of select="InvoiceId"/></InvoiceId>
  <InvoiceNum><xsl:value-of select="InvoiceNum"/></InvoiceNum>
  <InvoiceDate><xsl:value-of select="InvoiceDate"/></InvoiceDate>
  <SysDocId><xsl:value-of select="SysDocId"/></SysDocId>
  <ProjectId><xsl:value-of select="ProjectId"/></ProjectId>
  <ObjectCode><xsl:value-of select="ObjectCode"/></ObjectCode>
  <ExpenditureType><xsl:value-of select="ExpenditureType"/></ExpenditureType>
  <AmountNoTax><xsl:value-of select="AmountNoTax"/></AmountNoTax>
  <AmountIncTax><xsl:value-of select="AmountIncTax"/></AmountIncTax>
  <OrgId><xsl:value-of select="OrgId"/></OrgId>
  <CycleNum><xsl:value-of select="ContractStage"/></CycleNum>
  <StageNum><xsl:value-of select="PurchasePosition"/></StageNum>
 <CycleId><xsl:value-of select="CycleId"/></CycleId>
  <StageId><xsl:value-of select="StageId"/></StageId>
  <xsl:if  test="BarcodeList!=''" >
  <BarcodeList>
  <xsl:for-each select="BarcodeList">
   <xsl:for-each select="Barcode">
    <Barcode>
  <BarcodeId><xsl:value-of select="BarcodeId"/></BarcodeId>
  <CategoryCode><xsl:value-of select="CategoryCode"/></CategoryCode>
     </Barcode>
  </xsl:for-each> 
  </xsl:for-each>
  </BarcodeList>
</xsl:if>
  </Invoice>
</xsl:for-each> 
 </InvoiceList>
</xsl:for-each>
</urn:ManageInvoiceRequest>
</xsl:template>
</xsl:stylesheet>
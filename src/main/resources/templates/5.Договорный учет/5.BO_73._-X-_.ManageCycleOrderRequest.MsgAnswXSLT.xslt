<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<urn1:ManageCycleOrderRequest  xmlns:urn1="urn:ru:rt:fuip:contractaccordermessage">
<xsl:for-each select="CycleOrder">
 <CycleOrder>
  <ExtOrderId><xsl:value-of select="ExtOrderId"/></ExtOrderId>

<xsl:if  test="SysContractNum!=''" >
  <SysContractNum><xsl:value-of select="SysContractNum"/></SysContractNum>
</xsl:if>

  <ContractFlag><xsl:value-of select="ContractFlag"/></ContractFlag>

  <DocTypeCode><xsl:value-of select="DocTypeCode"/></DocTypeCode>

<xsl:if  test="FrameContractId!=''" >
  <FrameContractId><xsl:value-of select="FrameContractId"/></FrameContractId>
</xsl:if>
<VendorDocNum><xsl:value-of select="VendorDocNum"/></VendorDocNum>
<xsl:if  test="IntNum!=''" >
  <IntNum><xsl:value-of select="IntNum"/></IntNum>
</xsl:if>

<xsl:if  test="VendorId!=''" >
  <VendorId><xsl:value-of select="VendorId"/></VendorId>
</xsl:if>

 <VendorSiteId><xsl:value-of select="VendorSiteId"/></VendorSiteId>

 <OrgId><xsl:value-of select="OrgId"/></OrgId> 
 
<xsl:if  test="ContractDate!=''" >
  <ContractDate><xsl:value-of select="ContractDate"/></ContractDate>
</xsl:if>
<xsl:if  test="Reserve1!=''" >
  <Reserve1><xsl:value-of select="Reserve1"/></Reserve1>
</xsl:if>



<xsl:if  test="PartiesList!=''" >
<xsl:for-each select="PartiesList">
 <PartiesList>
 <xsl:for-each select="Parties">
 <Parties>
 				<PartyName><xsl:value-of select="PartyName"/></PartyName>
				<PartyId><xsl:value-of select="PartyId"/></PartyId>
 </Parties>
</xsl:for-each> <!-- Parties -->
 </PartiesList>
</xsl:for-each> <!-- PartiesList -->
</xsl:if>

<CycleList>
<xsl:for-each select="CycleList">

<xsl:for-each select="Cycle">
<Cycle>

 <ExtCycleId><xsl:value-of select="ExtCycleId"/></ExtCycleId>

<xsl:if  test="CycleId!=''" >
  <CycleId><xsl:value-of select="CycleId"/></CycleId>
</xsl:if>
<xsl:if  test="CycleName!=''" >
  <CycleName><xsl:value-of select="CycleName"/></CycleName>
</xsl:if>
 <StartDate><xsl:value-of select="StartDate"/></StartDate>
 <EndDate><xsl:value-of select="EndDate"/></EndDate>
 <TaxRate><xsl:value-of select="TaxRate"/></TaxRate>

<StageList>


<xsl:for-each select="StageList">

<xsl:for-each select="Stage">
<Stage>
            <StageType><xsl:value-of select="StageType"/></StageType>
            <OrgId><xsl:value-of select="OrgId"/></OrgId>
            <ExpenditureType/>
            <SusStageId><xsl:value-of select="SusStageId"/></SusStageId>
            <PlanDate><xsl:value-of select="PlanDate"/></PlanDate>
            <ProjectId><xsl:value-of select="ProjectId"/></ProjectId>
            
            <AmountIncludeTax><xsl:value-of select="AmountIncludeTax"/></AmountIncludeTax>
            <AmountNoTax><xsl:value-of select="AmountNoTax"/></AmountNoTax>
            <isIntegration><xsl:value-of select="isIntegration"/></isIntegration>
            <StageReserve><xsl:value-of select="StageReserve"/></StageReserve>
            <!--<extStageName><xsl:value-of select="extStageName"/></extStageName> -->
</Stage>
</xsl:for-each>  <!-- Stage -->

</xsl:for-each>  <!-- StageList -->


</StageList>
 <CycleReserve><xsl:value-of select="CycleReserve"/></CycleReserve>
</Cycle>
</xsl:for-each>  <!-- Cycle -->


</xsl:for-each>  <!-- CycleList -->
</CycleList>


<xsl:if  test="Description!=''" >
  <Description><xsl:value-of select="Description"/></Description>
</xsl:if>
<xsl:if  test="StartDate!=''" >
  <StartDate><xsl:value-of select="StartDate"/></StartDate>
</xsl:if>
<xsl:if  test="EndDate!=''" >
  <EndDate><xsl:value-of select="EndDate"/></EndDate>
</xsl:if>

<xsl:if  test="ContractSpecificsList!=''" >
<xsl:for-each select="ContractSpecificsList">
 <ContractSpecificsList>
 <xsl:for-each select="ContractSpecifics">
 <ContractSpecifics>
				<ExtLineId><xsl:value-of select="ExtLineId"/></ExtLineId>
				<LineNum><xsl:value-of select="LineNum"/></LineNum>
				<Code><xsl:value-of select="Code"/></Code>
				<Cost><xsl:value-of select="Cost"/></Cost>
				<Count><xsl:value-of select="Count"/></Count>
				<Rate><xsl:value-of select="Rate"/></Rate>
				<LineAmount><xsl:value-of select="LineAmount"/></LineAmount>
				<InvProject><xsl:value-of select="InvProject"/></InvProject>
				<Task><xsl:value-of select="Task"/></Task>
				<ExpenditureType><xsl:value-of select="ExpenditureType"/></ExpenditureType>
				<NewEquipment><xsl:value-of select="NewEquipment"/></NewEquipment>
				<ImpEquipment><xsl:value-of select="ImpEquipment"/></ImpEquipment>
				<isMark><xsl:value-of select="isMark"/></isMark>
				<VendorPosition><xsl:value-of select="VendorPosition"/></VendorPosition>
				<PackageUnit><xsl:value-of select="PackageUnit"/></PackageUnit>
				<Article><xsl:value-of select="Article"/></Article>
				<SpecificsReserve><xsl:value-of select="SpecificsReserve"/></SpecificsReserve>
 </ContractSpecifics>
</xsl:for-each> <!-- ContractSpecifics -->
 </ContractSpecificsList>
</xsl:for-each> <!--ContractSpecificsList -->
</xsl:if>

 </CycleOrder>
</xsl:for-each> <!-- CycleOrder -->
</urn1:ManageCycleOrderRequest>
</xsl:template>
</xsl:stylesheet>
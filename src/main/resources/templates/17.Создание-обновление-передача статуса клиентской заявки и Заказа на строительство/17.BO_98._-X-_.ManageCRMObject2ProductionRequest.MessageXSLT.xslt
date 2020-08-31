<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <urn1:ManageCRMObject2ProductionRequest xmlns:urn1="urn:ru:rt:crm:csmorderstate">
      <CRMObject2Production>
        <xsl:for-each select="CRMObject2Production">
          <SYSOrderNum>
            <xsl:value-of select="SYSOrderNum"/>
          </SYSOrderNum>
          <ObjectCode>
            <xsl:value-of select="ObjectCode"/>
          </ObjectCode>
          <xsl:if test="SYSContractId!=''">
            <SYSContractId>
              <xsl:value-of select="SYSContractId"/>
            </SYSContractId>
          </xsl:if>
          <xsl:if test="AgreementId!=''">
            <AgreementId>
              <xsl:value-of select="AgreementId"/>
            </AgreementId>
          </xsl:if>
          <xsl:if test="ContractorName!=''">
            <ContractorName>
              <xsl:value-of select="ContractorName"/>
            </ContractorName>
          </xsl:if>
          <OrgId>
            <xsl:value-of select="OrgId"/>
          </OrgId>
          <ShortProjectCode>
            <xsl:value-of select="ShortProjectCode"/>
          </ShortProjectCode>
          <ProjectCode>
            <xsl:value-of select="ProjectCode"/>
          </ProjectCode>
          <InvestorTaskDescr>
            <xsl:value-of select="InvestorTaskDescr"/>
          </InvestorTaskDescr>
          <MOLUser>
            <xsl:value-of select="MOLUser"/>
          </MOLUser>
          <CFO>
            <xsl:value-of select="CFO"/>
          </CFO>
          <Account>
            <xsl:value-of select="Account"/>
          </Account>
          <FixedAssetsType>
            <xsl:value-of select="FixedAssetsType"/>
          </FixedAssetsType>
          <xsl:if test="AssetsIdR12!=''">
            <RealtyAttribute>
              <xsl:value-of select="AssetsIdR12"/>
            </RealtyAttribute>
          </xsl:if>
          <AssetsCost>
            <xsl:value-of select="AssetsCost"/>
          </AssetsCost>
          <PlacedInServiceDate>
            <xsl:value-of select="PlacedInServiceDate"/>
          </PlacedInServiceDate>
        </xsl:for-each>
        <!--CRMObject2Production -->
      </CRMObject2Production>
    </urn1:ManageCRMObject2ProductionRequest>
  </xsl:template>
</xsl:stylesheet>
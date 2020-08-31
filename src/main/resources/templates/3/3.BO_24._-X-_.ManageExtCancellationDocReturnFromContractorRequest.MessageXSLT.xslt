<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<urn1:ManageExtCancellationDocReturnFromContractorRequest xmlns:urn1="urn:ru:rt:fuip:extstockmovementsmessage">
			<xsl:for-each select="ExtCancellationDocList">
				<ExtCancellationDocList>
					<xsl:for-each select="ExtCancellationDoc">
						<ExtCancellationDoc>
							<ExtCostId>
								<xsl:value-of select="ExtCostId"/>
							</ExtCostId>
							<xsl:if test="OrderId!=''">
								<OrderId>
									<xsl:value-of select="OrderId"/>
								</OrderId>
							</xsl:if>
							<ExtDocId>
								<xsl:value-of select="ExtDocId"/>
							</ExtDocId>
							<xsl:if test="InvLayerId!=''">
								<InvLayerId>
									<xsl:value-of select="InvLayerId"/>
								</InvLayerId>
							</xsl:if>
							<ExtDocNum>
								<xsl:value-of select="ExtDocNum"/>
							</ExtDocNum>
							<ExtDocDate>
								<xsl:value-of select="ExtDocDate"/>
							</ExtDocDate>
							<InventoryItemId>
								<xsl:value-of select="InventoryItemId"/>
							</InventoryItemId>
							<xsl:if test="SourceProjectId!=''">
								<SourceProjectId>
									<xsl:value-of select="SourceProjectId"/>
								</SourceProjectId>
							</xsl:if>
							<xsl:if test="SourceTaskId!=''">
								<SourceTaskId>
									<xsl:value-of select="SourceTaskId"/>
								</SourceTaskId>
							</xsl:if>
							<xsl:if test="ProjectId!=''">
								<ProjectId>
									<xsl:value-of select="ProjectId"/>
								</ProjectId>
							</xsl:if>
							<xsl:if test="TaskId!=''">
								<TaskId>
									<xsl:value-of select="TaskId"/>
								</TaskId>
							</xsl:if>
							<xsl:if test="ObjectCode!=''">
								<ObjectCode>
									<xsl:value-of select="ObjectCode"/>
								</ObjectCode>
							</xsl:if>
							<SourceSubInventoryCode>
								<xsl:value-of select="SourceSubInventoryCode"/>
							</SourceSubInventoryCode>
							<SourceMOL>
								<xsl:value-of select="SourceMOL"/>
							</SourceMOL>
							<xsl:if test="SourceContractor!=''">
								<SourceContractor>
									<xsl:value-of select="SourceContractor"/>
								</SourceContractor>
							</xsl:if>
							<xsl:if test="SubInventoryCode!=''">
								<SubInventoryCode>
									<xsl:value-of select="SubInventoryCode"/>
								</SubInventoryCode>
							</xsl:if>
							<xsl:if test="MOL!=''">
								<MOL>
									<xsl:value-of select="MOL"/>
								</MOL>
							</xsl:if>
							<xsl:if test="Contractor!=''">
								<Contractor>
									<xsl:value-of select="Contractor"/>
								</Contractor>
							</xsl:if>
							<TransUnit>
								<xsl:value-of select="TransUnit"/>
							</TransUnit>
							<TransQuantity>
								<xsl:value-of select="TransQuantity"/>
							</TransQuantity>
							<TransCost>
								<xsl:value-of select="TransCost"/>
							</TransCost>
							<TransValue>
								<xsl:value-of select="TransValue"/>
							</TransValue>
							<EqStatus>
								<xsl:value-of select="EqStatus"/>
							</EqStatus>
							<OrgId>
								<xsl:value-of select="OrgId"/>
							</OrgId>
							<xsl:if test="TransferOrgId!=''">
								<TransferOrgId>
									<xsl:value-of select="TransferOrgId"/>
								</TransferOrgId>
							</xsl:if>
							<xsl:if test="TransId!=''">
								<TransId>
									<xsl:value-of select="TransId"/>
								</TransId>
							</xsl:if>
							<xsl:if test="ExpenditureType!=''">
								<ExpenditureType>
									<xsl:value-of select="ExpenditureType"/>
								</ExpenditureType>
							</xsl:if>
							<ExtSourceLineId>
								<xsl:value-of select="ExtSourceLineId"/>
							</ExtSourceLineId>
							<xsl:if test="WorkAcc!=''">
								<WorkAcc>
									<xsl:value-of select="WorkAcc"/>
								</WorkAcc>
							</xsl:if>
						</ExtCancellationDoc>
					</xsl:for-each>
				</ExtCancellationDocList>
			</xsl:for-each>
		</urn1:ManageExtCancellationDocReturnFromContractorRequest>
	</xsl:template>
</xsl:stylesheet>
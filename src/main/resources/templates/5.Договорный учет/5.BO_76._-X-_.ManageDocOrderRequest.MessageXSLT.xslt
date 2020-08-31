<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<urn1:ManageDocOrderRequest xmlns:urn1="urn:ru:rt:fuip:contractaccordermessage">
			<xsl:for-each select="DocOrder">
				<DocOrder>
					<ExtCycleId>
						<xsl:value-of select="ExtCycleId"/>
					</ExtCycleId>
					<xsl:if test="SysOrderNum!=''">
						<SysOrderNum>
							<xsl:value-of select="SysOrderNum"/>
						</SysOrderNum>
					</xsl:if>
					<xsl:if test="RequestId!=''">
					<RequestId>
						<xsl:value-of select="RequestId"/>
					</RequestId>
					</xsl:if>
					<xsl:if test="OrderDate!=''">
						<OrderDate>
							<xsl:value-of select="OrderDate"/>
						</OrderDate>
					</xsl:if>
					<OrderType>
						<xsl:value-of select="OrderType"/>
					</OrderType>
					<xsl:if test="StartDate!=''">
						<StartDate>
							<xsl:value-of select="StartDate"/>
						</StartDate>
					</xsl:if>
					<xsl:if test="EndDate!=''">
						<EndDate>
							<xsl:value-of select="EndDate"/>
						</EndDate>
					</xsl:if>
					<xsl:if test="FrameContractId!=''">
						<FrameContractId>
							<xsl:value-of select="FrameContractId"/>
						</FrameContractId>
					</xsl:if>
					<CapitalCostCode>
						<xsl:value-of select="CapitalCostCode"/>
					</CapitalCostCode>
					<xsl:if test="Description!=''">
						<Description>
							<xsl:value-of select="Description"/>
						</Description>
					</xsl:if>
					<OrgId>
						<xsl:value-of select="OrgId"/>
					</OrgId>
					<DocStageList>
						<xsl:for-each select="DocStageList">
							<xsl:for-each select="DocStage">
								<DocStage>
													<ExtStageId>
														<xsl:value-of select="ExtStageId"/>
													</ExtStageId>
													<xsl:if test="StageId!=''">
														<StageId>
															<xsl:value-of select="StageId"/>
														</StageId>
													</xsl:if>
													<StageType>
														<xsl:value-of select="StageType"/>
													</StageType>
													<ExpenditureType>
														<xsl:value-of select="ExpenditureType"/>
													</ExpenditureType>
													<xsl:if test="TaskId!=''">
														<TaskId>
															<xsl:value-of select="TaskId"/>
														</TaskId>
													</xsl:if>
													<PlanDate>
														<xsl:value-of select="PlanDate"/>
													</PlanDate>
													<AmountNoTax>
														<xsl:value-of select="AmountNoTax"/>
													</AmountNoTax>
													<AmountIncludeTax>
														<xsl:value-of select="AmountIncludeTax"/>
													</AmountIncludeTax>
													<xsl:if test="Description!=''">
														<Description>
															<xsl:value-of select="Description"/>
														</Description>
													</xsl:if>
													<xsl:if test="BudgetItemCode!=''">
														<BudgetItemCode>
															<xsl:value-of select="BudgetItemCode"/>
														</BudgetItemCode>
													</xsl:if>
													<OrgId>
														<xsl:value-of select="OrgId"/>
													</OrgId>
													<ProjectId>
														<xsl:value-of select="ProjectId"/>
													</ProjectId>
								</DocStage>
								</xsl:for-each>
								<!-- DocStage -->
						  </xsl:for-each>
						  <!-- DocStageList -->
						</DocStageList>
				</DocOrder>
			</xsl:for-each>
			<!-- DocOrder -->
		</urn1:ManageDocOrderRequest>
	</xsl:template>
</xsl:stylesheet>
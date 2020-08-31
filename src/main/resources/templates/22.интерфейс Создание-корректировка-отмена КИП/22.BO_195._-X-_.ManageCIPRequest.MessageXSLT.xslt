<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
<urn1:ManageCIPRequest xmlns:urn1="urn:ru:rt:fuip:investplanmessage">
 <xsl:for-each select="CIP">
		<CIP>
			<!--Optional:-->
			<!--type: string
			<ProjectCode>gero et</ProjectCode> -->
					<xsl:if test="ProjectCode!=''">
						<ProjectCode>
							<xsl:value-of select="ProjectCode"/>
						</ProjectCode>
					</xsl:if>
			<!--Optional:-->
			<!--type: string-->
					<xsl:if test="ProjectCodeParent!=''">
						<ProjectCodeParent>
							<xsl:value-of select="ProjectCodeParent"/>
						</ProjectCodeParent>
					</xsl:if>

			<!--type: integer-->
			<ExtCIPProjectId><xsl:value-of select="ExtCIPProjectId"/></ExtCIPProjectId>
			<!--type: string-->
			<ExtCIPProjectUrl><xsl:value-of select="ExtCIPProjectUrl"/></ExtCIPProjectUrl>
			<!--anonymous type - enumeration: [Create,Update,Cancel]-->
			<StageType><xsl:value-of select="StageType"/></StageType>
			<!--type: string-->
			<ProjectName><xsl:value-of select="ProjectName"/></ProjectName>
			<!--type: integer-->
			<OrgId><xsl:value-of select="OrgId"/></OrgId>
			<!--type: string-->
			<EmplName><xsl:value-of select="EmplName"/></EmplName>
			<!--type: string-->
			<EmplEmail><xsl:value-of select="EmplEmail"/></EmplEmail>
			<!--type: integer-->
			<InvestType><xsl:value-of select="InvestType"/></InvestType>
			<!--type: integer-->
			<ClassCode><xsl:value-of select="ClassCode"/></ClassCode>
			<!--type: string-->
			<CentralProject><xsl:value-of select="CentralProject"/></CentralProject>
<xsl:if test="InterMRF!=''">
			<!--type: string-->
			<InterMRF><xsl:value-of select="InterMRF"/></InterMRF>
</xsl:if>
			<!--type: string-->
			<CFO><xsl:value-of select="CFO"/></CFO>
			<!--type: string-->
			<CFOInitiator><xsl:value-of select="CFOInitiator"/></CFOInitiator>
			<!--type: string-->
			<Programm><xsl:value-of select="Programm"/></Programm>
			<!--type: dateTime-->
			<StartDate><xsl:value-of select="StartDate"/></StartDate>
			<!--type: dateTime-->
			<EndDate><xsl:value-of select="EndDate"/></EndDate>
							

			<!--type: decimal-->
			<AmountNPV><xsl:value-of select="AmountNPV"/></AmountNPV>
			<!--type: decimal-->
			<AmountIRR><xsl:value-of select="AmountIRR"/></AmountIRR>
							

			<!--type: decimal-->
			<AmountPP><xsl:value-of select="AmountPP"/></AmountPP>

			<!--type: decimal-->
			<AmountPI><xsl:value-of select="AmountPI"/></AmountPI>

			<!--Optional:-->
			<xsl:for-each select="BudgetsList">
			<BudgetsList>
				<!--1 or more repetitions:-->
				<xsl:for-each select="Budgets">
				<Budgets>
					<!--type: integer-->
					<Year><xsl:value-of select="Year"/></Year>

					<!--Optional:-->
					<!--type: integer-->
					<xsl:if test="Month!=''">
						<Month><xsl:value-of select="Month"/></Month>
                                        </xsl:if>
					<!--type: integer-->
					<OperEx><xsl:value-of select="OperEx"/></OperEx>

					<!--Optional:-->
					<!--type: decimal-->
					<xsl:if test="NPVYear!=''">
						<NPVYear><xsl:value-of select="NPVYear"/></NPVYear>
                                        </xsl:if>

				<xsl:for-each select="ResourceIPList">
					<ResourceIPList>
						<!--1 or more repetitions:-->
					<xsl:for-each select="ResourceIP">
						<ResourceIP>
							<!--Optional:-->
							<!--type: string-->
						<xsl:if test="ResourceName!=''">
							<ResourceName><xsl:value-of select="ResourceName"/></ResourceName>
						</xsl:if>
							<!--Optional:-->
							<!--type: integer-->
						<xsl:if test="ResourceId!=''">
							<ResourceId><xsl:value-of select="ResourceId"/></ResourceId>
	                                        </xsl:if>
							<!--Optional:-->
							<!--type: string-->
						<xsl:if test="ProductionType!=''">
							<ProductionType><xsl:value-of select="ProductionType"/></ProductionType>
                	                        </xsl:if>
							<!--type: decimal-->
							<Amount><xsl:value-of select="Amount"/></Amount>

						</ResourceIP>
			 		</xsl:for-each> <!-- ResourceIP -->						

					</ResourceIPList>
			 		</xsl:for-each> <!-- ResourceIPList -->						


                                         <xsl:for-each select="ResourceFAList">
					<ResourceFAList>
						<!--1 or more repetitions:-->
                                         <xsl:for-each select="ResourceFA">
						<ResourceFA>
							<!--Optional:-->
							<!--type: string-->
						<xsl:if test="ResourceName!=''">
							<ResourceName><xsl:value-of select="ResourceName"/></ResourceName>
						</xsl:if>
							<!--Optional:-->
							<!--type: integer-->
						<xsl:if test="ResourceId!=''">
							<ResourceId><xsl:value-of select="ResourceId"/></ResourceId>
						</xsl:if>
							<!--Optional:-->
							<!--type: decimal-->
							<Amount><xsl:value-of select="Amount"/></Amount>
						</ResourceFA>
			 		</xsl:for-each> <!-- ResourceFA -->						

					</ResourceFAList>
			 		</xsl:for-each> <!-- ResourceFAList -->						

                                         <xsl:for-each select="ResourceCFList">
					<ResourceCFList>
						<!--1 or more repetitions:-->
                                           <xsl:for-each select="ResourceCF">
						<ResourceCF>
							<!--Optional:-->
							<!--type: string-->
						<xsl:if test="ResourceName!=''">
							<ResourceName><xsl:value-of select="ResourceName"/></ResourceName>
						</xsl:if>
							<!--Optional:-->
							<!--type: integer-->
						<xsl:if test="ResourceId!=''">
							<ResourceId><xsl:value-of select="ResourceId"/></ResourceId>
						</xsl:if>
							<!--type: string-->
							<Action><xsl:value-of select="Action"/></Action>
							<!--type: decimal-->
							<Amount><xsl:value-of select="Amount"/></Amount>

						</ResourceCF>
					</xsl:for-each> <!-- ResourceCF -->						
					</ResourceCFList>
			 		</xsl:for-each> <!-- ResourceCFList -->						
                                        <xsl:for-each select="ResourceNATList">
					<ResourceNATList>
                                        <xsl:for-each select="ResourceNAT">
						<!--1 or more repetitions:-->
						<ResourceNAT>
							<!--type: integer-->
							<ResourceId><xsl:value-of select="ResourceId"/></ResourceId>

							<!--type: decimal-->
							<Amount><xsl:value-of select="Amount"/></Amount>

							<!--type: integer-->
							<Quantity><xsl:value-of select="Quantity"/></Quantity>

						</ResourceNAT>
			 		</xsl:for-each> <!-- ResourceNATL -->

					</ResourceNATList>
			 		</xsl:for-each> <!-- ResourceNATList -->
						
                                         <xsl:for-each select="ResourceEFList">
					<ResourceEFList>
						<!--1 or more repetitions:-->
                                         <xsl:for-each select="ResourceEF">
						<ResourceEF>
							<!--type: integer-->
							<ServiceCode><xsl:value-of select="ServiceCode"/></ServiceCode>

							<!--type: string-->
							<Action><xsl:value-of select="Action"/></Action>

							<!--type: string-->
							<Business><xsl:value-of select="Business"/></Business>

							<!--type: integer-->
							<SBinc><xsl:value-of select="SBinc"/></SBinc>

							<!--Optional:-->
							<!--type: integer-->
						<xsl:if test="ResourceId!=''">
							<SBmig><xsl:value-of select="SBmig"/></SBmig>
						</xsl:if>

							<!--type: string-->
							<RevenueType><xsl:value-of select="RevenueType"/></RevenueType>

							<!--type: integer-->
							<ARPU><xsl:value-of select="ARPU"/></ARPU>

							<!--type: decimal-->
							<REV><xsl:value-of select="REV"/></REV>
						</ResourceEF>
				</xsl:for-each> <!-- ResourceEF -->						
					</ResourceEFList>
				</xsl:for-each> <!-- ResourceEFList -->						
				</Budgets>
				</xsl:for-each> <!-- Budgets -->						
			</BudgetsList>
			</xsl:for-each> <!-- BudgetsList -->

		</CIP>
	</xsl:for-each> <!-- CIP -->	
</urn1:ManageCIPRequest>
	</xsl:template>
</xsl:stylesheet>
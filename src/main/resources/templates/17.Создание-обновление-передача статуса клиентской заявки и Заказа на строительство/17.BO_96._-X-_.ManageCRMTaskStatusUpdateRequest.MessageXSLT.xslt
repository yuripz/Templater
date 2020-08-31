<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<urn1:ManageCRMTaskStatusUpdateRequest xmlns:urn1="urn:ru:rt:crm:csmorderstatemessage">
			<CRMTaskStatusUpdate>
				<xsl:for-each select="CRMTaskStatusUpdate">
					<CRMRequestTaskList>
						<xsl:for-each select="CRMRequestIdList">
							<xsl:for-each select="CRMRequest">
								<CRMRequestTask>
									<CRMRequestId>
									<xsl:value-of select="CRMRequestId"/>
								   </CRMRequestId>
									<SinglePayment>
									<xsl:value-of select="SinglePayment"/>
								   </SinglePayment>
									<MonthRevenue>
									<xsl:value-of select="MonthRevenue"/>
									</MonthRevenue>
									<Discount>
									<xsl:value-of select="Discount"/>
									</Discount>
									<SourceRequest><xsl:value-of select="SourceRequest"/></SourceRequest>
									<ServiceType><xsl:value-of select="ServiceType"/></ServiceType>
								</CRMRequestTask>
							</xsl:for-each>
						</xsl:for-each>
						<!-- CRMRequestTaskList -->
					</CRMRequestTaskList>
					<CRMRequestStatus>
						<xsl:value-of select="CRMRequestStatus"/>
					</CRMRequestStatus>
		<SYSOrderStage><xsl:value-of select="SYSOrderStage"/></SYSOrderStage>
		<SYSOrderStageCode><xsl:value-of select="SYSOrderStageCode"/></SYSOrderStageCode>
					<xsl:if test="ConnectTechnology!=''">
						<ConnectTechnology>
							<xsl:value-of select="ConnectTechnology"/>
						</ConnectTechnology>
					</xsl:if>
					<xsl:if test="ConnectTechnologyID!=''">
						<ConnectTechnologyID>
							<xsl:value-of select="ConnectTechnologyID"/>
						</ConnectTechnologyID>
					</xsl:if>
					<xsl:if test="CancelReason!=''">
						<CancelReason>
							<xsl:value-of select="CancelReason"/>
						</CancelReason>
					</xsl:if>
					<xsl:if test="GoToCommentOrder!=''">
						<GoToCommentOrder>
							<xsl:value-of select="GoToCommentOrder"/>
						</GoToCommentOrder>
					</xsl:if>
		<ComComment><xsl:value-of select="ComComment"/></ComComment>					
		<SYSOrderNum><xsl:value-of select="SYSOrderNum"/></SYSOrderNum>
		<SMRCost><xsl:value-of select="SMRCost"/></SMRCost>
		<ProjectCost><xsl:value-of select="ProjectCost"/></ProjectCost>
		<OtherCost><xsl:value-of select="OtherCost"/></OtherCost>
		<EquipmentCost><xsl:value-of select="EquipmentCost"/></EquipmentCost>

		<EquipmentName><xsl:value-of select="EquipmentName"/></EquipmentName>
		<Point1Name><xsl:value-of select="Point1Name"/></Point1Name>
		<Point1Address><xsl:value-of select="Point1Address"/></Point1Address>
		<Point1Interface><xsl:value-of select="Point1Interface"/></Point1Interface>
		<Point1Equipment><xsl:value-of select="Point1Equipment"/></Point1Equipment>
		<Point3Name><xsl:value-of select="Point3Name"/></Point3Name>
		<Point3Address><xsl:value-of select="Point3Address"/></Point3Address>
		<Point3Interface><xsl:value-of select="Point3Interface"/></Point3Interface>
		<Point3Equipment><xsl:value-of select="Point3Equipment"/></Point3Equipment>		
		
	<InCanalization><xsl:value-of select="InCanalization"/></InCanalization>
	<AirCable><xsl:value-of select="AirCable"/></AirCable>
	<GroundCable><xsl:value-of select="GroundCable"/></GroundCable>
	<BuildCanalization><xsl:value-of select="BuildCanalization"/></BuildCanalization>
	<NeedHole><xsl:value-of select="NeedHole"/></NeedHole>
	<TechSolLifetime><xsl:value-of select="TechSolLifetime"/></TechSolLifetime>
	<ImplPeriod><xsl:value-of select="ImplPeriod"/></ImplPeriod>
	<WorkMethod><xsl:value-of select="WorkMethod"/></WorkMethod>
	<Contractor><xsl:value-of select="Contractor"/></Contractor>
	<ApprovalDetailing><xsl:value-of select="ApprovalDetailing"/></ApprovalDetailing>
	<TVready><xsl:value-of select="TVready"/></TVready>
	<Point2LInchOrgMethod><xsl:value-of select="Point2LInchOrgMethod"/></Point2LInchOrgMethod>

 <!-- HE-3925  -->
 <specialNotes><xsl:value-of select="SpecialNotes"/>
</specialNotes>
<ProjectSolution><xsl:value-of select="ProjectSolution"/>
</ProjectSolution>
 <RegionalFilial><xsl:value-of select="RegionalFilial"/>
 </RegionalFilial>
  <buildingState><xsl:value-of select="OrderOMSPTV/buildingState"/>
 </buildingState>

		<xsl:if test="SYSOrderServicesAddr!=''">
		<SYSOrderServicesAddr>
		<xsl:for-each select="SYSOrderServicesAddr">

			<GlobalAddrId><xsl:value-of select="GlobalAddrId"/></GlobalAddrId>
			<KLADRLocalityId><xsl:value-of select="KLADRLocalityId"/></KLADRLocalityId>
			<KLADRStreetId><xsl:value-of select="KLADRStreetId"/></KLADRStreetId>
			<Street><xsl:value-of select="Street"/></Street>
			<StreetKind><xsl:value-of select="StreetKind"/></StreetKind>
			<House><xsl:value-of select="House"/></House>
			<HouseLitera><xsl:value-of select="HouseLitera"/></HouseLitera>
			<CornerHouse><xsl:value-of select="CornerHouse"/></CornerHouse>
			<BuildingBlock><xsl:value-of select="BuildingBlock"/></BuildingBlock>
			<BuildingBlockLitera><xsl:value-of select="BuildingBlockLitera"/></BuildingBlockLitera>
			<Building><xsl:value-of select="Building"/></Building>
			<BuildingLitera><xsl:value-of select="BuildingLitera"/></BuildingLitera>
			<Ownership><xsl:value-of select="Ownership"/></Ownership>
			<OwnershipLitera><xsl:value-of select="OwnershipLitera"/></OwnershipLitera>
			<AddrComment><xsl:value-of select="AddrComment"/></AddrComment>
			</xsl:for-each>
		</SYSOrderServicesAddr>
	   </xsl:if>
		<xsl:if test="SYSProjectAnalytics!=''">
		<SYSProjectAnalytics>
		<xsl:for-each select="SYSProjectAnalytics">
			<SYSProjectNum><xsl:value-of select="SYSProjectNum"/></SYSProjectNum>
			<SYSProjectURL><xsl:value-of select="SYSProjectURL"/></SYSProjectURL>
			<ConstructionCost><xsl:value-of select="ConstructionCost"/></ConstructionCost>
			<ProjectPaybackPeriod><xsl:value-of select="ProjectPaybackPeriod"/></ProjectPaybackPeriod>
			<ProjectPaybackPeriodAll><xsl:value-of select="ProjectPaybackPeriodAll"/></ProjectPaybackPeriodAll>
			<NDS_Tax><xsl:value-of select="NDS_Tax"/></NDS_Tax>
		</xsl:for-each>
		</SYSProjectAnalytics>
	   </xsl:if>	

					<ChangeStatusDate>
						<xsl:value-of select="ChangeStatusDate"/>
					</ChangeStatusDate>
					<UsrLogin>
						<xsl:value-of select="UsrLogin"/>
					</UsrLogin>
					<StatusSYSUsrName>
						<xsl:value-of select="StatusSYSUsrName"/>
					</StatusSYSUsrName>
					<StatusSYSUsrEMail>
						<xsl:value-of select="StatusSYSUsrEMail"/>
					</StatusSYSUsrEMail>

					<xsl:if test="RequestAttachmentList!=''">
						<RequestAttachmentList>
							<xsl:for-each select="RequestAttachmentList">
									<xsl:for-each select="RequestAttachment">
            								<RequestAttachment>
										<xsl:if test="AttachmentBarCode!=''">
											<AttachmentBarCode>
												<xsl:value-of select="AttachmentBarCode"/>
											</AttachmentBarCode>
										</xsl:if>
										<xsl:if test="AttachmentBarCode=''">
											<AttachmentBarCode>000000000000</AttachmentBarCode>
										</xsl:if>
										<xsl:if test="AttachmentURL!=''">
											<AttachmentURL>
												<xsl:value-of select="AttachmentURL"/>
											</AttachmentURL>
										</xsl:if>
										<xsl:if test="AttachmenCategory!=''">
											<AttachmentCategory>
												<xsl:value-of select="AttachmentCategory"/>
											</AttachmentCategory>
										</xsl:if>
										<xsl:if test="AttachmentName!=''">
											<AttachmentName>
												<xsl:value-of select="AttachmentName"/>
											</AttachmentName>
										</xsl:if>
    								           </RequestAttachment>
 								           </xsl:for-each>
                    							   <!--RequestAttacment -->
							</xsl:for-each>
							<!--RequestAttacmentList -->
						</RequestAttachmentList>
					</xsl:if>
				</xsl:for-each>
				<!--CRMTaskStatusUpdate -->
			</CRMTaskStatusUpdate>
		</urn1:ManageCRMTaskStatusUpdateRequest>
	</xsl:template>
</xsl:stylesheet>
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<urn1:ManageCRMOrderUpdateRequest xmlns:urn1="urn:ru:rt:crm:csmorderstatemessage">
			<CRMOrderUpdate>
				<xsl:for-each select="CRMOrderUpdate">
					<SYSOrderNum>
						<xsl:value-of select="SYSOrderNum"/>
					</SYSOrderNum>
					<SYSOrderStatus>
						<xsl:value-of select="SYSOrderStatus"/>
					</SYSOrderStatus>
					<SYSOrderStageCode>
						<xsl:value-of select="SYSOrderStageCode"/>
					</SYSOrderStageCode>
					<SYSOrderStage>
						<xsl:value-of select="SYSOrderStage"/>
					</SYSOrderStage>
					<xsl:if test="SYSOrderComment!=''">
						<SYSOrderComment>
							<xsl:value-of select="SYSOrderComment"/>
						</SYSOrderComment>
					</xsl:if>
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
					<WorkMethod>
						<xsl:value-of select="WorkMethod"/>
					</WorkMethod>
					<xsl:if test="Contractor!=''">
						<Contractor>
							<xsl:value-of select="Contractor"/>
						</Contractor>
					</xsl:if>
					<xsl:if test="AgreementId!=''">
						<AgreementId>
							<xsl:value-of select="AgreementId"/>
						</AgreementId>
					</xsl:if>
					<xsl:if test="AgreementDate!=''">
						<AgreementDate>
							<xsl:value-of select="AgreementDate"/>
						</AgreementDate>
					</xsl:if>
					<xsl:if test="ConstructionCost!=''">
						<ConstructionCost>
							<xsl:value-of select="ConstructionCost"/>
						</ConstructionCost>
					</xsl:if>
					<xsl:if test="ProjectCost!=''">
						<ProjectCost>
							<xsl:value-of select="ProjectCost"/>
						</ProjectCost>
					</xsl:if>
					<xsl:if test="AgreementCost!=''">
						<AgreementCost>
							<xsl:value-of select="AgreementCost"/>
						</AgreementCost>
					</xsl:if>
					<xsl:if test="EquipmentCost!=''">
						<EquipmentCost>
							<xsl:value-of select="EquipmentCost"/>
						</EquipmentCost>
					</xsl:if>
					<xsl:if test="OtherCost!=''">
						<OtherCost>
							<xsl:value-of select="OtherCost"/>
						</OtherCost>
					</xsl:if>
					<xsl:if test="PaybackPeriod!=''">
						<PaybackPeriod>
							<xsl:value-of select="PaybackPeriod"/>
						</PaybackPeriod>
					</xsl:if>
					<xsl:if test="R12ShortProjectcode!=''">
						<R12ShortProjectcode>
							<xsl:value-of select="R12ShortProjectcode"/>
						</R12ShortProjectcode>
					</xsl:if>
					<xsl:if test="R12Projectcode!=''">
						<R12Projectcode>
							<xsl:value-of select="R12Projectcode"/>
						</R12Projectcode>
					</xsl:if>
					<xsl:if test="SYSUsrLogin!=''">
						<SYSUsrLogin>
							<xsl:value-of select="SYSUsrLogin"/>
						</SYSUsrLogin>
					</xsl:if>
					<xsl:if test="SYSUsrName!=''">
						<SYSUsrName>
							<xsl:value-of select="SYSUsrName"/>
						</SYSUsrName>
					</xsl:if>
					<xsl:if test="SYSUsrEMail!=''">
						<SYSUsrEMail>
							<xsl:value-of select="SYSUsrEMail"/>
						</SYSUsrEMail>
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
					<xsl:if test="IsWorkaround!=''">
						<IsWorkaround>
							<xsl:value-of select="IsWorkaround"/>
						</IsWorkaround>
					</xsl:if>
					<xsl:if test="StatusDateTime!=''">
						<StatusDateTime>
							<xsl:value-of select="StatusDateTime"/>
						</StatusDateTime>
					</xsl:if>
					<xsl:if test="StatusSYSUsrLogin!=''">
						<StatusSYSUsrLogin>
							<xsl:value-of select="StatusSYSUsrLogin"/>
						</StatusSYSUsrLogin>
					</xsl:if>
					<xsl:if test="StatusSYSUsrName!=''">
						<StatusSYSUsrName>
							<xsl:value-of select="StatusSYSUsrName"/>
						</StatusSYSUsrName>
					</xsl:if>
					<xsl:if test="StatusSYSUsrEMail!=''">
						<StatusSYSUsrEMail>
							<xsl:value-of select="StatusSYSUsrEMail"/>
						</StatusSYSUsrEMail>
					</xsl:if>
					<CRMRequestList>
						<xsl:for-each select="CRMRequestList">
							<xsl:for-each select="CRMRequest">
								<CRMRequest>
									<CRMRequestId>
										<xsl:value-of select="CRMRequestId"/>
									</CRMRequestId>
									<CRMOrderId>
										<xsl:value-of select="CRMOrderId"/>
									</CRMOrderId>
									<ServiceType>
										<xsl:value-of select="ServiceType"/>
									</ServiceType>
									<SinglePayment>
										<xsl:value-of select="SinglePayment"/>
									</SinglePayment>
									<MonthRevenue>
										<xsl:value-of select="MonthRevenue"/>
									</MonthRevenue>
									<Discount>
										<xsl:value-of select="Discount"/>
									</Discount>
									<SrvComment>
										<xsl:value-of select="SrvComment"/>
									</SrvComment>
									<SourceRequest>
										<xsl:value-of select="SourceRequest"/>
									</SourceRequest>
									<xsl:if test="RequestAttachmentList!=''">
										<RequestAttacmentList>
											<xsl:for-each select="RequestAttachmentList">
												<RequestAttachment>
													<xsl:for-each select="RequestAttachment">
														<xsl:if test="BarCode!=''">
															<BarCode>
																<xsl:value-of select="BarCode"/>
															</BarCode>
														</xsl:if>
														<xsl:if test="Category!=''">
															<Category>
																<xsl:value-of select="Category"/>
															</Category>
														</xsl:if>
													</xsl:for-each>
												</RequestAttachment>
											</xsl:for-each>
											<!--RequestAttacmentList -->
										</RequestAttacmentList>
									</xsl:if>
								</CRMRequest>
							</xsl:for-each>
							<!--CRMRequest-->
						</xsl:for-each>
						<!--CRMRequestIdList-->
					</CRMRequestList>
				</xsl:for-each>
				<!--CRMOrderUpdate -->
			</CRMOrderUpdate>
		</urn1:ManageCRMOrderUpdateRequest>
	</xsl:template>
</xsl:stylesheet>
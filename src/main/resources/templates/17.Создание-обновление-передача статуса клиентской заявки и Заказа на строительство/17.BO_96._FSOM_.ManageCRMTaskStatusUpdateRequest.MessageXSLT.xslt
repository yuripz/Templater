<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<tns:orderStatusNotification xmlns:tns="http://oms.rt.ru/">
			<originator>HERMES</originator>
			<receiver>
				<xsl:value-of select="/CRMTaskStatusUpdate/MsgDirection_Cod"/>
			</receiver>
			<orderResult>
				<orderResultCode>
					<xsl:if test="/CRMTaskStatusUpdate/CancelReason!=''">
						<xsl:value-of select="/CRMTaskStatusUpdate/CancelReason"/>
					</xsl:if>
					<xsl:if test="/CRMTaskStatusUpdate/CancelReason=''">0</xsl:if>
				</orderResultCode>
				<orderResultText>
					<xsl:value-of select="/CRMTaskStatusUpdate/GoToCommentOrder"/>
					<!-- было <xsl:if test="CRMTaskStatusUpdate/CRMRequestStatus!=''"><xsl:value-of select="CRMTaskStatusUpdate/CRMRequestStatus"/></xsl:if>-->
				</orderResultText>
				<xsl:if test="CRMTaskStatusUpdate/CRMRequestStatus=''">
					<orderResultText>DO UPDATE ORDER</orderResultText>
				</xsl:if>
			</orderResult>
			<xsl:if test="CRMTaskStatusUpdate/QueueId!=''">
				<requestId>
					<xsl:value-of select="CRMTaskStatusUpdate/QueueId"/>
				</requestId>
			</xsl:if>
			<xsl:if test="CRMTaskStatusUpdate/QueueId=''">
				<requestId>0-0-0-0</requestId>
			</xsl:if>
			<order>
				<xsl:for-each select="CRMTaskStatusUpdate">
					<orderId>
						<xsl:value-of select="CRMOrderId"/>
					</orderId>
					<orderOMSId>
						<xsl:value-of select="OrderOMSId"/>
					</orderOMSId>
					<orderStartDate>2020-03-16T10:41:41+03:00</orderStartDate>
					<orderExpectedCompletionDate>2020-03-16T10:41:41+03:00</orderExpectedCompletionDate>
					<orderCompletionDate>2020-03-16T10:41:41+03:00</orderCompletionDate>
					<xsl:variable name="orderStateF" select="CRMRequestStatus"/>
					<xsl:choose>
						<xsl:when test="$orderStateF= 'CANCEL' ">
							<orderState>CANCELLED</orderState>
						</xsl:when>
						<xsl:when test="$orderStateF= 'FAILED' ">
							<orderState>FAILED</orderState>
						</xsl:when>
						<xsl:when test="$orderStateF= 'COMPLETE' ">
							<orderState>COMPLETED</orderState>
						</xsl:when>
						<xsl:otherwise>
							<orderState>INPROGRESS</orderState>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:if test="CRMRequestStatus!='CANCEL' and CRMRequestStatus!='FAILED' and CRMRequestStatus!= 'COMPLETE'">
					<orderNotifications>
						<orderNotification>
							<notificationTimestamp>
								<xsl:value-of select="ChangeStatusDate"/>
							</notificationTimestamp>
							<notificationStatus>MANUAL</notificationStatus>
							<notificationText>
								<xsl:value-of select="SYSOrderStage"/>								
							</notificationText>
						</orderNotification>
					</orderNotifications>
					</xsl:if>
					<orderComments>
						<Comment>
							<text>
								<xsl:value-of select="GoToCommentOrder"/>
							</text>
						</Comment>
					</orderComments>
					<orderParties>
						<orderParty>
							<partyRole>KZ</partyRole>
							<partyId>
								<xsl:value-of select="OrderOMSId"/>
							</partyId>
							<partyAttributes>
								<attribute name="stage">
									<xsl:value-of select="SYSOrderStage"/>
								</attribute>
								<attribute name="reason">
									<xsl:value-of select="CancelReason"/>
								</attribute>
								<attribute name="comment">
									<xsl:value-of select="HrmsSYSOrderComment"/>
								</attribute>
								<attribute name="url">https://hermes-test.rt.ru/aggregator/<xsl:value-of select="OrderOMSId"/>
								</attribute>
							</partyAttributes>
						</orderParty>
						<orderParty>
							<partyRole>KP</partyRole>
							<partyId>
								<xsl:value-of select="/CRMTaskStatusUpdate/SYSProjectAnalytics/SYSProjectNum"/>
							</partyId>
							<partyAttributes>
								<attribute name="ROI">
									<xsl:value-of select="/CRMTaskStatusUpdate/SYSProjectAnalytics/ProjectPaybackPeriod"/>
								</attribute>
							</partyAttributes>
						</orderParty>
						<orderParty>
							<partyRole>WORKER</partyRole>
							<partyName>
								<xsl:value-of select="StatusSYSUsrName"/>
							</partyName>
							<partyAttributes>
								<attribute name="email">
									<xsl:value-of select="StatusSYSUsrEMail"/>
								</attribute>
							</partyAttributes>
						</orderParty>
						<xsl:if test="/CRMTaskStatusUpdate/PTVResult='1'">
							<xsl:for-each select="LastPTVInfo">
								<xsl:for-each select="LastPTVCap">
									<orderParty>
										<partyRole>SOLUTION</partyRole>
										<partyId>
											<xsl:value-of select="/CRMTaskStatusUpdate/OrderOMSId"/>
										</partyId>
										<partyAttributes>
											<xsl:if test="IS_CURRENT='1'">
												<attribute name="isMain">true</attribute>
											</xsl:if>
											<attribute name="connectionType">
												<xsl:value-of select="CONNECTION_TYPE"/>
												<!--									<xsl:if test="/CRMTaskStatusUpdate/TVready=''">OffNet</xsl:if><xsl:if test="/CRMTaskStatusUpdate/TVready!=''">OnNet</xsl:if>-->
											</attribute>
											<!--								<xsl:choose>
									<xsl:when test="/CRMTaskStatusUpdate/NoTB!=''">
										<attribute name="fldNoTB">1</attribute>
									</xsl:when>
									<xsl:otherwise>
										<attribute name="fldNoTB">0</attribute>
									</xsl:otherwise>
								</xsl:choose>-->
											<attribute name="projectId">
												<xsl:value-of select="/CRMTaskStatusUpdate/ProjectSolution"/>
											</attribute>
											<attribute name="technology">
												<xsl:value-of select="OPPTVCAP_TECHNOLOGY"/>
											</attribute>
											<attribute name="solutionLifetime">
												<xsl:value-of select="/CRMTaskStatusUpdate/OrderOMSParam/TECH_PROPOSAL_EXPIRE"/>
											</attribute>
											<attribute name="implementationPeriod">
												<xsl:value-of select="DEADLINE_PERIOD"/>
											</attribute>
											<attribute name="approvalDetailing">
												<xsl:value-of select="/CRMTaskStatusUpdate/ApprovalDetailing"/>
											</attribute>
											<attribute name="buildProjectCost">
												<xsl:value-of select="PIR_SUM"/>
											</attribute>
											<attribute name="buildCost">
												<xsl:value-of select="SMR_SUM"/>
											</attribute>
											<attribute name="equipmentCost">
												<xsl:value-of select="EQUIP_SUM"/>
											</attribute>
											<attribute name="airCable"/>
											<attribute name="groundCable"/>
											<attribute name="needHole">
												<xsl:value-of select="OPPTVCAP_DUCT_LENGTH"/>
											</attribute>
											<attribute name="buildCanalization">
												<xsl:value-of select="OPPTVCAP_DUCT_LENGTH"/>
											</attribute>
											<attribute name="capability">
												<xsl:if test="OPPTVCAP_AVAIL='1'">true</xsl:if>
												<xsl:if test="OPPTVCAP_AVAIL!='1'">false</xsl:if>
											</attribute>
											<attribute name="buildingState">
												<xsl:value-of select="/CRMTaskStatusUpdate/OrderOMSPTV/buildingState"/>
											</attribute>
											<attribute name="KKT">
												<xsl:value-of select="/CRMTaskStatusUpdate/CRMRequestIdList/CRMRequest/SrvOMSParam/SRV_EXT_CONN_SCHEME"/>
											</attribute>
											<attribute name="specialNotes">
												<xsl:value-of select="/CRMTaskStatusUpdate/SpecialNotes"/>
											</attribute>
											<attribute name="ROI">
												<xsl:value-of select="PAYBACK_PERIOD"/>
											</attribute>
											<attribute name="installationCost">
												<xsl:value-of select="/CRMTaskStatusUpdate/OpexInstallCost"/>
											</attribute>
										</partyAttributes>
									</orderParty>
								</xsl:for-each>
								<!-- LastPTVCap -->
							</xsl:for-each>
							<!-- LastPTVInfo -->
						</xsl:if>
						<xsl:if test="(not(/CRMTaskStatusUpdate/PTVResult)) or /CRMTaskStatusUpdate/PTVResult='0'">
							<orderParty>
								<partyRole>SOLUTION</partyRole>
								<partyId>
									<xsl:value-of select="/CRMTaskStatusUpdate/OrderOMSId"/>
								</partyId>
								<partyAttributes>
									<attribute name="isMain">true</attribute>
									<attribute name="connectionType">
										<xsl:if test="/CRMTaskStatusUpdate/TVready=''">OffNet</xsl:if>
										<xsl:if test="/CRMTaskStatusUpdate/TVready!=''">OnNet</xsl:if>
									</attribute>
									<!-- константа -->
									<attribute name="UE">RUR</attribute>
									<!-- константа -->
									<attribute name="VAT">без НДС</attribute>
									<attribute name="MonthlyFee">
										<xsl:value-of select="ProjectCost"/>
									</attribute>
									<attribute name="buildCost">
										<xsl:value-of select="SMRCost"/>
									</attribute>
									<attribute name="installationCost">
										<xsl:value-of select="/CRMTaskStatusUpdate/OpexInstallCost"/>
									</attribute>
									<attribute name="equipmentCost">
										<xsl:value-of select="EquipmentCost"/>
									</attribute>
									<attribute name="equipmentName">
										<xsl:value-of select="EquipmentName"/>
									</attribute>
									<attribute name="inCanalization">
										<xsl:value-of select="InCanalization"/>
									</attribute>
									<attribute name="airCable">
										<xsl:value-of select="AirCable"/>
									</attribute>
									<attribute name="groundCable">
										<xsl:value-of select="GroundCable"/>
									</attribute>
									<attribute name="needHole">
										<xsl:if test="BuildCanalization='0'">Нет</xsl:if>
										<xsl:if test="BuildCanalization!='0'">Да</xsl:if>
									</attribute>
									<attribute name="buildCanalization">
										<xsl:value-of select="BuildCanalization"/>
									</attribute>
									<attribute name="capability">
										<xsl:choose>
											<xsl:when test="/CRMTaskStatusUpdate/NoTB!=''">false</xsl:when>
											<xsl:otherwise>true</xsl:otherwise>
										</xsl:choose>
									</attribute>
									<attribute name="solution">
										<xsl:value-of select="/CRMTaskStatusUpdate/ProjectSolution"/>
									</attribute>
									<attribute name="technology">
										<xsl:if test="/CRMTaskStatusUpdate/OrderOMSParam/SubTechnology!=''"><xsl:value-of select="/CRMTaskStatusUpdate/OrderOMSParam/SubTechnology"/></xsl:if>
										<xsl:if test="/CRMTaskStatusUpdate/OrderOMSParam/SubTechnology=''"><xsl:value-of select="/CRMTaskStatusUpdate/Technology"/></xsl:if>
									</attribute>
									<attribute name="solutionLifetime">
										<xsl:value-of select="/CRMTaskStatusUpdate/OrderOMSParam/TECH_PROPOSAL_EXPIRE"/>
									</attribute>
									<attribute name="implementationPeriod">
										<xsl:value-of select="/CRMTaskStatusUpdate/ImplPeriod"/>
									</attribute>
									<attribute name="buildingState">
										<xsl:value-of select="/CRMTaskStatusUpdate/OrderOMSPTV/buildingState"/>
									</attribute>
									<attribute name="KKT">
										<xsl:value-of select="/CRMTaskStatusUpdate/CRMRequestIdList/CRMRequest/SrvOMSParam/SRV_EXT_CONN_SCHEME"/>
									</attribute>
									<attribute name="specialNotes">
										<xsl:value-of select="/CRMTaskStatusUpdate/SpecialNotes"/>
									</attribute>
									<attribute name="ROI">
										<xsl:value-of select="/CRMTaskStatusUpdate/SYSProjectAnalytics/ProjectPaybackPeriod"/>
									</attribute>
								</partyAttributes>
							</orderParty>
						</xsl:if>
						<xsl:if test="RequestAttachmentList!=''">
							<xsl:for-each select="RequestAttachmentList">
								<xsl:for-each select="RequestAttachment">
									<orderAttachment>
										<attachmentType>
											<xsl:value-of select="AttachmentTypeID"/>
										</attachmentType>
										<creationDate>
											<xsl:value-of select="AttachmentDate"/>
										</creationDate>
										<xsl:if test="AttachmentURL!=''">
											<URL>
												<xsl:value-of select="AttachmentURL"/>
											</URL>
										</xsl:if>
										<xsl:if test="AttachmentName!=''">
											<header>
												<xsl:value-of select="AttachmentName"/>
											</header>
										</xsl:if>
										<fileName>
											<xsl:value-of select="AttachmentFileName"/>
										</fileName>
										<fileExtension>
											<xsl:value-of select="AttachmentFileName"/>
										</fileExtension>
									</orderAttachment>
								</xsl:for-each>
								<!--RequestAttacment -->
							</xsl:for-each>
							<!--RequestAttacmentList -->
						</xsl:if>
					</orderParties>
					<orderItems>
						<xsl:for-each select="CRMRequestIdList">
							<xsl:for-each select="CRMRequest">
								<orderItem>
									<orderItemId>
										<xsl:value-of select="CRMRequestId"/>
									</orderItemId>
									<orderItemAction>
										<xsl:value-of select="orderItemAction"/>
									</orderItemAction>
									<orderItemAttributes>
										<xsl:if test="SrvOMSParam/SRV_LINE_NUMBER!=''">
											<attribute name="lineId">
												<xsl:value-of select="SrvOMSParam/SRV_LINE_NUMBER"/>
											</attribute>
										</xsl:if>
										<xsl:if test="SrvOMSParam/SRV_AUTH_METHOD!=''">
											<attribute name="authorizationMethod">
												<xsl:value-of select="SrvOMSParam/SRV_AUTH_METHOD"/>
											</attribute>
										</xsl:if>
									</orderItemAttributes>	
									<xsl:if test="SrvOMSParam/SRV_SLTU_RESERVE_NUM!=''">
										<orderItemParties>
											<orderItemParty>
												<partyRole>RESERVATION</partyRole>
												<partyId><xsl:value-of select="SrvOMSParam/SRV_SLTU_RESERVE"/></partyId>
												<partyAttributes>
													<attribute name="reservationId">
														<xsl:value-of select="SrvOMSParam/SRV_SLTU_RESERVE"/>
													</attribute>
													<attribute name="reservationNumber">
														<xsl:value-of select="SrvOMSParam/SRV_SLTU_RESERVE_NUM"/>
													</attribute>
												</partyAttributes>
											</orderItemParty>
										</orderItemParties>
									</xsl:if>
									
									<orderItemResult>
										<orderItemResultCode>0</orderItemResultCode>
										<orderItemResultText>
											<xsl:value-of select="orderItemResultText"/>
										</orderItemResultText>
									</orderItemResult>
								</orderItem>
							</xsl:for-each>
						</xsl:for-each>
						<!-- CRMRequestTaskList -->
					</orderItems>
				</xsl:for-each>
				<!--CRMTaskStatusUpdate -->
			</order>
		</tns:orderStatusNotification>
	</xsl:template>
</xsl:stylesheet>

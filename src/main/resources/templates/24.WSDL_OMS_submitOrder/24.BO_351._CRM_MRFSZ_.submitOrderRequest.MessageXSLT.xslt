<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<tns:submitOrderRequest xmlns:tns="http://oms.rt.ru/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
			<originator>HRMS</originator>
			<receiver>CRM_MRFSZ</receiver>
			<callbackEndpoint>HRMS</callbackEndpoint>
			<!--<mode>SYNC</mode>-->
			<xsl:for-each select="submitOrderRequest">
				<requestId>
					<xsl:value-of select="QueueId"/>
				</requestId>
				<order>
					<orderId>
						<xsl:value-of select="OrderOMSId"/>
					</orderId>
					<!--<orderType><xsl:value-of select="CRMRequestStatus"/></orderType>-->
					<xsl:variable name="orderStateF" select="CRMRequestStatus"/>
					<xsl:choose>
						<xsl:when test="$orderStateF= 'PREPROVIDE' ">
							<orderType>PREPROVIDE</orderType>
						</xsl:when>
						<xsl:when test="$orderStateF= 'PROVIDE' ">
							<orderType>PROVIDE</orderType>
						</xsl:when>
						<xsl:otherwise>
							<orderType>INPROGRESS</orderType>
						</xsl:otherwise>
					</xsl:choose>
					<!--<orderParentId>String</orderParentId>-->
					<orderPriority>
						<xsl:value-of select="OrderPriority"/>
					</orderPriority>
					<!--		<orderCategory>KKFU</orderCategory>
		<orderChannel>String</orderChannel>
		<branch>String</branch>
		<affiliate>String</affiliate>
-->
					<orderAttributes>
						<attribute name="CustomerProjectName">
							<xsl:value-of select="OrderOMSParam/CRMPromotionID"/>
						</attribute>
						<attribute name="CustomerProjectId">
							<xsl:value-of select="OrderOMSParam/PromoOrderID"/>
						</attribute>
						<attribute name="ServiceBillingSystem">
							<xsl:value-of select="OrderOMSParam/ServiceBillingSystem"/>
						</attribute>
						<attribute name="LastMileRTC_CMS">
							<xsl:value-of select="/submitOrderRequest/CRMOrderId"/>
						</attribute>
						<attribute name="OrderCSRFilial">
							<xsl:value-of select="/submitOrderRequest/OrderOMSParam/CRMOriginatorLevelR12"/>
						</attribute>
					</orderAttributes>
					<orderDate>
						<xsl:value-of select="CRMCreateDate"/>
					</orderDate>
					<!--		<orderRequestedStartDate>2001-12-17T09:30:47Z</orderRequestedStartDate>-->
					<orderRequiredDate>
						<xsl:value-of select="TechSolLifetime"/>
					</orderRequiredDate>
					<orderComments>
						<Comment>
 <xsl:if test="GoToCommentOrder!=''">
    <text>
      <xsl:value-of select="GoToCommentOrder"/>
    </text>
  </xsl:if>
  <xsl:if test="GoToCommentOrder=''">
    <text>
      <xsl:value-of select="SYSOrderStage"/>
    </text>
  </xsl:if>
						</Comment>
					</orderComments>
					<orderParties>
						<orderParty>
							<partyRole>KZ</partyRole>
							<partyId>
								<!--<xsl:value-of select="OrderOMSId"/>-->
								<xsl:value-of select="/submitOrderRequest/kzOrderId"/>
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
							</partyAttributes>
						</orderParty>
						<orderParty>
							<partyRole>WORKER</partyRole>
							<partyId>
								<xsl:value-of select="StatusSYSUsrName"/>
							</partyId>
							<partyName>
								<xsl:value-of select="StatusSYSUsrName"/>
							</partyName>
							<partyAttributes>
								<attribute name="email">
									<xsl:value-of select="StatusSYSUsrEMail"/>
								</attribute>
							</partyAttributes>
						</orderParty>
						<orderParty>
							<partyRole>SALES</partyRole>
							<partyId>
								<xsl:value-of select="OrderOMSParam/CRMOrderCSR"/>
							</partyId>
						</orderParty>
						<orderParty>
							<partyRole>SOLUTION</partyRole>
							<partyId>
								<xsl:value-of select="OrderOMSId"/>
							</partyId>
							<partyAttributes>
								<attribute name="projectId">
									<xsl:value-of select="ProjectSolution"/>
								</attribute>
								<attribute name="technology">
									<xsl:value-of select="/submitOrderRequest/ConnectTechnology"/>
								</attribute>
								<attribute name="connectionType">
									<xsl:if test="/submitOrderRequest/TVready=''">OffNet</xsl:if>
									<xsl:if test="/submitOrderRequest/TVready!=''">OnNet</xsl:if>
								</attribute>
								<attribute name="solutionLifetime">
									<xsl:value-of select="TechSolLifetime"/>
								</attribute>
								<attribute name="implementationPeriod">
									<xsl:value-of select="ImplPeriod"/>
								</attribute>
								<attribute name="approvalDetailing">
									<xsl:value-of select="ApprovalDetailing"/>
								</attribute>
								<attribute name="UE">RUR</attribute>
								<!-- ��������� -->
								<attribute name="VAT">��� ���</attribute>
								<attribute name="buildProjectCost">
									<xsl:value-of select="ProjectCost"/>
								</attribute>
								<attribute name="installationCost">
									<xsl:value-of select="SMRCost"/>
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
									<xsl:if test="BuildCanalization='0'">false</xsl:if>
									<xsl:if test="BuildCanalization!='0'">true</xsl:if>
								</attribute>
								<attribute name="buildCanalization">
									<xsl:value-of select="BuildCanalization"/>
								</attribute>
								<attribute name="fldHrmsExtraPaysMethod">
									<xsl:value-of select="WorkMethod"/>
								</attribute>
								<attribute name="fldHrmsExtraPaysExecutor">
									<xsl:value-of select="Contractor"/>
								</attribute>
								<attribute name="buildingState">
									<xsl:value-of select="OrderOMSPTV/buildingState"/>
								</attribute>
								<attribute name="point1Name">
									<xsl:value-of select="Point1Name"/>
								</attribute>
								<attribute name="point1Address">
									<xsl:value-of select="Point1Address"/>
								</attribute>
								<attribute name="point1Interface">
									<xsl:value-of select="Point1Interface"/>
								</attribute>
								<attribute name="point1Equipment">
									<xsl:value-of select="Point1Equipment"/>
								</attribute>
								<attribute name="point3Name">
									<xsl:value-of select="Point3Name"/>
								</attribute>
								<attribute name="point3Address">
									<xsl:value-of select="Point3Address"/>
								</attribute>
								<attribute name="point3Interface">
									<xsl:value-of select="Point3Interface"/>
								</attribute>
								<attribute name="point3Equipment">
									<xsl:value-of select="Point3Equipment"/>
								</attribute>
								<attribute name="point2LInchOrgMethod">
									<xsl:value-of select="Point2LInchOrgMethod"/>
								</attribute>
								<attribute name="lMCrossing">
									<xsl:value-of select="fldLMCrossing"/>
								</attribute>
								<attribute name="lMOrgLevel">
									<xsl:value-of select="fldLMOrgLevel"/>
								</attribute>
								<attribute name="networkPath">
									<xsl:value-of select="fldNetworkPath"/>
								</attribute>
							</partyAttributes>
						</orderParty>
						<orderParty>
							<partyRole>CLIENT</partyRole>
							<partyId>
								<xsl:value-of select="/submitOrderRequest/CRMCustomer/CUSTOM_ID"/>
							</partyId>
							<partyName>
								<xsl:value-of select="/submitOrderRequest/CRMCustomer/CUSTOM_NAME"/>
							</partyName>
							<partyAttributes>
								<attribute name="CustomerKPP">
									<xsl:value-of select="/submitOrderRequest/CRMCustomer/CUSTOM_OKONH"/>
								</attribute>
								<attribute name="CustomerTaxId">
									<xsl:value-of select="/submitOrderRequest/CRMCustomer/CUSTOM_INN"/>
								</attribute>
								<attribute name="CustomerMacroSegment">
									<xsl:value-of select="/submitOrderRequest/OrderOMSParam/CRMPromotionType"/>
								</attribute>
								<attribute name="CustomerSegment">
									<xsl:value-of select="/submitOrderRequest/OrderOMSParam/CRMPromotionSegmentName"/>
								</attribute>
								<attribute name="CustomerContactsName">
									<xsl:value-of select="/submitOrderRequest/CRMCustomer/CUSTOM_NAME2"/>
								</attribute>
								<attribute name="CustomerPhone">
									<xsl:value-of select="/submitOrderRequest/CRMCustomer/CUSTOM_CONTACT_PHONE"/>
								</attribute>
								<attribute name="CustomerEmail">
									<xsl:value-of select="/submitOrderRequest/CRMCustomer/CUSTOM_CONTACT_EMAIL"/></attribute>
							</partyAttributes>
						</orderParty>
						<orderParty>
							<partyRole>CONTACT</partyRole>
							<partyId>
								<xsl:value-of select="/submitOrderRequest/CRMCustomer/CUSTOM_ID"/>
							</partyId>
							<!--����� ��  [CUSTOM_ID] => 1313585 ��� �������-->
							<partyName>
								<xsl:value-of select="/submitOrderRequest/OrderOMSContact/OrderContactPerson"/>
							</partyName>
							<partyAttributes>
								<attribute name="phone">
									<xsl:value-of select="/submitOrderRequest/OrderOMSContact/OrderContactPhone"/>
								</attribute>
								<!--����� �� [OrderContactPhone] => 4444444-->
								<attribute name="email">
									<xsl:value-of select="/submitOrderRequest/OrderOMSContact/OrderContactEmail"/>
								</attribute>
								<!--����� ��  [OrderContactEmail] => @@@@@@-->
							</partyAttributes>
						</orderParty>
					</orderParties>
					<xsl:for-each select="CRMRequestIdList">
						<orderItems>
							<xsl:for-each select="CRMRequest">
								<orderItem>
									<orderItemId>
										<xsl:value-of select="CSERVICE_ID"/>
									</orderItemId>
									<orderItemAction>
										<xsl:value-of select="orderItemAction"/>
									</orderItemAction>
									<orderItemCategory>CFS</orderItemCategory>
									<orderItemParentId/>
									<orderItemParentInstanceId/>
									<orderItemRequiredDate>
										<xsl:value-of select="SrvOMSParam/SRV_DT_START"/>
									</orderItemRequiredDate>
									<!--				<ServiceType>
				<xsl:value-of select="ServiceType"/></ServiceType>-->
									<orderItemSpecification>
										<catalogId>SC</catalogId>
										<specId>
											<xsl:value-of select="CFFS_ID"/>
										</specId>
										<specVersion>1.0</specVersion>
										<specName>
											<xsl:value-of select="ServiceName"/>
										</specName>
									</orderItemSpecification>
									<xsl:if test="ServiceType='NETWORK'">
										<orderItemLocation>
											<locationId>
												<xsl:value-of select="/submitOrderRequest/SYSOrderServicesAddr/GID"/>
											</locationId>
											<locationCategory>STRICT</locationCategory>
											<locationRegister>GID</locationRegister>
											<locationAttributes>
												<attribute name="locationPremises"/>
												<xsl:value-of select="/submitOrderRequest/SYSOrderServicesAddr/ExtOffice"/>
											</locationAttributes>
										</orderItemLocation>
										<xsl:if test="SrvOMSParam/SRV_SLTU_RESERVE_NUM !=''">
											<orderItemParties>
												<orderParty>
													<partyRole>RESERVATION</partyRole>
													<partyId>
														<xsl:value-of select="SrvOMSParam/SRV_SLTU_RESERVE"/>
													</partyId>
													<partyName>ResourceBooking</partyName>
													<partyAttributes>
														<attribute name="reservationNumber">
															<xsl:value-of select="SrvOMSParam/SRV_SLTU_RESERVE_NUM"/>
														</attribute>
														<attribute name="reservationId">
															<xsl:value-of select="SrvOMSParam/SRV_SLTU_RESERVE"/>
														</attribute>
													</partyAttributes>
												</orderParty>
											</orderItemParties>
										</xsl:if>
										<!-- test="SrvOMSParam/SRV_SLTU_RESERVE_NUM !=''"-->
									</xsl:if>
									<orderItemComments/>
									<!--<orderItemReservationId/>-->
									<orderItemAttributes>
										<attribute name="ServiceSpeedValue">
											<xsl:value-of select="SrvOMSParam/SRV_CMS_ServiceSpeed"/>
											<!--�������� �������, ����/c-->
										</attribute>
										<attribute name="ServiceSpeedMeasure">
											<xsl:value-of select="SrvOMSParam/SRV_CMS_ServiceSpeed_SCALE"/>
											<!--������� ��������� ��������-->
										</attribute>
										<attribute name="access_interface">
											<xsl:value-of select="SrvOMSParam/SRV_CMS_fldPoint2Interface"/>
											<!--��������� �������-->
										</attribute>
										<xsl:if test="ServiceType='NETWORK'">
											<!-- technology lineId , serviceItemId ����� �������� � XML, ������ ��� ������ ServiceType='NETWORK' -->
											<attribute name="accountNumber">
												<xsl:value-of select="SrvOMSParam/SRV_SLTU_ACCOUNTNUMBER"/>
											</attribute>
											<attribute name="lineId">
												<xsl:value-of select="SrvOMSParam/SRV_LINE_NUMBER"/>
											</attribute>
											<xsl:if test="(not(SrvOMSParam/SRV_SLTU_SERVICE_ID)) or SrvOMSParam/SRV_SLTU_SERVICE_ID=''">
												<attribute name="serviceItemId">000000</attribute>
											</xsl:if>
											<xsl:if test="SrvOMSParam/SRV_SLTU_SERVICE_ID!=''">
												<attribute name="serviceItemId">
													<xsl:value-of select="SrvOMSParam/SRV_SLTU_SERVICE_ID"/>
												</attribute>
											</xsl:if>
											<attribute name="technology">
												<xsl:value-of select="/submitOrderRequest/ConnectTechnology"/>
											</attribute>
										</xsl:if>
										<xsl:if test="ServiceType='IP_address'">
											<attribute name="service_qty">1</attribute>
										</xsl:if>
										<xsl:if test="ServiceType='VPN'">
											<attribute name="vpn_type">L3_VPN</attribute>
											<attribute name="sub_net">
												<xsl:value-of select="SrvOMSParam/SRV_VPN_SUBNET"/>
												<!-- ����� �� [SRV_VPN_SUBNET] => 10.0.0.0 -->
											</attribute>
											<attribute name="cpe_mode">Routing</attribute>
											<!-- �� ��������� Routing -->
											<xsl:if test="SrvOMSParam/SRV_VPN_PKT_ROUTING_TYPE='�����������'">
												<attribute name="routing_mode">���</attribute>
												<!-- ���� [SRV_VPN_PKT_ROUTING_TYPE] => �����������, �� "routing_mode" = ���,-->
											</xsl:if>
											<xsl:if test="SrvOMSParam/SRV_VPN_PKT_ROUTING_TYPE='������������'">
												<attribute name="routing_mode">��</attribute>
												<!--���� [SRV_VPN_PKT_ROUTING_TYPE] => ������������, �� "routing_mode" = �� -->
											</xsl:if>
											<xsl:if test="SrvOMSParam/SRV_VPN_LOCAL_VPN='���'">
												<attribute name="as_id">12389</attribute>
												<!-- ���� [SRV_VPN_LOCAL_VPN] => ���, �� as_id = 12389 -->
											</xsl:if>
											<xsl:if test="SrvOMSParam/SRV_VPN_LOCAL_VPN='��'">
												<attribute name="as_id">0</attribute>
												<!-- ���� [SRV_VPN_LOCAL_VPN] => ��, �� as_id = 0 -->
											</xsl:if>
										</xsl:if>
										<xsl:if test="ServiceType='VPN_L2'">
											<attribute name="vpn_type">L2_VPN</attribute>
											<attribute name="sub_net">
												<xsl:value-of select="SrvOMSParam/SRV_VPN_SUBNET"/>
												<!-- ����� �� [SRV_VPN_SUBNET] => 10.0.0.0 -->
											</attribute>
											<attribute name="cpe_mode">Routing</attribute>
											<!-- �� ��������� Routing -->
											<xsl:if test="SrvOMSParam/SRV_VPN_PKT_ROUTING_TYPE='�����������'">
												<attribute name="routing_mode">���</attribute>
												<!-- ���� [SRV_VPN_PKT_ROUTING_TYPE] => �����������, �� "routing_mode" = ���,-->
											</xsl:if>
											<xsl:if test="SrvOMSParam/SRV_VPN_PKT_ROUTING_TYPE='������������'">
												<attribute name="routing_mode">��</attribute>
												<!--���� [SRV_VPN_PKT_ROUTING_TYPE] => ������������, �� "routing_mode" = �� -->
											</xsl:if>
											<xsl:if test="SrvOMSParam/SRV_VPN_LOCAL_VPN='���'">
												<attribute name="as_id">12389</attribute>
												<!-- ���� [SRV_VPN_LOCAL_VPN] => ���, �� as_id = 12389 -->
											</xsl:if>
											<xsl:if test="SrvOMSParam/SRV_VPN_LOCAL_VPN='��'">
												<attribute name="as_id">0</attribute>
												<!-- ���� [SRV_VPN_LOCAL_VPN] => ��, �� as_id = 0 -->
											</xsl:if>
										</xsl:if>
										<xsl:if test="ServiceType='VPLS point'">
											<attribute name="vpn_type">VPLS</attribute>
											<attribute name="vpn_type">L2_VPN</attribute>
											<attribute name="sub_net">
												<xsl:value-of select="SrvOMSParam/SRV_VPN_SUBNET"/>
												<!-- ����� �� [SRV_VPN_SUBNET] => 10.0.0.0 -->
											</attribute>
											<attribute name="cpe_mode">Routing</attribute>
											<!-- �� ��������� Routing -->
											<xsl:if test="SrvOMSParam/SRV_VPN_PKT_ROUTING_TYPE='�����������'">
												<attribute name="routing_mode">���</attribute>
												<!-- ���� [SRV_VPN_PKT_ROUTING_TYPE] => �����������, �� "routing_mode" = ���,-->
											</xsl:if>
											<xsl:if test="SrvOMSParam/SRV_VPN_PKT_ROUTING_TYPE='������������'">
												<attribute name="routing_mode">��</attribute>
												<!--���� [SRV_VPN_PKT_ROUTING_TYPE] => ������������, �� "routing_mode" = �� -->
											</xsl:if>
											<xsl:if test="SrvOMSParam/SRV_VPN_LOCAL_VPN='���'">
												<attribute name="as_id">12389</attribute>
												<!-- ���� [SRV_VPN_LOCAL_VPN] => ���, �� as_id = 12389 -->
											</xsl:if>
											<xsl:if test="SrvOMSParam/SRV_VPN_LOCAL_VPN='��'">
												<attribute name="as_id">0</attribute>
												<!-- ���� [SRV_VPN_LOCAL_VPN] => ��, �� as_id = 0 -->
											</xsl:if>
										</xsl:if>
										<xsl:if test="ServiceType='cfs_vpn'">
											<attribute name="vpn_type">
												<xsl:value-of select="SrvOMSParam/SRV_VPN_TYPE"/>
												<!--  ��� VPN ����� �� [SRV_VPN_TYPE] => VPLS point -->
											</attribute>
											<attribute name="vpn_qos">
												<xsl:value-of select="SrvOMSParam/SRV_CMS_ServiceQoS"/>
												<!-- ����� ������������(QoS) ����� �� [SRV_CMS_ServiceQoS] => N -->
											</attribute>
											<attribute name="vpn_topology">
												<xsl:value-of select="SrvOMSParam/SRV_CMS_ServiceTopology"/>
												<!-- ��������� ����� �� [SRV_CMS_ServiceTopology] => FM VPN (full mesh VPN) -->
											</attribute>
											<attribute name="vpn_id">
												<xsl:value-of select="SrvOMSParam/SRV_VPN_ID"/>
												<!-- ID VPN ���� ����� �� [SRV_VPN_ID] => ID VPN ���� -->
											</attribute>
											<attribute name="vpn_name">
												<xsl:value-of select="SrvOMSParam/SRV_VPN_NAME"/>
												<!-- ��� VPN ���� ����� �� [SRV_VPN_NAME] => ��� VPN ����-->
											</attribute>
											<attribute name="as_id">12389</attribute>
										</xsl:if>
									</orderItemAttributes>
									<!--				<orderItemBillingInfo>text</orderItemBillingInfo>
				<orderItemAppointmentId>String</orderItemAppointmentId>-->
								</orderItem>
							</xsl:for-each>
						</orderItems>
					</xsl:for-each>
					<!--		<orderAppointmentId>String</orderAppointmentId>-->
				</order>
			</xsl:for-each>
		</tns:submitOrderRequest>
	</xsl:template>
</xsl:stylesheet>
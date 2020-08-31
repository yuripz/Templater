<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<tns:createAppointmentRequest xmlns:tns="http://oms.rt.ru/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
			<xsl:if test="/submitOrderRequest/MsgDirection_Cod!= 'CMS.KKFU'">
				<originator>HRMS</originator>
			</xsl:if>
			<xsl:if test="/submitOrderRequest/MsgDirection_Cod= 'CMS.KKFU'">
				<originator>
					<xsl:value-of select="/submitOrderRequest/MsgDirection_Cod"/>
				</originator>
			</xsl:if>
			<receiver>SZ.WFMARGUS</receiver>
			<callbackEndpoint>HRMS</callbackEndpoint>
			<!--<mode>SYNC</mode>-->
			<xsl:for-each select="submitOrderRequest">
				<requestId>
					<xsl:value-of select="QueueId"/>
				</requestId>
				<wfmRequest>
					<orderId>
						<!--<xsl:value-of select="OrderOMSId"/>-->
						<xsl:value-of select="kzOrderId"/>
					</orderId>
					<orderDate>
						<xsl:value-of select="OrderOMSParam/CRMCreateDate_atom"/>
					</orderDate>
					<branch>
						<xsl:value-of select="MRFFilialCode"/>
					</branch>
					<affiliate>
						<xsl:value-of select="RegionalFilial"/>
					</affiliate>
					<appointmentType>SURVEY</appointmentType>
					<appointmentStatus>POSTPONED</appointmentStatus>
					<readinessStatus>NOT_READY_TO_EXECUTE</readinessStatus>
					<xsl:if test="CRMRequestIdList/CRMRequest[1]/SrvOMSParam/SRV_DT_START_atom">
						<intervalStartDate>
							<xsl:value-of select="CRMRequestIdList/CRMRequest[1]/SrvOMSParam/SRV_DT_START_atom"/>
						</intervalStartDate>
					</xsl:if>
					<orderComments>
						<comment>
							<xsl:if test="SurveyComment">
								<text>
									<xsl:value-of select="SurveyComment"/>
								</text>
							</xsl:if>
						</comment>
					</orderComments>
					<location>
						<locationId>
							<xsl:value-of select="/submitOrderRequest/SYSOrderServicesAddr/GID"/>
						</locationId>
						<locationCategory>STRICT</locationCategory>
						<locationRegister>GID</locationRegister>
						<locationAttributes>
							<attribute name="locationPremises">
								<xsl:value-of select="/submitOrderRequest/SYSOrderServicesAddr/ExtOffice"/>
							</attribute>
						</locationAttributes>
					</location>
					<orderParties>
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
									<xsl:value-of select="/submitOrderRequest/CRMCustomer/CUSTOM_CONTACT_EMAIL"/>
								</attribute>
							</partyAttributes>
						</orderParty>
						<orderParty>
							<partyRole>CONTACT</partyRole>
							<partyId>
								<xsl:value-of select="/submitOrderRequest/CRMCustomer/CUSTOM_ID"/>
							</partyId>
							<!--берем из  [CUSTOM_ID] => 1313585 для клиента-->
							<partyName>
								<xsl:value-of select="/submitOrderRequest/OrderOMSContact/OrderContactPerson"/>
							</partyName>
							<partyAttributes>
								<attribute name="phone">
									<xsl:value-of select="/submitOrderRequest/OrderOMSContact/OrderContactPhone"/>
								</attribute>
								<!--берем из [OrderContactPhone] => 4444444-->
								<attribute name="email">
									<xsl:value-of select="/submitOrderRequest/OrderOMSContact/OrderContactEmail"/>
								</attribute>
								<!--берем из  [OrderContactEmail] => @@@@@@-->
							</partyAttributes>
						</orderParty>
					</orderParties>
					<attributes>
						<attribute name="orderOMSId">
							<xsl:value-of select="/submitOrderRequest/hermesOMSParam/ExternalOrderID"/>
						</attribute>
						<attribute name="CustomerProjectName">
							<xsl:value-of select="OrderOMSParam/CRMPromotionID"/>
						</attribute>
						<attribute name="CustomerProjectId">
							<xsl:value-of select="OrderOMSParam/PromoOrderID"/>
						</attribute>
						<attribute name="ServiceBillingSystem">
							<xsl:value-of select="OrderOMSParam/ServiceBillingSystem"/>
						</attribute>
						<xsl:if test="/submitOrderRequest/MsgDirection_Cod= 'CMS.KKFU'">
							<attribute name="LastMileRTC_CMS">
								<xsl:value-of select="/submitOrderRequest/CRMOrderId"/>
							</attribute>
						</xsl:if>
						<attribute name="OrderCSRFilial">
							<xsl:value-of select="/submitOrderRequest/OrderOMSParam/CRMOriginatorLevelR12"/>
						</attribute>
					</attributes>
					<xsl:for-each select="CRMRequestIdList">
						<orderItems>
							<xsl:for-each select="CRMRequest">
								<orderItem>
									<orderItemId>
										<xsl:value-of select="CSERVICE_ID"/>
									</orderItemId>
									<orderItemState>
										<xsl:value-of select="orderItemAction"/>
									</orderItemState>
									<orderItemInstanceId>CFS</orderItemInstanceId>
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
									<orderItemAttributes>
										<xsl:if test="SrvOMSParam/SRV_CMS_ServiceSpeed">
											<xsl:variable name="originator" select="SrvOMSParam/SRV_CMS_ServiceSpeed"/>
											<attribute name="bandwidth">
												<xsl:value-of select="format-number($originator, '##')"/>
												<xsl:value-of select="SrvOMSParam/SRV_CMS_ServiceSpeed_SCALE_dict"/>
											</attribute>
											<attribute name="ServiceSpeedValue">
												<xsl:value-of select="SrvOMSParam/SRV_CMS_ServiceSpeed"/>
											</attribute>
											<!--Скорость сервиса, кбит/c-->
											<attribute name="ServiceSpeedMeasure">
												<xsl:value-of select="SrvOMSParam/SRV_CMS_ServiceSpeed_SCALE"/>
											</attribute>
										</xsl:if>
										<!--Единицы измерения скорости-->
										<attribute name="access_interface">
											<xsl:value-of select="SrvOMSParam/SRV_CMS_fldPoint2Interface"/>
										</attribute>
										<!--Интерфейс клиента-->
										<xsl:if test="ServiceType='NETWORK'">
											<!-- technology lineId , serviceItemId нужно выводить в XML, только для услуги ServiceType='NETWORK' -->
											<attribute name="accountNumber">
												<xsl:value-of select="SrvOMSParam/SRV_SLTU_ACCOUNTNUMBER"/>
											</attribute>
											<attribute name="reservationNumber">
												<xsl:value-of select="SrvOMSParam/SRV_SLTU_RESERVE_NUM"/>
											</attribute>
											<attribute name="reservationId">
												<xsl:value-of select="SrvOMSParam/SRV_SLTU_RESERVE"/>
											</attribute>
											<attribute name="serviceItemId">
												<xsl:value-of select="SrvOMSParam/SRV_SLTU_SERVICE_ID"/>
											</attribute>
											<attribute name="technology">
												<xsl:value-of select="/submitOrderRequest/Technology"/>
											</attribute>
											<attribute name="lineId">
												<xsl:value-of select="SrvOMSParam/SRV_LINE_NUMBER"/>
											</attribute>
											<!--	<xsl:if test="(not(SrvOMSParam/SRV_SLTU_SERVICE_ID)) or SrvOMSParam/SRV_SLTU_SERVICE_ID=''">
												<attribute name="serviceItemId">000000</attribute>
											</xsl:if>
											<xsl:if test="SrvOMSParam/SRV_SLTU_SERVICE_ID!=''">
												<attribute name="serviceItemId">
													<xsl:value-of select="SrvOMSParam/SRV_SLTU_SERVICE_ID"/>
												</attribute>
											</xsl:if> -->
										</xsl:if>
										<xsl:if test="ServiceType='IP_address'">
											<attribute name="service_qty">1</attribute>
										</xsl:if>
										<xsl:if test="ServiceType='cfs_vpn_node'">
											<attribute name="vpn_node_name">
												<xsl:value-of select="SrvOMSParam/SRV_VPN_NODE_NAME"/>
											</attribute>
											<xsl:if test="(not(SrvOMSParam/SRV_VPN_NODE_TYPE)) or SrvOMSParam/SRV_VPN_NODE_TYPE=''">
												<attribute name="vpn_node_type">P2P</attribute>
											</xsl:if>
											<xsl:if test="SrvOMSParam/SRV_VPN_NODE_TYPE!=''">
												<attribute name="vpn_node_type">
													<xsl:value-of select="SrvOMSParam/SRV_VPN_NODE_TYPE"/>
												</attribute>
											</xsl:if>
											<attribute name="routing_mode">
												<xsl:value-of select="SrvOMSParam/SRV_VPN_PKT_ROUTING_TYPE"/>
											</attribute>
											<attribute name="vpn_qos">
												<xsl:value-of select="SrvOMSParam/SRV_CMS_ServiceQoS"/>
											</attribute>
											<attribute name="vpn_node_cos">
												<xsl:value-of select="SrvOMSParam/SRV_VPN_NODE_COS"/>
											</attribute>
											<attribute name="primary_or_redoundant">
												<xsl:value-of select="SrvOMSParam/SRV_VPN_NODE_ROLE"/>
											</attribute>
											<attribute name="if_ip">
												<xsl:value-of select="SrvOMSParam/SRV_VPN_SUBNET"/>
											</attribute>
											<attribute name="ce_ip">
												<xsl:value-of select="SrvOMSParam/SRV_VPN_CEIP"/>
											</attribute>
											<attribute name="external_as">
												<xsl:value-of select="SrvOMSParam/SRV_VPN_EXT_AS"/>
											</attribute>
											<attribute name="qinq">
												<xsl:value-of select="SrvOMSParam/SRV_VPN_QINQ"/>
											</attribute>
											<attribute name="ip_prefix">
												<xsl:value-of select="SrvOMSParam/SRV_VPN_PREFIX_IP"/>
											</attribute>
											<attribute name="mtu">
												<xsl:value-of select="SrvOMSParam/SRV_VPN_MTU"/>
											</attribute>
										</xsl:if>
										<xsl:if test="ServiceType='VPN'">
											<attribute name="vpn_type">L3_VPN</attribute>
											<attribute name="sub_net">
												<xsl:value-of select="SrvOMSParam/SRV_VPN_SUBNET"/>
											</attribute>
											<!-- берем из [SRV_VPN_SUBNET] => 10.0.0.0 -->
											<attribute name="cpe_mode">Routing</attribute>
											<!-- по умолчанию Routing -->
											<xsl:if test="SrvOMSParam/SRV_VPN_PKT_ROUTING_TYPE='статическая'">
												<attribute name="routing_mode">STATIC</attribute>
											</xsl:if>
											<!-- если [SRV_VPN_PKT_ROUTING_TYPE] => статическая, то "routing_mode" = Нет,-->
											<xsl:if test="SrvOMSParam/SRV_VPN_PKT_ROUTING_TYPE='динамическая'">
												<attribute name="routing_mode">BGP</attribute>
											</xsl:if>
											<!--если [SRV_VPN_PKT_ROUTING_TYPE] => динамическая, то "routing_mode" = Да -->
											<xsl:if test="SrvOMSParam/SRV_VPN_LOCAL_VPN='Нет'">
												<attribute name="isLocal">false</attribute>
											</xsl:if>
											<!-- если [SRV_VPN_LOCAL_VPN] => Нет, то as_id = 12389 -->
											<xsl:if test="SrvOMSParam/SRV_VPN_LOCAL_VPN='Да'">
												<attribute name="isLocal">true</attribute>
											</xsl:if>
											<!-- если [SRV_VPN_LOCAL_VPN] => Да, то as_id = 0 -->
										</xsl:if>
										<xsl:if test="ServiceType='VPN_L2'">
											<attribute name="vpn_type">L2_VPN</attribute>
											<attribute name="sub_net">
												<xsl:value-of select="SrvOMSParam/SRV_VPN_SUBNET"/>
											</attribute>
											<!-- берем из [SRV_VPN_SUBNET] => 10.0.0.0 -->
											<attribute name="cpe_mode">Routing</attribute>
											<!-- по умолчанию Routing -->
											<xsl:if test="SrvOMSParam/SRV_VPN_PKT_ROUTING_TYPE='статическая'">
												<attribute name="routing_mode">STATIC</attribute>
											</xsl:if>
											<!-- если [SRV_VPN_PKT_ROUTING_TYPE] => статическая, то "routing_mode" = Нет,-->
											<xsl:if test="SrvOMSParam/SRV_VPN_PKT_ROUTING_TYPE='динамическая'">
												<attribute name="routing_mode">BGP</attribute>
											</xsl:if>
											<!--если [SRV_VPN_PKT_ROUTING_TYPE] => динамическая, то "routing_mode" = Да -->
											<xsl:if test="SrvOMSParam/SRV_VPN_LOCAL_VPN='Нет'">
												<attribute name="isLocal">false</attribute>
											</xsl:if>
											<!-- если [SRV_VPN_LOCAL_VPN] => Нет, то as_id = 12389 -->
											<xsl:if test="SrvOMSParam/SRV_VPN_LOCAL_VPN='Да'">
												<attribute name="isLocal">true</attribute>
											</xsl:if>
											<!-- если [SRV_VPN_LOCAL_VPN] => Да, то as_id = 0 -->
										</xsl:if>
										<xsl:if test="ServiceType='VPLS point'">
											<attribute name="vpn_type">VPLS</attribute>
											<attribute name="vpn_type">L2_VPN</attribute>
											<attribute name="sub_net">
												<xsl:value-of select="SrvOMSParam/SRV_VPN_SUBNET"/>
											</attribute>
											<!-- берем из [SRV_VPN_SUBNET] => 10.0.0.0 -->
											<attribute name="cpe_mode">Routing</attribute>
											<!-- по умолчанию Routing -->
											<xsl:if test="SrvOMSParam/SRV_VPN_PKT_ROUTING_TYPE='статическая'">
												<attribute name="routing_mode">STATIC</attribute>
											</xsl:if>
											<!-- если [SRV_VPN_PKT_ROUTING_TYPE] => статическая, то "routing_mode" = Нет,-->
											<xsl:if test="SrvOMSParam/SRV_VPN_PKT_ROUTING_TYPE='динамическая'">
												<attribute name="routing_mode">BGP</attribute>
											</xsl:if>
											<!--если [SRV_VPN_PKT_ROUTING_TYPE] => динамическая, то "routing_mode" = Да -->
											<xsl:if test="SrvOMSParam/SRV_VPN_LOCAL_VPN='Нет'">
												<attribute name="isLocal">false</attribute>
											</xsl:if>
											<!-- если [SRV_VPN_LOCAL_VPN] => Нет, то as_id = 12389 -->
											<xsl:if test="SrvOMSParam/SRV_VPN_LOCAL_VPN='Да'">
												<attribute name="isLocal">true</attribute>
											</xsl:if>
											<!-- если [SRV_VPN_LOCAL_VPN] => Да, то as_id = 0 -->
										</xsl:if>
										<xsl:if test="ServiceType='cfs_vpn'">
											<attribute name="vpn_type">
												<xsl:value-of select="SrvOMSParam/SRV_VPN_TYPE"/>
											</attribute>
											<!--  Тип VPN берем из [SRV_VPN_TYPE] => VPLS point -->
											<attribute name="vpn_qos">
												<xsl:value-of select="SrvOMSParam/SRV_CMS_ServiceQoS"/>
											</attribute>
											<!-- Класс обслуживания(QoS) берем из [SRV_CMS_ServiceQoS] => N -->
											<attribute name="vpn_topology">
												<xsl:value-of select="SrvOMSParam/SRV_CMS_ServiceTopology"/>
											</attribute>
											<!-- Топология берем из [SRV_CMS_ServiceTopology] => FM VPN (full mesh VPN) -->
											<attribute name="vpn_id">
												<xsl:value-of select="SrvOMSParam/SRV_VPN_ID"/>
											</attribute>
											<!-- ID VPN сети берем из [SRV_VPN_ID] => ID VPN сети -->
											<attribute name="vpn_name">
												<xsl:value-of select="SrvOMSParam/SRV_VPN_NAME"/>
											</attribute>
											<!-- Имя VPN сети берем из [SRV_VPN_NAME] => Имя VPN сети-->
											<attribute name="pe_as">
												<xsl:value-of select="SrvOMSParam/SRV_VPN_AS"/>
											</attribute>
											<xsl:if test="SrvOMSParam/SRV_VPN_LOCAL_VPN='Нет'">
												<attribute name="isLocal">false</attribute>
											</xsl:if>
											<!-- если [SRV_VPN_LOCAL_VPN] => Нет, то as_id = 12389 -->
											<xsl:if test="SrvOMSParam/SRV_VPN_LOCAL_VPN='Да'">
												<attribute name="isLocal">true</attribute>
											</xsl:if>
											<!-- если [SRV_VPN_LOCAL_VPN] => Да, то as_id = 0 -->
											<xsl:if test="SrvOMSParam/SRV_VPN_LOCAL_VPN='false'">
												<attribute name="isLocal">false</attribute>
											</xsl:if>
											<!-- если [SRV_VPN_LOCAL_VPN] => Нет, то as_id = 12389 -->
											<xsl:if test="SrvOMSParam/SRV_VPN_LOCAL_VPN='true'">
												<attribute name="isLocal">true</attribute>
											</xsl:if>
											<!-- если [SRV_VPN_LOCAL_VPN] => Да, то as_id = 0 -->
										</xsl:if>
									</orderItemAttributes>
									<orderItemAction>
										<xsl:value-of select="orderItemAction"/>
									</orderItemAction>
									<orderItemResult/>
									<orderItemReferences/>
								</orderItem>
							</xsl:for-each>
						</orderItems>
					</xsl:for-each>
					<!--		<orderAppointmentId>String</orderAppointmentId>-->
				</wfmRequest>
			</xsl:for-each>
		</tns:createAppointmentRequest>
	</xsl:template>
</xsl:stylesheet>

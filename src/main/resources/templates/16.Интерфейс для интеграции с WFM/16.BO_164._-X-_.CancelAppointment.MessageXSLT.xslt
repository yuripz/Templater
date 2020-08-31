<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<tns:cancelOrderRequest xmlns:tns="http://oms.rt.ru/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
			<originator>HRMS</originator>
			<receiver>SZ.WFMARGUS</receiver>
			<callbackEndpoint>HRMS</callbackEndpoint>
			<xsl:for-each select="cancelOrderRequest">
				<requestId>
					<xsl:value-of select="QueueId"/>
				</requestId>
				<order>
					<orderId>
						<xsl:value-of select="OrderOMSId"/>
					</orderId>
					<orderOMSId>
						<xsl:value-of select="/submitOrderRequest/hermesOMSParam/ExternalOrderID"/>
					</orderOMSId>
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
					<appointmentStatus>PLANNED</appointmentStatus>
					<readinessStatus>NOT_READY_TO_EXECUTE</readinessStatus>
					<xsl:if test="CRMRequestIdList/CRMRequest[1]/SrvOMSParam/SRV_DT_START_atom">
						<intervalStartDate>
							<xsl:value-of select="CRMRequestIdList/CRMRequest[1]/SrvOMSParam/SRV_DT_START_atom"/>
						</intervalStartDate>
					</xsl:if>
					<!--<intervalEndDate><xsl:value-of select="TechSolLifetime"/></intervalEndDate>-->
					<orderComments>
						<Comment>
							<xsl:if test="hermesOMSPrevComment!=''">
								<text>
									<xsl:value-of select="hermesOMSPrevComment"/>
								</text>
							</xsl:if>
							<xsl:if test="hermesOMSPrevComment=''">
								<text>
									<xsl:value-of select="SYSOrderStage"/>
								</text>
							</xsl:if>
						</Comment>
					</orderComments>
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
				</order>
			</xsl:for-each>
		</tns:cancelOrderRequest>
	</xsl:template>
</xsl:stylesheet>
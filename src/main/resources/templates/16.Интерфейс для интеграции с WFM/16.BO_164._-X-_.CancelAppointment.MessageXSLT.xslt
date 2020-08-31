<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<tns:cancelAppointmentRequest xmlns:tns="http://oms.rt.ru/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
			<xsl:choose>
				<xsl:when test="/cancelOrderRequest/StatusSYSUsrName = 'cron'">
					<xsl:if test="/cancelOrderRequest/MsgDirection_Cod != ''">
						<originator>
							<xsl:value-of select="/cancelOrderRequest/MsgDirection_Cod"/>
						</originator>
					</xsl:if>
					<xsl:if test="/cancelOrderRequest/MsgDirection_Cod = '' ">
						<originator>HRMS</originator>
					</xsl:if>
				</xsl:when>
				<xsl:otherwise>
					<originator>HRMS</originator>
				</xsl:otherwise>
			</xsl:choose>
			<receiver>SZ.WFMARGUS</receiver>
			<callbackEndpoint>HRMS</callbackEndpoint>
			<xsl:for-each select="cancelOrderRequest">
				<requestId>
					<xsl:value-of select="QueueId"/>
				</requestId>
				<wfmRequest>
					<orderId>
						<!--<xsl:value-of select="OrderOMSId"/>-->
						<xsl:value-of select="kzOrderId"/>
					</orderId>
					<branch>
						<xsl:value-of select="MRFFilialCode"/>
					</branch>
					<affiliate>
						<xsl:value-of select="RegionalFilial"/>
					</affiliate>
					<appointmentId>
						<xsl:value-of select="hermesOMSParam/AppointmentId"/>
					</appointmentId>
					<reasonCode>cancel</reasonCode>
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
								<xsl:value-of select="/cancelOrderRequest/CRMCustomer/CUSTOM_ID"/>
							</partyId>
							<partyName>
								<xsl:value-of select="/cancelOrderRequest/CRMCustomer/CUSTOM_NAME"/>
							</partyName>
							<partyAttributes>
								<attribute name="CustomerKPP">
									<xsl:value-of select="/cancelOrderRequest/CRMCustomer/CUSTOM_OKONH"/>
								</attribute>
								<attribute name="CustomerTaxId">
									<xsl:value-of select="/cancelOrderRequest/CRMCustomer/CUSTOM_INN"/>
								</attribute>
								<attribute name="CustomerMacroSegment">
									<xsl:value-of select="/cancelOrderRequest/OrderOMSParam/CRMPromotionType"/>
								</attribute>
								<attribute name="CustomerSegment">
									<xsl:value-of select="/cancelOrderRequest/OrderOMSParam/CRMPromotionSegmentName"/>
								</attribute>
								<attribute name="CustomerContactsName">
									<xsl:value-of select="/cancelOrderRequest/CRMCustomer/CUSTOM_NAME2"/>
								</attribute>
								<attribute name="CustomerPhone">
									<xsl:value-of select="/cancelOrderRequest/CRMCustomer/CUSTOM_CONTACT_PHONE"/>
								</attribute>
								<attribute name="CustomerEmail">
									<xsl:value-of select="/cancelOrderRequest/CRMCustomer/CUSTOM_CONTACT_EMAIL"/>
								</attribute>
							</partyAttributes>
						</orderParty>
						<orderParty>
							<partyRole>CONTACT</partyRole>
							<partyId>
								<xsl:value-of select="/cancelOrderRequest/CRMCustomer/CUSTOM_ID"/>
							</partyId>
							<!--берем из  [CUSTOM_ID] => 1313585 для клиента-->
							<partyName>
								<xsl:value-of select="/cancelOrderRequest/OrderOMSContact/OrderContactPerson"/>
							</partyName>
							<partyAttributes>
								<attribute name="phone">
									<xsl:value-of select="/cancelOrderRequest/OrderOMSContact/OrderContactPhone"/>
								</attribute>
								<!--берем из [OrderContactPhone] => 4444444-->
								<attribute name="email">
									<xsl:value-of select="/cancelOrderRequest/OrderOMSContact/OrderContactEmail"/>
								</attribute>
								<!--берем из  [OrderContactEmail] => @@@@@@-->
							</partyAttributes>
						</orderParty>
					</orderParties>
					<orderComments>
						<comment>
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
						</comment>
					</orderComments>
				</wfmRequest>
			</xsl:for-each>
		</tns:cancelAppointmentRequest>
	</xsl:template>
</xsl:stylesheet>
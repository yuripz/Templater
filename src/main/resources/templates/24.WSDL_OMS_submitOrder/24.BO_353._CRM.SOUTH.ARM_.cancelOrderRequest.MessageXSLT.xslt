<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<tns:cancelOrderRequest xmlns:tns="http://oms.rt.ru/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
			<xsl:if test="/cancelOrderRequest/MsgDirection_Cod!= 'CMS.KKFU'">
				<originator>HRMS</originator>
			</xsl:if>
			<xsl:if test="/cancelOrderRequest/MsgDirection_Cod= 'CMS.KKFU'">
				<originator>
					<xsl:value-of select="/cancelOrderRequest/MsgDirection_Cod"/>
				</originator>
			</xsl:if>
			<receiver>CRM.SOUTH.ARM</receiver>
			<callbackEndpoint>HRMS</callbackEndpoint>
			<xsl:for-each select="cancelOrderRequest">
				<requestId>
					<xsl:value-of select="QueueId"/>
				</requestId>
				<order>
					<orderId>
						<xsl:value-of select="OrderOMSId"/>
					</orderId>
					<orderOMSId><xsl:value-of select="hermesOMSParam/ExternalOrderID"/></orderOMSId> 
					
					<orderParties>
						<orderParty>
							<partyRole>WORKER</partyRole>
							<partyId>
								<xsl:value-of select="StatusSYSUsrName"/>
							</partyId>
							<partyAttributes>
								<attribute name="email">
									<xsl:value-of select="StatusSYSUsrEMail"/>
								</attribute>
							</partyAttributes>
						</orderParty>
					</orderParties>
				</order>
			</xsl:for-each>
		</tns:cancelOrderRequest>
	</xsl:template>
</xsl:stylesheet>
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<tns:submitHTTP_Get_SRV xmlns:tns="http://oms.rt.ru/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
			<originator>HRMS</originator>
			<receiver>HTTP.HRMS</receiver>
			<tns:callbackEndpoints>
			<tns:callbackEndpoint>HRMS</tns:callbackEndpoint>
						<tns:EndpointAtribute name="place">куда бежать</tns:EndpointAtribute>
						<tns:EndpointAtribute name="время">когда визжать</tns:EndpointAtribute>			
			</tns:callbackEndpoints>
			<!--<mode>SYNC</mode>-->
			<xsl:for-each select="HTTP_Get_SRV">
				<requestId>
					<xsl:value-of select="Queue_Id"/>
				</requestId>
				<order>
					<orderId>
						<xsl:value-of select="Id_Adderss"/></orderId>
						<OrderAtribute name="place">место встречи</OrderAtribute>
						<OrderAtribute name="время">время вперед</OrderAtribute>
					
					<Adderss>
						<xsl:value-of select="Str_Adderss"/>
					</Adderss>
				</order>
			</xsl:for-each>
		</tns:submitHTTP_Get_SRV>
	</xsl:template>
</xsl:stylesheet>
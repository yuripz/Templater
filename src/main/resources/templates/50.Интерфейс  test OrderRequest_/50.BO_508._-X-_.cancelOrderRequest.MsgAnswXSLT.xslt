<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 <xsl:template match="/">
<cancelOrderResponse>
	<originator>HRMS</originator>
	<receiver>CRM_MRFSZ</receiver>
	<orderResult>
		<orderResultCode>0</orderResultCode>
		<orderResultText/>
	</orderResult>
	<requestId>11122233</requestId>
	<order>
		<acknowledgement>
			<orderId>15-11-18-002-ZZZ</orderId>
			<orderOMSId>1176149</orderOMSId>
			<orderStartDate>2019-03-18T00:00:00+03:00</orderStartDate>
			<orderExpectedCompletionDate>2019-03-25T00:00:00+03:00</orderExpectedCompletionDate>
			<orderState>ACKNOWLEDGED</orderState>
		</acknowledgement>
	</order>
</cancelOrderResponse>

 </xsl:template>
</xsl:stylesheet>
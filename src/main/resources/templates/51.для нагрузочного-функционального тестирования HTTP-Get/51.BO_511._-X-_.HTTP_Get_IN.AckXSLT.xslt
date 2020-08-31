<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
 <xsl:template match="/">

<Response>
	<ResultCode>0</ResultCode>
	<ResultMessage>прием функционального тестирования HTTP-Get</ResultMessage>
	<PayLoad>
		<Pay_Id>123456</Pay_Id>
		<Manager_Id>987654321</Manager_Id>
	</PayLoad>
</Response>

 </xsl:template>
</xsl:stylesheet>
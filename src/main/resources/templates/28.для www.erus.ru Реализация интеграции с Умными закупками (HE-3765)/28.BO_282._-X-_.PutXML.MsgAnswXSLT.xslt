<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 <xsl:template match="/">
<tns:PutResultXmlResponse xmlns:tns="urn:ru:rt:hrms:successresponse">
	<ResultCode>0</ResultCode>
	<Message>String</Message>
	<PutXmlResult>
		<ResultCode>0</ResultCode>
		<ArrayOfString>
			<String>String1</String>
						<String>String2</String>
									<String>String3</String>
		</ArrayOfString>
		<HermesOrderNum>2147483647</HermesOrderNum>
		<ResultUrl>String</ResultUrl>
	</PutXmlResult>
</tns:PutResultXmlResponse>

 </xsl:template>
</xsl:stylesheet>
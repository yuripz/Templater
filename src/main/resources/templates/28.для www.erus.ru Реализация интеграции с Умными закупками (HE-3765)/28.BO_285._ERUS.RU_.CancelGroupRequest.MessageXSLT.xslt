<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/" xmlns:etc="http://etc.ru">		
		<etc:PutXml>
			<etc:acLogin>germes</etc:acLogin>
			<etc:acPassword>1Qq</etc:acPassword>
			<etc:escode>rostel</etc:escode>
			<etc:uri>CancelGroupRequest#<xsl:value-of select="/CancelGroupRequest/@QUEUE_ID"/>:<xsl:value-of select="/CancelGroupRequest/Number"/></etc:uri>
			<etc:content>
			<CancelGroupRequest>
	<Number><xsl:value-of select="/CancelGroupRequest/Number"/></Number>
	<LinkExternal><xsl:value-of select="/CancelGroupRequest/LinkExternal"/></LinkExternal>
	<DocDate><xsl:value-of select="/CancelGroupRequest/DocDate"/></DocDate>
	<Name><xsl:value-of select="/CancelGroupRequest/Name"/></Name>
				<xsl:copy-of select="/CancelGroupRequest/Customer"/>
				<xsl:copy-of select="/CancelGroupRequest/Reason"/>			
	</CancelGroupRequest>			
			</etc:content>
		</etc:PutXml>
	</xsl:template>
</xsl:stylesheet>
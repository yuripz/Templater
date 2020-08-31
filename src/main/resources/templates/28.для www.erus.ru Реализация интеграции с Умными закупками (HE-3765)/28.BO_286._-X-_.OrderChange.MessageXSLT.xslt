<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/" xmlns:etc="http://etc.ru">
		<etc:PutXml>
			<etc:acLogin>germes</etc:acLogin>
			<etc:acPassword>1Qq</etc:acPassword>
			<etc:escode>rostel</etc:escode>
			<etc:uri>OrderChange#<xsl:value-of select="/OrderChange/@QUEUE_ID"/>:<xsl:value-of select="/OrderChange/NumberReg"/>
			</etc:uri>
			<etc:content>
				<OrderChange>
					<NumberReg>
						<xsl:value-of select="/OrderChange/NumberReg"/>
					</NumberReg>
					<LinkExternal>
						<xsl:value-of select="/OrderChange/LinkExternal"/>
					</LinkExternal>
					<DocDate>
						<xsl:value-of select="/OrderChange/DocDate"/>
					</DocDate>
					<Name>
						<xsl:value-of select="/OrderChange/Name"/>
					</Name>
					<xsl:copy-of select="/OrderChange/Customer"/>
					<NumberOrder><xsl:value-of select="/OrderChange/NumberOrder"/></NumberOrder>
					<xsl:copy-of select="/OrderChange/RequestInfo"/>
				</OrderChange>
			</etc:content>
		</etc:PutXml>
	</xsl:template>
</xsl:stylesheet>
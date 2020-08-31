<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<xsl:for-each select="Confirmation">
   <DATA><FIELDS>   
   <ER><xsl:value-of select="ResultCode"/></ER>
   <MES><xsl:value-of select="Message"/></MES>
   </FIELDS></DATA>
		</xsl:for-each>
		<xsl:for-each select="Fault">
			<tns:Fault xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:tns="urn:ru:rt:crm:fault">
				<Result>
   <DATA><FIELDS>   
   <ERR>30201</ERR>
   <MES>Ошибка при вызове сервиса в Гермес</MES>
   </FIELDS></DATA>
					<Next>ERRIN</Next>
				</Result>
			</tns:Fault>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
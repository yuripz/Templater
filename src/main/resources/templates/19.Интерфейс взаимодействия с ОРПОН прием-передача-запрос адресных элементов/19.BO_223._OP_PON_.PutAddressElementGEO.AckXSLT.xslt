<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ws="http://www.informatica.com/dis/ws/ws_">
 <xsl:template match="/">
  <xsl:for-each select="Confirmation">
<ws:AddressListGEOResponse>
	<ws:ResultCode><xsl:value-of select="ResultCode"/></ws:ResultCode>
	<ws:ResultMessage><xsl:value-of select="Message"/></ws:ResultMessage>
	<xsl:for-each select="AddrElementErrorGroup">
	<ws:AddrElementErrorGroup>
		<ws:GlobalID><xsl:value-of select="GlobalID"/></ws:GlobalID>
		<ws:AddrElementLevel><xsl:value-of select="AddrElementLevel"/></ws:AddrElementLevel>
		<ws:LocalID><xsl:value-of select="LocalID"/></ws:LocalID>
		<ws:SystemCode>FE_Germes_AR</ws:SystemCode>
		<ws:ErrorCode><xsl:value-of select="ErrorCode"/></ws:ErrorCode>
		<ws:Description><xsl:value-of select="Description"/></ws:Description>
	</ws:AddrElementErrorGroup>
</xsl:for-each> <!-- 	AddrElementErrorGroup -->

	<xsl:for-each select="LocalIDGroup">
	<ws:LocalIDGroup>
		<ws:GlobalID><xsl:value-of select="GlobalID"/></ws:GlobalID>
		<xsl:if test="AddrElementLevel!=''">
		<ws:AddrElementLevel><xsl:value-of select="AddrElementLevel"/></ws:AddrElementLevel>
		</xsl:if>
		<xsl:if test="AddrElementLevel=''">
		<ws:AddrElementLevel>8</ws:AddrElementLevel>
		</xsl:if>
		<ws:SystemCode>FE_Germes_AR</ws:SystemCode>
		<ws:LocalID><xsl:value-of select="LocalID"/></ws:LocalID>
	</ws:LocalIDGroup>
</xsl:for-each> <!-- 	LocalIDGroup -->
</ws:AddressListGEOResponse>
  </xsl:for-each>
  <xsl:for-each select="Fault">
<urn1:Fault xmlns:urn1="urn:ru:rt:hrms:fault">
   <ResultCode><xsl:value-of select="ResultCode"/></ResultCode> 
   <ResultMessage><xsl:value-of select="ResultMessage"/></ResultMessage> 
</urn1:Fault>
  </xsl:for-each>
 </xsl:template>
</xsl:stylesheet>
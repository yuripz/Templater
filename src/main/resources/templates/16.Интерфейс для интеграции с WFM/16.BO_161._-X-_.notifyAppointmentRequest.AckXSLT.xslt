<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tns="http://oms.rt.ru/">
 <xsl:template match="/">
<tns:notifyAppointmentResponse>
	<originator>HRMS</originator>
	<receiver>SZ.WFMARGUS</receiver>
	<result>
		<resultCode>0</resultCode>
		<resultText>String-resultText</resultText>
	</result>
</tns:notifyAppointmentResponse>
<!--
  <xsl:for-each select="Fault">
<urn1:Fault xmlns:urn1="urn:ru:rt:hrms:fault">
   <ResultCode><xsl:value-of select="ResultCode"/></ResultCode> 
   <ResultMessage><xsl:value-of select="ResultMessage"/></ResultMessage> 
</urn1:Fault>
  </xsl:for-each>
-->
 </xsl:template>
</xsl:stylesheet>
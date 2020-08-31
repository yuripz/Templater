<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
 <xsl:template match="/">
  <xsl:for-each select="Confirmation">
<Response type="json">
	<ResultCode><xsl:value-of select="ResultCode"/></ResultCode>
	<ResultMessage><xsl:value-of select="Message"/></ResultMessage>
	<PayLoad>
		<Msg_Status><xsl:value-of select="PayLoad/AppResponse"/></Msg_Status>
		<Queue_Direction><xsl:value-of select="PayLoad/Queue_Direction"/></Queue_Direction>
		<xsl:if test="PayLoad/Msg_Result!=''">
		<Msg_Result><xsl:value-of select="PayLoad/Msg_Result"/></Msg_Result>
		</xsl:if>
		<Msg_Reason><xsl:value-of select="PayLoad/Msg_Reason"/></Msg_Reason>
		<xsl:if test="PayLoad/GlobalId!=''">
		<GlobalId><xsl:value-of select="PayLoad/GlobalId"/></GlobalId>
		<FormalName><xsl:value-of select="PayLoad/FormalName"/></FormalName>
		</xsl:if>
		 <xsl:for-each select="PayLoad/FoundGeoObjects">
		 		<!-- <xsl:for-each select="geoObjects">-->
		 		 <xsl:copy-of select="geoObjects"/>
		<!-- <GlobalID><xsl:value-of select="GlobalID"/></GlobalID>-->
		   <!--</xsl:for-each>
-->		   </xsl:for-each>
	</PayLoad>
</Response>
  </xsl:for-each>
  <xsl:for-each select="Fault">
<urn1:Fault xmlns:urn1="urn:ru:rt:hrms:fault">
   <ResultCode><xsl:value-of select="ResultCode"/></ResultCode> 
   <ResultMessage><xsl:value-of select="ResultMessage"/></ResultMessage> 
</urn1:Fault>
  </xsl:for-each>
 </xsl:template>
</xsl:stylesheet>
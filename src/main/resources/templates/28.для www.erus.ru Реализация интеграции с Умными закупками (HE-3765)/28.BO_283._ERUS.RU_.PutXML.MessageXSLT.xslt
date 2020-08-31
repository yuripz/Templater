<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/" xmlns:etc="http://etc.ru">		
		<etc:PutXml>
			<etc:acLogin>germes</etc:acLogin>
			<etc:acPassword>1Qq</etc:acPassword>
			<etc:escode>rostel</etc:escode>
			<etc:uri>Contract#<xsl:value-of select="/Contract/@QUEUE_ID"/>:<xsl:value-of select="/Contract/IDContract"/>@<xsl:value-of select="/Contract/NumberContract"/>
			</etc:uri>
			<etc:content>
			<Contract>
	<NumberContract><xsl:value-of select="/Contract/NumberContract"/></NumberContract>
	<IDContract><xsl:value-of select="/Contract/IDContract"/></IDContract>
	<SubjectContract><xsl:value-of select="/Contract/SubjectContract"/></SubjectContract>
	<BeginDate><xsl:value-of select="/Contract/BeginDate"/></BeginDate>
	<EndDate><xsl:value-of select="/Contract/EndDate"/></EndDate>
	<State><xsl:value-of select="/Contract/State"/></State>
	<Type><xsl:value-of select="/Contract/Type"/></Type>
				<xsl:copy-of select="/Contract/Customer"/>
				<xsl:copy-of select="/Contract/Supplier"/>
        <xsl:copy-of select="/Contract/DivisionSupplier[*]"/>
        <xsl:if test="/Contract/DeliveryDeadline!=''">
		<DeliveryDeadline><xsl:value-of select="/Contract/DeliveryDeadline"/></DeliveryDeadline>
        </xsl:if>
        <xsl:if test="PaymentDeadline!=''">
	        <PaymentDeadline><xsl:value-of select="/Contract/PaymentDeadline"/></PaymentDeadline>
        </xsl:if>
	<xsl:copy-of select="/Contract/RequestContract[*]"/>			
	</Contract>			
			</etc:content>
		</etc:PutXml>
	</xsl:template>
</xsl:stylesheet>
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:xsi="http://www.w3.org/2001/XMLSchema"
xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:urn="urn:DefaultNamespace">

<xsl:template match="/" priority="1">
<urn:DOACTION >
	<ACTIONNAME>CreateNotesForOrderHermes</ACTIONNAME>
	<SYSTEMID>Hermes</SYSTEMID>
			
	<DATASET xsi:type="urn:DATASETARRAY">
		<FIELD xsi:type="urn:ArrayOfDATASETFIELD" soapenc:arrayType="urn:DATASETFIELD[]">
			<item>
				<FIELDNAME>AuthorId</FIELDNAME>
				<FIELDVALUE xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
					<item>
						<xsl:value-of select="/SendCommentRequest/payload/Person/id"/>
					</item>
				</FIELDVALUE>
			</item>
			<item>
				<FIELDNAME>AuthorName</FIELDNAME>
				<FIELDVALUE xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
					<item>
						<xsl:value-of select="/SendCommentRequest/payload/Person/name"/>
					</item>
				</FIELDVALUE>
			</item>
			<item>
				<FIELDNAME>AuthorEmail</FIELDNAME>
				<FIELDVALUE xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
					<item>
						<xsl:value-of select="/SendCommentRequest/payload/Person/email"/>
					</item>
				</FIELDVALUE>
			</item>
			<item>
				<FIELDNAME>Date</FIELDNAME>
				<FIELDVALUE xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
					<item>
						<xsl:value-of select="/SendCommentRequest/payload/DateTM"/>
					</item>
				</FIELDVALUE>
			</item>
			<item>
				<FIELDNAME>Body</FIELDNAME>
				<FIELDVALUE xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
					<item>
						<xsl:value-of select="/SendCommentRequest/payload/MessageBody"/>
					</item>
				</FIELDVALUE>
			</item>
			
			<item>
				<FIELDNAME>MessageID</FIELDNAME>
				<FIELDVALUE xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
					<item>
						<xsl:value-of select="/SendCommentRequest/payload/MessageID"/>
					</item>
				</FIELDVALUE>
			</item>
		
		</FIELD>
				
	</DATASET>
	<DOCKEY><xsl:value-of select="/SendCommentRequest/payload/orderId"/></DOCKEY>

</urn:DOACTION>
</xsl:template>
</xsl:stylesheet>
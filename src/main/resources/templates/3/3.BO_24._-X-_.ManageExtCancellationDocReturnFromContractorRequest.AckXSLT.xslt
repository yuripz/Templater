<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 <xsl:template match="/">
  <xsl:for-each select="ConfirmManageExtCancellationDocReturnFromContractorRequest">
  <xsl:for-each select="CancelDocDetailConfirmation">
   <Confirmation>
     <ResultCode><xsl:value-of select="ResultCode"/></ResultCode>
     <Message><xsl:value-of select="Message"/></Message>
     <xsl:for-each select="CancelDocDetailList">
       <DetailList>
       <xsl:for-each select="CancelDocDetail">
          <Detail>
             <DocNum><xsl:value-of select="DocNum"/></DocNum>
             <LineNum><xsl:value-of select="LineNum"/></LineNum>
             <CancelDocNum><xsl:value-of select="CancelDocNum"/></CancelDocNum>
             <CancelDocLineNum><xsl:value-of select="CancelDocLineNum"/></CancelDocLineNum>
             <ResultCode><xsl:value-of select="ResultCode"/></ResultCode>
             <Message><xsl:value-of select="Message"/></Message>
          </Detail>
     </xsl:for-each>
       </DetailList>
     </xsl:for-each>
     <Next>RESOUT</Next>   
    </Confirmation>
  </xsl:for-each>
  </xsl:for-each>
 </xsl:template>
</xsl:stylesheet>
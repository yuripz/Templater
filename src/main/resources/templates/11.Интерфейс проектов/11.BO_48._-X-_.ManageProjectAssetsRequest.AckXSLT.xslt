<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 <xsl:template match="/">
  <xsl:for-each select="ConfirmManageProjectAssetsRequest">
  <xsl:for-each select="AssetsConfirmation">
   <Confirmation>
     <ResultCode><xsl:value-of select="ResultCode"/></ResultCode>
     <Message><xsl:value-of select="Message"/></Message>
     <xsl:for-each select="AssetsDetailList">
       <DetailList>
       <xsl:for-each select="AssetsDetail">
          <Detail>
             <ObjectCode><xsl:value-of select="ObjectCode"/></ObjectCode>
             <AssetNumber><xsl:value-of select="AssetNumber"/></AssetNumber>
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
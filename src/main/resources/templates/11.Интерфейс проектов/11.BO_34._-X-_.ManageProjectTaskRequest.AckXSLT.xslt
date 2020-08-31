<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 <xsl:template match="/">
  <xsl:for-each select="ConfirmManageProjectTaskRequest">
  <xsl:for-each select="ProjectTaskConfirmation">
   <Confirmation>
     <ResultCode><xsl:value-of select="ResultCode"/></ResultCode>
     <Message><xsl:value-of select="Message"/></Message>
     <xsl:for-each select="ProjectTaskDetailList">
       <DetailList>
       <xsl:for-each select="ProjectTaskDetail">
          <Detail>
             <DocId><xsl:value-of select="DocId"/></DocId>
             <TaskId><xsl:value-of select="TaskId"/></TaskId>
             <TaskNumber><xsl:value-of select="TaskNumber"/></TaskNumber>
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
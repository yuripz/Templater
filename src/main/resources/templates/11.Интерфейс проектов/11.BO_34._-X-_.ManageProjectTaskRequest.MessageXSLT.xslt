<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
<urn1:ManageProjectTaskRequest xmlns:urn1="urn:ru:rt:fuip:projecttaskmessage">
<xsl:for-each select="ProjectTaskList">
 <ProjectTaskList>
<xsl:for-each select="ProjectTask">
  <ProjectTask>
   <ObjectCode><xsl:value-of select="ObjectCode"/></ObjectCode>
   <ProjectId><xsl:value-of select="ProjectId"/></ProjectId>
   <TaskName><xsl:value-of select="TaskName"/></TaskName>
   <OrgId><xsl:value-of select="OrgId"/></OrgId>
<xsl:if test="Description!=''">
    <Description><xsl:value-of select="Description"/></Description>
</xsl:if>
<xsl:if test="StartDate!=''">
    <StartDate><xsl:value-of select="StartDate"/></StartDate>
</xsl:if>
<xsl:if test="CompletionDate!=''">
    <CompletionDate><xsl:value-of select="CompletionDate"/></CompletionDate>
</xsl:if>
<xsl:if test="CommOrder!=''">
    <CommOrder><xsl:value-of select="CommOrder"/></CommOrder>
</xsl:if>
  </ProjectTask>
</xsl:for-each> 
 </ProjectTaskList>
</xsl:for-each>
</urn1:ManageProjectTaskRequest>
</xsl:template>
</xsl:stylesheet>
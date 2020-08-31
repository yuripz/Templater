<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
   <Confirmation>
    <ResultCode>0</ResultCode>
    <Message>Ответ megaindex в массиве</Message>
       <DetailList>
  <xsl:copy-of select="MsgData"/>
       </DetailList> 

     <Next>RESOUT</Next>
   </Confirmation>

  <xsl:for-each select="Fault">
      <xsl:choose>
        <xsl:when test="ResultCode > 0">
          <Result>
            <Cod>
              <xsl:value-of select="ResultCode"/>
            </Cod>
            <Text>
              <xsl:value-of select="Message"/>
            </Text>
            <Next>RESOUT</Next>
          </Result>
        </xsl:when>
        <xsl:otherwise>
          <Result>
            <Cod>6666</Cod>
						<Text>
							<xsl:copy-of select="/Fault"/>
						</Text>
						<Next>RESOUT</Next>
					</Result>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>

	</xsl:template>
</xsl:stylesheet>
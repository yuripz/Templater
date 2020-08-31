<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <xsl:for-each select="Envelope">
      <xsl:for-each select="Body">
        <xsl:for-each select="orderStatusNotification">
          <xsl:variable name="originator" select="originator"/>
          <xsl:choose>
            <xsl:when test="$originator= 'VLG.DKB2B' ">
              <Context>
                <EventInitiator>VLG.DKB2B</EventInitiator>
                <EventKey>-1</EventKey>
                <Source>VLG.DKB2B</Source>
                <Destination>HRMS</Destination>
                <BusOperationId>352</BusOperationId>
              </Context>
            </xsl:when>
            <xsl:when test="$originator= 'CRM_MRFSZ' ">
              <Context>
                <EventInitiator>CRM_MRFSZ</EventInitiator>
                <EventKey>-1</EventKey>
                <Source>CRM_MRFSZ</Source>
                <Destination>HRMS</Destination>
                <BusOperationId>352</BusOperationId>
              </Context>
            </xsl:when>
            <xsl:when test="$originator= 'CRM.SOUTH.ARM' ">
              <Context>
                <EventInitiator>CRM.SOUTH.ARM</EventInitiator>
                <EventKey>-1</EventKey>
                <Source>CRM.SOUTH.ARM</Source>
                <Destination>HRMS</Destination>
                <BusOperationId>352</BusOperationId>
              </Context>
            </xsl:when>
          </xsl:choose>
        </xsl:for-each>
      </xsl:for-each>
      <!-- Body -->
		</xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
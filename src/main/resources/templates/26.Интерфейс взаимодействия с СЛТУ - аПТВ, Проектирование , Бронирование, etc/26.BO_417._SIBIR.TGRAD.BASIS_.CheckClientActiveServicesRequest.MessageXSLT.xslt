<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/" xmlns:proj="http://nri.rt.ru/ProjectProposalSevice">
    <proj:CheckClientActiveServicesRequest>
      <xsl:for-each select="CheckClientActiveServicesRequest">
        <proj:originator>HERMES</proj:originator>
        <proj:receiver>
          <xsl:value-of select="receiver"/>
        </proj:receiver>
        <proj:payload>
          <xsl:for-each select="payload">
            <proj:targetLocation>
              <xsl:for-each select="targetLocation">
                <xsl:if test="locationCategory='GID'">
                  <proj:locationId>
                    <xsl:value-of select="locationId"/>
                  </proj:locationId>
                  <proj:locationCategory>STRICT</proj:locationCategory>
                  <proj:locationRegister>GID</proj:locationRegister>
                </xsl:if>
                <xsl:if test="locationCategory!='GID'">
                  <proj:locationCategory>GEO</proj:locationCategory>
                  <proj:locationRegister>GEO</proj:locationRegister>
                  <proj:locationAttributes>
                    <xsl:for-each select="locationAttributes">
                      <proj:attribute name="Latitude" status="AC" isChanged="false">
                        <xsl:value-of select="Latitude"/>
                      </proj:attribute>
                      <proj:attribute name="Longitude" status="AC" isChanged="false">
                        <xsl:value-of select="Longitude"/>
                      </proj:attribute>
                      <xsl:if test="room!=''">
                        <proj:attribute name="room" status="AC" isChanged="false">
                          <xsl:value-of select="room"/>
                        </proj:attribute>
                      </xsl:if>
                    </xsl:for-each>
                    <!-- locationAttributesn-->
                  </proj:locationAttributes>
                </xsl:if>
              </xsl:for-each>
              <!-- targetLocation-->
            </proj:targetLocation>
            <xsl:for-each select="client">
              <proj:client>
                <proj:partyRole>CLIENT</proj:partyRole>
                <proj:partyId>
                  <xsl:value-of select="partyId"/>
                </proj:partyId>
                <proj:partyName>
                  <xsl:value-of select="partyName"/>
                </proj:partyName>
              </proj:client>
            </xsl:for-each>
            <!-- client -->
          </xsl:for-each>
          <!-- payload -->
        </proj:payload>
      </xsl:for-each>
      <!-- CreateProjectProposalRequest-->
    </proj:CheckClientActiveServicesRequest>
  </xsl:template>
</xsl:stylesheet>
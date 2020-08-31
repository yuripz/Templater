<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/" xmlns:net="http://nri.rt.ru/NetworkCapability">
    <net:checkAccessCapabilityRequest>
      <xsl:for-each select="checkAccessCapabilityRequest">
        <net:originator>HERMES</net:originator>
        <net:receiver>DV.TGRAD</net:receiver>
        <net:payload>
          <xsl:for-each select="payload">
            <net:orderId>
              <xsl:value-of select="orderId"/>
            </net:orderId>
            <net:targetLocation>
              <xsl:for-each select="targetLocation">
                <xsl:if test="locationCategory!='GEO'">
                  <net:locationId>
                    <xsl:value-of select="locationId"/>
                  </net:locationId>
                  <net:locationCategory>STRICT</net:locationCategory>
                  <net:locationRegister>
                    <xsl:value-of select="locationCategory"/>
                  </net:locationRegister>
                </xsl:if>
                <xsl:if test="locationCategory='GEO'">
                  <net:locationCategory>GEO</net:locationCategory>
                  <net:locationAttributes>
                    <xsl:for-each select="locationAttributes">
                      <net:attribute name="Latitude" status="AC" isChanged="false">
                        <xsl:value-of select="Latitude"/>
                      </net:attribute>
                      <net:attribute name="Longitude" status="AC" isChanged="false">
                        <xsl:value-of select="Longitude"/>
                      </net:attribute>
                      <xsl:if test="room!=''">
                        <attribute name="room" status="AC" isChanged="false">
                          <xsl:value-of select="room"/>
                        </attribute>
                      </xsl:if>
                    </xsl:for-each>
                    <!-- locationAttributesn-->
                  </net:locationAttributes>
                </xsl:if>
              </xsl:for-each>
              <!-- targetLocation-->
            </net:targetLocation>
            <net:requiredCapacity>
              <xsl:value-of select="requiredCapacity"/>
            </net:requiredCapacity>
            <xsl:if test="technology!=''">
              <net:technology>
                <xsl:value-of select="technology"/>
              </net:technology>
            </xsl:if>
            <xsl:if test="searchRadius!=''">
              <net:searchRadius>
                <xsl:value-of select="searchRadius"/>
              </net:searchRadius>
            </xsl:if>
            <!--< net:range>1</net:range>   HE-3988 -->
            <net:existingLines>
              <xsl:for-each select="existingLines">
                <net:line>
                  <xsl:value-of select="LineParam"/>
                </net:line>
              </xsl:for-each>
              <!-- existingLines-->
            </net:existingLines>
          </xsl:for-each>
          <!-- payload -->
        </net:payload>
      </xsl:for-each>
      <!-- checkAccessCapabilityReques-->
    </net:checkAccessCapabilityRequest>
  </xsl:template>
</xsl:stylesheet>
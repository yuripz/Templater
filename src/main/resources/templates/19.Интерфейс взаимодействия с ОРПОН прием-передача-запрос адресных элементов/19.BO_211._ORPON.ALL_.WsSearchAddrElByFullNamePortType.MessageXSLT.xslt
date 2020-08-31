<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
      <ws:AddressElementNameData xmlns:ws="http://www.informatica.com/dis/ws/ws_">
        <xsl:for-each select="AddressElementNameData">
     
        <xsl:for-each select="AddressElementFullNameList">
 <AddressElementFullNameList>
        <xsl:for-each select="AddressElementFullNameGroup">
                <AddressElementFullNameGroup>
          <FullAddress>
            <xsl:value-of select="FullAddress"/>
          </FullAddress>
          <MaxResult>
            <xsl:value-of select="MaxResult"/>
          </MaxResult>
          <SystemCode>
            <xsl:value-of select="SystemCode"/>
          </SystemCode>
 </AddressElementFullNameGroup>
        </xsl:for-each>
         </AddressElementFullNameList>  
        </xsl:for-each>

        </xsl:for-each>
        <!--ws:AddressElementNameData-->
      </ws:AddressElementNameData>
  </xsl:template>
</xsl:stylesheet>
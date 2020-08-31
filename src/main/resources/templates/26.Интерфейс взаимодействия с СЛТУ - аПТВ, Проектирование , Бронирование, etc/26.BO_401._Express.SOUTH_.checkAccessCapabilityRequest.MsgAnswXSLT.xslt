<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
      <xsl:for-each select="checkAccessCapabilityResponse">
   <Confirmation>
   
     <ResultCode><xsl:value-of select="orderResult/orderResultCode"/></ResultCode>
    <Message><xsl:value-of select="orderResult/orderResultText"/></Message>
<!-- ÀÐÃÓÑ -->
     <xsl:for-each select="payload">
       <DetailList>
  
        <addressInfo>
               <hasCableEntry><xsl:value-of select="addressInfo/hasCableEntry"/></hasCableEntry>
               <hasCableDuct><xsl:value-of select="addressInfo/hasCableDuct"/></hasCableDuct>
               <buildingState><xsl:value-of select="addressInfo/buildingState"/></buildingState>
        </addressInfo>
       <xsl:for-each select="capabilities">
          <capabilities>
               <xsl:for-each select="capability">
               <capability>
                  <technology><xsl:value-of select="technology"/></technology>
                  <available><xsl:value-of select="available"/></available>
      <capabilityType><xsl:value-of select="capabilityType"/></capabilityType>
      <description><xsl:value-of select="description"/></description>
                  <networkEntry>
     <sequence>1</sequence>
          <xsl:if test="capabilityType='INSTALLATION'"> 
                  <siteInfo>
      <!-- EMPTY <xsl:value-of select=""/> -->
                  </siteInfo>
          </xsl:if>
               <xsl:for-each select="networkDevelopment">
                    
                     <siteInfo>
                     <solutionId><xsl:value-of select="solutionId"/></solutionId>
                     <siteId><xsl:value-of select="siteId"/></siteId>
                     <siteName><xsl:value-of select="siteName"/></siteName>
                     <siteType><xsl:value-of select="siteType"/></siteType>
                     <siteStatus><xsl:value-of select="siteStatus"/></siteStatus>
                     </siteInfo>
                 
               <xsl:for-each select="siteLocation">
                     <siteLocation>
                        <locationId><xsl:value-of select="locationId"/></locationId>
                        <locationCategory><xsl:value-of select="locationCategory"/></locationCategory>
                                     <xsl:if test="locationCategory!='GID'">    
           <xsl:for-each select="locationAttributes">      
      <locationAttributes>
      <xsl:for-each select="attribute">
      
        <xsl:element name="{@name}">
            <xsl:value-of select="."/>
        </xsl:element>
        <!-- xsl:apply-templates select="locationAttributes"/ -->

            </xsl:for-each> <!--  attrs-->
      </locationAttributes>
            </xsl:for-each> <!--  attrs-->
      </xsl:if>

                     </siteLocation>
                  </xsl:for-each> <!--    siteLocation -->
  <networkDevelopment>  
                     <siteHasCableEntry><xsl:value-of select="siteHasCableEntry"/></siteHasCableEntry>
                     <cableDuctPathLength><xsl:value-of select="cableDuctPathLength"/></cableDuctPathLength>
                     <projectPathLength><xsl:value-of select="projectPathLength"/></projectPathLength>
                  </networkDevelopment>
                  </xsl:for-each> <!--        networkDevelopment -->
                  <xsl:for-each select="equipmentList">
                  <equipmentList>
                  <xsl:for-each select="equipment">
                     <equipment>
                        <id><xsl:value-of select="id"/></id>
                        <name><xsl:value-of select="name"/></name>
                        <typeName><xsl:value-of select="typeName"/></typeName>
                        <category><xsl:value-of select="category"/></category>
                        <status><xsl:value-of select="status"/></status>
                        <centralOfficeId><xsl:value-of select="centralOfficeId"/></centralOfficeId>
                        <availableCapacity><xsl:value-of select="availableCapacity"/></availableCapacity>
                        <extraCapacity><xsl:value-of select="extraCapacity"/></extraCapacity>
                        <hasProjectFiberLink><xsl:value-of select="hasProjectFiberLink"/></hasProjectFiberLink>
                        <resolution><xsl:value-of select="resolution"/></resolution>
                              <xsl:if test="description!=''">
                                <description>
                                  <xsl:value-of select="description"/>
                                </description>
                              </xsl:if>
<xsl:for-each select="attributes">
  <attributes>
    <xsl:for-each select="attribute">
<!--<attribute name="{@name}"><xsl:value-of select="."/></attribute>-->
      <xsl:element name="{@name}">
        <xsl:value-of select="."/>
      </xsl:element>
    </xsl:for-each>
    <!--  attrs-->
 </attributes>
</xsl:for-each>
</equipment>
                              </xsl:for-each> <!--      equipment -->
                  </equipmentList>
         </xsl:for-each> <!--      equipmentList -->
         </networkEntry>
         
               </capability>
            </xsl:for-each> <!--  capability-->
          </capabilities>
     </xsl:for-each>
       </DetailList> 
     </xsl:for-each>
     <Next>RESOUT</Next>
   </Confirmation>
  </xsl:for-each> <!--  orderResult -->
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
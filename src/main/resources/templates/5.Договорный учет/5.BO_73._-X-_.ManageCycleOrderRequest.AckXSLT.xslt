<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <xsl:for-each select="ConfirmManageCycleOrderRequest">
            <Confirmation>
                <xsl:for-each select="NotFrameContract">
                    <ResultCode>
                        <xsl:value-of select="ResultCode"/>
                    </ResultCode>
                    <Message>
                        <xsl:value-of select="Message"/>
                    </Message>
                    <xsl:for-each select="NotFrameContractDetailList">
                         <DetailList> 
                            <xsl:for-each select="NotFrameContractDetail">
                                <Detail>
                                    <ExtOrderId><xsl:value-of select="ExtOrderId"/></ExtOrderId>
                                    <SysContractNum><xsl:value-of select="SysContractNum"/></SysContractNum>
                                    <xsl:for-each select="CycleList">
                                    <!--<DetailList> -->
                                    <CycleList>
                                        <xsl:for-each select="Cycle">
                                            <!--<Detail> -->
                                            <Cycle>
                                                <ExtCycleId><xsl:value-of select="ExtCycleId"/></ExtCycleId>
                                                <CycleId><xsl:value-of select="CycleId"/></CycleId>
                                                <StageId><xsl:value-of select="StageId"/></StageId>
                                            <!--</Detail>-->
                                            </Cycle>
                                        </xsl:for-each>
                                        <!--</DetailList>-->
                                        </CycleList>
                                    </xsl:for-each>
                                </Detail>
                            </xsl:for-each>
                        </DetailList>
                    </xsl:for-each>
                    <Next>RESOUT</Next>
                </xsl:for-each>
            </Confirmation>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<xsl:if test="Confirmation!=''">
			<xsl:for-each select="Confirmation">
				<xsl:for-each select="submitOrderResponse">
					<tns:submitOrderResponse xmlns:tns="http://oms.rt.ru/">
						<!--<xsl:copy-of select="../../Confirmation"/> -->
						<originator>HRMS</originator>
						<receiver>
							<xsl:value-of select="receiver"/>
						</receiver>
						<orderResult>
							<orderResultCode><xsl:value-of select="/Confirmation/ResultCode"/>
							</orderResultCode>
							<orderResultText>
								<xsl:value-of select="/Confirmation/Message"/>
							</orderResultText>
						</orderResult>
						<xsl:if test="requestId!=''">
							<requestId>
								<xsl:value-of select="requestId"/>
							</requestId>
						</xsl:if>
						<xsl:if test="requestId=''">
							<requestId>0-0-0-0</requestId>
						</xsl:if>
						<xsl:for-each select="order">
							<order>
								<response>
									<orderId>
										<xsl:value-of select="orderId"/>
									</orderId>
									<orderOMSId>
										<xsl:value-of select="orderOMSId"/>
									</orderOMSId>
									<orderOMSurl>https://hermes-test.rt.ru/express_ptv/uploads/single/<xsl:value-of select="orderOMSId"/>
									</orderOMSurl>
									<xsl:if test="/Confirmation/submitOrderResponse/order/orderStartDate!=''">
										<orderState>
											<xsl:value-of select="/Confirmation/submitOrderResponse/order/orderState"/>
										</orderState>
										<orderStartDate>
											<xsl:value-of select="/Confirmation/submitOrderResponse/order/orderStartDate"/>
										</orderStartDate>
									</xsl:if>
									<xsl:if test="/Confirmation/submitOrderResponse/order/orderCompletionDate!=''">
										<orderCompletionDate>
											<xsl:value-of select="/Confirmation/submitOrderResponse/order/orderCompletionDate"/>
										</orderCompletionDate>
									</xsl:if>
									<xsl:for-each select="orderParties">
										<orderParties>
											<xsl:for-each select="orderParty">
												<orderParty>
													<xsl:choose>
														<xsl:when test="partyRole='SOLUTION'">
															<partyRole>SOLUTION</partyRole>
															<xsl:for-each select="partyAttributes">
																<partyAttributes>
																	<xsl:if test="isMain='1'">
																		<attribute name="isMain">1</attribute>
																	</xsl:if>
																	<attribute name="connectionType">
																		<xsl:value-of select="connectionType"/>
																	</attribute>
																	<attribute name="technology">
																		<xsl:value-of select="technology"/>
																	</attribute>
																	<attribute name="implementationPeriod">
																		<xsl:value-of select="implementationPeriod"/>
																	</attribute>
																	<attribute name="capability">
																		<xsl:value-of select="capability"/>
																	</attribute>
																	<attribute name="buildingState">
																		<xsl:value-of select="buildingState"/>
																	</attribute>
																	<attribute name="equipmentCost">
																		<xsl:value-of select="equipmentFee"/>
																	</attribute>
																</partyAttributes>
															</xsl:for-each>
														</xsl:when>
													</xsl:choose>
												</orderParty>
											</xsl:for-each>
											<!-- orderParty -->
										</orderParties>
									</xsl:for-each>
									<!-- orderParties -->
									<!--
						<xsl:if test="/Confirmation/ResultCode='0'"><xsl:copy-of select="/Confirmation/submitOrderResponse/order/orderParties"/></xsl:if>
					-->
								</response>
							</order>
						</xsl:for-each>
					</tns:submitOrderResponse>
				</xsl:for-each>
				<!-- submitOrderResponse -->
			</xsl:for-each>
			<xsl:for-each select="Fault">
				<tns:Fault xmlns:tns="http://oms.rt.ru/">
					<ResultCode>
						<xsl:value-of select="ResultCode"/>
					</ResultCode>
					<Message>
						<xsl:value-of select="Message"/>
					</Message>
				</tns:Fault>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="Confirmation=''">
			<tns:Fault xmlns:tns="http://oms.rt.ru/">
				<ResultCode>
					<xsl:value-of select="ResultCode"/>
				</ResultCode>
				<Message>
					<xsl:value-of select="Message"/>
				</Message>
			</tns:Fault>
		</xsl:if>
		<xsl:if test="Result!=''">
			<tns:Fault xmlns:tns="http://oms.rt.ru/">
				<ResultCode>-10203</ResultCode>
				<Message>возврат из прикладного обработчика был произведен ранее, чем был сформирован ответ. Сбой синхронизации потоков
				</Message>
			</tns:Fault>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
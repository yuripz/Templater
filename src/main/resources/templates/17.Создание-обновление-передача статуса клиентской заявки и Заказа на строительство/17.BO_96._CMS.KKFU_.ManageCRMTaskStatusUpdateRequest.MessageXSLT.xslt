<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:xsi="http://www.w3.org/2001/XMLSchema"
xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/"
xmlns:urn="urn:DefaultNamespace" 
>
<xsl:template match="RequestAttachmentList">
<item>
   <FIELDNAME>FileURL</FIELDNAME>
   <FIELDVALUE xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
	<xsl:for-each select="RequestAttachment">   
    <item> <xsl:value-of select="AttachmentURL"/>  </item>
	</xsl:for-each>
   </FIELDVALUE>
</item>

<item>
   <FIELDNAME>FileName</FIELDNAME>
   <FIELDVALUE xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
   	<xsl:for-each select="RequestAttachment">   
   	    <item> <xsl:value-of select="AttachmentName"/> </item>
 	</xsl:for-each>
   </FIELDVALUE>
 </item>  
  
<item>
   <FIELDNAME>FileType</FIELDNAME>
   <FIELDVALUE xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
   	<xsl:for-each select="RequestAttachment">   
   	    <item> <xsl:value-of select="AttachmentCategory"/> </item>
 	</xsl:for-each>
   </FIELDVALUE>
 </item> 
   
<item>
   <FIELDNAME>FileAuthor</FIELDNAME>
   <FIELDVALUE xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
   	<xsl:for-each select="RequestAttachment">   
   	    <item> <xsl:value-of select="AttachmentAuthor"/> </item>
 	</xsl:for-each>
   </FIELDVALUE>
 </item>    
 
 <item>
   <FIELDNAME>FileDate</FIELDNAME>
   <FIELDVALUE xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
   	<xsl:for-each select="RequestAttachment">   
   	    <item> <xsl:value-of select="AttachmentDate"/> </item>
 	</xsl:for-each>
   </FIELDVALUE>
 </item> 

</xsl:template>

<xsl:template match="CRMTaskStatusUpdate">
	<xsl:for-each select="CRMRequestIdList">
		<xsl:for-each select="CRMRequest">
		<xsl:if test="ServiceType='LastMileRTC_CMS'">
		<DOCKEY> <xsl:value-of select="CRMRequestId"/> </DOCKEY>	
		</xsl:if>	
		</xsl:for-each>
	</xsl:for-each>
</xsl:template>

<xsl:template match="/" priority="1">
<urn:DOACTION >
	<xsl:for-each select="CRMTaskStatusUpdate">					
	<ACTIONNAME>UpdateServiceHermes</ACTIONNAME>
	<SYSTEMID>Hermes</SYSTEMID>
			
	<DATASET xsi:type="urn:DATASETARRAY">
		<FIELD xsi:type="urn:ArrayOfDATASETFIELD" soapenc:arrayType="urn:DATASETFIELD[]">
				<xsl:for-each select="CRMRequestIdList">
				<xsl:for-each select="CRMRequest">
					<xsl:if test="ServiceType='LastMileRTC_CMS'">
			<item>
				<FIELDNAME>orderItemId</FIELDNAME>
				<FIELDVALUE  xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
					<item>
						<xsl:value-of select="CRMRequestId"/>
					</item>
				</FIELDVALUE>
			</item>
					</xsl:if>		
				</xsl:for-each>
				</xsl:for-each>
				<!-- CRMRequestTaskList -->	
			<item>
				<FIELDNAME>orderItemAction</FIELDNAME>
				<FIELDVALUE  xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
					<item>
						<xsl:if test="CRMRequestStatus='FIELDSUPDATE'">FIELDSUPDATE</xsl:if>			
						<xsl:if test="CRMRequestStatus!='FIELDSUPDATE'">STATUSUPDATE</xsl:if>
					</item>
				</FIELDVALUE>
			</item>
				<item>            
					<FIELDNAME>fldPoint2LMOrgMethod</FIELDNAME>
						<FIELDVALUE xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
							<item><xsl:value-of select="ConnectTechnologyID"/></item> <!-- Тег из БО-96 -->
						</FIELDVALUE>            		
            	</item>

				<item>            
					<FIELDNAME>fldNetworkPath</FIELDNAME>
						<FIELDVALUE xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
							<item><xsl:value-of select="NetworkPath"/></item> <!-- Тег из БО-96 (задействованные участки сети) -->
						</FIELDVALUE>            		
            	</item>
				
				<item>            
					<FIELDNAME>fldRegionalFilial</FIELDNAME>
						<FIELDVALUE xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
							<item><xsl:value-of select="RegionalFilial"/></item> <!-- Тег из БО-96 (региональный филиал) -->
						</FIELDVALUE>            		
            	</item>

				<item> 
					<FIELDNAME>fldConnectionType</FIELDNAME>
						<FIELDVALUE xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
							<item> 
			<xsl:if test="TVready=''">Off net</xsl:if>			
			<xsl:if test="TVready!=''">On net</xsl:if>						
							</item> <!-- "On net" если CRMRequestStatus = COMPLETE, "Off net" для остальных значений CRMRequestStatus константа в зависимости от тега БО-96-->
						</FIELDVALUE>            		
            	</item>

				<item> 
					<FIELDNAME>fldNotReady</FIELDNAME>
						<FIELDVALUE xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
							<item> 
								<xsl:if test="SYSOrderStage='Клиент не готов'">1</xsl:if>			
								<xsl:if test="SYSOrderStage!='Клиент не готов'"></xsl:if>						
							</item> <!-- признак клиент не готов -->
						</FIELDVALUE>            		
            	</item>
				
				<item> 
					<FIELDNAME>fldNoTB</FIELDNAME>
						<FIELDVALUE xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
							<item> 
								<xsl:if test="NoTB=''"></xsl:if>			
								<xsl:if test="NoTB!=''">1</xsl:if>						
							</item> 
						</FIELDVALUE>            		
            	</item>
				<item> 
					<FIELDNAME>fldChannelIdSLTU</FIELDNAME>
						<FIELDVALUE xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
							<item><xsl:value-of select="LastMileID"/></item> <!-- Тег из БО-96 -->
						</FIELDVALUE>            		
            	</item>
                <item>
                	<FIELDNAME>fldIsAddCapCosts</FIELDNAME>
						<FIELDVALUE xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
							<item>
								<xsl:choose>
									<xsl:when test="(SMRCost='0') and (ProjectCost='0') and (OtherCost='0') and (EquipmentCost='0.00')">0</xsl:when>
									<xsl:when test="NoTB!=''">0</xsl:when>
									<xsl:otherwise>1</xsl:otherwise>
								</xsl:choose>
                            </item>
               		</FIELDVALUE>            		
            	</item>

				<item>
                	<FIELDNAME>fldUE</FIELDNAME>
						<FIELDVALUE xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
							<item>RUR</item> <!-- константа -->
						</FIELDVALUE>            		
            	</item>
			
				<item>
					<FIELDNAME>fldInstallFee</FIELDNAME>
						<FIELDVALUE xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
							<item><xsl:value-of select="SMRCost"/></item> <!-- Тег из БО-96 -->
						</FIELDVALUE>            		
					</item>

				<item>
               		<FIELDNAME>fldMonthlyFee</FIELDNAME>
						<FIELDVALUE xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
							<item><xsl:value-of select="ProjectCost"/></item> <!-- Тег из БО-96 -->
						</FIELDVALUE>            		
				</item>

				<item>
					<FIELDNAME>fldOtherFee</FIELDNAME>
						<FIELDVALUE xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
							<item><xsl:value-of select="OtherCost"/></item> <!-- Тег из БО-96 -->
               		</FIELDVALUE>            		
            	</item>

				<item>
                	<FIELDNAME>fldEquipmentFee</FIELDNAME>
						<FIELDVALUE xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
							<item><xsl:value-of select="EquipmentCost"/></item> <!-- Тег из БО-96 -->
						</FIELDVALUE>            		
            	</item>

				<item>
               		<FIELDNAME>fldEquipmentName</FIELDNAME>
						<FIELDVALUE xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
							<item><xsl:value-of select="EquipmentName"/></item> <!-- Тег из БО-96 -->
						</FIELDVALUE>            		
            	</item>

				<item>
               		<FIELDNAME>fldVAT</FIELDNAME>
						<FIELDVALUE xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
							<item>без НДС</item> <!-- константа -->
						</FIELDVALUE>            		
            	</item>

				<item>
                	<FIELDNAME>fldHrmsCRMOrderOperation</FIELDNAME>
						<FIELDVALUE xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
							<item><xsl:value-of select="SYSOrderStage"/></item> <!-- Тег из БО-96 -->
						</FIELDVALUE>            		
            	</item>
				
			<xsl:if test="SYSBuildStage!=''">				
				<item>
                	<FIELDNAME>fldHrmsCRMBuildOperation</FIELDNAME>
						<FIELDVALUE xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
							<item><xsl:value-of select="SYSBuildStage"/></item> <!-- Тег из БО-96 -->
						</FIELDVALUE>            		
            	</item>
			</xsl:if>				

				<item>
                	<FIELDNAME>fldHrmsSYSOrderComment</FIELDNAME>
						<FIELDVALUE xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
							<item><xsl:value-of select="GoToCommentOrder"/></item> <!-- Тег из БО-96 -->
						</FIELDVALUE>            		
            	</item>
		
			<item>
				<FIELDNAME>orderItemNewStatus</FIELDNAME>
				<FIELDVALUE  xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
					<item><xsl:value-of select="CRMRequestStatus"/></item>
				</FIELDVALUE>
			</item>

<item>
<FIELDNAME>fldPoint1Name </FIELDNAME> <!--- значение Point1Name из БО-96 -->
				<FIELDVALUE  xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
					<item><xsl:value-of select="Point1Name"/></item>
				</FIELDVALUE>
</item>
<item>
<FIELDNAME>fldPoint1Address</FIELDNAME> <!--- значение Point3Addressиз БО-96 -->
				<FIELDVALUE  xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
					<item><xsl:value-of select="Point1Address"/></item>
				</FIELDVALUE>
</item>
<item>
<FIELDNAME>fldPoint1Interface</FIELDNAME> <!--- значение Point1Interface из БО-96 -->
				<FIELDVALUE  xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
					<item><xsl:value-of select="Point1Interface"/></item>
				</FIELDVALUE>
</item>
<item>
<FIELDNAME>fldPoint1Equipment</FIELDNAME> <!--- значение Point1Equipment из БО-96    -->
				<FIELDVALUE  xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
					<item><xsl:value-of select="Point1Equipment"/></item>
				</FIELDVALUE>
</item>
<item>
<FIELDNAME>fldPoint3Name</FIELDNAME> <!--- значение Point3Name из БО-96                 -->
				<FIELDVALUE  xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
					<item><xsl:value-of select="Point3Name"/></item>
				</FIELDVALUE>
</item>
<item>
<FIELDNAME>fldPoint3Address</FIELDNAME> <!--- значение Point3Address из БО-96 -->
				<FIELDVALUE  xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
					<item><xsl:value-of select="Point3Address"/></item>
				</FIELDVALUE>
</item>
<item>
<FIELDNAME>fldPoint3Interface</FIELDNAME> <!--- значение Point3Interface из БО-96-->
				<FIELDVALUE  xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
					<item><xsl:value-of select="Point3Interface"/></item>
				</FIELDVALUE>
</item>
<item>
<FIELDNAME>fldPoint3Equipment</FIELDNAME> <!-- значение Point3Equipment из БО-96 -->
				<FIELDVALUE  xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
					<item><xsl:value-of select="Point3Equipment"/></item>
				</FIELDVALUE>
</item>

<item>
<FIELDNAME>fldPoint1Name </FIELDNAME> <!--- значение Point1Name из БО-96 -->
				<FIELDVALUE  xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
					<item><xsl:value-of select="Point1Name"/></item>
				</FIELDVALUE>
</item>
	
<item>
<FIELDNAME>fldApprovalRequired</FIELDNAME> <!--- Признак непустого значения ApprovalDetailing из БО-96 -->
		<FIELDVALUE  xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
			<item>
				<xsl:if test="ApprovalDetailing=''">Нет</xsl:if>			
				<xsl:if test="ApprovalDetailing!=''">Да</xsl:if>	
			</item>
		</FIELDVALUE>
</item>

<item>
<FIELDNAME>fldApprovalDetailing</FIELDNAME> <!--- значение из БО-96 -->
		<FIELDVALUE  xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
			<item><xsl:value-of select="ApprovalDetailing"/></item>
		</FIELDVALUE>
</item>

<item>
<FIELDNAME>fldTechSolLifetime</FIELDNAME> <!--- значение из БО-96 -->
		<FIELDVALUE  xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
			<item><xsl:value-of select="TechSolLifetime"/></item>
		</FIELDVALUE>
</item>

	
<item>
<FIELDNAME>fldImplPeriod</FIELDNAME> <!--- значение из БО-96 -->
		<FIELDVALUE  xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
			<item><xsl:value-of select="ImplPeriod"/></item>
		</FIELDVALUE>
</item>

<item>
<FIELDNAME>fldPoint2LInchOrgMethod</FIELDNAME> <!--- значение из БО-96 -->
		<FIELDVALUE  xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
			<item><xsl:value-of select="Point2LInchOrgMethod"/></item>
		</FIELDVALUE>
</item>
	
<item>
<FIELDNAME>fldSolutionPicture</FIELDNAME> <!--- значение из БО-96 -->
		<FIELDVALUE  xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
			<item><xsl:value-of select="SolutionPicture"/></item>
		</FIELDVALUE>
</item>
	

<item>
<FIELDNAME>fldInCanalization</FIELDNAME> <!--- значение из БО-96 -->
		<FIELDVALUE  xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
			<item><xsl:value-of select="InCanalization"/></item>
		</FIELDVALUE>
</item>
	

<item>
<FIELDNAME>fldNeedHole</FIELDNAME> <!--- значение из БО-96 -->
		<FIELDVALUE  xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
			<item>
                            <xsl:if test="BuildCanalization='0'">Нет</xsl:if>
                            <xsl:if test="BuildCanalization!='0'">Да</xsl:if>
                        </item>
		</FIELDVALUE>
</item>
	
<item>
<FIELDNAME>fldAirCable</FIELDNAME> <!--- значение из БО-96 -->
		<FIELDVALUE  xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
			<item><xsl:value-of select="AirCable"/></item>
		</FIELDVALUE>
</item>
	

<item>
<FIELDNAME>fldHrmsExtraPaysExecutor</FIELDNAME> <!--- значение из БО-96 -->
		<FIELDVALUE  xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
			<item><xsl:value-of select="Contractor"/></item>
		</FIELDVALUE>
</item>

<item>
<FIELDNAME>fldGroundCable</FIELDNAME> <!--- значение из БО-96 -->
		<FIELDVALUE  xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
			<item><xsl:value-of select="GroundCable"/></item>
		</FIELDVALUE>
</item>
	

<item>
<FIELDNAME>fldHrmsExtraPaysMethod</FIELDNAME> <!--- значение из БО-96 -->
		<FIELDVALUE  xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
			<item><xsl:value-of select="WorkMethod"/></item>
		</FIELDVALUE>
</item>
	

<item>
<FIELDNAME>fldBuildCanalization</FIELDNAME> <!--- значение из БО-96 -->
		<FIELDVALUE  xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
			<item><xsl:value-of select="BuildCanalization"/></item>
		</FIELDVALUE>
</item>

	
<item>
<FIELDNAME>ReturnReason</FIELDNAME> <!--- значение из БО-96 -->
		<FIELDVALUE  xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
			<item>
				<xsl:if test="CRMRequestStatus!='COMPLETE'"><xsl:value-of select="CancelReason"/></xsl:if>
			</item>
		</FIELDVALUE>
</item>

<item>
<FIELDNAME>fldSpecialNotes</FIELDNAME> <!--- значение из БО-96(особые условия) -->
		<FIELDVALUE  xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
			<item><xsl:value-of select="SpecialNotes"/></item>
		</FIELDVALUE>
</item>


<item>
<FIELDNAME>fldLMCrossing</FIELDNAME> <!--- значение из БО-96(кроссировка на УД) -->
		<FIELDVALUE  xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
			<item><xsl:value-of select="LMCrossing"/></item>
		</FIELDVALUE>
</item>

<item>
<FIELDNAME>Solution</FIELDNAME> <!--- значение из БО-96(альбом типовых решений) -->
		<FIELDVALUE  xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
			<item><xsl:value-of select="ProjectSolution"/></item>
		</FIELDVALUE>
</item>

<item>
<FIELDNAME>fldRespPersNumber</FIELDNAME> <!--- значение из БО-96(табельный номер Менеджера БТИ) -->
		<FIELDVALUE  xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
			<item><xsl:value-of select="RespPersNumber"/></item>
		</FIELDVALUE>
</item>

<item>
<FIELDNAME>fldLMOrgLevel</FIELDNAME> <!--- значение из БО-96(уровень организации LastMile) -->
		<FIELDVALUE  xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
			<item><xsl:value-of select="LMOrgLevel"/></item>
		</FIELDVALUE>
</item>

<item>
<FIELDNAME>fldHrmsWorkMethod</FIELDNAME> <!--- значение из БО-96(Способ организации работ) -->
		<FIELDVALUE  xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
			<item><xsl:value-of select="WorkMethod"/></item>
		</FIELDVALUE>
</item>
<item>
<FIELDNAME>SMRDone</FIELDNAME> <!--- Признак завершения СМР -->
		<FIELDVALUE  xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
			<item><xsl:value-of select="SMRDone"/></item>
		</FIELDVALUE>
</item>


			<item>
			<FIELDNAME>fldHrmsSYSUsrName</FIELDNAME>
				<FIELDVALUE  xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
					<item><xsl:value-of select="StatusSYSUsrName"/></item>
				</FIELDVALUE>
			</item>

			<item>
			<FIELDNAME>fldHrmsSYSUsrEMail</FIELDNAME>
				<FIELDVALUE  xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
					<item><xsl:value-of select="StatusSYSUsrEMail"/></item>
				</FIELDVALUE>
			</item>
	
			<xsl:apply-templates select="RequestAttachmentList"/>
				
	<xsl:if test="SYSOrderStage='Ожидание согласования организации для локального проекта CRM'">
			<item>
			<FIELDNAME>fldFinanceSource</FIELDNAME>
				<FIELDVALUE  xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
					<item><xsl:value-of select="//FinanceSource"/></item>
				</FIELDVALUE>
			</item>
			<item>
			<FIELDNAME>InvestResult</FIELDNAME>
				<FIELDVALUE  xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
					<item>Да</item>
				</FIELDVALUE>
			</item>
			<item>
			<FIELDNAME>InvestResultComment</FIELDNAME>
				<FIELDVALUE  xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
					<item><xsl:value-of select="GoToCommentOrder"/></item>
				</FIELDVALUE>
			</item>
	</xsl:if>
	
		<xsl:if test="SYSOrderStage='Инвестиции не выделены (для проекта CRM)'">
			<item>
			<FIELDNAME>fldFinanceSource</FIELDNAME>
				<FIELDVALUE  xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
					<item><xsl:value-of select="//FinanceSource"/></item>
				</FIELDVALUE>
			</item>
			<item>
			<FIELDNAME>InvestResult</FIELDNAME>
				<FIELDVALUE  xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
					<item>Нет</item>
				</FIELDVALUE>
			</item>
			<item>
			<FIELDNAME>InvestResultComment</FIELDNAME>
				<FIELDVALUE  xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
					<item><xsl:value-of select="GoToCommentOrder"/></item>
				</FIELDVALUE>
			</item>
	</xsl:if>
	
	<xsl:if test="SYSOrderStage='Уточнение в ГСП для строительства'">
			<item>
			<FIELDNAME>ReTechSolution</FIELDNAME>
				<FIELDVALUE  xsi:type="soapenc:Array" soapenc:arrayType="xsd:string[1]">
					<item>1</item>
				</FIELDVALUE>
			</item>			
	</xsl:if>
		</FIELD>
				
	</DATASET>
				</xsl:for-each>

				<!--CRMTaskStatusUpdate -->
<xsl:apply-templates select="CRMTaskStatusUpdate" />

</urn:DOACTION>
</xsl:template>
</xsl:stylesheet>
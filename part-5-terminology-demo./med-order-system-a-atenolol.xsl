<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:cda="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    
    <xsl:output method="text" encoding="UTF-8"/>
    
    <xsl:template match="/">  
        {
        "orderer": "91d20d7a-ca22-4198-b0c5-6bfc8f806467",
        "type": "drugorder",
        "patient": "020f9272-94c0-450a-bee9-1f6497ed471a",
        "concept": "316441ec-c0fd-44bc-a040-c68f4da8d228",
        "careSetting": "6f0c9a92-6f24-11e3-af88-005056821db0", 
        "encounter": "98a4edf3-057d-4f92-9c4f-14094ca4197e",
        "frequency": "9d7c32a2-3f10-11e4-adec-0800271c1b75",
        "drug": "316441ec-c0fd-44bc-a040-c68f4da8d228",
        "dosingType": "org.openmrs.SimpleDosingInstructions",
        "dose": "50",
        "doseUnits": "9d6691d8-3f10-11e4-adec-0800271c1b75",
        "quantity": "<xsl:value-of select="//cda:entryRelationship/cda:supply/cda:quantity/@value"/>",
        "quantityUnits": "86239663-7b04-4563-b877-d7efc4fe6c46", 
        "duration": 0, 
        "durationUnits": "bb62c684-3f10-11e4-adec-0800271c1b75", 
        "numRefills": 0, 
        "route": "9d6bc13f-3f10-11e4-adec-0800271c1b75",
        "brandName": "Tenormin", 
        "dispenseAsWritten": true 
        }
    </xsl:template>
</xsl:stylesheet>

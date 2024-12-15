<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cda="urn:hl7-org:v3">
    <xsl:output method="text"/>
    
    <xsl:template match="/">
        <xsl:variable name="medication" select="//cda:component/cda:section[cda:templateId/@root='2.16.840.1.113883.10.20.22.2.1.1']"/>
        <xsl:variable name="drug1" select="$medication/cda:entry/cda:substanceAdministration/cda:consumable[cda:manufacturedProduct/cda:manufacturedMaterial/cda:code/@code='205304']"/>
    {
        "concept": <xsl:value-of select="$medication/cda:entry/cda:substanceAdministration/cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/cda:code/@code"/>",
        "name": "<xsl:value-of select="$drug1/cda:manufacturedProduct/cda:manufacturedMaterial/cda:code/@displayName"/>",
        "minimumDailyDose": "<xsl:value-of select="$medication/cda:entry/cda:substanceAdministration/cda:doseQuantity[1]/@value"/>",
        "maximumDailyDose": "<xsl:value-of select="$medication/cda:entry/cda:substanceAdministration/cda:doseQuantity[1]/@value"/>",
        "dosageForm": "<xsl:value-of select="$medication/cda:entry/cda:substanceAdministration/cda:administrationUnitCode/@displayName"/>"
    }
        <xsl:variable name="drug2" select="$medication/cda:entry/cda:substanceAdministration/cda:consumable[cda:manufacturedProduct/cda:manufacturedMaterial/cda:code/@code='197380']"/>
    {
        "concept": <xsl:value-of select="$drug2/cda:manufacturedProduct/cda:manufacturedMaterial/cda:code/@code"/>",
        "name": "<xsl:value-of select="$drug2/cda:manufacturedProduct/cda:manufacturedMaterial/cda:code/@displayName"/>",
        "minimumDailyDose": "<xsl:value-of select="$medication/cda:entry/cda:substanceAdministration/cda:doseQuantity[1]/@value"/>",
        "maximumDailyDose": "<xsl:value-of select="$medication/cda:entry/cda:substanceAdministration/cda:doseQuantity[1]/@value"/>",
        "dosageForm": "<xsl:value-of select="$medication/cda:entry/cda:substanceAdministration/cda:administrationUnitCode/@displayName"/>"
    }
    </xsl:template>
</xsl:stylesheet>


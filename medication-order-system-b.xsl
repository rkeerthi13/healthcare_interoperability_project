<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:cda="urn:hl7-org:v3">
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:template match="/">
        <output>
            <drug>
                <description><xsl:value-of select="//cda:component/cda:section[cda:templateId/@root = '2.16.840.1.113883.10.20.22.2.1.1']/cda:entry/cda:substanceAdministration/cda:consumable[cda:manufacturedProduct/cda:manufacturedMaterial/cda:code/@code = '205304']/cda:manufacturedProduct/cda:manufacturedMaterial/cda:code/@displayName"/></description>
                <JavaClassName>org.openmrs.DrugOrder</JavaClassName>
            </drug>
            <drug>
                <description><xsl:value-of select="//cda:component/cda:section[cda:templateId/@root = '2.16.840.1.113883.10.20.22.2.1.1']/cda:entry/cda:substanceAdministration/cda:consumable[cda:manufacturedProduct/cda:manufacturedMaterial/cda:code/@code = '197380']/cda:manufacturedProduct/cda:manufacturedMaterial/cda:code/@displayName"/></description>
                <JavaClassName>org.openmrs.DrugOrder</JavaClassName>
            </drug>
        </output>
    </xsl:template>
</xsl:stylesheet>

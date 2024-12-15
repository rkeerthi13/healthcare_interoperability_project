<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:n1="urn:hl7-org:v3">
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:template match="/">
        <patient>
            <names>
                <givenName>
                    <xsl:value-of select="//n1:recordTarget/n1:patientRole/n1:patient/n1:name/n1:given"/>
                </givenName>
                <familyName>
                    <xsl:value-of select="//n1:recordTarget/n1:patientRole/n1:patient/n1:name/n1:family"/>
                </familyName>
            </names>
            <gender>
                <xsl:value-of select="//n1:recordTarget/n1:patientRole/n1:patient/n1:administrativeGenderCode/@code"/>
            </gender>
            <birthdate>
                <xsl:value-of select="//n1:recordTarget/n1:patientRole/n1:patient/n1:birthTime/@value"/>
            </birthdate>
            <addresses>
                <address>
                    <address1>
                        <xsl:value-of select="//n1:recordTarget/n1:patientRole/n1:addr/n1:streetAddressLine"/>
                    </address1>
                    <cityVillage>
                        <xsl:value-of select="//n1:recordTarget/n1:patientRole/n1:addr/n1:city"/>
                    </cityVillage>
                    <country>
                        <xsl:value-of select="//n1:recordTarget/n1:patientRole/n1:addr/n1:country"/>
                    </country>
                    <postalCode>
                        <xsl:value-of select="//n1:recordTarget/n1:patientRole/n1:addr/n1:postalCode"/>
                    </postalCode>
                </address>
            </addresses>
        </patient>
    </xsl:template>
</xsl:stylesheet>

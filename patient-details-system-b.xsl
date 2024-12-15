<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:cda="urn:hl7-org:v3"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:output method="text"/>
    
    <xsl:template match="/">
        <xsl:variable name="patient" select="//cda:recordTarget/cda:patientRole/cda:patient"/>
        <xsl:variable name="address" select="//cda:recordTarget/cda:patientRole/cda:addr"/>
        
        <!-- extracting birthTime -->
        <xsl:variable name="birthYear" select="substring($patient/cda:birthTime/@value, 1, 4)" />
        <xsl:variable name="birthMonth" select="substring($patient/cda:birthTime/@value, 5, 2)" />
        <xsl:variable name="birthDay" select="substring($patient/cda:birthTime/@value, 7, 2)" />
        
        <!-- Construct the birthdate in the desired format -->
        <xsl:variable name="birthdate" select="concat($birthYear, '-', $birthMonth, '-', $birthDay)" />
        
        <!-- Use $birthdate for YYYY-MM-DD format -->
        
        <xsl:text>{&#xA;</xsl:text> 
        <xsl:text>    "names": [&#xA;</xsl:text>
        <xsl:text>      {&#xA;</xsl:text>
        <xsl:text>        "givenName": "</xsl:text>
        <xsl:value-of select="$patient/cda:name/cda:given"/>
        <xsl:text>",&#xA;</xsl:text>
        <xsl:text>        "familyName": "</xsl:text>
        <xsl:value-of select="$patient/cda:name/cda:family"/>
        <xsl:text>"&#xA;</xsl:text>
        <xsl:text>      }&#xA;</xsl:text>
        <xsl:text>    ],&#xA;</xsl:text>
        <xsl:text>    "gender": "</xsl:text>
        <xsl:value-of select="$patient/cda:administrativeGenderCode/@code"/>
        <xsl:text>",&#xA;</xsl:text>
        <xsl:text>    "birthdate": "</xsl:text>
        <xsl:value-of select="$birthdate"/>
        <xsl:text>",&#xA;</xsl:text>
        <xsl:text>    "addresses": [&#xA;</xsl:text>
        <xsl:text>      {&#xA;</xsl:text>
        <xsl:text>        "address1": "</xsl:text>
        <xsl:value-of select="$address/cda:streetAddressLine"/>
        <xsl:text>",&#xA;</xsl:text>
        <xsl:text>        "cityVillage": "</xsl:text>
        <xsl:value-of select="$address/cda:city"/>
        <xsl:text>",&#xA;</xsl:text>
        <xsl:text>        "country": "</xsl:text>
        <xsl:value-of select="$address/cda:country"/>
        <xsl:text>",&#xA;</xsl:text>
        <xsl:text>        "postalCode": "</xsl:text>
        <xsl:value-of select="$address/cda:postalCode"/>
        <xsl:text>"&#xA;</xsl:text>
        <xsl:text>      }&#xA;</xsl:text>
        <xsl:text>    ]&#xA;</xsl:text>
        <xsl:text>  },&#xA;</xsl:text>
    </xsl:template>   
</xsl:stylesheet>


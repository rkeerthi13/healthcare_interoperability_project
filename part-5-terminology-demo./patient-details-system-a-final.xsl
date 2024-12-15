<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:cda="urn:hl7-org:v3"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:date="http://exslt.org/dates-and-times">
    
    <xsl:output method="text" encoding="UTF-8"/>
    
    <xsl:variable name="patient" select="//cda:recordTarget/cda:patientRole/cda:patient"/>
    <xsl:variable name="address" select="//cda:recordTarget/cda:patientRole/cda:addr"/>
    
    <!-- extracting birthTime -->
    <xsl:variable name="birthYear" select="substring($patient/cda:birthTime/@value, 1, 4)"/>
    <xsl:variable name="birthMonth" select="substring($patient/cda:birthTime/@value, 5, 2)"/>
    <xsl:variable name="birthDay" select="substring($patient/cda:birthTime/@value, 7, 2)"/>
    
    <!-- Construct the birthdate in the desired format -->
    <xsl:variable name="birthdate" select="concat($birthYear, '-', $birthMonth, '-', $birthDay)"/>
    <xsl:variable name="birthtime" select="'00:00:00.000+0100'"/>
    
    <!-- Use $birthdate for YYYY-MM-DD format -->
    
    <!--Create Data Format of the document -->
    <xsl:variable name="dateYear" select="substring(//cda:encounter//cda:effectiveTime/@value, 1, 4)"/>
    <xsl:variable name="dateMonth" select="substring(//cda:encounter//cda:effectiveTime/@value, 5, 2)"/>
    <xsl:variable name="dateDay" select="substring(//cda:encounter//cda:effectiveTime/@value, 7, 2)"/>
    <xsl:variable name="dateTime" select="substring(//cda:encounter//cda:effectiveTime/@value, 9, 2)"/>
    <xsl:variable name="dateSeconds1" select="substring(//cda:encounter//cda:effectiveTime/@value, 11, 2)"/>
    <xsl:variable name="dateSeconds2" select="substring(//cda:encounter//cda:effectiveTime/@value, 13, 2)"/>
    <xsl:variable name="dateFormat" select="concat($dateYear, '-', $dateMonth, '-', $dateDay, 'T', $dateTime, ':', $dateSeconds1, ':', $dateSeconds2, '.000+0000')"/>
    
    <!-- Match the root element of the document -->
    <xsl:template match="/">
        {
        "identifiers":[
        {
        "identifier":"103VWW1",
        "identifierType":"81433852-3f10-11e4-adec-0800271c1b75",
        "location":"baf7bd38-d225-11e4-9c67-080027b662ec",
        "preferred":true
        }
        ],
        "person":{
        "gender":"<xsl:value-of select="$patient/cda:administrativeGenderCode/@code"/>",
        "age":<xsl:value-of select="floor(number(substring(date:date(), 1, 4)) - number($birthYear))"/>,
        "birthdate":"<xsl:value-of select="concat($birthdate, 'T', $birthtime)"/>",
        "birthdateEstimated":false,
        "dead":false,
        "deathDate":null,
        "causeOfDeath":null,
        "names":[
        {
        "givenName":"<xsl:value-of select="$patient/cda:name/cda:given"/>",
        "familyName":"<xsl:value-of select="$patient/cda:name/cda:family"/>"
        }
        ],
        "addresses":[
        {
        "address1":"<xsl:value-of select="$address/cda:streetAddressLine"/>",
        "cityVillage":"<xsl:value-of select="$address/cda:city"/>",
        "country":"<xsl:value-of select="$address/cda:country"/>",
        "postalCode":"<xsl:value-of select="$address/cda:postalCode"/>"
        }
        ]
        }
        }
    </xsl:template>
</xsl:stylesheet>
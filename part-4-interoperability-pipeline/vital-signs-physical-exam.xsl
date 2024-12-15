<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:cda="urn:hl7-org:v3"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:output method="text" encoding="UTF-8"/>
    
    <!-- Match the root element of the document -->
    <xsl:template match="/">
        <xsl:text>[&#xA;</xsl:text>
        <!-- Apply templates to extract vital signs -->
        <xsl:apply-templates
            select="//cda:component//cda:section//cda:entry//cda:organizer//cda:component//cda:observation"/>
        <xsl:text>]&#xA;</xsl:text>
        
        <!-- Extract physical exam -->
        <xsl:apply-templates select="//cda:section[cda:code/@code='29545-1']"/>
    </xsl:template>
    
    <!--Create Data Format of the document -->
    <xsl:variable name="dateYear" select="substring(//cda:encounter//cda:effectiveTime/@value, 1, 4)"/>
    <xsl:variable name="dateMonth" select="substring(//cda:encounter//cda:effectiveTime/@value, 5, 2)"/>
    <xsl:variable name="dateDay" select="substring(//cda:encounter//cda:effectiveTime/@value, 7, 2)"/>
    <xsl:variable name="dateTime" select="substring(//cda:encounter//cda:effectiveTime/@value, 9, 2)"/>
    <xsl:variable name="dateSeconds1" select="substring(//cda:encounter//cda:effectiveTime/@value, 11, 2)"/>
    <xsl:variable name="dateSeconds2" select="substring(//cda:encounter//cda:effectiveTime/@value, 13, 2)"/>
    <xsl:variable name="dateFormat"
        select="concat($dateYear, '-', $dateMonth, '-', $dateDay, 'T', $dateTime, ':', $dateSeconds1, ':', $dateSeconds2, '.000+0000')"/>
    
    <!-- Match observation elements -->
    <xsl:template match="cda:observation">
        <!-- Check if the observation is for blood pressure, height, or weight -->
        <xsl:choose>
            <xsl:when test="cda:code/@code = '8480-6' or cda:code/@code = '8462-4' or cda:code/@code = '8302-2'">
                <xsl:text>{&#xA;</xsl:text>
                <!-- Extract information -->
                <xsl:text>  "person": "</xsl:text>
                <xsl:value-of select="//cda:recordTarget//cda:patientRole//cda:id/@root"/>
                <xsl:text>",&#xA;</xsl:text>
                <xsl:text>  "concept": "</xsl:text>
                <xsl:value-of select="cda:code/@code"/>
                <xsl:text>",&#xA;</xsl:text>
                <xsl:text>  "obsDatetime": "</xsl:text>
                <xsl:value-of select="$dateFormat"/>
                <xsl:text>",&#xA;</xsl:text>
                <xsl:text>  "value": "</xsl:text>
                <xsl:value-of select="cda:value/@value"/>
                <xsl:text>"&#xA;</xsl:text>
                <xsl:text>}</xsl:text>
                <!-- Add comma if not the last observation -->
                <xsl:if test="position() != last()">,</xsl:if>
                <xsl:text>&#xA;</xsl:text>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <!-- Match the physical exam section -->
    <xsl:template match="cda:section[cda:code/@code='29545-1']">
        <xsl:text>{&#xA;</xsl:text>
        <xsl:text>  "person": "</xsl:text>
        <xsl:value-of select="//cda:recordTarget//cda:patientRole//cda:id/@root"/>
        <xsl:text>",&#xA;</xsl:text>
        <xsl:text>  "concept": "</xsl:text>
        <xsl:value-of select="cda:code/@code"/>
        <xsl:text>",&#xA;</xsl:text>
        <xsl:text>  "obsDatetime": "</xsl:text>
        <xsl:value-of select="$dateFormat"/>
        <xsl:text>",&#xA;</xsl:text>
        <xsl:text>  "value": "</xsl:text>
        <xsl:for-each select="cda:text/cda:list/cda:item">
            <xsl:value-of select="."/>
            <xsl:text> </xsl:text>
        </xsl:for-each>
        <xsl:text>"&#xA;</xsl:text>
        <xsl:text>}</xsl:text>
    </xsl:template>
    
</xsl:stylesheet>
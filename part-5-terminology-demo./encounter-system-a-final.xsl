<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:cda="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xsl:output method="text" encoding="UTF-8"/>
    
    <!-- Create Date Format of the document -->
    <xsl:variable name="dateYear" select="substring(//cda:encounter//cda:effectiveTime/@value, 1, 4)"/>
    <xsl:variable name="dateMonth" select="substring(//cda:encounter//cda:effectiveTime/@value, 5, 2)"/>
    <xsl:variable name="dateDay" select="substring(//cda:encounter//cda:effectiveTime/@value, 7, 2)"/>
    <xsl:variable name="dateHour" select="substring(//cda:encounter//cda:effectiveTime/@value, 9, 2)"/>
    <xsl:variable name="dateMinute" select="substring(//cda:encounter//cda:effectiveTime/@value, 11, 2)"/>
    <xsl:variable name="dateSecond" select="substring(//cda:encounter//cda:effectiveTime/@value, 13, 2)"/>
    <xsl:variable name="dateMillisecond" select="substring(//cda:encounter//cda:effectiveTime/@value, 15, 3)"/>
    
    <xsl:variable name="dateFormat" select="concat($dateYear, '-', $dateMonth, '-', $dateDay, 'T', $dateHour, ':', $dateMinute, ':', $dateSecond, '.', $dateMillisecond, '+0000')"/>
    
    <!-- Match the root element of the document -->
    <xsl:template match="/">  
        {
        "encounterDatetime": "2024-03-01T00:00:00.000+0100",
        "patient": "020f9272-94c0-450a-bee9-1f6497ed471a",
        "encounterType": "81852aee-3f10-11e4-adec-0800271c1b75",
        "location": "baf7bd38-d225-11e4-9c67-080027b662ec",
        <!-- chief complaint - Headache -->
        "obs":[{
        "concept": "c3959ab5-3f10-11e4-adec-0800271c1b75",
        "obsDatetime": "2024-03-01T00:00:00.000+0100",
        "value": "1f592562-4e15-11e4-8a57-0800271c1b75"
        },{
        <!-- Social History(smoking history) -->
        "concept": "c2a43174-c9db-4e54-8516-17372c83537f",
        "obsDatetime": "2024-03-01T00:00:00.000+0100",
        "value": "true"
        },{
        <!-- Social History(non-alcoholic) -->
        "concept": "bf2f300e-a61b-4145-997a-72b40e35ea2e",
        "obsDatetime": "2024-03-01T00:00:00.000+0100",
        "value": "false"
        },{<!-- Family History (Hypertension) -->
        "concept": "cb5be653-8370-4126-bc6b-637aa4f17813",
        "obsDatetime": "2024-03-01T00:00:00.000+0100",
        "value": "true"
        },{ <!-- Family history - Diabetes Mellitus) -->
        "concept": "5ea42483-cdcf-4cd9-a58a-da9e43fe583a",
        "obsDatetime": "2024-03-01T00:00:00.000+0100",
        "value": "true"
        },{<!-- Diagnoses (hypertension) -->
        "concept": "81c7149b-3f10-11e4-adec-0800271c1b75",
        "obsDatetime": "2024-03-01T00:00:00.000+0100",
        "value": "8961717d-b30d-46b1-b917-ff5a463fcb51" 
        },{ <!-- Systolic Blood Pressure) -->
        "concept": "c36e9c8b-3f10-11e4-adec-0800271c1b75",
        "obsDatetime": "2024-03-01T00:00:00.000+0100",
        "value": "132"
        },{ <!-- Diastolic Blood Pressure) -->
        "concept": "c379aa1d-3f10-11e4-adec-0800271c1b75",
        "obsDatetime": "2024-03-01T00:00:00.000+0100",
        "value": "80"
        },{ <!-- Height) -->
        "concept": "5090AAAAAAAAAAAAAAAAAAAAAAAAAAAA",
        "obsDatetime": "2024-03-01T00:00:00.000+0100",
        "value": "177"
        },{ <!-- Weight) -->
        "concept": "5089AAAAAAAAAAAAAAAAAAAAAAAAAAAA",
        "obsDatetime": "2024-03-01T00:00:00.000+0100",
        "value": "88"
        },{ <!-- Physical Exam) -->
        "concept": "c39a35e2-3f10-11e4-adec-0800271c1b75",
        "obsDatetime": "2024-03-01T00:00:00.000+0100",
        "value": "HEENT: All normal to examination. Heart: RRR, no murmur. THORAX and LUNGS: Clear without rhonchi or wheeze. ABDOMEN: No distension, tenderness, or guarding, obese, pos bowel sounds. BACK: Normal to inspection and palpation, without tenderness; no presacraledema. EXTREMITIES: No edema or swelling noted, no evidence of chronic stasis changes, and symmetrical appearance without any asymmetry."
        }],
        "visit": {
        "patient": "020f9272-94c0-450a-bee9-1f6497ed471a",
        "visitType": "c22a5000-3f10-11e4-adec-0800271c1b75",
        "startDatetime": "2024-03-01T00:00:00.000+0100",
        "stopDatetime" : "2024-03-01T00:00:00.000+0100"
        }
        }
    </xsl:template>
</xsl:stylesheet>

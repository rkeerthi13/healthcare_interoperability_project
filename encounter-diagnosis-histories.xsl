<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:cda="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:output method="text"/>

    <xsl:template match="/">
        <xsl:variable name="patient" select="//cda:recordTarget/cda:patientRole/cda:patient"/>
        <xsl:variable name="address" select="//cda:recordTarget/cda:patientRole/cda:addr"/>
        <!-- extracting birthTime -->
        <xsl:variable name="birthYear" select="substring($patient/cda:birthTime/@value, 1, 4)"/>
        <xsl:variable name="birthMonth" select="substring($patient/cda:birthTime/@value, 5, 2)"/>
        <xsl:variable name="birthDay" select="substring($patient/cda:birthTime/@value, 7, 2)"/>
        <!-- Construct the birthdate in the desired format -->
        <xsl:variable name="birthdate" select="concat($birthYear, '-', $birthMonth, '-', $birthDay)"/>
        <!-- Use $birthdate for YYYY-MM-DD format -->
        <xsl:variable name="dateYear"
            select="substring(//cda:encounter/cda:effectiveTime/@value, 1, 4)"/>
        <xsl:variable name="dateMonth"
            select="substring(//cda:encounter/cda:effectiveTime/@value, 5, 2)"/>
        <xsl:variable name="dateDay"
            select="substring(//cda:encounter/cda:effectiveTime/@value, 7, 2)"/>
        <xsl:variable name="dateTime"
            select="substring(//cda:encounter/cda:effectiveTime/@value, 9, 2)"/>
        <xsl:variable name="dateSeconds1"
            select="substring(//cda:encounter/cda:effectiveTime/@value, 11, 2)"/>
        <xsl:variable name="dateSeconds2"
            select="substring(//cda:encounter/cda:effectiveTime/@value, 13, 2)"/>
        <xsl:variable name="dateFormat"
            select="concat($dateYear, '-', $dateMonth, '-', $dateDay, 'T', $dateTime, ':', $dateSeconds1, ':', $dateSeconds2, '.000+0000')"/>
        <xsl:text>{&#xA;</xsl:text>
        <xsl:text>  "patient": {&#xA;</xsl:text>
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
        <!-- Creating a new Encounter for a new Visit -->
        <xsl:text>{&#xA;</xsl:text>
        <xsl:text>  "encounterDatetime": "</xsl:text>
        <xsl:value-of select="//cda:encounter/cda:effectiveTime/@value"/>
        <xsl:text>",&#xA;</xsl:text>
        <xsl:text>  "patient": "</xsl:text>
        <xsl:value-of select="//cda:recordTarget/cda:patientRole/cda:id/@root"/>
        <xsl:text>",&#xA;</xsl:text>
        <xsl:text>  "encounterType": "</xsl:text>
        <xsl:value-of select="//cda:entry[1]/cda:encounter[1]/@classCode"/>
        <xsl:text>",&#xA;</xsl:text>
        <xsl:text>  "location": "</xsl:text>
        <xsl:value-of select="//cda:encounter/cda:participant/cda:participantRole/cda:addr/cda:city"/>
        <xsl:text>",&#xA;</xsl:text>
        <xsl:text>  "encounterProviders": [&#xA;</xsl:text>
        <xsl:text>    {&#xA;</xsl:text>
        <xsl:text>      "provider": "</xsl:text>
        <xsl:value-of select="//cda:encounter/cda:performer/cda:assignedEntity/cda:id/@extension"/>
        <xsl:text>",&#xA;</xsl:text>
        <xsl:text>      "encounterRole": "</xsl:text>
        <xsl:value-of select="//cda:documentationOf/serviceEvent/performer/functionCode/@codeSystem"/>
        <xsl:text>",&#xA;</xsl:text>
        <xsl:text>    }&#xA;</xsl:text>
        <xsl:text>  ],&#xA;</xsl:text>
        <xsl:text>  "visit": {&#xA;</xsl:text>
        <xsl:text>    "patient": "</xsl:text>
        <xsl:value-of select="//cda:recordTarget/cda:patientRole/cda:id/@root"/>
        <xsl:text>",&#xA;</xsl:text>
        <xsl:text>    "visitType": </xsl:text>
        <xsl:value-of select="//cda:entry/cda:encounter/cda:code/@code"/>
        <xsl:text>",&#xA;</xsl:text>
        <xsl:text>    "startDatetime": "</xsl:text>
        <xsl:value-of select="$dateFormat"/>
        <xsl:text>",&#xA;</xsl:text>
        <xsl:text>    "stopDatetime" : "</xsl:text>
        <xsl:value-of select="$dateFormat"/>
        <xsl:text>"&#xA;</xsl:text>
        <xsl:text>  }&#xA;</xsl:text>
        <xsl:text>}</xsl:text>
        
        <!-- Cheif Complaint in problem list during the ecounter -->
        
        <xsl:variable name="Problemlist" select="//cda:component/cda:section[cda:templateId/@root = '2.16.840.1.113883.10.20.22.2.5.1']"/>
        <xsl:variable name="Problem1"
            select="$Problemlist/cda:act[cda:entryRelationship/cda:observation/cda:code/@code= 'R51.9']"/>/>
       {
        <xsl:text>  "person": "</xsl:text>
        <xsl:value-of select="//cda:recordTarget/cda:patientRole/cda:id/@root"/>
        <xsl:text>",&#xA;</xsl:text>
        "concept": <xsl:value-of select="$Problem1/cda:entryRelationship/cda:observation/cda:code/@codeSystemName"/>
        <xsl:text>",&#xA;</xsl:text>
        <xsl:text>    "obsDatetime": "</xsl:text>
        <xsl:value-of select="$dateFormat"/>
        "value":<xsl:value-of select="$Problem1/cda:entryRelationship/cda:observation/cda:code/@displayName"/>"
        }
        
        
        
        <!-- Family History -->
        
        <xsl:variable name="History"
            select="//cda:component/cda:section[cda:templateId/@root = '2.16.840.1.113883.10.20.22.2.15']"/>
        <xsl:variable name="FamilyHistory1"
            select="$History/cda:entry/cda:organizer/cda:component[cda:observation/cda:value/@code = 'E08']"/>/>
        <xsl:variable name="History2"
            select="//cda:component/cda:section[cda:templateId/@root = '2.16.840.1.113883.10.20.22.2.15']"/>
        <xsl:variable name="FamilyHistory2"
            select="$History2/cda:entry/cda:organizer/cda:component[cda:observation/cda:value/@code = 'I10']"/>/
        {
        "Name": <xsl:value-of select="$FamilyHistory1/cda:observation/cda:value/@displayName"/>
        "Description": "Has_Family_History_of_Diabeties_Mellitus"/>
        "Name": <xsl:value-of select="$FamilyHistory2/cda:observation/cda:value/@displayName"/>
        "Description": "Has_Family_History_of_Hypertension"/>
        
       }
        
        <!-- Habit History -->
        <xsl:variable name="SocialHistory"
            select="//cda:component/cda:section[cda:templateId/@root = '2.16.840.1.113883.10.20.22.2.17']"/>
        <xsl:variable name="Smokinghistory"
            select="$SocialHistory/cda:entry/cda:observation[cda:code/@code = '72166-2']"/>/>
        <xsl:variable name="Smokinghistorystatus"
            select="$SocialHistory/cda:entry/cda:observation[cda:value/@code = 'F17.219']"/>/>
        <xsl:variable name="Alcoholhistory"
            select="$SocialHistory/cda:entry/cda:observation[cda:code/@code = '74205-6']"/>/>
        <xsl:variable name="Alcoholhistorystatus"
            select="$SocialHistory/cda:entry/cda:observation[cda:value/@code = '443315005']"/>/>
        {
        "Name": <xsl:value-of select="$Smokinghistory/cda:code/@displayName"/>
        "Description": <xsl:value-of select="$Smokinghistorystatus/cda:value/@displayName"/>
        "Name": <xsl:value-of select="$Alcoholhistory/cda:code/@displayName"/>
        "Description": <xsl:value-of select="$Alcoholhistorystatus/cda:value/@displayName"/>
        }
       
        <!-- Diagnosis during the encounter -->
        <xsl:variable name="DiagnosisEncounter"
            select="//cda:component/cda:section[cda:templateId/@root = '2.16.840.1.113883.10.20.22.2.22.1']"/>
        <xsl:variable name="Diagnosis"
            select="$DiagnosisEncounter/cda:entry/cda:encounter[cda:entryRelationship/cda:act/cda:code/@codeSystem = '2.16.840.1.113883.6.90']"
        />/> { <xsl:text>  "person": "</xsl:text>
        <xsl:value-of select="//cda:recordTarget/cda:patientRole/cda:id/@root"/>
        <xsl:text>",&#xA;</xsl:text>
        "concept": <xsl:value-of select="$Diagnosis/cda:entryRelationship/cda:act/cda:code/@codeSystemName"/>
        <xsl:text>",&#xA;</xsl:text>
        <xsl:text>    "obsDatetime": "</xsl:text>
        <xsl:value-of select="$dateFormat"/>
        "value":<xsl:value-of select="$Diagnosis/cda:entryRelationship/cda:act/cda:code/@displayName"/>"
        /default:ClinicalDocument/default:component[1]/default:structuredBody[1]/default:component[3]/default:section[1]/default:entry[1]/default:encounter[1]/default:entryRelationship[1]/default:act[1]/default:code[1]/@codeSystem
        }
    
      
        
    </xsl:template>
</xsl:stylesheet>

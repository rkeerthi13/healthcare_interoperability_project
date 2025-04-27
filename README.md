# Healthcare Interoperability Project

This repository contains the complete work for the **Healthcare Interoperability Project**, aimed at achieving seamless data exchange between healthcare systems. This project demonstrates interoperability principles, focusing on HL7 standards, CDA document transformations, XSLT workflows, and real-time API interactions.

---

## Project Overview

- **Objective**: Enhance interoperability between healthcare systems (System A: OpenMRS, System B: Surescripts) by leveraging HL7 standards, CDA templates, XSLT transformations, and REST APIs.
- **Use Case**: A clinician diagnoses a patient and generates an electronic prescription, which is transmitted to a pharmacy network for dispensing.

---

## Tools and Technologies Used

- **Standards**: HL7 CDA, FHIR, NCPDP SCRIPT
- **Terminologies**: ICD-10-CM, SNOMED-CT, RxNorm, LOINC
- **Tools**:
  - **Oxygen XML Editor**: Used to create and validate CDA documents and XSLT transformations.
  - **Postman**: Used for API interactions to send and retrieve data between systems.
- **Languages**: XML, XSLT, JSON

---

## Sprints and Deliverables

### 1. Use Case Selection and Details
- **File**: `part-1-use-case-selection-clinician-to-pharmacy.pdf`
- **Summary**: Defined the clinician-to-pharmacy use case, identified clinical concepts (e.g., diagnosis, medication), and mapped them to terminologies like ICD-10-CM, SNOMED-CT, and RxNorm.

### 2. Problem Analysis and Modeling
- **File**: `part-2-problem-analysis-modeling-electronic-prescription.pdf`
- **Summary**: Developed UML and BPMN models to represent semantic and syntactic interoperability between clinicians, EHRs, and pharmacies. Focused on the e-prescription workflow.

### 3. CDA Entry Mockups
- **Folder**: `part-3-cda-entry-mockups`
- **Files**:
  - `annotated-complete-cda.xml`
  - `cda-viewer-screenshot1.png`
  - `cda-viewer-screenshot2.png`
- **Summary**: Created a customized CDA document including sections like patient demographics, encounters, medications, and diagnoses. Validated the CDA document using Oxygen XML Editor and HL7 Viewer.

### 4. Interoperability Pipeline
- **Folder**: `part-4-interoperability-pipeline`
- **Files**:
  - `encounter-diagnosis-histories.xsl`
  - `final-customized-cda.xml`
  - `interoperability-pipeline-report.pdf`
  - `medication-order-system-a.xsl`
  - `medication-order-system-b.xsl`
  - `medications-system-a.xsl`
  - `medications-system-b.xsl`
  - `patient-details-system-a.xsl`
  - `patient-details-system-b.xsl`
  - `vital-signs-physical-exam.xsl`
- **Summary**: Implemented XSLT transformations to convert CDA data into formats compatible with System A (JSON) and System B (XML). Data was processed and validated successfully.

### 5. Terminology Project Demo
- **Folder**: `part-5-terminology-demo`
- **Files**:
  - `encounter-system-a-final.xsl`
  - `med-order-system-a-telmisartan.xsl`
  - `med-order-system-a-atenolol.xsl`
  - `patient-details-system-a-final.xsl`
  - `systemb-telmisartan-final.xsl`
  - `systemb-atenolol.xsl`
  - `ncpdp-new-rx-example.xml`
  - `ps3-validated.xml`
- **Summary**: Demonstrated real-time interoperability:
  - **System A**: Posted JSON data to OpenMRS via REST API and validated updates in the system.
  - **System B**: Transformed retrieved data into XML for Surescripts, validated NCPDP standards, and ensured successful message exchange.

---

## How to Run

1. **View CDA Documents**:
   - Open `annotated-complete-cda.xml` or `final-customized-cda.xml` using Oxygen XML Editor or any HL7 CDA Viewer.
   
2. **Test XSLT Transformations**:
   - Run XSLT files located in `part-4-interoperability-pipeline` and `part-5-terminology-demo` using Oxygen XML Editor or an XSLT processor (e.g., Saxon).

3. **API Interactions**:
   - Use Postman to POST JSON payloads to System A (OpenMRS) and verify updates.
   - Validate System B XML transformations against Surescripts’ NCPDP SCRIPT standards.

---

## Contributors

- **Keerthika Sunchu**
- **Eswar Kamisetti**
- **Ramya Keerthi Majji**
- **April Taylor**
- **Vaibhav Thakur**

---

## Contact

For questions or suggestions, contact:  
**Keerthika Sunchu** - [ksunchu@iu.edu](mailto:ksunchu@iu.edu)
**Ramya Keerthi Majji**- [rmajji@iu.edu]


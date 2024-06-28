#Clear existing data and graphics
rm(list=ls())
graphics.off()
#Load Hmisc library
library(Hmisc)
library(dplyr)
#Read Data
data=read.csv('data_raw/SiteAssessment50SITE-DataExportReport_DATA_2024-01-30_1804.csv')
#Setting Labels

label(data$record_id)="Record ID"
label(data$region)="REGION IeDEA global region"
label(data$center)="CENTER Code for Clinic/Centre/Hospital where patient is seen. Needs to be unique within each region."
label(data$name)="NAME Proper name to identify center"
label(data$program)="PROGRAM Care program with which the center is associated (if applicable)"
label(data$adultped)="ADULTPED Population the center serves"
label(data$rural)="RURAL Facility location"
label(data$level)="LEVEL Facility level of care"
label(data$country)="COUNTRY"
label(data$sa2_record_id)="Site Assessment 2.0 ID-mapped"
label(data$sa3_record_id)="Site Assessment 3.0 ID -  mapped"
label(data$sa4_record_id)="Site Assessment 4.0 ID -  mapped"
label(data$sa5_record_id)="Site Assessment 5.0 ID -  mapped"
label(data$date1)="1.3 Please enter the date this survey is being completed"
label(data$residence_setting)="2.1 How would you describe the area of residence of the population served by this health facilitys HIV clinic(s)?Select one response only"
label(data$clinic_type_min)="2.2 What age range is served by this HIV clinic?Please record minimum and maximum ages of patients served by this clinic. If there is no maximum age limit, enter 99."
label(data$clinic_type_max)="2.2 What age range is served by this HIV clinic?Please record minimum and maximum ages of patients served by this clinic. If there is no maximum age limit, enter 99."
label(data$pediatrician_0)="3.1a. Pediatrician (general)"
label(data$internist_0)="3.1b. Internist, family practitioner, generalist (physician)"
label(data$id_specialist)="3.1c. Infectious disease or HIV specialist"
label(data$midlevel_prov_0)="3.1d. Mid-level providers (generalist clinical officers, nurses/nurse practitioners, midwifes, physician assistants)"
label(data$adher_counselor)="3.1e. Adherence counselors"
label(data$peer_educ)="3.1f. Peer educators/mentors/navigators"
label(data$outreach)="3.1g.  Outreach workers"
label(data$nutritionist)="3.1h. Nutritionists"
label(data$geriatrician)="3.1i Geriatrician"
label(data$ophtalmologist)="3.1j Ophthalmologist"
label(data$audiologist)="3.1k Audiologist"
label(data$psychologist)="3.1l Psychologist"
label(data$psychiatrist)="3.1m Psychiatrist"
label(data$occ_therapist)="3.1n Physical or occupational therapist"
label(data$dermatologist)="3.1o Dermatologist or other physician with specialized training in dermatology"
label(data$midlev_dermatologist)="3.1p Mid-level provider with specialty training in dermatology (e.g. clinical officers, nurses, nurse practitioners, physician assistants with specialized training in dermatology)"
label(data$ct_services)="4.1 How often are HIV counseling and testing services offered at this health facility?  "
label(data$test_services_type2_b___1)="4.2 What types of HIV testing services are currently offered at this health facility?Check all that apply. (choice=Opt-out testing (provider-initiated))"
label(data$test_services_type2_b___2)="4.2 What types of HIV testing services are currently offered at this health facility?Check all that apply. (choice=Opt-in testing (client-initiated))"
label(data$test_services_type2_b___3)="4.2 What types of HIV testing services are currently offered at this health facility?Check all that apply. (choice=Partner/couples or index case testing)"
label(data$test_services_type2_b___4)="4.2 What types of HIV testing services are currently offered at this health facility?Check all that apply. (choice=Family tree testing (testing of family and other household members))"
label(data$test_services_type2_b___7)="4.2 What types of HIV testing services are currently offered at this health facility?Check all that apply. (choice=Early Infant Diagnosis (EID))"
label(data$test_services_type2_b___5)="4.2 What types of HIV testing services are currently offered at this health facility?Check all that apply. (choice=Rapid HIV tests/Same-day testing)"
label(data$test_services_type2_b___6)="4.2 What types of HIV testing services are currently offered at this health facility?Check all that apply. (choice=HIV self-testing kits)"
label(data$test_services_type2_b___88)="4.2 What types of HIV testing services are currently offered at this health facility?Check all that apply. (choice=Other {other_hivtesting})"
label(data$other_hivtesting)="4.2a. If Other, please specify"
label(data$confirm_test_art)="4.3 After a positive result on an HIV screening test at this health facility or elsewhere, is additional testing done at this health facility to confirm HIV diagnoses prior to initiating patients on ART? "
label(data$confirm_dx_adults___1)="4.4 How is the diagnosis of HIV infection confirmed for adults and children ≥18 monthsenrolling into care at this site?Check all that apply. (choice=Confirmatory antibody test)"
label(data$confirm_dx_adults___2)="4.4 How is the diagnosis of HIV infection confirmed for adults and children ≥18 monthsenrolling into care at this site?Check all that apply. (choice=Confirmation based on HIV viral load (PCR) test)"
label(data$confirm_dx_adults___88)="4.4 How is the diagnosis of HIV infection confirmed for adults and children ≥18 monthsenrolling into care at this site?Check all that apply. (choice=Other {confirm_dx_adults_other})"
label(data$confirm_dx_adults_other)="4.4a If Other, please specify"
label(data$confirm_dx_infants___77)="4.5 How is the diagnosis of HIV infection confirmed for infants < 18 months at this site?Check all that apply. (choice=Not applicable (no infants/pediatric patients))"
label(data$confirm_dx_infants___1)="4.5 How is the diagnosis of HIV infection confirmed for infants < 18 months at this site?Check all that apply. (choice=Confirmatory antibody test)"
label(data$confirm_dx_infants___2)="4.5 How is the diagnosis of HIV infection confirmed for infants < 18 months at this site?Check all that apply. (choice=Confirmation based on HIV DNA or RNA PCR)"
label(data$confirm_dx_infants___88)="4.5 How is the diagnosis of HIV infection confirmed for infants < 18 months at this site?Check all that apply. (choice=Other {confirm_dx_infants_other})"
label(data$confirm_dx_infants_other)="4.5a If Other, please specify"
label(data$dx_services_infants)="4.6 How often are early infant diagnosis (EID) services offered at this health facility? "
label(data$same_day_poc_c)="4.7 How often are same-day results for DNA or RNA PCR EID testing available at this health facility? Same day means results are available on the day of specimen collection."
label(data$eid_dx_tat)="4.8 During the past year, what was the usual turnaround time (in days) for getting early infant diagnosis (EID) test results?Turnaround time means the time from ordering or referring a patient for the test to the time when results are received by the facility/clinic staff. Enter the number of days, or NA if EID is not available. Enter 0 for same-day results."
label(data$rpid_hivtest)="4.9a. HIV-1/HIV-2 antigen/antibody immunoassay test for established HIV infection"
label(data$hiv1_2_antigen)="4.9b. HIV-1 p24 antigen test for acute HIV infection (i.e., before HIV antibodies are detectable)"
label(data$hiv_p24_antigen)="4.9c. Virologic assay tests (e.g., HIV RNA nucleic acid test, nucleic acid amplification test) for acute HIV infection"
label(data$hiv_nat)="4.9d. Supplemental HIV-1/HIV-2 antibody differentiation immunoassay"
label(data$hiv1_2_antibody)="4.9e. DNA or RNA PCR for early infant diagnosis (EID)"
label(data$entry_b___1)="5.1 What are the most common entry points into HIV care for patients at this health facility? Check all that apply. (choice=Voluntary counseling and testing (VCT) unit)"
label(data$entry_b___23)="5.1 What are the most common entry points into HIV care for patients at this health facility? Check all that apply. (choice=Maternal and child health services (e.g. Antenatal care, prevention of mother to child transmission, maternity/labor & delivery, under-5 clinic))"
label(data$entry_b___4)="5.1 What are the most common entry points into HIV care for patients at this health facility? Check all that apply. (choice=Sexually transmitted infection (STI) treatment unit)"
label(data$entry_b___5)="5.1 What are the most common entry points into HIV care for patients at this health facility? Check all that apply. (choice=Tuberculosis (TB) unit)"
label(data$entry_b___6)="5.1 What are the most common entry points into HIV care for patients at this health facility? Check all that apply. (choice=Outpatient department)"
label(data$entry_b___8)="5.1 What are the most common entry points into HIV care for patients at this health facility? Check all that apply. (choice=Inpatient hospitalization)"
label(data$entry_b___7)="5.1 What are the most common entry points into HIV care for patients at this health facility? Check all that apply. (choice=Referrals/transfers from other health facilities/sites)"
label(data$entry_b___88)="5.1 What are the most common entry points into HIV care for patients at this health facility? Check all that apply. (choice=Other {entry_b_other})"
label(data$entry_b_other)="5.1a If Other, please specify"
label(data$services_type_3_b___77)="5.2 What type of support services are routinely provided to patients who receive a positive HIV test result at this health facility?Routinely means provided as the standard of care.Check all that apply OR select None.  (choice=None)"
label(data$services_type_3_b___12)="5.2 What type of support services are routinely provided to patients who receive a positive HIV test result at this health facility?Routinely means provided as the standard of care.Check all that apply OR select None.  (choice=Psychosocial support from nurse, social worker, counselor, mentor, etc.)"
label(data$services_type_3_b___3)="5.2 What type of support services are routinely provided to patients who receive a positive HIV test result at this health facility?Routinely means provided as the standard of care.Check all that apply OR select None.  (choice=Partner disclosure counseling and support)"
label(data$services_type_3_b___4)="5.2 What type of support services are routinely provided to patients who receive a positive HIV test result at this health facility?Routinely means provided as the standard of care.Check all that apply OR select None.  (choice=Referral to support groups)"
label(data$services_type_3_b___5)="5.2 What type of support services are routinely provided to patients who receive a positive HIV test result at this health facility?Routinely means provided as the standard of care.Check all that apply OR select None.  (choice=Referral to community-based volunteers/workers)"
label(data$services_type_3_b___88)="5.2 What type of support services are routinely provided to patients who receive a positive HIV test result at this health facility?Routinely means provided as the standard of care.Check all that apply OR select None.  (choice=Other {other_specify4})"
label(data$other_specify4)="5.2a If Other, please specify"
label(data$screening_enrollment___77)="5.3 Which of the following screenings are routinely done at the time of enrollment into HIV care at this health facility (e.g. newly-diagnosed patients or patients who transfer to this site for HIV care)?Routinely means provided as the standard of care at enrollment.Check all that apply or select None.  (choice=None)"
label(data$screening_enrollment___1)="5.3 Which of the following screenings are routinely done at the time of enrollment into HIV care at this health facility (e.g. newly-diagnosed patients or patients who transfer to this site for HIV care)?Routinely means provided as the standard of care at enrollment.Check all that apply or select None.  (choice=Pregnancy/breastfeeding)"
label(data$screening_enrollment___2)="5.3 Which of the following screenings are routinely done at the time of enrollment into HIV care at this health facility (e.g. newly-diagnosed patients or patients who transfer to this site for HIV care)?Routinely means provided as the standard of care at enrollment.Check all that apply or select None.  (choice=Latent tuberculosis infection (LTBI))"
label(data$screening_enrollment___3)="5.3 Which of the following screenings are routinely done at the time of enrollment into HIV care at this health facility (e.g. newly-diagnosed patients or patients who transfer to this site for HIV care)?Routinely means provided as the standard of care at enrollment.Check all that apply or select None.  (choice=Tuberculosis (TB) disease)"
label(data$screening_enrollment___4)="5.3 Which of the following screenings are routinely done at the time of enrollment into HIV care at this health facility (e.g. newly-diagnosed patients or patients who transfer to this site for HIV care)?Routinely means provided as the standard of care at enrollment.Check all that apply or select None.  (choice=Sexually-transmitted infection (STI))"
label(data$screening_enrollment___5)="5.3 Which of the following screenings are routinely done at the time of enrollment into HIV care at this health facility (e.g. newly-diagnosed patients or patients who transfer to this site for HIV care)?Routinely means provided as the standard of care at enrollment.Check all that apply or select None.  (choice=Hepatitis B)"
label(data$screening_enrollment___8)="5.3 Which of the following screenings are routinely done at the time of enrollment into HIV care at this health facility (e.g. newly-diagnosed patients or patients who transfer to this site for HIV care)?Routinely means provided as the standard of care at enrollment.Check all that apply or select None.  (choice=Hepatitis C)"
label(data$screening_enrollment___9)="5.3 Which of the following screenings are routinely done at the time of enrollment into HIV care at this health facility (e.g. newly-diagnosed patients or patients who transfer to this site for HIV care)?Routinely means provided as the standard of care at enrollment.Check all that apply or select None.  (choice=Alcohol use disorders)"
label(data$screening_enrollment___10)="5.3 Which of the following screenings are routinely done at the time of enrollment into HIV care at this health facility (e.g. newly-diagnosed patients or patients who transfer to this site for HIV care)?Routinely means provided as the standard of care at enrollment.Check all that apply or select None.  (choice=Substance use disorders (e.g.,tobacco, smoking, illicit drug use))"
label(data$screening_enrollment___11)="5.3 Which of the following screenings are routinely done at the time of enrollment into HIV care at this health facility (e.g. newly-diagnosed patients or patients who transfer to this site for HIV care)?Routinely means provided as the standard of care at enrollment.Check all that apply or select None.  (choice=Depression)"
label(data$screening_enrollment___12)="5.3 Which of the following screenings are routinely done at the time of enrollment into HIV care at this health facility (e.g. newly-diagnosed patients or patients who transfer to this site for HIV care)?Routinely means provided as the standard of care at enrollment.Check all that apply or select None.  (choice=Anxiety)"
label(data$screening_enrollment___13)="5.3 Which of the following screenings are routinely done at the time of enrollment into HIV care at this health facility (e.g. newly-diagnosed patients or patients who transfer to this site for HIV care)?Routinely means provided as the standard of care at enrollment.Check all that apply or select None.  (choice=Post-traumatic stress disorder (PTSD))"
label(data$screening_enrollment___14)="5.3 Which of the following screenings are routinely done at the time of enrollment into HIV care at this health facility (e.g. newly-diagnosed patients or patients who transfer to this site for HIV care)?Routinely means provided as the standard of care at enrollment.Check all that apply or select None.  (choice=Cognitive impairment)"
label(data$screening_enrollment___15)="5.3 Which of the following screenings are routinely done at the time of enrollment into HIV care at this health facility (e.g. newly-diagnosed patients or patients who transfer to this site for HIV care)?Routinely means provided as the standard of care at enrollment.Check all that apply or select None.  (choice=Suicidal ideation or behavior)"
label(data$cotrimoxazole_meds___77)="5.4 What types of patients receive Cotrimoxazole (Bactrim, Septra) prophylaxis as the standard of care at the HIV clinic? Check all that apply OR select None. (choice=None)"
label(data$cotrimoxazole_meds___1)="5.4 What types of patients receive Cotrimoxazole (Bactrim, Septra) prophylaxis as the standard of care at the HIV clinic? Check all that apply OR select None. (choice=All patients)"
label(data$cotrimoxazole_meds___2)="5.4 What types of patients receive Cotrimoxazole (Bactrim, Septra) prophylaxis as the standard of care at the HIV clinic? Check all that apply OR select None. (choice=Patients who meet a CD4 threshold)"
label(data$cotrimoxazole_meds___3)="5.4 What types of patients receive Cotrimoxazole (Bactrim, Septra) prophylaxis as the standard of care at the HIV clinic? Check all that apply OR select None. (choice=Pregnant women)"
label(data$cotrimoxazole_meds___4)="5.4 What types of patients receive Cotrimoxazole (Bactrim, Septra) prophylaxis as the standard of care at the HIV clinic? Check all that apply OR select None. (choice=Infants/children < 18 months)"
label(data$cotrimoxazole_meds___5)="5.4 What types of patients receive Cotrimoxazole (Bactrim, Septra) prophylaxis as the standard of care at the HIV clinic? Check all that apply OR select None. (choice=Infants/children < 5 years)"
label(data$cotrimoxazole_meds___6)="5.4 What types of patients receive Cotrimoxazole (Bactrim, Septra) prophylaxis as the standard of care at the HIV clinic? Check all that apply OR select None. (choice=Infants/children < 10 years)"
label(data$cotrimoxazole_meds___7)="5.4 What types of patients receive Cotrimoxazole (Bactrim, Septra) prophylaxis as the standard of care at the HIV clinic? Check all that apply OR select None. (choice=TB patients)"
label(data$cotrimoxazole_meds___88)="5.4 What types of patients receive Cotrimoxazole (Bactrim, Septra) prophylaxis as the standard of care at the HIV clinic? Check all that apply OR select None. (choice=Other {cotrimoxazole_other})"
label(data$cotrimoxazole_other)="If Other, please specify"
label(data$cd4_testing)="5.5 	Is CD4 cell count testing done as the standard of care prior to ART initiation for newly-enrolling patients with HIV? "
label(data$cd4_testing_old)="5.6 	Is CD4 cell count testing done as the standard of care prior to re-starting ART patients re-entering care in this health facility? "
label(data$lab_cd4_b)="5.7 Where is the laboratory that conducts CD4 cell count testing for this HIV clinic?"
label(data$sameday_cd4_b)="5.8 How often are same-day CD4 cell count results available at this health facility? Same day means results are available on the day of specimen collection."
label(data$care_preart)="5.9 Does this HIV clinic initiate newly-diagnosed patients on ART?If all patients initiate ART elsewhere prior to enrollment in HIV care at this clinic, please select No. Otherwise, please select Yes. "
label(data$art_time2_b)="5.10 How soon after confirming HIV diagnoses and/or treatment eligibility do patients routinely initiate ART? Routinely refers to the standard of care. Check one best response."
label(data$art_visits)="5.11 At this clinic, how many ART readiness counseling sessions were routinely conducted before eligible patients initiate ART? Routinely refers to the standard of care.  Check one best response"
label(data$poc_pcr_rna_b)="6.1 How often are same-day results for RNA PCR HIV viral load testing available at this health facility? Same day means results are available on the day of specimen collection."
label(data$tat_vl_days)="6.2 What is the usual turnaround time (in days) for getting viral load test results? Turnaround time means the time from ordering or referring a patient for the test to the time when results are received by the facility/clinic staff. Enter 0 for same-day results"
label(data$sms_retention_c___77)="6.3 Does this HIV clinic utilize text or voice messaging reminders to support any of the following: Check all that apply OR select None/Not applicable (choice=None/Not applicable)"
label(data$sms_retention_c___5)="6.3 Does this HIV clinic utilize text or voice messaging reminders to support any of the following: Check all that apply OR select None/Not applicable (choice=Medication adherence reminders)"
label(data$sms_retention_c___6)="6.3 Does this HIV clinic utilize text or voice messaging reminders to support any of the following: Check all that apply OR select None/Not applicable (choice=Appointment reminders)"
label(data$sms_retention_c___3)="6.3 Does this HIV clinic utilize text or voice messaging reminders to support any of the following: Check all that apply OR select None/Not applicable (choice=Follow-up of missed appointments)"
label(data$sms_retention_c___4)="6.3 Does this HIV clinic utilize text or voice messaging reminders to support any of the following: Check all that apply OR select None/Not applicable (choice=Educational messaging)"
label(data$freq_reminders)="6.4 What is the frequency of text or voice messaging reminders sent to support medication adherence?Check one best response"
label(data$freq_reminders_oth)="6.4a If Other, please specify"
label(data$notstable_refil)="6.5a What is the frequency of ART refills for patients who are newly initiating ART?"
label(data$stable_refil)="6.5b What is the frequency of ART refills for patients stable on ART?(Stable on ART defined as on ART for at least 1 year and evidence of treatment success)"
label(data$notstable_refil_oth)="6.5a1 If patients newly initiating  ART Other, please specify"
label(data$stable_refil_oth)="6.5b1 If patients stable on ART Other, please specify"
label(data$notstable_visits)="6.6a What is the visit frequency of ART refills for patients who are newly initiating ART?"
label(data$stable_visits)="6.6b What is the visit frequency of ART refills for patients stable on ART?(Stable on ART defined as on ART for at least 1 year and evidence of treatment success)"
label(data$notstable_visits_oth)="6.6a1 If patients newly initiating ART Other, please specify"
label(data$stable_visits_oth)="6.6b1 If patients stable on ART Other, please specify"
label(data$meds_art_b___77)="6.7 How is ART medication adherence routinely monitored or assessed in patients at this HIV clinic? Routinely monitored means monitored as the standard of care.Check all that apply OR select Not applicable. (choice=Not applicable (medication adherence not routinely monitored))"
label(data$meds_art_b___9)="6.7 How is ART medication adherence routinely monitored or assessed in patients at this HIV clinic? Routinely monitored means monitored as the standard of care.Check all that apply OR select Not applicable. (choice=Patient self-report of medication adherence)"
label(data$meds_art_b___10)="6.7 How is ART medication adherence routinely monitored or assessed in patients at this HIV clinic? Routinely monitored means monitored as the standard of care.Check all that apply OR select Not applicable. (choice=Routine review of medication pick-up/pharmacy refills)"
label(data$meds_art_b___3)="6.7 How is ART medication adherence routinely monitored or assessed in patients at this HIV clinic? Routinely monitored means monitored as the standard of care.Check all that apply OR select Not applicable. (choice=Pill counts (Pharmacist/provider count of unused medication in pill bottles))"
label(data$meds_art_b___5)="6.7 How is ART medication adherence routinely monitored or assessed in patients at this HIV clinic? Routinely monitored means monitored as the standard of care.Check all that apply OR select Not applicable. (choice=Electronic dose monitoring (e.g., MEMS caps))"
label(data$meds_art_b___7)="6.7 How is ART medication adherence routinely monitored or assessed in patients at this HIV clinic? Routinely monitored means monitored as the standard of care.Check all that apply OR select Not applicable. (choice=Routine viral loads)"
label(data$meds_art_b___88)="6.7 How is ART medication adherence routinely monitored or assessed in patients at this HIV clinic? Routinely monitored means monitored as the standard of care.Check all that apply OR select Not applicable. (choice=Other {meds_art_b_oth})"
label(data$meds_art_b_oth)="6.7a If Other, please specify"
label(data$adherence_self___77)="6.8 Which of the following self-report measures are used in assessing patient adherence?Check all that apply OR select Not applicable. (choice=Not applicable (patient self-report not used in assessing adherence))"
label(data$adherence_self___1)="6.8 Which of the following self-report measures are used in assessing patient adherence?Check all that apply OR select Not applicable. (choice=Unstructured assessment of adherence by clinician or provider)"
label(data$adherence_self___2)="6.8 Which of the following self-report measures are used in assessing patient adherence?Check all that apply OR select Not applicable. (choice=Count-based measures (patients asked to report number of doses missed or taken during a specific period-e.g., 30 days, 7 days))"
label(data$adherence_self___3)="6.8 Which of the following self-report measures are used in assessing patient adherence?Check all that apply OR select Not applicable. (choice=Estimation-based measures (patients asked to describe their overall adherence in terms of ratings or a visual analogue scale))"
label(data$adherence_self___4)="6.8 Which of the following self-report measures are used in assessing patient adherence?Check all that apply OR select Not applicable. (choice=Provider-administered assessments)"
label(data$adherence_self___5)="6.8 Which of the following self-report measures are used in assessing patient adherence?Check all that apply OR select Not applicable. (choice=Computer/tablet/app-based assessments)"
label(data$adherence_self___88)="6.8 Which of the following self-report measures are used in assessing patient adherence?Check all that apply OR select Not applicable. (choice=Other (specify) {adherence_self_oth})"
label(data$adherence_self_oth)="6.8a If Other, please specify"
label(data$adherence_freq)="6.9 How frequently is adherence assessed in patients at this HIV clinic?Check one best response"
label(data$adherence_freq_oth)="6.9a If Other, please specify"
label(data$adherence_interv_pt___77)="6.10 What types of patients are eligible for intensified/enhanced adherence interventions?Check all that apply or select Not applicable. (choice=None/Not applicable)"
label(data$adherence_interv_pt___1)="6.10 What types of patients are eligible for intensified/enhanced adherence interventions?Check all that apply or select Not applicable. (choice=Patients with known adherence challenges (e.g., self-reported by patient))"
label(data$adherence_interv_pt___2)="6.10 What types of patients are eligible for intensified/enhanced adherence interventions?Check all that apply or select Not applicable. (choice=Patients with suspected adherence problems (e.g., irregular clinic visits))"
label(data$adherence_interv_pt___3)="6.10 What types of patients are eligible for intensified/enhanced adherence interventions?Check all that apply or select Not applicable. (choice=Patients with any level of viremia (i.e., viral load above lower limit of detection))"
label(data$adherence_interv_pt___4)="6.10 What types of patients are eligible for intensified/enhanced adherence interventions?Check all that apply or select Not applicable. (choice=Patients with viral load ≥1000 copies/mL)"
label(data$adherence_interv_pt___5)="6.10 What types of patients are eligible for intensified/enhanced adherence interventions?Check all that apply or select Not applicable. (choice=Patients with new onset of opportunistic infection)"
label(data$adherence_interv_pt___6)="6.10 What types of patients are eligible for intensified/enhanced adherence interventions?Check all that apply or select Not applicable. (choice=Patients initiating ART with advanced HIV disease)"
label(data$adherence_interv_pt___88)="6.10 What types of patients are eligible for intensified/enhanced adherence interventions?Check all that apply or select Not applicable. (choice=Other (specify) {adherence_interv_pt_oth})"
label(data$adherence_interv_pt_oth)="6.10a If Other, please specify"
label(data$adh_educ)="6.11a.	Patient education media (e.g., written, pictorial, video)"
label(data$adh_pillboxes)="6.11b.	Pill boxes or blister packs"
label(data$adh_vis_aids)="6.11c.	Visual reminders/aids (e.g., calendars, checklists, diary cards, other reminders)"
label(data$adh_edevices)="6.11d.	Electronic reminder devices (e.g. alarm clocks, wrist watches, beepers, smart phone apps)"
label(data$adh_reminder_oth)="6.11e.	Other (specify)  If not applicable, select None"
label(data$adh_reminder_oth_sp)="If Other adherence aids/reminders, specify"
label(data$oneon1_adh)="6.12a.	One-on-one adherence counseling by HIV care providers or pharmacist/pharmacy staff"
label(data$grou_adh)="6.12b.	Group adherence counseling by HIV care providers or pharmacist/pharmacy staff"
label(data$peer_adh)="6.12c.	Peer counseling"
label(data$ref_peer_adh)="6.12d.	Referral to peer support or mentor groups"
label(data$facility_adh)="6.12e.	Facility-based ART adherence clubs"
label(data$community_adh)="6.12f.	Community-based ART adherence clubs"
label(data$repeatvl_adh)="6.12g.	Repeat viral load testing"
label(data$cbt_adh)="6.12h.	Cognitive behavioral therapy or other mental health interventions"
label(data$cash_adh)="6.12i.	Cash incentives"
label(data$food_adh)="6.12j.	Food supplements"
label(data$supp_adh)="6.12k.	Vitamin/micronutrient supplements"
label(data$dot_adh)="6.12l.	Directly observed treatment (DOT) or directly administered antiretroviral therapy (DART) (e.g., long-acting injectable ART)"
label(data$oth_support_adh)="6.12m.	Other (specify) If not applicable, select None"
label(data$oth_supp_adh_sp)="If Other ART adherence support services, specify"
label(data$ltbi_screening)="7.1a. Testing for latent tuberculosis infection (LTBI)"
label(data$sti_screening)="7.1b. Sexually transmitted infections (STIs)"
label(data$hbv_screening_b)="7.1c. New (incident) Hepatitis B virus (HBV)"
label(data$hcv_screening_b)="7.1d. New (incident) Hepatitis C virus (HCV)"
label(data$alc_screening)="7.1e. Alcohol use disorders"
label(data$sud_screening_b)="7.1f. Substance use disorders (tobacco, illicit drug use, etc.)"
label(data$depression_screening)="7.1g. Depression"
label(data$anxiety_screening)="7.1h. Anxiety"
label(data$ptsd_screening)="7.1i. Post-traumatic stress disorder (PTSD)"
label(data$cog_imp_screening)="7.1j. Cognitive impairment"
label(data$suic_id_screening)="7.1.k. Suicidal ideation or behavior"
label(data$counsel_disclosure_b)="7.2a. Counseling regarding disclosure to sexual partners"
label(data$safesex_method_b)="7.2b Education on sexual behavior and safer sex practices"
label(data$family_plan_b)="7.2c Family planning counseling"
label(data$harm_reduction_b)="7.2d Education on high-risk substance-use behaviors & harm reduction  practices"
label(data$pmtct)="7.3a Prevention of maternal to child transmission (PMTCT)"
label(data$prov_condoms_b)="7.3b Condoms"
label(data$male_circum_b)="7.3c Voluntary male circumcision services"
label(data$famplan_methods_b)="7.3d Family planning/contraceptive methods other than condoms"
label(data$tx_depression)="7.3e Treatment/management of depression"
label(data$tx_ptsd)="7.3f Treatment/management of post-traumatic stress disorder (PTSD)"
label(data$tx_anxiety)="7.3g Treatment/management of anxiety disorders (other than PTSD)"
label(data$tx_alcohol)="7.3h Treatment for alcohol use disorders"
label(data$tx_sud)="7.3i Treatment for substance abuse disorders (other than alcohol)"
label(data$hpv_vacc_b)="7.3j HPV vaccine"
label(data$pneumococcal_vacc)="7.3k Pneumococcal vaccine"
label(data$hepa_vacc)="7.3l Hepatitis A vaccine"
label(data$hepb_vacc)="7.3m Hepatitis B vaccine"
label(data$covid_vacc)="7.3n COVID-19 vaccine"
label(data$quantitative_pcr_vl)="7.4a Quantitative PCR or HIV viral load assay"
label(data$genotypic_dr_testing)="7.4b HIV-1 genotypic drug resistance testing"
label(data$hepv_b)="7.4c Hepatitis B surface antigen (HBsAg) to measure active (chronic) Hepatitis B infection"
label(data$hepv_c)="7.4d Hepatitis B virus viral load (HBV DNA) to measure active (chronic) Hepatitis B infection"
label(data$helpc_b)="7.4e Hepatitis C virus antibody (anti-HCV) to measure past or active (chronic) Hepatitis C infection"
label(data$hepc_c)="7.4f	Hepatitis C virus viral load (HCV RNA) to measure active (chronic) Hepatitis C infection"
label(data$syphilis)="7.4g Syphilis testing (RPR/TPHA/ VDRL)"
label(data$stis)="7.4h STIs other than syphilis"
label(data$crypto_antigen)="7.4i Cryptococcal meningitis screening (serum cryptococcal antigen or lateral flow assay)"
label(data$crypto_csfindia)="7.4j Cryptococcal meningitis diagnosis by CSF India Ink or latex agglutination"
label(data$routine_visits_b)="7.5a Routine clinic visits or consultations"
label(data$specialty_visits_b)="7.5b Specialty clinic visits or consultations"
label(data$first_line_art_b)="7.5c First line ART regimens"
label(data$second_line_art_b)="7.5d Second line ART regimens"
label(data$oi_meds_b)="7.5e Opportunstic Infection (OI) medications (e.g., Cotrimoxazole)"
label(data$hepb_meds_b)="7.f Hepatitis B antiviral medication"
label(data$hepc_meds_b)="7.5g Hepatitis C antiviral medication"
label(data$mh_tx_b)="7.5h Mental health counseling or therapy"
label(data$psychiatric_meds_b)="7.5i Psychiatric medications"
label(data$rapid_hivtest_b)="7.6a HIV-1/HIV-2 antigen/antibody immunoassay test for established HIV infection"
label(data$hiv1_hiv2_test_b)="7.6b HIV-1 p24 antigen test for acute HIV-1 infection"
label(data$hiv1_p24_b)="7.6c Supplemental HIV-1/HIV-2 antibody differentiation immunoassay"
label(data$cd4_test_b)="7.6d CD4 testing"
label(data$qual_pcr_eid_b)="7.6e DNA or RNA PCR for early infant diagnosis (EID)"
label(data$quant_pcr_vl_b)="7.6f Quantitative PCR or viral load"
label(data$hiv1_dr_b)="7.6g HIV-1 genotypic drug resistance testing"
label(data$hbv_test_b)="7.6h Hepatitis B virus (HBV)"
label(data$hcv_test_b)="7.6i Hepatitis C virus (HCV)"
label(data$pharmacy)="8.1 Is there a pharmacy located at this health facility?"
label(data$first_line_arv3)="8.2a First-line HIV antiretroviral medications (ARVs)"
label(data$first_line_arv_out3)="8.2a1 First-line HIV antiretroviral medications (ARVs)"
label(data$second_line_arv3)="8.2b Second-line HIV ARVs"
label(data$second_line_arv_out3)="8.2b1 Second-line HIV ARVs"
label(data$third_line_arv3)="8.2c Third-line HIV ARVs"
label(data$third_line_arv_out3)="8.2c1 Third-line HIV ARVs"
label(data$injectable_art)="8.2d Long-acting injectable ART (combined Cabotegravir/Rilpivirine)"
label(data$injectable_art_out)="8.2d1 Long-acting injectable ART (combined Cabotegravir/Rilpivirine)"
label(data$tbp_meds)="8.2e TB prevention medications (INH, RIF)"
label(data$tbp_meds_out)="8.2e1 TB prevention medications (INH, RIF)"
label(data$ds_tbmeds)="8.2f Drug-sensitive TB treatment medications (RHZE) "
label(data$ds_tbmeds_out)="8.2f1 Drug-sensitive TB treatment medications (RHZE) Rifapentine"
label(data$mdr_tbmeds)="8.2g Multidrug-resistant (MDR) TB treatment medications"
label(data$mdr_tbmeds_out)="8.2g1 Multidrug-resistant (MDR) TB treatment medications"
label(data$cotrimoxazole3)="8.2h Cotrimoxazole (Bactrim, Septra, TMP-SMX)"
label(data$cotrimoxazole_out3)="8.2h1 Cotrimoxazole (Bactrim, Septra, TMP-SMX)"
label(data$malaria_tx3)="8.2i Malaria treatment "
label(data$malaria_tx_out3)="8.2i1 Malaria treatment "
label(data$fluconazole3)="8.2j Fluconazole"
label(data$fluconazole_out3)="8.2j1 Fluconazole"
label(data$amphotericin3)="8.2k Amphotericin B"
label(data$amphotericin_out3)="8.2k1 Amphotericin B"
label(data$flucytosine3)="8.2l Flucytosine (5FC)"
label(data$flucytosine_out3)="8.2l1 Flucytosine (5FC)"
label(data$contraceptives_short3)="8.2m Short-acting contraceptives (pills, injectables, condoms)"
label(data$contraceptives_short_out3)="8.2m1 Short-acting contraceptives (pills, injectables, condoms)"
label(data$contraceptives_long3)="8.2n Long-acting reversible contraceptives (implants, intrauterine devices)"
label(data$contraceptives_long_out3)="8.2n1 Long-acting reversible contraceptives (implants, intrauterine devices)"
label(data$ssris3)="8.2o Selective serotonin reuptake inhibitors (SSRIs: e.g., fluoxetine, citalopram, sertraline, paroxetine)"
label(data$ssris_out3)="8.2o1 Selective serotonin reuptake inhibitors (SSRIs: e.g., fluoxetine, citalopram, sertraline, paroxetine)"
label(data$snris3)="8.2p Serotonin and norepinephrine reuptake inhibitors (SNRIs: e.g., duloxetine, venlafaxine, levomilnacipran)"
label(data$snris_out3)="8.2p1 Serotonin and norepinephrine reuptake inhibitors (SNRIs: e.g., duloxetine, venlafaxine, levomilnacipran)"
label(data$antidepressants3)="8.2q Tricyclic antidepressants (e.g., amitriptyline, amoxapine, doxepin)"
label(data$antidepressants_out3)="8.2q1 Tricyclic antidepressants (e.g., amitriptyline, amoxapine, doxepin)"
label(data$benzodiazepines3)="8.2r Benzodiazepines (e.g., alprazolam, lorazepam, diazepam)"
label(data$benzodiazepines_out3)="8.2r1 Benzodiazepines (e.g., alprazolam, lorazepam, diazepam)"
label(data$antipsychotics3)="8.2s Antipsychotic medications (e.g., risperidone, quetiapine, aripiprazole)"
label(data$antipsychotics_out3)="8.2s1 Antipsychotic medications (e.g., risperidone, quetiapine, aripiprazole)"
label(data$mood_stab3)="8.2t Mood stabilizers (e.g., carbamazepine, lithium, lamotrigine)"
label(data$mood_stab_out3)="8.2t1 Mood stabilizers (e.g., carbamazepine, lithium, lamotrigine)"
label(data$alc_meds3)="8.2u Alcohol dependence medications (Disulfiram, Naltrexone, Acamprosate)"
label(data$alc_meds_out3)="8.2u1 Alcohol dependence medications (Disulfiram, Naltrexone, Acamprosate)"
label(data$wait_list_b)="8.3 In the past year, did this HIV clinic have patients on a waiting list to receive ART? "
label(data$prep)="8.4a Pre-exposure prophylaxis (PrEP)"
label(data$pep)="8.4b Post-exposure prophylaxis (PEP)"
label(data$prepmeds)="8.5a Pre-Exposure prophylaxis (PrEP)"
label(data$prepmeds_out)="8.5a1 Pre-Exposure prophylaxis (PrEP)"
label(data$lai_prepmeds)="8.5b Long-acting PrEP (injectable Cabotegravir or Dapirivine Vaginal Ring)"
label(data$lai_prepmeds_out)="8.5b1 Pre-Exposure prophylaxis (PrEP)"
label(data$pep_meds)="8.5c Post-exposure prophylaxis (PEP)"
label(data$pep_meds_out)="8.5c1 Post-exposure prophylaxis (PEP)"
label(data$missapp_art___77)="9.1. 	What is done to follow-up with ART patients who miss appointments?     Check all that apply OR select Nothing/No follow-up.  (choice=Nothing/no follow-up with ART patients who miss appointments)"
label(data$missapp_art___1)="9.1. 	What is done to follow-up with ART patients who miss appointments?     Check all that apply OR select Nothing/No follow-up.  (choice=Phone call to individual or family)"
label(data$missapp_art___2)="9.1. 	What is done to follow-up with ART patients who miss appointments?     Check all that apply OR select Nothing/No follow-up.  (choice=Send letter)"
label(data$missapp_art___3)="9.1. 	What is done to follow-up with ART patients who miss appointments?     Check all that apply OR select Nothing/No follow-up.  (choice=Send SMS)"
label(data$missapp_art___4)="9.1. 	What is done to follow-up with ART patients who miss appointments?     Check all that apply OR select Nothing/No follow-up.  (choice=Send email)"
label(data$missapp_art___5)="9.1. 	What is done to follow-up with ART patients who miss appointments?     Check all that apply OR select Nothing/No follow-up.  (choice=Send message via online patient portal)"
label(data$missapp_art___6)="9.1. 	What is done to follow-up with ART patients who miss appointments?     Check all that apply OR select Nothing/No follow-up.  (choice=Home visit by clinic staff)"
label(data$missapp_art___7)="9.1. 	What is done to follow-up with ART patients who miss appointments?     Check all that apply OR select Nothing/No follow-up.  (choice=Home visit by community outreach worker)"
label(data$missapp_art___88)="9.1. 	What is done to follow-up with ART patients who miss appointments?     Check all that apply OR select Nothing/No follow-up.  (choice=Other (specify) {other_specify19})"
label(data$other_specify19)="9.1a If Other, please specify"
label(data$track_ltfu)="9.2 Does this clinic ascertain the outcomes of patients with HIV who were lost to follow-up (e.g. outcomes such as patient deaths, transfers to other facilities, ART status, etc.)? "
label(data$track_ltfu_edms)="9.3 Are the outcomes of tracked patients recorded in electronic databases?  "
label(data$track_ltfu_info2___1)="9.4 After tracking patients lost to follow-up at this HIV clinic, what information was recorded in electronic databases?Check all that apply. (choice=Transfers to other facilities)"
label(data$track_ltfu_info2___1b)="9.4 After tracking patients lost to follow-up at this HIV clinic, what information was recorded in electronic databases?Check all that apply. (choice=Loss to follow-up)"
label(data$track_ltfu_info2___5)="9.4 After tracking patients lost to follow-up at this HIV clinic, what information was recorded in electronic databases?Check all that apply. (choice=Deaths)"
label(data$track_ltfu_info2___88)="9.4 After tracking patients lost to follow-up at this HIV clinic, what information was recorded in electronic databases?Check all that apply. (choice=Other {other_specify222})"
label(data$other_specify222)="9.4a. If Other, please specify"
label(data$services_peds2_b___77)="10.1 Which of the following services were provided at this facility to pediatric patients (< 10 years), including HIV-exposed infants ? Check all that apply OR select Not applicable if no pediatric patients are served at this facility. (choice=Not applicable (no pediatric patients served at this facility))"
label(data$services_peds2_b___1)="10.1 Which of the following services were provided at this facility to pediatric patients (< 10 years), including HIV-exposed infants ? Check all that apply OR select Not applicable if no pediatric patients are served at this facility. (choice=Postnatal ARV prophylaxis/prevention of mother-to-child transmission services to HIV-exposed infants)"
label(data$services_peds2_b___1b)="10.1 Which of the following services were provided at this facility to pediatric patients (< 10 years), including HIV-exposed infants ? Check all that apply OR select Not applicable if no pediatric patients are served at this facility. (choice=ART initiation)"
label(data$services_peds2_b___2)="10.1 Which of the following services were provided at this facility to pediatric patients (< 10 years), including HIV-exposed infants ? Check all that apply OR select Not applicable if no pediatric patients are served at this facility. (choice=Infant feeding counseling)"
label(data$services_peds2_b___3)="10.1 Which of the following services were provided at this facility to pediatric patients (< 10 years), including HIV-exposed infants ? Check all that apply OR select Not applicable if no pediatric patients are served at this facility. (choice=Male circumcision for infants)"
label(data$services_peds2_b___4)="10.1 Which of the following services were provided at this facility to pediatric patients (< 10 years), including HIV-exposed infants ? Check all that apply OR select Not applicable if no pediatric patients are served at this facility. (choice=Immunizations)"
label(data$services_peds2_b___5)="10.1 Which of the following services were provided at this facility to pediatric patients (< 10 years), including HIV-exposed infants ? Check all that apply OR select Not applicable if no pediatric patients are served at this facility. (choice=Nutritional support)"
label(data$services_peds2_b___6)="10.1 Which of the following services were provided at this facility to pediatric patients (< 10 years), including HIV-exposed infants ? Check all that apply OR select Not applicable if no pediatric patients are served at this facility. (choice=Growth monitoring)"
label(data$services_peds2_b___7)="10.1 Which of the following services were provided at this facility to pediatric patients (< 10 years), including HIV-exposed infants ? Check all that apply OR select Not applicable if no pediatric patients are served at this facility. (choice=Integrated Management of Childhood Illness (IMCI))"
label(data$services_peds2_b___8)="10.1 Which of the following services were provided at this facility to pediatric patients (< 10 years), including HIV-exposed infants ? Check all that apply OR select Not applicable if no pediatric patients are served at this facility. (choice=Screening for tuberculosis (TB) disease)"
label(data$services_peds2_b___10)="10.1 Which of the following services were provided at this facility to pediatric patients (< 10 years), including HIV-exposed infants ? Check all that apply OR select Not applicable if no pediatric patients are served at this facility. (choice=Testing for latent tuberculosis infection(LTBI))"
label(data$care_infants)="10.2 Does this health facility provide HIV care and treatment to infants < 24 months of age?"
label(data$care_infants_site___1)="10.3 Where is HIV care provided for HIV-exposed infants (< 24 months) at this health facility?Check all that apply. (choice=HIV clinic)"
label(data$care_infants_site___2)="10.3 Where is HIV care provided for HIV-exposed infants (< 24 months) at this health facility?Check all that apply. (choice=Well-baby clinic (for infants and children only))"
label(data$care_infants_site___3)="10.3 Where is HIV care provided for HIV-exposed infants (< 24 months) at this health facility?Check all that apply. (choice=Maternal and child health (MCH) clinic for women and infants)"
label(data$care_infants_site___88)="10.3 Where is HIV care provided for HIV-exposed infants (< 24 months) at this health facility?Check all that apply. (choice=Other {care_infants_site_other})"
label(data$care_infants_site_other)="10.3a. If Other, please specify"
label(data$care_infants_art_site___1)="10.4 Where do infants (< 24 months) diagnosed with HIV initiate ART at this health facility?Check all that apply (choice=HIV clinic)"
label(data$care_infants_art_site___2)="10.4 Where do infants (< 24 months) diagnosed with HIV initiate ART at this health facility?Check all that apply (choice=Well-baby clinic (for infants and children only))"
label(data$care_infants_art_site___3)="10.4 Where do infants (< 24 months) diagnosed with HIV initiate ART at this health facility?Check all that apply (choice=Maternal and child health (MCH) clinic for women and infants)"
label(data$care_infants_art_site___88)="10.4 Where do infants (< 24 months) diagnosed with HIV initiate ART at this health facility?Check all that apply (choice=Other {care_infants_art_site_other})"
label(data$care_infants_art_site_other)="If Other, please specify"
label(data$services_youth_b___77)="10.5 Does this health facility offer any of the following services for youth/adolescent patients with HIV? Check all that apply OR select None (choice=None  (no dedicated services for adolescent patients))"
label(data$services_youth_b___1)="10.5 Does this health facility offer any of the following services for youth/adolescent patients with HIV? Check all that apply OR select None (choice=Dedicated hours or space for youth/adolescent HIV testing & counseling services)"
label(data$services_youth_b___2)="10.5 Does this health facility offer any of the following services for youth/adolescent patients with HIV? Check all that apply OR select None (choice=Dedicated hours or space for youth/adolescent HIV care and treatment services)"
label(data$services_youth_b___3)="10.5 Does this health facility offer any of the following services for youth/adolescent patients with HIV? Check all that apply OR select None (choice=Peer counseling for youth/adolescent patients with HIV)"
label(data$services_youth_b___4)="10.5 Does this health facility offer any of the following services for youth/adolescent patients with HIV? Check all that apply OR select None (choice=Support groups specifically for youth/adolescent patients with HIV)"
label(data$services_youth_b___5)="10.5 Does this health facility offer any of the following services for youth/adolescent patients with HIV? Check all that apply OR select None (choice=Services to support transition to adult HIV care)"
label(data$tst_tbdiag)="11.1a Tuberculin skin test (TST) or IGRA for TB diagnostics"
label(data$cxr_tbdiag)="11.1b Chest x-ray for TB diagnostics"
label(data$sput_tbdiag)="11.1c Specimen collection (sputum, urine) for TB diagnostics"
label(data$tbtrt)="11.1d TB treatment"
label(data$tbhiv_integration)="11.2 What level of integrated TB/HIV services does this HIV clinic have?Select one best response"
label(data$integration_oth)="11.2a If Other, please specify"
label(data$tb_symptom_screen)="11.3 Does this HIV clinic perform TB symptom screening for enrolled patients?"
label(data$tb_symptom_screen_oth)="11.3a If Other, please specify"
label(data$screen_cough)="11.4a Cough"
label(data$screen_fever)="11.4b Fever"
label(data$screen_nightsweats)="11.4c Night sweats"
label(data$screen_weightloss)="11.4d Weight loss"
label(data$screen_contact)="11.4e History of contact with a TB patient"
label(data$screen_fatigue)="11.4f Fatigue/lethargy (or decreased playfulness in children)"
label(data$screen_oth)="11.4g Other (specify)"
label(data$screen_oth_sp)="11.4g1 If other, specify"
label(data$ltbi_testing___0)="11.5 Which latent tuberculosis infection (LTBI) testing do you offer at your facility? Check all that apply (choice=None)"
label(data$ltbi_testing___1)="11.5 Which latent tuberculosis infection (LTBI) testing do you offer at your facility? Check all that apply (choice=Interferon-Gamma Release Assays (IGRAs) blood test)"
label(data$ltbi_testing___2)="11.5 Which latent tuberculosis infection (LTBI) testing do you offer at your facility? Check all that apply (choice=Tuberculin Skin Test (TST))"
label(data$ltbi_testing___88)="11.5 Which latent tuberculosis infection (LTBI) testing do you offer at your facility? Check all that apply (choice=Others, specify {ltbi_testing_oth})"
label(data$ltbi_testing_oth)="11.4g1 If other, specify"
label(data$tpt_prov)="11.6 Does this HIV clinic (or a co-located TB clinic) currently provide TB preventive therapy (TPT)?"
label(data$ltbi_ligibility)="11.7 Is LTBI testing routinely performed to determine the eligibility of patients with HIV to receive TPT at this HIV clinic or a co-located TB clinic?"
label(data$tpt_eligible___1)="11.8 For which of the following types of patients with HIV is LTBI testing (TST or IGRA) routinely performed to determine eligibility for TPT at this HIV clinic or a co-located TB clinic?Check all that apply (choice=All adults and adolescents)"
label(data$tpt_eligible___2)="11.8 For which of the following types of patients with HIV is LTBI testing (TST or IGRA) routinely performed to determine eligibility for TPT at this HIV clinic or a co-located TB clinic?Check all that apply (choice=Pregnant women)"
label(data$tpt_eligible___3)="11.8 For which of the following types of patients with HIV is LTBI testing (TST or IGRA) routinely performed to determine eligibility for TPT at this HIV clinic or a co-located TB clinic?Check all that apply (choice=Infants aged < 12 months)"
label(data$tpt_eligible___4)="11.8 For which of the following types of patients with HIV is LTBI testing (TST or IGRA) routinely performed to determine eligibility for TPT at this HIV clinic or a co-located TB clinic?Check all that apply (choice=Children aged 1-5 years)"
label(data$tpt_eligible___5)="11.8 For which of the following types of patients with HIV is LTBI testing (TST or IGRA) routinely performed to determine eligibility for TPT at this HIV clinic or a co-located TB clinic?Check all that apply (choice=Children aged 5-9 years)"
label(data$tpt_eligible___88)="11.8 For which of the following types of patients with HIV is LTBI testing (TST or IGRA) routinely performed to determine eligibility for TPT at this HIV clinic or a co-located TB clinic?Check all that apply (choice=Other (specify) {tpt_eligible_oth})"
label(data$tpt_eligible_oth)="11.8a If Other, please specify"
label(data$tpt_eligible_adult___77)="11.9 For adults and adolescents ≥10 years living with HIV and who are unlikely to have TB, which of the following characteristics are routinely used to determine eligibility for TPT at this HIV clinic or a co-located TB clinic?Check all that apply (choice=None (all adults and adolescents with HIV are eligible for TPT))"
label(data$tpt_eligible_adult___1)="11.9 For adults and adolescents ≥10 years living with HIV and who are unlikely to have TB, which of the following characteristics are routinely used to determine eligibility for TPT at this HIV clinic or a co-located TB clinic?Check all that apply (choice=Antiretroviral treatment status)"
label(data$tpt_eligible_adult___2)="11.9 For adults and adolescents ≥10 years living with HIV and who are unlikely to have TB, which of the following characteristics are routinely used to determine eligibility for TPT at this HIV clinic or a co-located TB clinic?Check all that apply (choice=Pregnancy status)"
label(data$tpt_eligible_adult___3)="11.9 For adults and adolescents ≥10 years living with HIV and who are unlikely to have TB, which of the following characteristics are routinely used to determine eligibility for TPT at this HIV clinic or a co-located TB clinic?Check all that apply (choice=Prior treatment for TB)"
label(data$tpt_eligible_adult___4)="11.9 For adults and adolescents ≥10 years living with HIV and who are unlikely to have TB, which of the following characteristics are routinely used to determine eligibility for TPT at this HIV clinic or a co-located TB clinic?Check all that apply (choice=Degree of immunosuppression)"
label(data$tpt_eligible_adult___5)="11.9 For adults and adolescents ≥10 years living with HIV and who are unlikely to have TB, which of the following characteristics are routinely used to determine eligibility for TPT at this HIV clinic or a co-located TB clinic?Check all that apply (choice=Contact with TB patient)"
label(data$tpt_eligible_adult___6)="11.9 For adults and adolescents ≥10 years living with HIV and who are unlikely to have TB, which of the following characteristics are routinely used to determine eligibility for TPT at this HIV clinic or a co-located TB clinic?Check all that apply (choice=Latent TB infection status)"
label(data$tpt_eligible_adult___88)="11.9 For adults and adolescents ≥10 years living with HIV and who are unlikely to have TB, which of the following characteristics are routinely used to determine eligibility for TPT at this HIV clinic or a co-located TB clinic?Check all that apply (choice=Other (specify) {tpt_eligible_adult_oth})"
label(data$tpt_eligible_adult_oth)="11.9a If Other, please specify"
label(data$tpt_lt12m)="11.10a. Infants aged < 12 months who are in contact with a person with TB"
label(data$tpt_ge1y)="11.10b. Children aged ≥1-9 years who live in a setting with high TB transmission, regardless of contact with TB patient"
label(data$tpt_g11y_tb)="11.10c. Children aged ≥1-9 years who have successfully completed treatment for TB disease"
label(data$tpt_adults)="11.11a.	Adults and adolescents ≥10 years, regardless of HIV status"
label(data$tpt_peds_lt5)="11.11b.	Children aged < 5 years, regardless of HIV status"
label(data$tpt_peds_ge9)="11.11c.	Children aged ≥5-9 years, regardless of HIV status"
label(data$tpt_hrcontacts)="11.11d.	High-risk household contacts of patients with multidrug-resistant tuberculosis, regardless of HIV status"
label(data$tpt_atrisk___77)="11.12 Regardless of HIV status, which of the following at-risk groups are eligible to receive TPT at this HIV clinic or a co-located TB clinic if they are determined not to have active TB?Check all that apply (choice=None)"
label(data$tpt_atrisk___1)="11.12 Regardless of HIV status, which of the following at-risk groups are eligible to receive TPT at this HIV clinic or a co-located TB clinic if they are determined not to have active TB?Check all that apply (choice=People with diabetes)"
label(data$tpt_atrisk___2)="11.12 Regardless of HIV status, which of the following at-risk groups are eligible to receive TPT at this HIV clinic or a co-located TB clinic if they are determined not to have active TB?Check all that apply (choice=People receiving dialysis)"
label(data$tpt_atrisk___3)="11.12 Regardless of HIV status, which of the following at-risk groups are eligible to receive TPT at this HIV clinic or a co-located TB clinic if they are determined not to have active TB?Check all that apply (choice=People on TNF inhibitors (i.e., drugs for inflammatory conditions such as rheumatoid arthritis))"
label(data$tpt_atrisk___4)="11.12 Regardless of HIV status, which of the following at-risk groups are eligible to receive TPT at this HIV clinic or a co-located TB clinic if they are determined not to have active TB?Check all that apply (choice=People preparing for organ or hematological transplant)"
label(data$tpt_atrisk___5)="11.12 Regardless of HIV status, which of the following at-risk groups are eligible to receive TPT at this HIV clinic or a co-located TB clinic if they are determined not to have active TB?Check all that apply (choice=People who have silicosis)"
label(data$tpt_atrisk___6)="11.12 Regardless of HIV status, which of the following at-risk groups are eligible to receive TPT at this HIV clinic or a co-located TB clinic if they are determined not to have active TB?Check all that apply (choice=Prisoners)"
label(data$tpt_atrisk___7)="11.12 Regardless of HIV status, which of the following at-risk groups are eligible to receive TPT at this HIV clinic or a co-located TB clinic if they are determined not to have active TB?Check all that apply (choice=Health workers)"
label(data$tpt_atrisk___8)="11.12 Regardless of HIV status, which of the following at-risk groups are eligible to receive TPT at this HIV clinic or a co-located TB clinic if they are determined not to have active TB?Check all that apply (choice=Immigrants from countries with a high TB burden)"
label(data$tpt_atrisk___9)="11.12 Regardless of HIV status, which of the following at-risk groups are eligible to receive TPT at this HIV clinic or a co-located TB clinic if they are determined not to have active TB?Check all that apply (choice=Homeless people)"
label(data$tpt_atrisk___10)="11.12 Regardless of HIV status, which of the following at-risk groups are eligible to receive TPT at this HIV clinic or a co-located TB clinic if they are determined not to have active TB?Check all that apply (choice=People who use drugs)"
label(data$tpt_atrisk___11)="11.12 Regardless of HIV status, which of the following at-risk groups are eligible to receive TPT at this HIV clinic or a co-located TB clinic if they are determined not to have active TB?Check all that apply (choice=People who engage in the harmful use of alcohol)"
label(data$tpt_atrisk___12)="11.12 Regardless of HIV status, which of the following at-risk groups are eligible to receive TPT at this HIV clinic or a co-located TB clinic if they are determined not to have active TB?Check all that apply (choice=Tobacco smokers)"
label(data$tpt_atrisk___13)="11.12 Regardless of HIV status, which of the following at-risk groups are eligible to receive TPT at this HIV clinic or a co-located TB clinic if they are determined not to have active TB?Check all that apply (choice=Underweight people who belong to other risk groups listed above)"
label(data$inh6_b___1)="11.13a 6-month isoniazid (6H) (choice=ADULTS)"
label(data$inh6_b___2)="11.13a 6-month isoniazid (6H) (choice=CHILDREN)"
label(data$inh6_b___77)="11.13a 6-month isoniazid (6H) (choice=NONE)"
label(data$inh6_b___3)="11.13a 6-month isoniazid (6H) (choice=DONT KNOW)"
label(data$inh9_b___1)="11.13b 9-month isoniazid (9H) (choice=ADULTS)"
label(data$inh9_b___2)="11.13b 9-month isoniazid (9H) (choice=CHILDREN)"
label(data$inh9_b___77)="11.13b 9-month isoniazid (9H) (choice=NONE)"
label(data$inh9_b___3)="11.13b 9-month isoniazid (9H) (choice=DONT KNOW)"
label(data$inh12_b___1)="11.13c 12-month isoniazid (12H) (choice=ADULTS)"
label(data$inh12_b___2)="11.13c 12-month isoniazid (12H) (choice=CHILDREN)"
label(data$inh12_b___77)="11.13c 12-month isoniazid (12H) (choice=NONE)"
label(data$inh12_b___3)="11.13c 12-month isoniazid (12H) (choice=DONT KNOW)"
label(data$inh36_b___1)="11.13d 36/Lifetime isoniazid (36/Lifetime H) (choice=ADULTS)"
label(data$inh36_b___2)="11.13d 36/Lifetime isoniazid (36/Lifetime H) (choice=CHILDREN)"
label(data$inh36_b___77)="11.13d 36/Lifetime isoniazid (36/Lifetime H) (choice=NONE)"
label(data$inh36_b___3)="11.13d 36/Lifetime isoniazid (36/Lifetime H) (choice=DONT KNOW)"
label(data$rif3_b___1)="11.13e 3-month rifampicin (3R) (choice=ADULTS)"
label(data$rif3_b___2)="11.13e 3-month rifampicin (3R) (choice=CHILDREN)"
label(data$rif3_b___77)="11.13e 3-month rifampicin (3R) (choice=NONE)"
label(data$rif3_b___3)="11.13e 3-month rifampicin (3R) (choice=DONT KNOW)"
label(data$rif4_b___1)="11.13f 4-month rifampicin (4R) (choice=ADULTS)"
label(data$rif4_b___2)="11.13f 4-month rifampicin (4R) (choice=CHILDREN)"
label(data$rif4_b___77)="11.13f 4-month rifampicin (4R) (choice=NONE)"
label(data$rif4_b___3)="11.13f 4-month rifampicin (4R) (choice=DONT KNOW)"
label(data$inh_rif3_b___1)="11.13g  3-month isoniazid-rifampicin (3HR) (choice=ADULTS)"
label(data$inh_rif3_b___2)="11.13g  3-month isoniazid-rifampicin (3HR) (choice=CHILDREN)"
label(data$inh_rif3_b___77)="11.13g  3-month isoniazid-rifampicin (3HR) (choice=NONE)"
label(data$inh_rif3_b___3)="11.13g  3-month isoniazid-rifampicin (3HR) (choice=DONT KNOW)"
label(data$inh_rif4_b___1)="11.13h.4-month isoniazid-rifampicin (4HR) (choice=ADULTS)"
label(data$inh_rif4_b___2)="11.13h.4-month isoniazid-rifampicin (4HR) (choice=CHILDREN)"
label(data$inh_rif4_b___77)="11.13h.4-month isoniazid-rifampicin (4HR) (choice=NONE)"
label(data$inh_rif4_b___3)="11.13h.4-month isoniazid-rifampicin (4HR) (choice=DONT KNOW)"
label(data$hp3_12weeks_b___1)="11.13i. Once-weekly isoniazid-rifapentine for 12 weeks (3HP) (choice=ADULTS)"
label(data$hp3_12weeks_b___2)="11.13i. Once-weekly isoniazid-rifapentine for 12 weeks (3HP) (choice=CHILDREN)"
label(data$hp3_12weeks_b___77)="11.13i. Once-weekly isoniazid-rifapentine for 12 weeks (3HP) (choice=NONE)"
label(data$hp3_12weeks_b___3)="11.13i. Once-weekly isoniazid-rifapentine for 12 weeks (3HP) (choice=DONT KNOW)"
label(data$hp3_1month_b___1)="11.13j. Once-daily isoniazid-rifapentine for 1 month (1HP) (choice=ADULTS)"
label(data$hp3_1month_b___2)="11.13j. Once-daily isoniazid-rifapentine for 1 month (1HP) (choice=CHILDREN)"
label(data$hp3_1month_b___77)="11.13j. Once-daily isoniazid-rifapentine for 1 month (1HP) (choice=NONE)"
label(data$hp3_1month_b___3)="11.13j. Once-daily isoniazid-rifapentine for 1 month (1HP) (choice=DONT KNOW)"
label(data$mdrtb_specify_b___1)="11.13k. Regimens for MDR-TB exposure (specify) (choice=ADULTS)"
label(data$mdrtb_specify_b___2)="11.13k. Regimens for MDR-TB exposure (specify) (choice=CHILDREN)"
label(data$mdrtb_specify_b___77)="11.13k. Regimens for MDR-TB exposure (specify) (choice=NONE)"
label(data$mdrtb_specify_b___3)="11.13k. Regimens for MDR-TB exposure (specify) (choice=DONT KNOW)"
label(data$other_specify_b___1)="11.13l.  Other TPT regimen(specify or select none) (choice=ADULTS)"
label(data$other_specify_b___2)="11.13l.  Other TPT regimen(specify or select none) (choice=CHILDREN)"
label(data$other_specify_b___77)="11.13l.  Other TPT regimen(specify or select none) (choice=NONE)"
label(data$other_specify_b___3)="11.13l.  Other TPT regimen(specify or select none) (choice=DONT KNOW)"
label(data$other_tpt_mdr)="11.13k1. Other regimen for MDR-TB exposure (specify)"
label(data$other_tpt_ad_b)="11.13l1. Other TPT regimen (specify) "
label(data$tpt_training)="11.14	Has anyone at this HIV clinic or a collocated TB clinic attended a formal training (such as hosted by the Ministry/Department of Health or an NGO) on TPT provision?"
label(data$tpt_barriers___77)="11.15 What are the most important barriers to initiating patients with HIV on TPT at this facility? Check all that apply (choice=None (No barriers to initiating patients on TPT))"
label(data$tpt_barriers___1)="11.15 What are the most important barriers to initiating patients with HIV on TPT at this facility? Check all that apply (choice=Medication availability or stockouts (Isoniazid, Rifapentine))"
label(data$tpt_barriers___2)="11.15 What are the most important barriers to initiating patients with HIV on TPT at this facility? Check all that apply (choice=LTBI Testing stockouts (Tuberculin and/or IGRA))"
label(data$tpt_barriers___3)="11.15 What are the most important barriers to initiating patients with HIV on TPT at this facility? Check all that apply (choice=Availability of diagnostics for ruling out active TB)"
label(data$tpt_barriers___4)="11.15 What are the most important barriers to initiating patients with HIV on TPT at this facility? Check all that apply (choice=Concerns about drug resistance)"
label(data$tpt_barriers___5)="11.15 What are the most important barriers to initiating patients with HIV on TPT at this facility? Check all that apply (choice=Increased workload)"
label(data$tpt_barriers___6)="11.15 What are the most important barriers to initiating patients with HIV on TPT at this facility? Check all that apply (choice=Patients refuse TPT)"
label(data$tpt_barriers___7)="11.15 What are the most important barriers to initiating patients with HIV on TPT at this facility? Check all that apply (choice=Access to HIV care using differentiated service delivery)"
label(data$tpt_barriers___88)="11.15 What are the most important barriers to initiating patients with HIV on TPT at this facility? Check all that apply (choice=Other, (specify) {tpt_barriers_oth})"
label(data$tpt_barriers_oth)="11.15a. If Other, please specify"
label(data$aud_patient___77)="12.1 Which patients with HIV are routinely screened for alcohol use disorders?Check all that apply, or select None or All patients. (choice=None (no screening for alcohol use disorders))"
label(data$aud_patient___1)="12.1 Which patients with HIV are routinely screened for alcohol use disorders?Check all that apply, or select None or All patients. (choice=All patients)"
label(data$aud_patient___2)="12.1 Which patients with HIV are routinely screened for alcohol use disorders?Check all that apply, or select None or All patients. (choice=Patients with symptoms of possible alcohol use disorders)"
label(data$aud_patient___3)="12.1 Which patients with HIV are routinely screened for alcohol use disorders?Check all that apply, or select None or All patients. (choice=Patients with therapeutic failure)"
label(data$aud_patient___4)="12.1 Which patients with HIV are routinely screened for alcohol use disorders?Check all that apply, or select None or All patients. (choice=Patients with poor adherence to ART)"
label(data$aud_patient___88)="12.1 Which patients with HIV are routinely screened for alcohol use disorders?Check all that apply, or select None or All patients. (choice=Other types of patients {aud_patient_oth})"
label(data$aud_patient___99)="12.1 Which patients with HIV are routinely screened for alcohol use disorders?Check all that apply, or select None or All patients. (choice=Do not know)"
label(data$aud_patient_oth)="12.1a If Other, please specify"
label(data$aud_screen_tools___77)="12.2 Which structured instrument(s) are used to screen patients for alcohol use disorders?Check all that apply or select None. (choice=None (no structured or standardized screening tool used))"
label(data$aud_screen_tools___1)="12.2 Which structured instrument(s) are used to screen patients for alcohol use disorders?Check all that apply or select None. (choice=Alcohol Use Disorders Identification Test (AUDIT))"
label(data$aud_screen_tools___2)="12.2 Which structured instrument(s) are used to screen patients for alcohol use disorders?Check all that apply or select None. (choice=Alcohol Use Disorders Identification Test-C (AUDIT-C))"
label(data$aud_screen_tools___3)="12.2 Which structured instrument(s) are used to screen patients for alcohol use disorders?Check all that apply or select None. (choice=Alcohol, Smoking, and Substance Involvement Screening Test (ASSIST))"
label(data$aud_screen_tools___4)="12.2 Which structured instrument(s) are used to screen patients for alcohol use disorders?Check all that apply or select None. (choice=Cut down, Annoyed, Guilty, Eye-opener (CAGE))"
label(data$aud_screen_tools___88)="12.2 Which structured instrument(s) are used to screen patients for alcohol use disorders?Check all that apply or select None. (choice=Other {aud_screen_tools_oth})"
label(data$aud_screen_tools_oth)="12.2a If Other, please specify"
label(data$aud_biomarkers___77)="12.3 Which of the following biomarkers can be assessed at this health facility in screening for alcohol use disorders?Check all that apply or select None. (choice=None - biomarkers not used in screening for alcohol use disorders)"
label(data$aud_biomarkers___1)="12.3 Which of the following biomarkers can be assessed at this health facility in screening for alcohol use disorders?Check all that apply or select None. (choice=Aspartate transaminase (AST))"
label(data$aud_biomarkers___2)="12.3 Which of the following biomarkers can be assessed at this health facility in screening for alcohol use disorders?Check all that apply or select None. (choice=Aspartate transaminase, Alanine transaminase ratio (AST/ALT))"
label(data$aud_biomarkers___3)="12.3 Which of the following biomarkers can be assessed at this health facility in screening for alcohol use disorders?Check all that apply or select None. (choice=Blood alcohol concentration (BAC))"
label(data$aud_biomarkers___4)="12.3 Which of the following biomarkers can be assessed at this health facility in screening for alcohol use disorders?Check all that apply or select None. (choice=Ethyl glucuronide (EtG))"
label(data$aud_biomarkers___88)="12.3 Which of the following biomarkers can be assessed at this health facility in screening for alcohol use disorders?Check all that apply or select None. (choice=Other {aud_biomarkers_oth})"
label(data$aud_biomarkers_oth)="12.3a If Other, please specify"
label(data$aud_pos_tx___77)="12.4 For patients who screen positive for alcohol use disorders, what treatment interventions are available at this health facility?Check all that apply or select None. (choice=None (no treatment available at this health facility))"
label(data$aud_pos_tx___1)="12.4 For patients who screen positive for alcohol use disorders, what treatment interventions are available at this health facility?Check all that apply or select None. (choice=Counseling)"
label(data$aud_pos_tx___6)="12.4 For patients who screen positive for alcohol use disorders, what treatment interventions are available at this health facility?Check all that apply or select None. (choice=WHO Screening, Brief Intervention, and Referral to Treatment (SBIRT))"
label(data$aud_pos_tx___2)="12.4 For patients who screen positive for alcohol use disorders, what treatment interventions are available at this health facility?Check all that apply or select None. (choice=Brief Intervention (1 to 3 sessions))"
label(data$aud_pos_tx___3)="12.4 For patients who screen positive for alcohol use disorders, what treatment interventions are available at this health facility?Check all that apply or select None. (choice=Detox hospitalization)"
label(data$aud_pos_tx___4)="12.4 For patients who screen positive for alcohol use disorders, what treatment interventions are available at this health facility?Check all that apply or select None. (choice=Pharmacological treatment (Disulfiram, Naltrexone, Acamprosate))"
label(data$aud_pos_tx___88)="12.4 For patients who screen positive for alcohol use disorders, what treatment interventions are available at this health facility?Check all that apply or select None. (choice=Other {aud_pos_tx_oth})"
label(data$aud_pos_tx_oth)="12.4a If Other, please specify"
label(data$other_aud_screen___77)="12.5 Which of the following other substance use disorders are patients screened for in the HIV clinic?Screening refers to any type of structured or unstructured assessment.Check all that apply or select None. (choice=None (no screening for other substance use disorders))"
label(data$other_aud_screen___0)="12.5 Which of the following other substance use disorders are patients screened for in the HIV clinic?Screening refers to any type of structured or unstructured assessment.Check all that apply or select None. (choice=Tobacco (e.g., smoke, smokeless))"
label(data$other_aud_screen___1)="12.5 Which of the following other substance use disorders are patients screened for in the HIV clinic?Screening refers to any type of structured or unstructured assessment.Check all that apply or select None. (choice=Cannabis (marijuana))"
label(data$other_aud_screen___2)="12.5 Which of the following other substance use disorders are patients screened for in the HIV clinic?Screening refers to any type of structured or unstructured assessment.Check all that apply or select None. (choice=Cocaine/crack)"
label(data$other_aud_screen___3)="12.5 Which of the following other substance use disorders are patients screened for in the HIV clinic?Screening refers to any type of structured or unstructured assessment.Check all that apply or select None. (choice=Ecstasy and other club drugs)"
label(data$other_aud_screen___4)="12.5 Which of the following other substance use disorders are patients screened for in the HIV clinic?Screening refers to any type of structured or unstructured assessment.Check all that apply or select None. (choice=Hallucinogens)"
label(data$other_aud_screen___5)="12.5 Which of the following other substance use disorders are patients screened for in the HIV clinic?Screening refers to any type of structured or unstructured assessment.Check all that apply or select None. (choice=Methamphetamine)"
label(data$other_aud_screen___6)="12.5 Which of the following other substance use disorders are patients screened for in the HIV clinic?Screening refers to any type of structured or unstructured assessment.Check all that apply or select None. (choice=Opioids)"
label(data$other_aud_screen___88)="12.5 Which of the following other substance use disorders are patients screened for in the HIV clinic?Screening refers to any type of structured or unstructured assessment.Check all that apply or select None. (choice=Other {other_aud_screen_oth})"
label(data$other_aud_screen_oth)="12.5a If Other, please specify"
label(data$other_aud_patients___1)="12.6 Which patients with HIV are routinely screened for other substance use disorders?Check all that apply or select All patients. (choice=All patients)"
label(data$other_aud_patients___2)="12.6 Which patients with HIV are routinely screened for other substance use disorders?Check all that apply or select All patients. (choice=Patients with symptoms of possible substance use disorders)"
label(data$other_aud_patients___3)="12.6 Which patients with HIV are routinely screened for other substance use disorders?Check all that apply or select All patients. (choice=Patients with therapeutic failure)"
label(data$other_aud_patients___4)="12.6 Which patients with HIV are routinely screened for other substance use disorders?Check all that apply or select All patients. (choice=Patients with poor adherence to ART)"
label(data$other_aud_patients___88)="12.6 Which patients with HIV are routinely screened for other substance use disorders?Check all that apply or select All patients. (choice=Other types of patients (specify {other_aud_patients_oth})"
label(data$other_aud_patients___99)="12.6 Which patients with HIV are routinely screened for other substance use disorders?Check all that apply or select All patients. (choice=Do not know)"
label(data$other_aud_patients_oth)="12.6a If Other, please specify"
label(data$sud_tools___77)="12.7 Which structured instrument(s) are used to screen patients for substance use disorders (other than alcohol use)?Check all that apply or select None. (choice=None (no structured or standardized screening tool used))"
label(data$sud_tools___1)="12.7 Which structured instrument(s) are used to screen patients for substance use disorders (other than alcohol use)?Check all that apply or select None. (choice=Addiction Severity Index (ASI))"
label(data$sud_tools___2)="12.7 Which structured instrument(s) are used to screen patients for substance use disorders (other than alcohol use)?Check all that apply or select None. (choice=Alcohol, Smoking, and Substance Involvement Screening Test (ASSIST))"
label(data$sud_tools___3)="12.7 Which structured instrument(s) are used to screen patients for substance use disorders (other than alcohol use)?Check all that apply or select None. (choice=Drug Abuse Screening Test (DAST))"
label(data$sud_tools___88)="12.7 Which structured instrument(s) are used to screen patients for substance use disorders (other than alcohol use)?Check all that apply or select None. (choice=Other (specify) {sud_tools_oth})"
label(data$sud_tools_oth)="12.7a If Other, please specify"
label(data$sud_pos_tx___77)="12.8 For patients with substance use disorders (other than alcohol use) what treatment interventions are available at this health facility?Check all that apply or select None. (choice=None (no treatment available at this health facility))"
label(data$sud_pos_tx___1)="12.8 For patients with substance use disorders (other than alcohol use) what treatment interventions are available at this health facility?Check all that apply or select None. (choice=Counseling (Psychotherapy))"
label(data$sud_pos_tx___7)="12.8 For patients with substance use disorders (other than alcohol use) what treatment interventions are available at this health facility?Check all that apply or select None. (choice=WHO Screening, Brief Intervention, and Referral to Treatment (SBIRT))"
label(data$sud_pos_tx___2)="12.8 For patients with substance use disorders (other than alcohol use) what treatment interventions are available at this health facility?Check all that apply or select None. (choice=Brief Intervention (1 to 3 sessions))"
label(data$sud_pos_tx___3)="12.8 For patients with substance use disorders (other than alcohol use) what treatment interventions are available at this health facility?Check all that apply or select None. (choice=Detox hospitalization)"
label(data$sud_pos_tx___4)="12.8 For patients with substance use disorders (other than alcohol use) what treatment interventions are available at this health facility?Check all that apply or select None. (choice=Methadone replacement therapy)"
label(data$sud_pos_tx___9)="12.8 For patients with substance use disorders (other than alcohol use) what treatment interventions are available at this health facility?Check all that apply or select None. (choice=Nicotine replacement)"
label(data$sud_pos_tx___5)="12.8 For patients with substance use disorders (other than alcohol use) what treatment interventions are available at this health facility?Check all that apply or select None. (choice=Other Pharmacological treatment)"
label(data$sud_pos_tx___88)="12.8 For patients with substance use disorders (other than alcohol use) what treatment interventions are available at this health facility?Check all that apply or select None. (choice=Other {sud_pos_tx_oth})"
label(data$sud_pos_tx_oth)="12.8a If Other, please specify"
label(data$clean_needles)="12.9 Do you provide clean needles/syringes at this health facility for people who inject drugs?"
label(data$depression_screen_pt_b___77)="13.1 Which patients with HIV are routinely screened for depression?Screening refers to any type of structured or unstructured assessment.  Check all that apply or select None. (choice=None (no patients are screened for depression))"
label(data$depression_screen_pt_b___1)="13.1 Which patients with HIV are routinely screened for depression?Screening refers to any type of structured or unstructured assessment.  Check all that apply or select None. (choice=All patients)"
label(data$depression_screen_pt_b___2)="13.1 Which patients with HIV are routinely screened for depression?Screening refers to any type of structured or unstructured assessment.  Check all that apply or select None. (choice=Patients presenting with symptoms of mental disorders)"
label(data$depression_screen_pt_b___3)="13.1 Which patients with HIV are routinely screened for depression?Screening refers to any type of structured or unstructured assessment.  Check all that apply or select None. (choice=Patients with therapeutic failure)"
label(data$depression_screen_pt_b___4)="13.1 Which patients with HIV are routinely screened for depression?Screening refers to any type of structured or unstructured assessment.  Check all that apply or select None. (choice=Patients with poor adherence to ART)"
label(data$depression_screen_pt_b___5)="13.1 Which patients with HIV are routinely screened for depression?Screening refers to any type of structured or unstructured assessment.  Check all that apply or select None. (choice=Older patients (≥50 years))"
label(data$depression_screen_pt_b___88)="13.1 Which patients with HIV are routinely screened for depression?Screening refers to any type of structured or unstructured assessment.  Check all that apply or select None. (choice=Other types of patients (specify) {depression_screen_pt_oth})"
label(data$depression_screen_pt_oth)="13.1a If other, please specify"
label(data$depression_screen_tools___77)="13.2 Which structured instrument(s) are used at this health facility to screen patients for depression? Check all that apply or select None. (choice=None (no structured or standardized depression screening tool used))"
label(data$depression_screen_tools___1)="13.2 Which structured instrument(s) are used at this health facility to screen patients for depression? Check all that apply or select None. (choice=Beck Depression Inventory (BDI))"
label(data$depression_screen_tools___2)="13.2 Which structured instrument(s) are used at this health facility to screen patients for depression? Check all that apply or select None. (choice=Center for Epidemiologic Studies Depression Scale (CES-D))"
label(data$depression_screen_tools___3)="13.2 Which structured instrument(s) are used at this health facility to screen patients for depression? Check all that apply or select None. (choice=Hamilton Rating Scale for Depression (HAM-D))"
label(data$depression_screen_tools___4)="13.2 Which structured instrument(s) are used at this health facility to screen patients for depression? Check all that apply or select None. (choice=Hospital Anxiety and Depression Scale (HAD))"
label(data$depression_screen_tools___5)="13.2 Which structured instrument(s) are used at this health facility to screen patients for depression? Check all that apply or select None. (choice=Patient Health Questionnaire-2 (PHQ-2))"
label(data$depression_screen_tools___6)="13.2 Which structured instrument(s) are used at this health facility to screen patients for depression? Check all that apply or select None. (choice=Patient Health Questionnaire-9 (PHQ-9))"
label(data$depression_screen_tools___88)="13.2 Which structured instrument(s) are used at this health facility to screen patients for depression? Check all that apply or select None. (choice=Other {depres_screen_tools_oth})"
label(data$depression_screen_tools___99)="13.2 Which structured instrument(s) are used at this health facility to screen patients for depression? Check all that apply or select None. (choice=Do not know)"
label(data$depres_screen_tools_oth)="13.2a If other, please specify"
label(data$depression_tx_b___77)="13.3 Which types of treatment are available at this health facility for patients with HIV with depression?Check all that apply or select None. (choice=None (no treatment available at this health facility))"
label(data$depression_tx_b___1)="13.3 Which types of treatment are available at this health facility for patients with HIV with depression?Check all that apply or select None. (choice=Counseling or psychotherapy)"
label(data$depression_tx_b___3)="13.3 Which types of treatment are available at this health facility for patients with HIV with depression?Check all that apply or select None. (choice=Medication)"
label(data$depression_tx_b___4)="13.3 Which types of treatment are available at this health facility for patients with HIV with depression?Check all that apply or select None. (choice=Peer support)"
label(data$depression_tx_b___5)="13.3 Which types of treatment are available at this health facility for patients with HIV with depression?Check all that apply or select None. (choice=Psychosocial support)"
label(data$depression_tx_b___88)="13.3 Which types of treatment are available at this health facility for patients with HIV with depression?Check all that apply or select None. (choice=Other {depres_tx_oth})"
label(data$depres_tx_oth)="13.3a If other, please specify"
label(data$anxiety_screen_pt_b___77)="13.4 Which patients with HIV are routinely screened for anxiety at this health facility?Screening refers to any type of structured or unstructured assessment.  Check all that apply or select None. (choice=None (no patients are screened for anxiety))"
label(data$anxiety_screen_pt_b___1)="13.4 Which patients with HIV are routinely screened for anxiety at this health facility?Screening refers to any type of structured or unstructured assessment.  Check all that apply or select None. (choice=All patients)"
label(data$anxiety_screen_pt_b___2)="13.4 Which patients with HIV are routinely screened for anxiety at this health facility?Screening refers to any type of structured or unstructured assessment.  Check all that apply or select None. (choice=Patients presenting with symptoms of mental disorders)"
label(data$anxiety_screen_pt_b___3)="13.4 Which patients with HIV are routinely screened for anxiety at this health facility?Screening refers to any type of structured or unstructured assessment.  Check all that apply or select None. (choice=Patients with therapeutic failure)"
label(data$anxiety_screen_pt_b___4)="13.4 Which patients with HIV are routinely screened for anxiety at this health facility?Screening refers to any type of structured or unstructured assessment.  Check all that apply or select None. (choice=Patients with poor adherence to ART)"
label(data$anxiety_screen_pt_b___5)="13.4 Which patients with HIV are routinely screened for anxiety at this health facility?Screening refers to any type of structured or unstructured assessment.  Check all that apply or select None. (choice=Older patients (≥50 years))"
label(data$anxiety_screen_pt_b___88)="13.4 Which patients with HIV are routinely screened for anxiety at this health facility?Screening refers to any type of structured or unstructured assessment.  Check all that apply or select None. (choice=Other types of patients {anxiety_screen_pt_oth})"
label(data$anxiety_screen_pt_oth)="13.4a If other, please specify"
label(data$anxiety_screen_tools___77)="13.5 Which structured instrument(s) are used at this health facility to screen patients for anxiety? Check all that apply or select None. (choice=None (no structured or standardized screening tool used))"
label(data$anxiety_screen_tools___1)="13.5 Which structured instrument(s) are used at this health facility to screen patients for anxiety? Check all that apply or select None. (choice=Beck Anxiety Inventory (BAI))"
label(data$anxiety_screen_tools___2)="13.5 Which structured instrument(s) are used at this health facility to screen patients for anxiety? Check all that apply or select None. (choice=Generalized Anxiety Disorder 7-item scale (GAD-7))"
label(data$anxiety_screen_tools___3)="13.5 Which structured instrument(s) are used at this health facility to screen patients for anxiety? Check all that apply or select None. (choice=Hospital Anxiety and Depression Scale (HAD))"
label(data$anxiety_screen_tools___4)="13.5 Which structured instrument(s) are used at this health facility to screen patients for anxiety? Check all that apply or select None. (choice=State-Trait Anxiety Inventory (STAI))"
label(data$anxiety_screen_tools___88)="13.5 Which structured instrument(s) are used at this health facility to screen patients for anxiety? Check all that apply or select None. (choice=Other {anxiety_screen_tools_oth})"
label(data$anxiety_screen_tools_oth)="13.5a If other, please specify"
label(data$anxiety_tx_b___77)="13.6 Which types of treatments are available at this health facility for patients with anxiety?Check all that apply or select None. (choice=None (no anxiety treatment available at this health facility))"
label(data$anxiety_tx_b___6)="13.6 Which types of treatments are available at this health facility for patients with anxiety?Check all that apply or select None. (choice=Counseling or psychotherapy)"
label(data$anxiety_tx_b___3)="13.6 Which types of treatments are available at this health facility for patients with anxiety?Check all that apply or select None. (choice=Medication)"
label(data$anxiety_tx_b___4)="13.6 Which types of treatments are available at this health facility for patients with anxiety?Check all that apply or select None. (choice=Peer support)"
label(data$anxiety_tx_b___5)="13.6 Which types of treatments are available at this health facility for patients with anxiety?Check all that apply or select None. (choice=Psychosocial support)"
label(data$anxiety_tx_b___88)="13.6 Which types of treatments are available at this health facility for patients with anxiety?Check all that apply or select None. (choice=Other {anxiety_tx_oth})"
label(data$anxiety_tx_oth)="13.6a If other, please specify"
label(data$ptsd_screen_pt_b___77)="13.7 Which patients with HIV are routinely screened for PTSD?Screening refers to any type of structured or unstructured assessment.  Check all that apply or select None. (choice=None (no patients are screened for PTSD))"
label(data$ptsd_screen_pt_b___1)="13.7 Which patients with HIV are routinely screened for PTSD?Screening refers to any type of structured or unstructured assessment.  Check all that apply or select None. (choice=All patients)"
label(data$ptsd_screen_pt_b___2)="13.7 Which patients with HIV are routinely screened for PTSD?Screening refers to any type of structured or unstructured assessment.  Check all that apply or select None. (choice=Patients presenting with symptoms of mental disorders)"
label(data$ptsd_screen_pt_b___3)="13.7 Which patients with HIV are routinely screened for PTSD?Screening refers to any type of structured or unstructured assessment.  Check all that apply or select None. (choice=Patients with therapeutic failure)"
label(data$ptsd_screen_pt_b___4)="13.7 Which patients with HIV are routinely screened for PTSD?Screening refers to any type of structured or unstructured assessment.  Check all that apply or select None. (choice=Patients with poor adherence to ART)"
label(data$ptsd_screen_pt_b___5)="13.7 Which patients with HIV are routinely screened for PTSD?Screening refers to any type of structured or unstructured assessment.  Check all that apply or select None. (choice=Older patients (≥50 years))"
label(data$ptsd_screen_pt_b___88)="13.7 Which patients with HIV are routinely screened for PTSD?Screening refers to any type of structured or unstructured assessment.  Check all that apply or select None. (choice=Other types of patients {ptsd_screen_pt_oth})"
label(data$ptsd_screen_pt_oth)="13.7a If other, please specify"
label(data$ptsd_screen_tools___77)="13.8 Which structured instrument(s) are used to screen patients for PTSD? Check all that apply or select None. (choice=None (no structured PTSD screening tool used))"
label(data$ptsd_screen_tools___1)="13.8 Which structured instrument(s) are used to screen patients for PTSD? Check all that apply or select None. (choice=Life Event Checklist)"
label(data$ptsd_screen_tools___2)="13.8 Which structured instrument(s) are used to screen patients for PTSD? Check all that apply or select None. (choice=Primary Care PTSD Screen (PC-PTSD))"
label(data$ptsd_screen_tools___4)="13.8 Which structured instrument(s) are used to screen patients for PTSD? Check all that apply or select None. (choice=PTSD Checklist for DSM-5 (PCL-5))"
label(data$ptsd_screen_tools___5)="13.8 Which structured instrument(s) are used to screen patients for PTSD? Check all that apply or select None. (choice=Short PTSD Rating Interview (SPRINT))"
label(data$ptsd_screen_tools___6)="13.8 Which structured instrument(s) are used to screen patients for PTSD? Check all that apply or select None. (choice=Trauma Screening Questionnaire  (TSQ))"
label(data$ptsd_screen_tools___88)="13.8 Which structured instrument(s) are used to screen patients for PTSD? Check all that apply or select None. (choice=Other {ptsd_screen_tools_oth})"
label(data$ptsd_screen_tools_oth)="13.8a If other, please specify"
label(data$ptsd_tx_b___77)="13.9 Which types of treatments are available at this health facility for patients with HIV with PTSD?Check all that apply or select None. (choice=None (no PTSD treatment available at this health facility))"
label(data$ptsd_tx_b___6)="13.9 Which types of treatments are available at this health facility for patients with HIV with PTSD?Check all that apply or select None. (choice=Counseling or psychotherapy)"
label(data$ptsd_tx_b___3)="13.9 Which types of treatments are available at this health facility for patients with HIV with PTSD?Check all that apply or select None. (choice=Medication)"
label(data$ptsd_tx_b___4)="13.9 Which types of treatments are available at this health facility for patients with HIV with PTSD?Check all that apply or select None. (choice=Peer support)"
label(data$ptsd_tx_b___5)="13.9 Which types of treatments are available at this health facility for patients with HIV with PTSD?Check all that apply or select None. (choice=Psychosocial support)"
label(data$ptsd_tx_b___88)="13.9 Which types of treatments are available at this health facility for patients with HIV with PTSD?Check all that apply or select None. (choice=Other {ptsd_tx_oth})"
label(data$ptsd_tx_oth)="13.9a If other, please specify"
label(data$cog_screen_pt___77)="13.10 Which patients with HIV are routinely screened for cognitive impairment?Screening refers to any type of structured or unstructured assessment.  Check all that apply or select None. (choice=None (no patients are screened for cognitive impairment))"
label(data$cog_screen_pt___1)="13.10 Which patients with HIV are routinely screened for cognitive impairment?Screening refers to any type of structured or unstructured assessment.  Check all that apply or select None. (choice=All patients)"
label(data$cog_screen_pt___2)="13.10 Which patients with HIV are routinely screened for cognitive impairment?Screening refers to any type of structured or unstructured assessment.  Check all that apply or select None. (choice=Patients presenting with symptoms of cognitive impairment)"
label(data$cog_screen_pt___3)="13.10 Which patients with HIV are routinely screened for cognitive impairment?Screening refers to any type of structured or unstructured assessment.  Check all that apply or select None. (choice=Patients with therapeutic failure)"
label(data$cog_screen_pt___4)="13.10 Which patients with HIV are routinely screened for cognitive impairment?Screening refers to any type of structured or unstructured assessment.  Check all that apply or select None. (choice=Patients with poor adherence to ART)"
label(data$cog_screen_pt___5)="13.10 Which patients with HIV are routinely screened for cognitive impairment?Screening refers to any type of structured or unstructured assessment.  Check all that apply or select None. (choice=Older patients (≥50 years))"
label(data$cog_screen_pt___88)="13.10 Which patients with HIV are routinely screened for cognitive impairment?Screening refers to any type of structured or unstructured assessment.  Check all that apply or select None. (choice=Other types of patients (specify) {cog_screen_pt_oth})"
label(data$cog_screen_pt_oth)="13.10a If other, specify"
label(data$cog_screen_tools___77)="13.11 Which structured instrument(s) are used at this health facility to screen patients for cognitive impairment?Check all that apply or select None. (choice=None (no structured cognitive impairment screening tool used))"
label(data$cog_screen_tools___1)="13.11 Which structured instrument(s) are used at this health facility to screen patients for cognitive impairment?Check all that apply or select None. (choice=Montreal Cognitive Assessment (MoCA))"
label(data$cog_screen_tools___2)="13.11 Which structured instrument(s) are used at this health facility to screen patients for cognitive impairment?Check all that apply or select None. (choice=HIV dementia scale)"
label(data$cog_screen_tools___88)="13.11 Which structured instrument(s) are used at this health facility to screen patients for cognitive impairment?Check all that apply or select None. (choice=Other (specify) {cog_screen_tools_oth})"
label(data$cog_screen_tools_oth)="13.11a If other, specify"
label(data$si_screen_pt___77)="13.12 Which patients with HIV are routinely screened for suicidal ideation or behavior?Screening refers to any type of structured or unstructured assessment.  Check all that apply or select None. (choice=None (no patients are screened for suicidal ideation or behavior))"
label(data$si_screen_pt___1)="13.12 Which patients with HIV are routinely screened for suicidal ideation or behavior?Screening refers to any type of structured or unstructured assessment.  Check all that apply or select None. (choice=All patients)"
label(data$si_screen_pt___2)="13.12 Which patients with HIV are routinely screened for suicidal ideation or behavior?Screening refers to any type of structured or unstructured assessment.  Check all that apply or select None. (choice=Patients presenting with symptoms of mental disorders)"
label(data$si_screen_pt___6)="13.12 Which patients with HIV are routinely screened for suicidal ideation or behavior?Screening refers to any type of structured or unstructured assessment.  Check all that apply or select None. (choice=Patients presenting with suicidal ideation)"
label(data$si_screen_pt___7)="13.12 Which patients with HIV are routinely screened for suicidal ideation or behavior?Screening refers to any type of structured or unstructured assessment.  Check all that apply or select None. (choice=Patients with past suicide attempts)"
label(data$si_screen_pt___3)="13.12 Which patients with HIV are routinely screened for suicidal ideation or behavior?Screening refers to any type of structured or unstructured assessment.  Check all that apply or select None. (choice=Patients with therapeutic failure)"
label(data$si_screen_pt___4)="13.12 Which patients with HIV are routinely screened for suicidal ideation or behavior?Screening refers to any type of structured or unstructured assessment.  Check all that apply or select None. (choice=Patients with poor adherence to ART)"
label(data$si_screen_pt___5)="13.12 Which patients with HIV are routinely screened for suicidal ideation or behavior?Screening refers to any type of structured or unstructured assessment.  Check all that apply or select None. (choice=Older patients (≥50 years))"
label(data$si_screen_pt___88)="13.12 Which patients with HIV are routinely screened for suicidal ideation or behavior?Screening refers to any type of structured or unstructured assessment.  Check all that apply or select None. (choice=Other types of patients (specify) {si_screen_pt_oth})"
label(data$si_screen_pt_oth)="13.12a If other, specify"
label(data$si_screen_tools___77)="13.13 Which structured instrument(s) are used at this health facility to screen patients for suicidal ideation or behavior?Check all that apply or select None.  (choice=None (no screening for suicidal ideation or behavior))"
label(data$si_screen_tools___1)="13.13 Which structured instrument(s) are used at this health facility to screen patients for suicidal ideation or behavior?Check all that apply or select None.  (choice=Columbia Suicide Severity Rating Scale (C-SSRS))"
label(data$si_screen_tools___88)="13.13 Which structured instrument(s) are used at this health facility to screen patients for suicidal ideation or behavior?Check all that apply or select None.  (choice=Other (specify) {si_screen_tools_oth})"
label(data$si_screen_tools_oth)="13.13a If other, specify"
label(data$protocol_suicide)="13.14 Is there a standard safety protocol at this health facility for responding to patients with suicidal ideation or behavior? "
label(data$ipv_screen_pt___77)="14.1 Which patients with HIV are routinely screened for exposure to IPV? IPV refers to behavior from a current or former intimate partner or spouse, causing physical, sexual, or psychological harm, including acts of physical aggression, psychological coercion, and controlling behaviors.  Screening refers to any type of structured or unstructured assessment.  Check all that apply (choice=None (no patients screened for IPV at this facility))"
label(data$ipv_screen_pt___9)="14.1 Which patients with HIV are routinely screened for exposure to IPV? IPV refers to behavior from a current or former intimate partner or spouse, causing physical, sexual, or psychological harm, including acts of physical aggression, psychological coercion, and controlling behaviors.  Screening refers to any type of structured or unstructured assessment.  Check all that apply (choice=All patients)"
label(data$ipv_screen_pt___1)="14.1 Which patients with HIV are routinely screened for exposure to IPV? IPV refers to behavior from a current or former intimate partner or spouse, causing physical, sexual, or psychological harm, including acts of physical aggression, psychological coercion, and controlling behaviors.  Screening refers to any type of structured or unstructured assessment.  Check all that apply (choice=All women, including transgender women)"
label(data$ipv_screen_pt___2)="14.1 Which patients with HIV are routinely screened for exposure to IPV? IPV refers to behavior from a current or former intimate partner or spouse, causing physical, sexual, or psychological harm, including acts of physical aggression, psychological coercion, and controlling behaviors.  Screening refers to any type of structured or unstructured assessment.  Check all that apply (choice=All patients who are pregnant or post-partum)"
label(data$ipv_screen_pt___3)="14.1 Which patients with HIV are routinely screened for exposure to IPV? IPV refers to behavior from a current or former intimate partner or spouse, causing physical, sexual, or psychological harm, including acts of physical aggression, psychological coercion, and controlling behaviors.  Screening refers to any type of structured or unstructured assessment.  Check all that apply (choice=Patients who are LGBTQ+ / having sexual or gender minority status)"
label(data$ipv_screen_pt___4)="14.1 Which patients with HIV are routinely screened for exposure to IPV? IPV refers to behavior from a current or former intimate partner or spouse, causing physical, sexual, or psychological harm, including acts of physical aggression, psychological coercion, and controlling behaviors.  Screening refers to any type of structured or unstructured assessment.  Check all that apply (choice=Patients with incomplete adherence to ART)"
label(data$ipv_screen_pt___88)="14.1 Which patients with HIV are routinely screened for exposure to IPV? IPV refers to behavior from a current or former intimate partner or spouse, causing physical, sexual, or psychological harm, including acts of physical aggression, psychological coercion, and controlling behaviors.  Screening refers to any type of structured or unstructured assessment.  Check all that apply (choice=Other types of patients {ipv_screen_pt_oth})"
label(data$ipv_screen_pt_oth)="14.1a If other, specify"
label(data$sv_screen_pt___77)="14.2 Which patients with HIV are routinely screened for exposure to sexual violence?  Sexual violence-inflicted by a partner or non-partner-includes sexual harassment, coercion, and assault.  Screening refers to any type of structured or unstructured assessment.  Check all that apply or select None. (choice=None (no patients screened for sexual violence at this facility))"
label(data$sv_screen_pt___9)="14.2 Which patients with HIV are routinely screened for exposure to sexual violence?  Sexual violence-inflicted by a partner or non-partner-includes sexual harassment, coercion, and assault.  Screening refers to any type of structured or unstructured assessment.  Check all that apply or select None. (choice=All patients)"
label(data$sv_screen_pt___1)="14.2 Which patients with HIV are routinely screened for exposure to sexual violence?  Sexual violence-inflicted by a partner or non-partner-includes sexual harassment, coercion, and assault.  Screening refers to any type of structured or unstructured assessment.  Check all that apply or select None. (choice=All women, including transgender women)"
label(data$sv_screen_pt___2)="14.2 Which patients with HIV are routinely screened for exposure to sexual violence?  Sexual violence-inflicted by a partner or non-partner-includes sexual harassment, coercion, and assault.  Screening refers to any type of structured or unstructured assessment.  Check all that apply or select None. (choice=All patients who are pregnant or post-partum)"
label(data$sv_screen_pt___3)="14.2 Which patients with HIV are routinely screened for exposure to sexual violence?  Sexual violence-inflicted by a partner or non-partner-includes sexual harassment, coercion, and assault.  Screening refers to any type of structured or unstructured assessment.  Check all that apply or select None. (choice=Patients who are LGBTQ+ / having sexual or gender minority status)"
label(data$sv_screen_pt___4)="14.2 Which patients with HIV are routinely screened for exposure to sexual violence?  Sexual violence-inflicted by a partner or non-partner-includes sexual harassment, coercion, and assault.  Screening refers to any type of structured or unstructured assessment.  Check all that apply or select None. (choice=Patients with incomplete adherence to ART)"
label(data$sv_screen_pt___88)="14.2 Which patients with HIV are routinely screened for exposure to sexual violence?  Sexual violence-inflicted by a partner or non-partner-includes sexual harassment, coercion, and assault.  Screening refers to any type of structured or unstructured assessment.  Check all that apply or select None. (choice=Other types of patients {sv_screen_pt_oth})"
label(data$sv_screen_pt_oth)="14.2a If other, specify"
label(data$ipv_sv_support___77)="14.3 For patients with identified exposure to IPV and/or sexual violence, what dedicated support services are available, either within the health facility or via linkage to community-based organizations?Check all that apply or select None. (choice=None (no dedicated IPV/sexual violence-related support services available))"
label(data$ipv_sv_support___1)="14.3 For patients with identified exposure to IPV and/or sexual violence, what dedicated support services are available, either within the health facility or via linkage to community-based organizations?Check all that apply or select None. (choice=Safety planning (making individualized plans to increase safety and support))"
label(data$ipv_sv_support___2)="14.3 For patients with identified exposure to IPV and/or sexual violence, what dedicated support services are available, either within the health facility or via linkage to community-based organizations?Check all that apply or select None. (choice=Social services)"
label(data$ipv_sv_support___3)="14.3 For patients with identified exposure to IPV and/or sexual violence, what dedicated support services are available, either within the health facility or via linkage to community-based organizations?Check all that apply or select None. (choice=Safe shelter)"
label(data$ipv_sv_support___4)="14.3 For patients with identified exposure to IPV and/or sexual violence, what dedicated support services are available, either within the health facility or via linkage to community-based organizations?Check all that apply or select None. (choice=Housing)"
label(data$ipv_sv_support___5)="14.3 For patients with identified exposure to IPV and/or sexual violence, what dedicated support services are available, either within the health facility or via linkage to community-based organizations?Check all that apply or select None. (choice=Legal aid)"
label(data$ipv_sv_support___6)="14.3 For patients with identified exposure to IPV and/or sexual violence, what dedicated support services are available, either within the health facility or via linkage to community-based organizations?Check all that apply or select None. (choice=Financial (including economic empowerment or microfinance))"
label(data$ipv_sv_support___88)="14.3 For patients with identified exposure to IPV and/or sexual violence, what dedicated support services are available, either within the health facility or via linkage to community-based organizations?Check all that apply or select None. (choice=Other (specify){ipv_sv_support_oth})"
label(data$ipv_sv_support___99)="14.3 For patients with identified exposure to IPV and/or sexual violence, what dedicated support services are available, either within the health facility or via linkage to community-based organizations?Check all that apply or select None. (choice=Do not know)"
label(data$ipv_sv_support_oth)="14.3a If other, specify"
label(data$ipv_sv_counseling___77)="14.4 For patients with identified exposure to IPV and/or sexual violence, what dedicated counseling or support groups are available, either within the health facility or via linkage to community-based organizations?Check all that apply or select None. (choice=None (no dedicated IPV/sexual violence-related counseling or support groups))"
label(data$ipv_sv_counseling___1)="14.4 For patients with identified exposure to IPV and/or sexual violence, what dedicated counseling or support groups are available, either within the health facility or via linkage to community-based organizations?Check all that apply or select None. (choice=Individual counseling)"
label(data$ipv_sv_counseling___2)="14.4 For patients with identified exposure to IPV and/or sexual violence, what dedicated counseling or support groups are available, either within the health facility or via linkage to community-based organizations?Check all that apply or select None. (choice=Counseling for partners / couples)"
label(data$ipv_sv_counseling___3)="14.4 For patients with identified exposure to IPV and/or sexual violence, what dedicated counseling or support groups are available, either within the health facility or via linkage to community-based organizations?Check all that apply or select None. (choice=Family counseling (adults and children))"
label(data$ipv_sv_counseling___4)="14.4 For patients with identified exposure to IPV and/or sexual violence, what dedicated counseling or support groups are available, either within the health facility or via linkage to community-based organizations?Check all that apply or select None. (choice=Peer counselor)"
label(data$ipv_sv_counseling___5)="14.4 For patients with identified exposure to IPV and/or sexual violence, what dedicated counseling or support groups are available, either within the health facility or via linkage to community-based organizations?Check all that apply or select None. (choice=Support groups)"
label(data$ipv_sv_counseling___88)="14.4 For patients with identified exposure to IPV and/or sexual violence, what dedicated counseling or support groups are available, either within the health facility or via linkage to community-based organizations?Check all that apply or select None. (choice=Other (specify) {ipv_sv_couns_oth})"
label(data$ipv_sv_counseling___99)="14.4 For patients with identified exposure to IPV and/or sexual violence, what dedicated counseling or support groups are available, either within the health facility or via linkage to community-based organizations?Check all that apply or select None. (choice=Do not know)"
label(data$ipv_sv_couns_oth)="14.4a If Other, specify"
label(data$stdrd_ipv)="14.5a Structured / standardized screening tool to address IPV "
label(data$stdrd_sv)="14.5a2 Structured / standardized screening tool to address sv "
label(data$space_ipv)="14.5b Procedures and space to ensure privacy / confidentiality to address IPV "
label(data$space_sv)="14.5b2 Procedures and space to ensure privacy / confidentiality to address sv "
label(data$protocol_ipv)="14.5c Standard protocol for immediate response to address IPV "
label(data$protocol_sv)="14.5c2 Standard protocol for immediate response to address sv "
label(data$educ_ipv)="14.5d Educational information for all patients to address IPV "
label(data$educ_sv)="14.5d2 Educational information for all patients to address sv "
label(data$oth_ipv)="14.5e Other to address IPV "
label(data$oth_ipv_sp)="14.5e1 Other IPV, specify"
label(data$oth_sv)="14.5e2 Other to address SV"
label(data$oth_sv_sp)="14.5e2a Other SV, specify If not applicable, select No."
label(data$cervical_screen)="15.1a.	Cervical cancer screening by visual inspection"
label(data$cervical_screen_pap)="15.1b.	Cervical cancer screening by Pap smear"
label(data$hpv_molecular)="15.1c.	Molecular cervical HPV testing (self-collected or provider-collected swab)"
label(data$anal_pap)="15.1d.	Anal pap test"
label(data$hr_anoscopy)="15.1e.	High-resolution anoscopy"
label(data$liver_ultrasound)="15.1f.	Ultrasound for liver disease management and liver cancer screening"
label(data$liver_screen_oth)="15.1g.	Other liver cancer screening tests (such as CT scan or serum alpha fetal protein measurements)"
label(data$breast_exam)="15.1h.	Breast exam by provider"
label(data$breast_mammogram)="15.1i.	Breast mammography or ultrasound"
label(data$colon_screen)="15.1j.	Colon cancer screening (such as fecal occult blood tests or colonoscopy)"
label(data$lung_screen)="15.1k.	Lung cancer screening (such as x-ray or CT scan)"
label(data$prostate_screen)="15.1l.	Prostate cancer screening by laboratory test"
label(data$cervical_routine___1)="15.2a. Cervical cancer (choice=Male sex at birth)"
label(data$cervical_routine___2)="15.2a. Cervical cancer (choice=Female sex at birth)"
label(data$cervical_routine___3)="15.2a. Cervical cancer (choice=Patients in specific age groups)"
label(data$cervical_routine___4)="15.2a. Cervical cancer (choice=Patients with specific risk factors)"
label(data$cervical_routine___88)="15.2a. Cervical cancer (choice=Other patient support)"
label(data$cervical_routine___77)="15.2a. Cervical cancer (choice=None / no patients routinely screened)"
label(data$anal_routine___1)="15.2b. Anal cancer (choice=Male sex at birth)"
label(data$anal_routine___2)="15.2b. Anal cancer (choice=Female sex at birth)"
label(data$anal_routine___3)="15.2b. Anal cancer (choice=Patients in specific age groups)"
label(data$anal_routine___4)="15.2b. Anal cancer (choice=Patients with specific risk factors)"
label(data$anal_routine___88)="15.2b. Anal cancer (choice=Other patient support)"
label(data$anal_routine___77)="15.2b. Anal cancer (choice=None / no patients routinely screened)"
label(data$liver_routine___1)="15.2c. Liver cancer (choice=Male sex at birth)"
label(data$liver_routine___2)="15.2c. Liver cancer (choice=Female sex at birth)"
label(data$liver_routine___3)="15.2c. Liver cancer (choice=Patients in specific age groups)"
label(data$liver_routine___4)="15.2c. Liver cancer (choice=Patients with specific risk factors)"
label(data$liver_routine___88)="15.2c. Liver cancer (choice=Other patient support)"
label(data$liver_routine___77)="15.2c. Liver cancer (choice=None / no patients routinely screened)"
label(data$breast_routine___1)="15.2d. Breast cancer (choice=Male sex at birth)"
label(data$breast_routine___2)="15.2d. Breast cancer (choice=Female sex at birth)"
label(data$breast_routine___3)="15.2d. Breast cancer (choice=Patients in specific age groups)"
label(data$breast_routine___4)="15.2d. Breast cancer (choice=Patients with specific risk factors)"
label(data$breast_routine___88)="15.2d. Breast cancer (choice=Other patient support)"
label(data$breast_routine___77)="15.2d. Breast cancer (choice=None / no patients routinely screened)"
label(data$colon_routine___1)="15.2e. Colon cancer (choice=Male sex at birth)"
label(data$colon_routine___2)="15.2e. Colon cancer (choice=Female sex at birth)"
label(data$colon_routine___3)="15.2e. Colon cancer (choice=Patients in specific age groups)"
label(data$colon_routine___4)="15.2e. Colon cancer (choice=Patients with specific risk factors)"
label(data$colon_routine___88)="15.2e. Colon cancer (choice=Other patient support)"
label(data$colon_routine___77)="15.2e. Colon cancer (choice=None / no patients routinely screened)"
label(data$lung_routine___1)="15.2f. Lung cancer (choice=Male sex at birth)"
label(data$lung_routine___2)="15.2f. Lung cancer (choice=Female sex at birth)"
label(data$lung_routine___3)="15.2f. Lung cancer (choice=Patients in specific age groups)"
label(data$lung_routine___4)="15.2f. Lung cancer (choice=Patients with specific risk factors)"
label(data$lung_routine___88)="15.2f. Lung cancer (choice=Other patient support)"
label(data$lung_routine___77)="15.2f. Lung cancer (choice=None / no patients routinely screened)"
label(data$prostate_routine___1)="15.2g. Prostate cancer (choice=Male sex at birth)"
label(data$prostate_routine___2)="15.2g. Prostate cancer (choice=Female sex at birth)"
label(data$prostate_routine___3)="15.2g. Prostate cancer (choice=Patients in specific age groups)"
label(data$prostate_routine___4)="15.2g. Prostate cancer (choice=Patients with specific risk factors)"
label(data$prostate_routine___88)="15.2g. Prostate cancer (choice=Other patient support)"
label(data$prostate_routine___77)="15.2g. Prostate cancer (choice=None / no patients routinely screened)"
label(data$cervical_brrier___1)="15.3a. Cervical cancer (choice=Lack of trained staff to perform screening)"
label(data$cervical_brrier___2)="15.3a. Cervical cancer (choice=Lack of equipment to perform screening)"
label(data$cervical_brrier___3)="15.3a. Cervical cancer (choice=Lack of standardized or national screening guidelines to inform clinic policy)"
label(data$cervical_brrier___88)="15.3a. Cervical cancer (choice=Other)"
label(data$cervical_brrier___77)="15.3a. Cervical cancer (choice=None / no barriers for screening)"
label(data$anal_barrier___1)="15.3b. Anal cancer (choice=Lack of trained staff to perform screening)"
label(data$anal_barrier___2)="15.3b. Anal cancer (choice=Lack of equipment to perform screening)"
label(data$anal_barrier___3)="15.3b. Anal cancer (choice=Lack of standardized or national screening guidelines to inform clinic policy)"
label(data$anal_barrier___88)="15.3b. Anal cancer (choice=Other)"
label(data$anal_barrier___77)="15.3b. Anal cancer (choice=None / no barriers for screening)"
label(data$liver_barrier___1)="15.3c. Liver cancer (choice=Lack of trained staff to perform screening)"
label(data$liver_barrier___2)="15.3c. Liver cancer (choice=Lack of equipment to perform screening)"
label(data$liver_barrier___3)="15.3c. Liver cancer (choice=Lack of standardized or national screening guidelines to inform clinic policy)"
label(data$liver_barrier___88)="15.3c. Liver cancer (choice=Other)"
label(data$liver_barrier___77)="15.3c. Liver cancer (choice=None / no barriers for screening)"
label(data$breast_barrier___1)="15.3d. Breast cancer (choice=Lack of trained staff to perform screening)"
label(data$breast_barrier___2)="15.3d. Breast cancer (choice=Lack of equipment to perform screening)"
label(data$breast_barrier___3)="15.3d. Breast cancer (choice=Lack of standardized or national screening guidelines to inform clinic policy)"
label(data$breast_barrier___88)="15.3d. Breast cancer (choice=Other)"
label(data$breast_barrier___77)="15.3d. Breast cancer (choice=None / no barriers for screening)"
label(data$colon_barrier___1)="15.3e. Colon cancer (choice=Lack of trained staff to perform screening)"
label(data$colon_barrier___2)="15.3e. Colon cancer (choice=Lack of equipment to perform screening)"
label(data$colon_barrier___3)="15.3e. Colon cancer (choice=Lack of standardized or national screening guidelines to inform clinic policy)"
label(data$colon_barrier___88)="15.3e. Colon cancer (choice=Other)"
label(data$colon_barrier___77)="15.3e. Colon cancer (choice=None / no barriers for screening)"
label(data$lung_barrier___1)="15.3f. Lung cancer (choice=Lack of trained staff to perform screening)"
label(data$lung_barrier___2)="15.3f. Lung cancer (choice=Lack of equipment to perform screening)"
label(data$lung_barrier___3)="15.3f. Lung cancer (choice=Lack of standardized or national screening guidelines to inform clinic policy)"
label(data$lung_barrier___88)="15.3f. Lung cancer (choice=Other)"
label(data$lung_barrier___77)="15.3f. Lung cancer (choice=None / no barriers for screening)"
label(data$prostate_barrier___1)="15.3g. Prostate cancer (choice=Lack of trained staff to perform screening)"
label(data$prostate_barrier___2)="15.3g. Prostate cancer (choice=Lack of equipment to perform screening)"
label(data$prostate_barrier___3)="15.3g. Prostate cancer (choice=Lack of standardized or national screening guidelines to inform clinic policy)"
label(data$prostate_barrier___88)="15.3g. Prostate cancer (choice=Other)"
label(data$prostate_barrier___77)="15.3g. Prostate cancer (choice=None / no barriers for screening)"
label(data$older_screen___77)="16.1 Which of the screenings are regularly performed during follow-up visits for enrolled older patients WITH hiv? Check all that apply or select None. (choice=None)"
label(data$older_screen___1)="16.1 Which of the screenings are regularly performed during follow-up visits for enrolled older patients WITH hiv? Check all that apply or select None. (choice=Frailty using phenotype (e.g., Fried Frailty, or assessment of physical dimensions of frailty))"
label(data$older_screen___2)="16.1 Which of the screenings are regularly performed during follow-up visits for enrolled older patients WITH hiv? Check all that apply or select None. (choice=Frailty using index of deficits or disabilities (e.g., Frailty Index of Accumulated Deficits [FI-CD], Frailty index derived from comprehensive geriatric assessment [FI-CGA] or VACS Index))"
label(data$older_screen___3)="16.1 Which of the screenings are regularly performed during follow-up visits for enrolled older patients WITH hiv? Check all that apply or select None. (choice=Frailty using Frail Scale (e.g., Clinical Frailty Scale [CFS], Edmonton Frail Scale [EFS] or other frailty scale))"
label(data$older_screen___4)="16.1 Which of the screenings are regularly performed during follow-up visits for enrolled older patients WITH hiv? Check all that apply or select None. (choice=Frailty with other screening, specify {older_screen_oth})"
label(data$older_screen___5)="16.1 Which of the screenings are regularly performed during follow-up visits for enrolled older patients WITH hiv? Check all that apply or select None. (choice=Urinary incontinence in older people (≥50 years old))"
label(data$older_screen___6)="16.1 Which of the screenings are regularly performed during follow-up visits for enrolled older patients WITH hiv? Check all that apply or select None. (choice=Fall risk in older people (≥50 years old))"
label(data$older_screen_oth)="16.1a Other frailty screening (specify)"
label(data$older_polypharmacy___77)="16.2 Which of the following practices are routinely used to evaluate polypharmacy in older patients with HIV? Polypharmacy is the use of multiple drugs to treat diseases and other health conditions.Check all that apply or select None. (choice=None (no evaluation of polypharmacy in older patients))"
label(data$older_polypharmacy___1)="16.2 Which of the following practices are routinely used to evaluate polypharmacy in older patients with HIV? Polypharmacy is the use of multiple drugs to treat diseases and other health conditions.Check all that apply or select None. (choice=Asking if patient has used more than 5 pills daily (both ART and non-ART) for 4 months or more)"
label(data$older_polypharmacy___2)="16.2 Which of the following practices are routinely used to evaluate polypharmacy in older patients with HIV? Polypharmacy is the use of multiple drugs to treat diseases and other health conditions.Check all that apply or select None. (choice=Using an electronic tool to evaluate potential interactions between medications)"
label(data$older_polypharmacy___3)="16.2 Which of the following practices are routinely used to evaluate polypharmacy in older patients with HIV? Polypharmacy is the use of multiple drugs to treat diseases and other health conditions.Check all that apply or select None. (choice=Using a pill card for the patient)"
label(data$older_polypharmacy___4)="16.2 Which of the following practices are routinely used to evaluate polypharmacy in older patients with HIV? Polypharmacy is the use of multiple drugs to treat diseases and other health conditions.Check all that apply or select None. (choice=Reconciliation of medication lists with patients during routine care)"
label(data$older_polypharmacy___88)="16.2 Which of the following practices are routinely used to evaluate polypharmacy in older patients with HIV? Polypharmacy is the use of multiple drugs to treat diseases and other health conditions.Check all that apply or select None. (choice=Other, specify {older_polypharmacy_oth})"
label(data$older_polypharmacy_oth)="16.2a If other, specify"
label(data$older_capacity___77)="16.3 Which of the following are routinely used at this health facility to evaluate vision and hearing capacity in older patients with HIV? Check all that apply or select None. (choice=None (no capacity to evaluate patient vision or hearing))"
label(data$older_capacity___1)="16.3 Which of the following are routinely used at this health facility to evaluate vision and hearing capacity in older patients with HIV? Check all that apply or select None. (choice=Asking about problems with vision (e.g., difficulty seeing far, reading, eye diseases))"
label(data$older_capacity___2)="16.3 Which of the following are routinely used at this health facility to evaluate vision and hearing capacity in older patients with HIV? Check all that apply or select None. (choice=WHO simple eye chart)"
label(data$older_capacity___3)="16.3 Which of the following are routinely used at this health facility to evaluate vision and hearing capacity in older patients with HIV? Check all that apply or select None. (choice=Audiological examination)"
label(data$older_capacity___4)="16.3 Which of the following are routinely used at this health facility to evaluate vision and hearing capacity in older patients with HIV? Check all that apply or select None. (choice=Otoscopic examination)"
label(data$older_capacity___5)="16.3 Which of the following are routinely used at this health facility to evaluate vision and hearing capacity in older patients with HIV? Check all that apply or select None. (choice=Whispered voice test)"
label(data$older_capacity___88)="16.3 Which of the following are routinely used at this health facility to evaluate vision and hearing capacity in older patients with HIV? Check all that apply or select None. (choice=Other (specify) {older_capacity_oth})"
label(data$older_capacity_oth)="16.3a If other, specify"
label(data$older_serv_pfmt)="16.4a.	Pelvic floor muscle training (PFMT), alone or combined with bladder control strategies among people with urinary incontinence"
label(data$older_serv_occ)="16.4b.	Physical/Occupational therapy or multimodal exercise (progressive strength resistance training) to aid mobility, balance, flexibility and strength)"
label(data$older_serv_ophthalmol)="16.4c.	Ophthalmology services"
label(data$older_serv_optical)="16.4d.	Optical services (e.g., corrective glasses)"
label(data$older_serv_audio)="16.4e.	Audiology examination services"
label(data$older_serv_audio_dev)="16.4f.	Audiology devices (e.g., Hearing aids)"
label(data$older_serv_diet_couns)="16.4g.	Dietary/nutritional counselling"
label(data$older_serv_diet_supp)="16.4h.	Oral nutrition supplements"
label(data$older_serv_mobility)="16.4i.	Assistive mobility devices (e.g., walkers, canes, non-slip shoes)"
label(data$older_malnutrition___77)="16.5 Which of the following practices or tests are routinely used to assess malnutritional status in older patients with HIV?Check all that apply or select None. (choice=None (no assessment of nutritional status in older patients)"
label(data$older_malnutrition___1)="16.5 Which of the following practices or tests are routinely used to assess malnutritional status in older patients with HIV?Check all that apply or select None. (choice=Ask about weight loss (>3 kg) in last 3 months and/or loss of appetite)"
label(data$older_malnutrition___2)="16.5 Which of the following practices or tests are routinely used to assess malnutritional status in older patients with HIV?Check all that apply or select None. (choice=Mini Nutritional Assessment)"
label(data$older_malnutrition___3)="16.5 Which of the following practices or tests are routinely used to assess malnutritional status in older patients with HIV?Check all that apply or select None. (choice=RNS-H (Rapid Nutrition Screening for HIV disease))"
label(data$older_malnutrition___4)="16.5 Which of the following practices or tests are routinely used to assess malnutritional status in older patients with HIV?Check all that apply or select None. (choice=Assessment of muscle mass and muscle strength)"
label(data$older_malnutrition___5)="16.5 Which of the following practices or tests are routinely used to assess malnutritional status in older patients with HIV?Check all that apply or select None. (choice=Food security scale (e.g., Food Insecurity Experience Scale [IES]; ELCSA))"
label(data$older_malnutrition___88)="16.5 Which of the following practices or tests are routinely used to assess malnutritional status in older patients with HIV?Check all that apply or select None. (choice=Other, specify {older_malnutrition_oth})"
label(data$older_malnutrition_oth)="16.5a If other, specify"
label(data$older_mobility___77)="16.6 Which of the following tests are routinely used to evaluate mobility loss in older patients with HIV? Check all that apply or select None. (choice=None (no evaluation of mobility loss in older patients)"
label(data$older_mobility___1)="16.6 Which of the following tests are routinely used to evaluate mobility loss in older patients with HIV? Check all that apply or select None. (choice=Chair rise test (able to complete 5 chair rises without using arms in 14 seconds))"
label(data$older_mobility___2)="16.6 Which of the following tests are routinely used to evaluate mobility loss in older patients with HIV? Check all that apply or select None. (choice=Short physical performance battery (SPPB))"
label(data$older_mobility___3)="16.6 Which of the following tests are routinely used to evaluate mobility loss in older patients with HIV? Check all that apply or select None. (choice=Time and Up Go Test (time for patient to rise from a chair, walk 3 meters, turn, walk back, and sit down again))"
label(data$older_mobility___4)="16.6 Which of the following tests are routinely used to evaluate mobility loss in older patients with HIV? Check all that apply or select None. (choice=Gait speed test)"
label(data$older_mobility___5)="16.6 Which of the following tests are routinely used to evaluate mobility loss in older patients with HIV? Check all that apply or select None. (choice=Rosow-Breslau Scale)"
label(data$dermatologist_location)="17.1 How far away is the closest dermatologist (medical doctor with specialized training in dermatology) from this HIV clinic? Select one best response"
label(data$sd_clin_exam)="17.2a Clinical exam (visual inspection of skin or mucosal surfaces)"
label(data$sd_biopsy)="17.2b Skin punch biopsy"
label(data$sd_excision)="17.2c Surgical excision"
label(data$sd_scraping)="17.2d Skin scraping/Potassium hydroxide (KOH) prep to examine for fungi/yeast)"
label(data$sd_culture)="17.2e Culture (bacterial, viral, fungal, other)"
label(data$sd_other)="17.2f Other (please specify or select Not Available)"
label(data$sd_dx_oth)="17.2f1. If other, please specify"
label(data$sd_fee_clin_exam)="17.3a Clinical exam (visual inspection of skin or mucosal surfaces)"
label(data$sd_fee_biopsy)="17.3b Skin punch biopsy"
label(data$sd_fee_excision)="17.3c Surgical wedge/excision"
label(data$sd_fee_other)="17.3d Other (please specify or select Not Applicable)"
label(data$sd_fee_oth)="17.3d1. If Other, please specify"
label(data$language_chosen)="Language chosen"
label(data$status_general)="Status of 2023 Site Assessment Survey for this Site"
label(data$coordinator_notes)="Survey Coordinator Notes"
label(data$survey_status_complete)="Complete?"
#Setting Units


#Setting Factors(will create new variable for factors)
data$region.factor = factor(data$region,levels=c("AP","NA","CN","CA","EA","SA","WA"))
data$adultped.factor = factor(data$adultped,levels=c("ADULT","PED","BOTH"))
data$rural.factor = factor(data$rural,levels=c("1","2","3","4","9"))
data$level.factor = factor(data$level,levels=c("1","2","3","9"))
data$country.factor = factor(data$country,levels=c("AFG","ALA","ALB","DZA","ASM","AND","AGO","AIA","ATA","ATG","ARG","ARM","ABW","AUS","AUT","AZE","BHS","BHR","BGD","BRB","BLR","BEL","BLZ","BEN","BMU","BTN","BOL","BES","BIH","BWA","BVT","BRA","IOT","BRN","BGR","BFA","BDI","CPV","KHM","CMR","CAN","CYM","CAF","TCD","CHL","CHN","CXR","CCK","COL","COM","COD","COG","COK","CRI","CIV","HRV","CUB","CUW","CYP","CZE","DNK","DJI","DMA","DOM","ECU","EGY","SLV","GNQ","ERI","EST","SWZ","ETH","FLK","FRO","FJI","FIN","FRA","GUF","PYF","ATF","GAB","GMB","GEO","DEU","GHA","GIB","GRC","GRL","GRD","GLP","GUM","GTM","GGY","GIN","GNB","GUY","HTI","HMD","VAT","HND","HKG","HUN","ISL","IND","IDN","IRN","IRQ","IRL","IMN","ISR","ITA","JAM","JPN","JEY","JOR","KAZ","KEN","KIR","PRK","KOR","KWT","KGZ","LAO","LVA","LBN","LSO","LBR","LBY","LIE","LTU","LUX","MAC","MKD","MDG","MWI","MYS","MDV","MLI","MLT","MHL","MTQ","MRT","MUS","MYT","MEX","FSM","MDA","MCO","MNG","MNE","MSR","MAR","MOZ","MMR","NAM","NRU","NPL","NLD","NCL","NZL","NIC","NER","NGA","NIU","NFK","MNP","NOR","OMN","PAK","PLW","PSE","PAN","PNG","PRY","PER","PHL","PCN","POL","PRT","PRI","QAT","REU","ROU","RUS","RWA","BLM","SHN","KNA","LCA","MAF","SPM","VCT","WSM","SMR","STP","SAU","SEN","SRB","SYC","SLE","SGP","SXM","SVK","SVN","SLB","SOM","ZAF","SGS","SSD","ESP","LKA","SDN","SUR","SJM","SWE","CHE","SYR","TWN","TJK","TZA","THA","TLS","TGO","TKL","TON","TTO","TUN","TUR","TKM","TCA","TUV","UGA","UKR","ARE","GBR","UMI","USA","URY","UZB","VUT","VEN","VNM","VGB","VIR","WLF","ESH","YEM","ZMB","ZWE"))
data$residence_setting.factor = factor(data$residence_setting,levels=c("2","3","5"))
data$pediatrician_0.factor = factor(data$pediatrician_0,levels=c("1","2","77"))
data$internist_0.factor = factor(data$internist_0,levels=c("1","2","77"))
data$id_specialist.factor = factor(data$id_specialist,levels=c("1","2","77"))
data$midlevel_prov_0.factor = factor(data$midlevel_prov_0,levels=c("1","2","77"))
data$adher_counselor.factor = factor(data$adher_counselor,levels=c("1","2","77"))
data$peer_educ.factor = factor(data$peer_educ,levels=c("1","2","77"))
data$outreach.factor = factor(data$outreach,levels=c("1","2","77"))
data$nutritionist.factor = factor(data$nutritionist,levels=c("1","2","77"))
data$geriatrician.factor = factor(data$geriatrician,levels=c("1","2","77"))
data$ophtalmologist.factor = factor(data$ophtalmologist,levels=c("1","2","77"))
data$audiologist.factor = factor(data$audiologist,levels=c("1","2","77"))
data$psychologist.factor = factor(data$psychologist,levels=c("1","2","77"))
data$psychiatrist.factor = factor(data$psychiatrist,levels=c("1","2","77"))
data$occ_therapist.factor = factor(data$occ_therapist,levels=c("1","2","77"))
data$dermatologist.factor = factor(data$dermatologist,levels=c("1","2","77"))
data$midlev_dermatologist.factor = factor(data$midlev_dermatologist,levels=c("1","2","77"))
data$ct_services.factor = factor(data$ct_services,levels=c("1","2","3"))
data$test_services_type2_b___1.factor = factor(data$test_services_type2_b___1,levels=c("0","1"))
data$test_services_type2_b___2.factor = factor(data$test_services_type2_b___2,levels=c("0","1"))
data$test_services_type2_b___3.factor = factor(data$test_services_type2_b___3,levels=c("0","1"))
data$test_services_type2_b___4.factor = factor(data$test_services_type2_b___4,levels=c("0","1"))
data$test_services_type2_b___7.factor = factor(data$test_services_type2_b___7,levels=c("0","1"))
data$test_services_type2_b___5.factor = factor(data$test_services_type2_b___5,levels=c("0","1"))
data$test_services_type2_b___6.factor = factor(data$test_services_type2_b___6,levels=c("0","1"))
data$test_services_type2_b___88.factor = factor(data$test_services_type2_b___88,levels=c("0","1"))
data$confirm_test_art.factor = factor(data$confirm_test_art,levels=c("1","0","77"))
data$confirm_dx_adults___1.factor = factor(data$confirm_dx_adults___1,levels=c("0","1"))
data$confirm_dx_adults___2.factor = factor(data$confirm_dx_adults___2,levels=c("0","1"))
data$confirm_dx_adults___88.factor = factor(data$confirm_dx_adults___88,levels=c("0","1"))
data$confirm_dx_infants___77.factor = factor(data$confirm_dx_infants___77,levels=c("0","1"))
data$confirm_dx_infants___1.factor = factor(data$confirm_dx_infants___1,levels=c("0","1"))
data$confirm_dx_infants___2.factor = factor(data$confirm_dx_infants___2,levels=c("0","1"))
data$confirm_dx_infants___88.factor = factor(data$confirm_dx_infants___88,levels=c("0","1"))
data$dx_services_infants.factor = factor(data$dx_services_infants,levels=c("1","2","77"))
data$same_day_poc_c.factor = factor(data$same_day_poc_c,levels=c("1","2","0"))
data$rpid_hivtest.factor = factor(data$rpid_hivtest,levels=c("1","2","3","77"))
data$hiv1_2_antigen.factor = factor(data$hiv1_2_antigen,levels=c("1","2","3","77"))
data$hiv_p24_antigen.factor = factor(data$hiv_p24_antigen,levels=c("1","2","3","77"))
data$hiv_nat.factor = factor(data$hiv_nat,levels=c("1","2","3","77"))
data$hiv1_2_antibody.factor = factor(data$hiv1_2_antibody,levels=c("1","2","3","77"))
data$entry_b___1.factor = factor(data$entry_b___1,levels=c("0","1"))
data$entry_b___23.factor = factor(data$entry_b___23,levels=c("0","1"))
data$entry_b___4.factor = factor(data$entry_b___4,levels=c("0","1"))
data$entry_b___5.factor = factor(data$entry_b___5,levels=c("0","1"))
data$entry_b___6.factor = factor(data$entry_b___6,levels=c("0","1"))
data$entry_b___8.factor = factor(data$entry_b___8,levels=c("0","1"))
data$entry_b___7.factor = factor(data$entry_b___7,levels=c("0","1"))
data$entry_b___88.factor = factor(data$entry_b___88,levels=c("0","1"))
data$services_type_3_b___77.factor = factor(data$services_type_3_b___77,levels=c("0","1"))
data$services_type_3_b___12.factor = factor(data$services_type_3_b___12,levels=c("0","1"))
data$services_type_3_b___3.factor = factor(data$services_type_3_b___3,levels=c("0","1"))
data$services_type_3_b___4.factor = factor(data$services_type_3_b___4,levels=c("0","1"))
data$services_type_3_b___5.factor = factor(data$services_type_3_b___5,levels=c("0","1"))
data$services_type_3_b___88.factor = factor(data$services_type_3_b___88,levels=c("0","1"))
data$screening_enrollment___77.factor = factor(data$screening_enrollment___77,levels=c("0","1"))
data$screening_enrollment___1.factor = factor(data$screening_enrollment___1,levels=c("0","1"))
data$screening_enrollment___2.factor = factor(data$screening_enrollment___2,levels=c("0","1"))
data$screening_enrollment___3.factor = factor(data$screening_enrollment___3,levels=c("0","1"))
data$screening_enrollment___4.factor = factor(data$screening_enrollment___4,levels=c("0","1"))
data$screening_enrollment___5.factor = factor(data$screening_enrollment___5,levels=c("0","1"))
data$screening_enrollment___8.factor = factor(data$screening_enrollment___8,levels=c("0","1"))
data$screening_enrollment___9.factor = factor(data$screening_enrollment___9,levels=c("0","1"))
data$screening_enrollment___10.factor = factor(data$screening_enrollment___10,levels=c("0","1"))
data$screening_enrollment___11.factor = factor(data$screening_enrollment___11,levels=c("0","1"))
data$screening_enrollment___12.factor = factor(data$screening_enrollment___12,levels=c("0","1"))
data$screening_enrollment___13.factor = factor(data$screening_enrollment___13,levels=c("0","1"))
data$screening_enrollment___14.factor = factor(data$screening_enrollment___14,levels=c("0","1"))
data$screening_enrollment___15.factor = factor(data$screening_enrollment___15,levels=c("0","1"))
data$cotrimoxazole_meds___77.factor = factor(data$cotrimoxazole_meds___77,levels=c("0","1"))
data$cotrimoxazole_meds___1.factor = factor(data$cotrimoxazole_meds___1,levels=c("0","1"))
data$cotrimoxazole_meds___2.factor = factor(data$cotrimoxazole_meds___2,levels=c("0","1"))
data$cotrimoxazole_meds___3.factor = factor(data$cotrimoxazole_meds___3,levels=c("0","1"))
data$cotrimoxazole_meds___4.factor = factor(data$cotrimoxazole_meds___4,levels=c("0","1"))
data$cotrimoxazole_meds___5.factor = factor(data$cotrimoxazole_meds___5,levels=c("0","1"))
data$cotrimoxazole_meds___6.factor = factor(data$cotrimoxazole_meds___6,levels=c("0","1"))
data$cotrimoxazole_meds___7.factor = factor(data$cotrimoxazole_meds___7,levels=c("0","1"))
data$cotrimoxazole_meds___88.factor = factor(data$cotrimoxazole_meds___88,levels=c("0","1"))
data$cd4_testing.factor = factor(data$cd4_testing,levels=c("1","0"))
data$cd4_testing_old.factor = factor(data$cd4_testing_old,levels=c("1","0"))
data$lab_cd4_b.factor = factor(data$lab_cd4_b,levels=c("1","23","77"))
data$sameday_cd4_b.factor = factor(data$sameday_cd4_b,levels=c("1","2","0"))
data$care_preart.factor = factor(data$care_preart,levels=c("1","0"))
data$art_time2_b.factor = factor(data$art_time2_b,levels=c("1","2","3","4","5"))
data$art_visits.factor = factor(data$art_visits,levels=c("1","2","3","4","5"))
data$poc_pcr_rna_b.factor = factor(data$poc_pcr_rna_b,levels=c("1","2","0"))
data$sms_retention_c___77.factor = factor(data$sms_retention_c___77,levels=c("0","1"))
data$sms_retention_c___5.factor = factor(data$sms_retention_c___5,levels=c("0","1"))
data$sms_retention_c___6.factor = factor(data$sms_retention_c___6,levels=c("0","1"))
data$sms_retention_c___3.factor = factor(data$sms_retention_c___3,levels=c("0","1"))
data$sms_retention_c___4.factor = factor(data$sms_retention_c___4,levels=c("0","1"))
data$freq_reminders.factor = factor(data$freq_reminders,levels=c("1","2","3","4","88"))
data$notstable_refil.factor = factor(data$notstable_refil,levels=c("1","2","3","88"))
data$stable_refil.factor = factor(data$stable_refil,levels=c("1","2","3","88"))
data$notstable_visits.factor = factor(data$notstable_visits,levels=c("1","2","3","88"))
data$stable_visits.factor = factor(data$stable_visits,levels=c("1","2","3","88"))
data$meds_art_b___77.factor = factor(data$meds_art_b___77,levels=c("0","1"))
data$meds_art_b___9.factor = factor(data$meds_art_b___9,levels=c("0","1"))
data$meds_art_b___10.factor = factor(data$meds_art_b___10,levels=c("0","1"))
data$meds_art_b___3.factor = factor(data$meds_art_b___3,levels=c("0","1"))
data$meds_art_b___5.factor = factor(data$meds_art_b___5,levels=c("0","1"))
data$meds_art_b___7.factor = factor(data$meds_art_b___7,levels=c("0","1"))
data$meds_art_b___88.factor = factor(data$meds_art_b___88,levels=c("0","1"))
data$adherence_self___77.factor = factor(data$adherence_self___77,levels=c("0","1"))
data$adherence_self___1.factor = factor(data$adherence_self___1,levels=c("0","1"))
data$adherence_self___2.factor = factor(data$adherence_self___2,levels=c("0","1"))
data$adherence_self___3.factor = factor(data$adherence_self___3,levels=c("0","1"))
data$adherence_self___4.factor = factor(data$adherence_self___4,levels=c("0","1"))
data$adherence_self___5.factor = factor(data$adherence_self___5,levels=c("0","1"))
data$adherence_self___88.factor = factor(data$adherence_self___88,levels=c("0","1"))
data$adherence_freq.factor = factor(data$adherence_freq,levels=c("1","2","88"))
data$adherence_interv_pt___77.factor = factor(data$adherence_interv_pt___77,levels=c("0","1"))
data$adherence_interv_pt___1.factor = factor(data$adherence_interv_pt___1,levels=c("0","1"))
data$adherence_interv_pt___2.factor = factor(data$adherence_interv_pt___2,levels=c("0","1"))
data$adherence_interv_pt___3.factor = factor(data$adherence_interv_pt___3,levels=c("0","1"))
data$adherence_interv_pt___4.factor = factor(data$adherence_interv_pt___4,levels=c("0","1"))
data$adherence_interv_pt___5.factor = factor(data$adherence_interv_pt___5,levels=c("0","1"))
data$adherence_interv_pt___6.factor = factor(data$adherence_interv_pt___6,levels=c("0","1"))
data$adherence_interv_pt___88.factor = factor(data$adherence_interv_pt___88,levels=c("0","1"))
data$adh_educ.factor = factor(data$adh_educ,levels=c("77","1","2"))
data$adh_pillboxes.factor = factor(data$adh_pillboxes,levels=c("77","1","2"))
data$adh_vis_aids.factor = factor(data$adh_vis_aids,levels=c("77","1","2"))
data$adh_edevices.factor = factor(data$adh_edevices,levels=c("77","1","2"))
data$adh_reminder_oth.factor = factor(data$adh_reminder_oth,levels=c("77","1","2"))
data$oneon1_adh.factor = factor(data$oneon1_adh,levels=c("77","1","2"))
data$grou_adh.factor = factor(data$grou_adh,levels=c("77","1","2"))
data$peer_adh.factor = factor(data$peer_adh,levels=c("77","1","2"))
data$ref_peer_adh.factor = factor(data$ref_peer_adh,levels=c("77","1","2"))
data$facility_adh.factor = factor(data$facility_adh,levels=c("77","1","2"))
data$community_adh.factor = factor(data$community_adh,levels=c("77","1","2"))
data$repeatvl_adh.factor = factor(data$repeatvl_adh,levels=c("77","1","2"))
data$cbt_adh.factor = factor(data$cbt_adh,levels=c("77","1","2"))
data$cash_adh.factor = factor(data$cash_adh,levels=c("77","1","2"))
data$food_adh.factor = factor(data$food_adh,levels=c("77","1","2"))
data$supp_adh.factor = factor(data$supp_adh,levels=c("77","1","2"))
data$dot_adh.factor = factor(data$dot_adh,levels=c("77","1","2"))
data$oth_support_adh.factor = factor(data$oth_support_adh,levels=c("77","1","2"))
data$ltbi_screening.factor = factor(data$ltbi_screening,levels=c("1","2","3","77"))
data$sti_screening.factor = factor(data$sti_screening,levels=c("1","2","3","77"))
data$hbv_screening_b.factor = factor(data$hbv_screening_b,levels=c("1","2","3","77"))
data$hcv_screening_b.factor = factor(data$hcv_screening_b,levels=c("1","2","3","77"))
data$alc_screening.factor = factor(data$alc_screening,levels=c("1","2","3","77"))
data$sud_screening_b.factor = factor(data$sud_screening_b,levels=c("1","2","3","77"))
data$depression_screening.factor = factor(data$depression_screening,levels=c("1","2","3","77"))
data$anxiety_screening.factor = factor(data$anxiety_screening,levels=c("1","2","3","77"))
data$ptsd_screening.factor = factor(data$ptsd_screening,levels=c("1","2","3","77"))
data$cog_imp_screening.factor = factor(data$cog_imp_screening,levels=c("1","2","3","77"))
data$suic_id_screening.factor = factor(data$suic_id_screening,levels=c("1","2","3","77"))
data$counsel_disclosure_b.factor = factor(data$counsel_disclosure_b,levels=c("1","2","3","77"))
data$safesex_method_b.factor = factor(data$safesex_method_b,levels=c("1","2","3","77"))
data$family_plan_b.factor = factor(data$family_plan_b,levels=c("1","2","3","77"))
data$harm_reduction_b.factor = factor(data$harm_reduction_b,levels=c("1","2","3","77"))
data$pmtct.factor = factor(data$pmtct,levels=c("1","2","3","77"))
data$prov_condoms_b.factor = factor(data$prov_condoms_b,levels=c("1","2","3","77"))
data$male_circum_b.factor = factor(data$male_circum_b,levels=c("1","2","3","77"))
data$famplan_methods_b.factor = factor(data$famplan_methods_b,levels=c("1","2","3","77"))
data$tx_depression.factor = factor(data$tx_depression,levels=c("1","2","3","77"))
data$tx_ptsd.factor = factor(data$tx_ptsd,levels=c("1","2","3","77"))
data$tx_anxiety.factor = factor(data$tx_anxiety,levels=c("1","2","3","77"))
data$tx_alcohol.factor = factor(data$tx_alcohol,levels=c("1","2","3","77"))
data$tx_sud.factor = factor(data$tx_sud,levels=c("1","2","3","77"))
data$hpv_vacc_b.factor = factor(data$hpv_vacc_b,levels=c("1","2","3","77"))
data$pneumococcal_vacc.factor = factor(data$pneumococcal_vacc,levels=c("1","2","3","77"))
data$hepa_vacc.factor = factor(data$hepa_vacc,levels=c("1","2","3","77"))
data$hepb_vacc.factor = factor(data$hepb_vacc,levels=c("1","2","3","77"))
data$covid_vacc.factor = factor(data$covid_vacc,levels=c("1","2","3","77"))
data$quantitative_pcr_vl.factor = factor(data$quantitative_pcr_vl,levels=c("1","2","3","77"))
data$genotypic_dr_testing.factor = factor(data$genotypic_dr_testing,levels=c("1","2","3","77"))
data$hepv_b.factor = factor(data$hepv_b,levels=c("1","2","3","77"))
data$hepv_c.factor = factor(data$hepv_c,levels=c("1","2","3","77"))
data$helpc_b.factor = factor(data$helpc_b,levels=c("1","2","3","77"))
data$hepc_c.factor = factor(data$hepc_c,levels=c("1","2","3","77"))
data$syphilis.factor = factor(data$syphilis,levels=c("1","2","3","77"))
data$stis.factor = factor(data$stis,levels=c("1","2","3","77"))
data$crypto_antigen.factor = factor(data$crypto_antigen,levels=c("1","2","3","77"))
data$crypto_csfindia.factor = factor(data$crypto_csfindia,levels=c("1","2","3","77"))
data$routine_visits_b.factor = factor(data$routine_visits_b,levels=c("1","0","3","77"))
data$specialty_visits_b.factor = factor(data$specialty_visits_b,levels=c("1","0","3","77"))
data$first_line_art_b.factor = factor(data$first_line_art_b,levels=c("1","0","3","77"))
data$second_line_art_b.factor = factor(data$second_line_art_b,levels=c("1","0","3","77"))
data$oi_meds_b.factor = factor(data$oi_meds_b,levels=c("1","0","3","77"))
data$hepb_meds_b.factor = factor(data$hepb_meds_b,levels=c("1","0","3","77"))
data$hepc_meds_b.factor = factor(data$hepc_meds_b,levels=c("1","0","3","77"))
data$mh_tx_b.factor = factor(data$mh_tx_b,levels=c("1","0","3","77"))
data$psychiatric_meds_b.factor = factor(data$psychiatric_meds_b,levels=c("1","0","3","77"))
data$rapid_hivtest_b.factor = factor(data$rapid_hivtest_b,levels=c("1","0","3","77"))
data$hiv1_hiv2_test_b.factor = factor(data$hiv1_hiv2_test_b,levels=c("1","0","3","77"))
data$hiv1_p24_b.factor = factor(data$hiv1_p24_b,levels=c("1","0","3","77"))
data$cd4_test_b.factor = factor(data$cd4_test_b,levels=c("1","0","3","77"))
data$qual_pcr_eid_b.factor = factor(data$qual_pcr_eid_b,levels=c("1","0","3","77"))
data$quant_pcr_vl_b.factor = factor(data$quant_pcr_vl_b,levels=c("1","0","3","77"))
data$hiv1_dr_b.factor = factor(data$hiv1_dr_b,levels=c("1","0","3","77"))
data$hbv_test_b.factor = factor(data$hbv_test_b,levels=c("1","0","3","77"))
data$hcv_test_b.factor = factor(data$hcv_test_b,levels=c("1","0","3","77"))
data$pharmacy.factor = factor(data$pharmacy,levels=c("1","0"))
data$first_line_arv3.factor = factor(data$first_line_arv3,levels=c("1","0"))
data$first_line_arv_out3.factor = factor(data$first_line_arv_out3,levels=c("1","0"))
data$second_line_arv3.factor = factor(data$second_line_arv3,levels=c("1","0"))
data$second_line_arv_out3.factor = factor(data$second_line_arv_out3,levels=c("1","0"))
data$third_line_arv3.factor = factor(data$third_line_arv3,levels=c("1","0"))
data$third_line_arv_out3.factor = factor(data$third_line_arv_out3,levels=c("1","0"))
data$injectable_art.factor = factor(data$injectable_art,levels=c("1","0"))
data$injectable_art_out.factor = factor(data$injectable_art_out,levels=c("1","0"))
data$tbp_meds.factor = factor(data$tbp_meds,levels=c("1","0"))
data$tbp_meds_out.factor = factor(data$tbp_meds_out,levels=c("1","0"))
data$ds_tbmeds.factor = factor(data$ds_tbmeds,levels=c("1","0"))
data$ds_tbmeds_out.factor = factor(data$ds_tbmeds_out,levels=c("1","0"))
data$mdr_tbmeds.factor = factor(data$mdr_tbmeds,levels=c("1","0"))
data$mdr_tbmeds_out.factor = factor(data$mdr_tbmeds_out,levels=c("1","0"))
data$cotrimoxazole3.factor = factor(data$cotrimoxazole3,levels=c("1","0"))
data$cotrimoxazole_out3.factor = factor(data$cotrimoxazole_out3,levels=c("1","0"))
data$malaria_tx3.factor = factor(data$malaria_tx3,levels=c("1","0"))
data$malaria_tx_out3.factor = factor(data$malaria_tx_out3,levels=c("1","0"))
data$fluconazole3.factor = factor(data$fluconazole3,levels=c("1","0"))
data$fluconazole_out3.factor = factor(data$fluconazole_out3,levels=c("1","0"))
data$amphotericin3.factor = factor(data$amphotericin3,levels=c("1","0"))
data$amphotericin_out3.factor = factor(data$amphotericin_out3,levels=c("1","0"))
data$flucytosine3.factor = factor(data$flucytosine3,levels=c("1","0"))
data$flucytosine_out3.factor = factor(data$flucytosine_out3,levels=c("1","0"))
data$contraceptives_short3.factor = factor(data$contraceptives_short3,levels=c("1","0"))
data$contraceptives_short_out3.factor = factor(data$contraceptives_short_out3,levels=c("1","0"))
data$contraceptives_long3.factor = factor(data$contraceptives_long3,levels=c("1","0"))
data$contraceptives_long_out3.factor = factor(data$contraceptives_long_out3,levels=c("1","0"))
data$ssris3.factor = factor(data$ssris3,levels=c("1","0"))
data$ssris_out3.factor = factor(data$ssris_out3,levels=c("1","0"))
data$snris3.factor = factor(data$snris3,levels=c("1","0"))
data$snris_out3.factor = factor(data$snris_out3,levels=c("1","0"))
data$antidepressants3.factor = factor(data$antidepressants3,levels=c("1","0"))
data$antidepressants_out3.factor = factor(data$antidepressants_out3,levels=c("1","0"))
data$benzodiazepines3.factor = factor(data$benzodiazepines3,levels=c("1","0"))
data$benzodiazepines_out3.factor = factor(data$benzodiazepines_out3,levels=c("1","0"))
data$antipsychotics3.factor = factor(data$antipsychotics3,levels=c("1","0"))
data$antipsychotics_out3.factor = factor(data$antipsychotics_out3,levels=c("1","0"))
data$mood_stab3.factor = factor(data$mood_stab3,levels=c("1","0"))
data$mood_stab_out3.factor = factor(data$mood_stab_out3,levels=c("1","0"))
data$alc_meds3.factor = factor(data$alc_meds3,levels=c("1","0"))
data$alc_meds_out3.factor = factor(data$alc_meds_out3,levels=c("1","0"))
data$wait_list_b.factor = factor(data$wait_list_b,levels=c("1","0","3"))
data$prep.factor = factor(data$prep,levels=c("1","2","3","77"))
data$pep.factor = factor(data$pep,levels=c("1","2","3","77"))
data$prepmeds.factor = factor(data$prepmeds,levels=c("1","0"))
data$prepmeds_out.factor = factor(data$prepmeds_out,levels=c("1","0"))
data$lai_prepmeds.factor = factor(data$lai_prepmeds,levels=c("1","0"))
data$lai_prepmeds_out.factor = factor(data$lai_prepmeds_out,levels=c("1","0"))
data$pep_meds.factor = factor(data$pep_meds,levels=c("1","0"))
data$pep_meds_out.factor = factor(data$pep_meds_out,levels=c("1","0"))
data$missapp_art___77.factor = factor(data$missapp_art___77,levels=c("0","1"))
data$missapp_art___1.factor = factor(data$missapp_art___1,levels=c("0","1"))
data$missapp_art___2.factor = factor(data$missapp_art___2,levels=c("0","1"))
data$missapp_art___3.factor = factor(data$missapp_art___3,levels=c("0","1"))
data$missapp_art___4.factor = factor(data$missapp_art___4,levels=c("0","1"))
data$missapp_art___5.factor = factor(data$missapp_art___5,levels=c("0","1"))
data$missapp_art___6.factor = factor(data$missapp_art___6,levels=c("0","1"))
data$missapp_art___7.factor = factor(data$missapp_art___7,levels=c("0","1"))
data$missapp_art___88.factor = factor(data$missapp_art___88,levels=c("0","1"))
data$track_ltfu.factor = factor(data$track_ltfu,levels=c("1","0"))
data$track_ltfu_edms.factor = factor(data$track_ltfu_edms,levels=c("1","0"))
data$track_ltfu_info2___1.factor = factor(data$track_ltfu_info2___1,levels=c("0","1"))
data$track_ltfu_info2___1b.factor = factor(data$track_ltfu_info2___1b,levels=c("0","1"))
data$track_ltfu_info2___5.factor = factor(data$track_ltfu_info2___5,levels=c("0","1"))
data$track_ltfu_info2___88.factor = factor(data$track_ltfu_info2___88,levels=c("0","1"))
data$services_peds2_b___77.factor = factor(data$services_peds2_b___77,levels=c("0","1"))
data$services_peds2_b___1.factor = factor(data$services_peds2_b___1,levels=c("0","1"))
data$services_peds2_b___1b.factor = factor(data$services_peds2_b___1b,levels=c("0","1"))
data$services_peds2_b___2.factor = factor(data$services_peds2_b___2,levels=c("0","1"))
data$services_peds2_b___3.factor = factor(data$services_peds2_b___3,levels=c("0","1"))
data$services_peds2_b___4.factor = factor(data$services_peds2_b___4,levels=c("0","1"))
data$services_peds2_b___5.factor = factor(data$services_peds2_b___5,levels=c("0","1"))
data$services_peds2_b___6.factor = factor(data$services_peds2_b___6,levels=c("0","1"))
data$services_peds2_b___7.factor = factor(data$services_peds2_b___7,levels=c("0","1"))
data$services_peds2_b___8.factor = factor(data$services_peds2_b___8,levels=c("0","1"))
data$services_peds2_b___10.factor = factor(data$services_peds2_b___10,levels=c("0","1"))
data$care_infants.factor = factor(data$care_infants,levels=c("1","0"))
data$care_infants_site___1.factor = factor(data$care_infants_site___1,levels=c("0","1"))
data$care_infants_site___2.factor = factor(data$care_infants_site___2,levels=c("0","1"))
data$care_infants_site___3.factor = factor(data$care_infants_site___3,levels=c("0","1"))
data$care_infants_site___88.factor = factor(data$care_infants_site___88,levels=c("0","1"))
data$care_infants_art_site___1.factor = factor(data$care_infants_art_site___1,levels=c("0","1"))
data$care_infants_art_site___2.factor = factor(data$care_infants_art_site___2,levels=c("0","1"))
data$care_infants_art_site___3.factor = factor(data$care_infants_art_site___3,levels=c("0","1"))
data$care_infants_art_site___88.factor = factor(data$care_infants_art_site___88,levels=c("0","1"))
data$services_youth_b___77.factor = factor(data$services_youth_b___77,levels=c("0","1"))
data$services_youth_b___1.factor = factor(data$services_youth_b___1,levels=c("0","1"))
data$services_youth_b___2.factor = factor(data$services_youth_b___2,levels=c("0","1"))
data$services_youth_b___3.factor = factor(data$services_youth_b___3,levels=c("0","1"))
data$services_youth_b___4.factor = factor(data$services_youth_b___4,levels=c("0","1"))
data$services_youth_b___5.factor = factor(data$services_youth_b___5,levels=c("0","1"))
data$tst_tbdiag.factor = factor(data$tst_tbdiag,levels=c("1","2","3","77"))
data$cxr_tbdiag.factor = factor(data$cxr_tbdiag,levels=c("1","2","3","77"))
data$sput_tbdiag.factor = factor(data$sput_tbdiag,levels=c("1","2","3","77"))
data$tbtrt.factor = factor(data$tbtrt,levels=c("1","2","3","77"))
data$tbhiv_integration.factor = factor(data$tbhiv_integration,levels=c("1","2","0","88"))
data$tb_symptom_screen.factor = factor(data$tb_symptom_screen,levels=c("1","2","88","0"))
data$screen_cough.factor = factor(data$screen_cough,levels=c("1","0","3"))
data$screen_fever.factor = factor(data$screen_fever,levels=c("1","0","3"))
data$screen_nightsweats.factor = factor(data$screen_nightsweats,levels=c("1","0","3"))
data$screen_weightloss.factor = factor(data$screen_weightloss,levels=c("1","0","3"))
data$screen_contact.factor = factor(data$screen_contact,levels=c("1","0","3"))
data$screen_fatigue.factor = factor(data$screen_fatigue,levels=c("1","0","3"))
data$screen_oth.factor = factor(data$screen_oth,levels=c("1","0","3"))
data$ltbi_testing___0.factor = factor(data$ltbi_testing___0,levels=c("0","1"))
data$ltbi_testing___1.factor = factor(data$ltbi_testing___1,levels=c("0","1"))
data$ltbi_testing___2.factor = factor(data$ltbi_testing___2,levels=c("0","1"))
data$ltbi_testing___88.factor = factor(data$ltbi_testing___88,levels=c("0","1"))
data$tpt_prov.factor = factor(data$tpt_prov,levels=c("1","0"))
data$ltbi_ligibility.factor = factor(data$ltbi_ligibility,levels=c("1","0"))
data$tpt_eligible___1.factor = factor(data$tpt_eligible___1,levels=c("0","1"))
data$tpt_eligible___2.factor = factor(data$tpt_eligible___2,levels=c("0","1"))
data$tpt_eligible___3.factor = factor(data$tpt_eligible___3,levels=c("0","1"))
data$tpt_eligible___4.factor = factor(data$tpt_eligible___4,levels=c("0","1"))
data$tpt_eligible___5.factor = factor(data$tpt_eligible___5,levels=c("0","1"))
data$tpt_eligible___88.factor = factor(data$tpt_eligible___88,levels=c("0","1"))
data$tpt_eligible_adult___77.factor = factor(data$tpt_eligible_adult___77,levels=c("0","1"))
data$tpt_eligible_adult___1.factor = factor(data$tpt_eligible_adult___1,levels=c("0","1"))
data$tpt_eligible_adult___2.factor = factor(data$tpt_eligible_adult___2,levels=c("0","1"))
data$tpt_eligible_adult___3.factor = factor(data$tpt_eligible_adult___3,levels=c("0","1"))
data$tpt_eligible_adult___4.factor = factor(data$tpt_eligible_adult___4,levels=c("0","1"))
data$tpt_eligible_adult___5.factor = factor(data$tpt_eligible_adult___5,levels=c("0","1"))
data$tpt_eligible_adult___6.factor = factor(data$tpt_eligible_adult___6,levels=c("0","1"))
data$tpt_eligible_adult___88.factor = factor(data$tpt_eligible_adult___88,levels=c("0","1"))
data$tpt_lt12m.factor = factor(data$tpt_lt12m,levels=c("1","0","77","3"))
data$tpt_ge1y.factor = factor(data$tpt_ge1y,levels=c("1","0","77","3"))
data$tpt_g11y_tb.factor = factor(data$tpt_g11y_tb,levels=c("1","0","77","3"))
data$tpt_adults.factor = factor(data$tpt_adults,levels=c("1","2","77","3"))
data$tpt_peds_lt5.factor = factor(data$tpt_peds_lt5,levels=c("1","2","77","3"))
data$tpt_peds_ge9.factor = factor(data$tpt_peds_ge9,levels=c("1","2","77","3"))
data$tpt_hrcontacts.factor = factor(data$tpt_hrcontacts,levels=c("1","2","77","3"))
data$tpt_atrisk___77.factor = factor(data$tpt_atrisk___77,levels=c("0","1"))
data$tpt_atrisk___1.factor = factor(data$tpt_atrisk___1,levels=c("0","1"))
data$tpt_atrisk___2.factor = factor(data$tpt_atrisk___2,levels=c("0","1"))
data$tpt_atrisk___3.factor = factor(data$tpt_atrisk___3,levels=c("0","1"))
data$tpt_atrisk___4.factor = factor(data$tpt_atrisk___4,levels=c("0","1"))
data$tpt_atrisk___5.factor = factor(data$tpt_atrisk___5,levels=c("0","1"))
data$tpt_atrisk___6.factor = factor(data$tpt_atrisk___6,levels=c("0","1"))
data$tpt_atrisk___7.factor = factor(data$tpt_atrisk___7,levels=c("0","1"))
data$tpt_atrisk___8.factor = factor(data$tpt_atrisk___8,levels=c("0","1"))
data$tpt_atrisk___9.factor = factor(data$tpt_atrisk___9,levels=c("0","1"))
data$tpt_atrisk___10.factor = factor(data$tpt_atrisk___10,levels=c("0","1"))
data$tpt_atrisk___11.factor = factor(data$tpt_atrisk___11,levels=c("0","1"))
data$tpt_atrisk___12.factor = factor(data$tpt_atrisk___12,levels=c("0","1"))
data$tpt_atrisk___13.factor = factor(data$tpt_atrisk___13,levels=c("0","1"))
data$inh6_b___1.factor = factor(data$inh6_b___1,levels=c("0","1"))
data$inh6_b___2.factor = factor(data$inh6_b___2,levels=c("0","1"))
data$inh6_b___77.factor = factor(data$inh6_b___77,levels=c("0","1"))
data$inh6_b___3.factor = factor(data$inh6_b___3,levels=c("0","1"))
data$inh9_b___1.factor = factor(data$inh9_b___1,levels=c("0","1"))
data$inh9_b___2.factor = factor(data$inh9_b___2,levels=c("0","1"))
data$inh9_b___77.factor = factor(data$inh9_b___77,levels=c("0","1"))
data$inh9_b___3.factor = factor(data$inh9_b___3,levels=c("0","1"))
data$inh12_b___1.factor = factor(data$inh12_b___1,levels=c("0","1"))
data$inh12_b___2.factor = factor(data$inh12_b___2,levels=c("0","1"))
data$inh12_b___77.factor = factor(data$inh12_b___77,levels=c("0","1"))
data$inh12_b___3.factor = factor(data$inh12_b___3,levels=c("0","1"))
data$inh36_b___1.factor = factor(data$inh36_b___1,levels=c("0","1"))
data$inh36_b___2.factor = factor(data$inh36_b___2,levels=c("0","1"))
data$inh36_b___77.factor = factor(data$inh36_b___77,levels=c("0","1"))
data$inh36_b___3.factor = factor(data$inh36_b___3,levels=c("0","1"))
data$rif3_b___1.factor = factor(data$rif3_b___1,levels=c("0","1"))
data$rif3_b___2.factor = factor(data$rif3_b___2,levels=c("0","1"))
data$rif3_b___77.factor = factor(data$rif3_b___77,levels=c("0","1"))
data$rif3_b___3.factor = factor(data$rif3_b___3,levels=c("0","1"))
data$rif4_b___1.factor = factor(data$rif4_b___1,levels=c("0","1"))
data$rif4_b___2.factor = factor(data$rif4_b___2,levels=c("0","1"))
data$rif4_b___77.factor = factor(data$rif4_b___77,levels=c("0","1"))
data$rif4_b___3.factor = factor(data$rif4_b___3,levels=c("0","1"))
data$inh_rif3_b___1.factor = factor(data$inh_rif3_b___1,levels=c("0","1"))
data$inh_rif3_b___2.factor = factor(data$inh_rif3_b___2,levels=c("0","1"))
data$inh_rif3_b___77.factor = factor(data$inh_rif3_b___77,levels=c("0","1"))
data$inh_rif3_b___3.factor = factor(data$inh_rif3_b___3,levels=c("0","1"))
data$inh_rif4_b___1.factor = factor(data$inh_rif4_b___1,levels=c("0","1"))
data$inh_rif4_b___2.factor = factor(data$inh_rif4_b___2,levels=c("0","1"))
data$inh_rif4_b___77.factor = factor(data$inh_rif4_b___77,levels=c("0","1"))
data$inh_rif4_b___3.factor = factor(data$inh_rif4_b___3,levels=c("0","1"))
data$hp3_12weeks_b___1.factor = factor(data$hp3_12weeks_b___1,levels=c("0","1"))
data$hp3_12weeks_b___2.factor = factor(data$hp3_12weeks_b___2,levels=c("0","1"))
data$hp3_12weeks_b___77.factor = factor(data$hp3_12weeks_b___77,levels=c("0","1"))
data$hp3_12weeks_b___3.factor = factor(data$hp3_12weeks_b___3,levels=c("0","1"))
data$hp3_1month_b___1.factor = factor(data$hp3_1month_b___1,levels=c("0","1"))
data$hp3_1month_b___2.factor = factor(data$hp3_1month_b___2,levels=c("0","1"))
data$hp3_1month_b___77.factor = factor(data$hp3_1month_b___77,levels=c("0","1"))
data$hp3_1month_b___3.factor = factor(data$hp3_1month_b___3,levels=c("0","1"))
data$mdrtb_specify_b___1.factor = factor(data$mdrtb_specify_b___1,levels=c("0","1"))
data$mdrtb_specify_b___2.factor = factor(data$mdrtb_specify_b___2,levels=c("0","1"))
data$mdrtb_specify_b___77.factor = factor(data$mdrtb_specify_b___77,levels=c("0","1"))
data$mdrtb_specify_b___3.factor = factor(data$mdrtb_specify_b___3,levels=c("0","1"))
data$other_specify_b___1.factor = factor(data$other_specify_b___1,levels=c("0","1"))
data$other_specify_b___2.factor = factor(data$other_specify_b___2,levels=c("0","1"))
data$other_specify_b___77.factor = factor(data$other_specify_b___77,levels=c("0","1"))
data$other_specify_b___3.factor = factor(data$other_specify_b___3,levels=c("0","1"))
data$tpt_training.factor = factor(data$tpt_training,levels=c("1","0","3"))
data$tpt_barriers___77.factor = factor(data$tpt_barriers___77,levels=c("0","1"))
data$tpt_barriers___1.factor = factor(data$tpt_barriers___1,levels=c("0","1"))
data$tpt_barriers___2.factor = factor(data$tpt_barriers___2,levels=c("0","1"))
data$tpt_barriers___3.factor = factor(data$tpt_barriers___3,levels=c("0","1"))
data$tpt_barriers___4.factor = factor(data$tpt_barriers___4,levels=c("0","1"))
data$tpt_barriers___5.factor = factor(data$tpt_barriers___5,levels=c("0","1"))
data$tpt_barriers___6.factor = factor(data$tpt_barriers___6,levels=c("0","1"))
data$tpt_barriers___7.factor = factor(data$tpt_barriers___7,levels=c("0","1"))
data$tpt_barriers___88.factor = factor(data$tpt_barriers___88,levels=c("0","1"))
data$aud_patient___77.factor = factor(data$aud_patient___77,levels=c("0","1"))
data$aud_patient___1.factor = factor(data$aud_patient___1,levels=c("0","1"))
data$aud_patient___2.factor = factor(data$aud_patient___2,levels=c("0","1"))
data$aud_patient___3.factor = factor(data$aud_patient___3,levels=c("0","1"))
data$aud_patient___4.factor = factor(data$aud_patient___4,levels=c("0","1"))
data$aud_patient___88.factor = factor(data$aud_patient___88,levels=c("0","1"))
data$aud_patient___99.factor = factor(data$aud_patient___99,levels=c("0","1"))
data$aud_screen_tools___77.factor = factor(data$aud_screen_tools___77,levels=c("0","1"))
data$aud_screen_tools___1.factor = factor(data$aud_screen_tools___1,levels=c("0","1"))
data$aud_screen_tools___2.factor = factor(data$aud_screen_tools___2,levels=c("0","1"))
data$aud_screen_tools___3.factor = factor(data$aud_screen_tools___3,levels=c("0","1"))
data$aud_screen_tools___4.factor = factor(data$aud_screen_tools___4,levels=c("0","1"))
data$aud_screen_tools___88.factor = factor(data$aud_screen_tools___88,levels=c("0","1"))
data$aud_biomarkers___77.factor = factor(data$aud_biomarkers___77,levels=c("0","1"))
data$aud_biomarkers___1.factor = factor(data$aud_biomarkers___1,levels=c("0","1"))
data$aud_biomarkers___2.factor = factor(data$aud_biomarkers___2,levels=c("0","1"))
data$aud_biomarkers___3.factor = factor(data$aud_biomarkers___3,levels=c("0","1"))
data$aud_biomarkers___4.factor = factor(data$aud_biomarkers___4,levels=c("0","1"))
data$aud_biomarkers___88.factor = factor(data$aud_biomarkers___88,levels=c("0","1"))
data$aud_pos_tx___77.factor = factor(data$aud_pos_tx___77,levels=c("0","1"))
data$aud_pos_tx___1.factor = factor(data$aud_pos_tx___1,levels=c("0","1"))
data$aud_pos_tx___6.factor = factor(data$aud_pos_tx___6,levels=c("0","1"))
data$aud_pos_tx___2.factor = factor(data$aud_pos_tx___2,levels=c("0","1"))
data$aud_pos_tx___3.factor = factor(data$aud_pos_tx___3,levels=c("0","1"))
data$aud_pos_tx___4.factor = factor(data$aud_pos_tx___4,levels=c("0","1"))
data$aud_pos_tx___88.factor = factor(data$aud_pos_tx___88,levels=c("0","1"))
data$other_aud_screen___77.factor = factor(data$other_aud_screen___77,levels=c("0","1"))
data$other_aud_screen___0.factor = factor(data$other_aud_screen___0,levels=c("0","1"))
data$other_aud_screen___1.factor = factor(data$other_aud_screen___1,levels=c("0","1"))
data$other_aud_screen___2.factor = factor(data$other_aud_screen___2,levels=c("0","1"))
data$other_aud_screen___3.factor = factor(data$other_aud_screen___3,levels=c("0","1"))
data$other_aud_screen___4.factor = factor(data$other_aud_screen___4,levels=c("0","1"))
data$other_aud_screen___5.factor = factor(data$other_aud_screen___5,levels=c("0","1"))
data$other_aud_screen___6.factor = factor(data$other_aud_screen___6,levels=c("0","1"))
data$other_aud_screen___88.factor = factor(data$other_aud_screen___88,levels=c("0","1"))
data$other_aud_patients___1.factor = factor(data$other_aud_patients___1,levels=c("0","1"))
data$other_aud_patients___2.factor = factor(data$other_aud_patients___2,levels=c("0","1"))
data$other_aud_patients___3.factor = factor(data$other_aud_patients___3,levels=c("0","1"))
data$other_aud_patients___4.factor = factor(data$other_aud_patients___4,levels=c("0","1"))
data$other_aud_patients___88.factor = factor(data$other_aud_patients___88,levels=c("0","1"))
data$other_aud_patients___99.factor = factor(data$other_aud_patients___99,levels=c("0","1"))
data$sud_tools___77.factor = factor(data$sud_tools___77,levels=c("0","1"))
data$sud_tools___1.factor = factor(data$sud_tools___1,levels=c("0","1"))
data$sud_tools___2.factor = factor(data$sud_tools___2,levels=c("0","1"))
data$sud_tools___3.factor = factor(data$sud_tools___3,levels=c("0","1"))
data$sud_tools___88.factor = factor(data$sud_tools___88,levels=c("0","1"))
data$sud_pos_tx___77.factor = factor(data$sud_pos_tx___77,levels=c("0","1"))
data$sud_pos_tx___1.factor = factor(data$sud_pos_tx___1,levels=c("0","1"))
data$sud_pos_tx___7.factor = factor(data$sud_pos_tx___7,levels=c("0","1"))
data$sud_pos_tx___2.factor = factor(data$sud_pos_tx___2,levels=c("0","1"))
data$sud_pos_tx___3.factor = factor(data$sud_pos_tx___3,levels=c("0","1"))
data$sud_pos_tx___4.factor = factor(data$sud_pos_tx___4,levels=c("0","1"))
data$sud_pos_tx___9.factor = factor(data$sud_pos_tx___9,levels=c("0","1"))
data$sud_pos_tx___5.factor = factor(data$sud_pos_tx___5,levels=c("0","1"))
data$sud_pos_tx___88.factor = factor(data$sud_pos_tx___88,levels=c("0","1"))
data$clean_needles.factor = factor(data$clean_needles,levels=c("1","0","3"))
data$depression_screen_pt_b___77.factor = factor(data$depression_screen_pt_b___77,levels=c("0","1"))
data$depression_screen_pt_b___1.factor = factor(data$depression_screen_pt_b___1,levels=c("0","1"))
data$depression_screen_pt_b___2.factor = factor(data$depression_screen_pt_b___2,levels=c("0","1"))
data$depression_screen_pt_b___3.factor = factor(data$depression_screen_pt_b___3,levels=c("0","1"))
data$depression_screen_pt_b___4.factor = factor(data$depression_screen_pt_b___4,levels=c("0","1"))
data$depression_screen_pt_b___5.factor = factor(data$depression_screen_pt_b___5,levels=c("0","1"))
data$depression_screen_pt_b___88.factor = factor(data$depression_screen_pt_b___88,levels=c("0","1"))
data$depression_screen_tools___77.factor = factor(data$depression_screen_tools___77,levels=c("0","1"))
data$depression_screen_tools___1.factor = factor(data$depression_screen_tools___1,levels=c("0","1"))
data$depression_screen_tools___2.factor = factor(data$depression_screen_tools___2,levels=c("0","1"))
data$depression_screen_tools___3.factor = factor(data$depression_screen_tools___3,levels=c("0","1"))
data$depression_screen_tools___4.factor = factor(data$depression_screen_tools___4,levels=c("0","1"))
data$depression_screen_tools___5.factor = factor(data$depression_screen_tools___5,levels=c("0","1"))
data$depression_screen_tools___6.factor = factor(data$depression_screen_tools___6,levels=c("0","1"))
data$depression_screen_tools___88.factor = factor(data$depression_screen_tools___88,levels=c("0","1"))
data$depression_screen_tools___99.factor = factor(data$depression_screen_tools___99,levels=c("0","1"))
data$depression_tx_b___77.factor = factor(data$depression_tx_b___77,levels=c("0","1"))
data$depression_tx_b___1.factor = factor(data$depression_tx_b___1,levels=c("0","1"))
data$depression_tx_b___3.factor = factor(data$depression_tx_b___3,levels=c("0","1"))
data$depression_tx_b___4.factor = factor(data$depression_tx_b___4,levels=c("0","1"))
data$depression_tx_b___5.factor = factor(data$depression_tx_b___5,levels=c("0","1"))
data$depression_tx_b___88.factor = factor(data$depression_tx_b___88,levels=c("0","1"))
data$anxiety_screen_pt_b___77.factor = factor(data$anxiety_screen_pt_b___77,levels=c("0","1"))
data$anxiety_screen_pt_b___1.factor = factor(data$anxiety_screen_pt_b___1,levels=c("0","1"))
data$anxiety_screen_pt_b___2.factor = factor(data$anxiety_screen_pt_b___2,levels=c("0","1"))
data$anxiety_screen_pt_b___3.factor = factor(data$anxiety_screen_pt_b___3,levels=c("0","1"))
data$anxiety_screen_pt_b___4.factor = factor(data$anxiety_screen_pt_b___4,levels=c("0","1"))
data$anxiety_screen_pt_b___5.factor = factor(data$anxiety_screen_pt_b___5,levels=c("0","1"))
data$anxiety_screen_pt_b___88.factor = factor(data$anxiety_screen_pt_b___88,levels=c("0","1"))
data$anxiety_screen_tools___77.factor = factor(data$anxiety_screen_tools___77,levels=c("0","1"))
data$anxiety_screen_tools___1.factor = factor(data$anxiety_screen_tools___1,levels=c("0","1"))
data$anxiety_screen_tools___2.factor = factor(data$anxiety_screen_tools___2,levels=c("0","1"))
data$anxiety_screen_tools___3.factor = factor(data$anxiety_screen_tools___3,levels=c("0","1"))
data$anxiety_screen_tools___4.factor = factor(data$anxiety_screen_tools___4,levels=c("0","1"))
data$anxiety_screen_tools___88.factor = factor(data$anxiety_screen_tools___88,levels=c("0","1"))
data$anxiety_tx_b___77.factor = factor(data$anxiety_tx_b___77,levels=c("0","1"))
data$anxiety_tx_b___6.factor = factor(data$anxiety_tx_b___6,levels=c("0","1"))
data$anxiety_tx_b___3.factor = factor(data$anxiety_tx_b___3,levels=c("0","1"))
data$anxiety_tx_b___4.factor = factor(data$anxiety_tx_b___4,levels=c("0","1"))
data$anxiety_tx_b___5.factor = factor(data$anxiety_tx_b___5,levels=c("0","1"))
data$anxiety_tx_b___88.factor = factor(data$anxiety_tx_b___88,levels=c("0","1"))
data$ptsd_screen_pt_b___77.factor = factor(data$ptsd_screen_pt_b___77,levels=c("0","1"))
data$ptsd_screen_pt_b___1.factor = factor(data$ptsd_screen_pt_b___1,levels=c("0","1"))
data$ptsd_screen_pt_b___2.factor = factor(data$ptsd_screen_pt_b___2,levels=c("0","1"))
data$ptsd_screen_pt_b___3.factor = factor(data$ptsd_screen_pt_b___3,levels=c("0","1"))
data$ptsd_screen_pt_b___4.factor = factor(data$ptsd_screen_pt_b___4,levels=c("0","1"))
data$ptsd_screen_pt_b___5.factor = factor(data$ptsd_screen_pt_b___5,levels=c("0","1"))
data$ptsd_screen_pt_b___88.factor = factor(data$ptsd_screen_pt_b___88,levels=c("0","1"))
data$ptsd_screen_tools___77.factor = factor(data$ptsd_screen_tools___77,levels=c("0","1"))
data$ptsd_screen_tools___1.factor = factor(data$ptsd_screen_tools___1,levels=c("0","1"))
data$ptsd_screen_tools___2.factor = factor(data$ptsd_screen_tools___2,levels=c("0","1"))
data$ptsd_screen_tools___4.factor = factor(data$ptsd_screen_tools___4,levels=c("0","1"))
data$ptsd_screen_tools___5.factor = factor(data$ptsd_screen_tools___5,levels=c("0","1"))
data$ptsd_screen_tools___6.factor = factor(data$ptsd_screen_tools___6,levels=c("0","1"))
data$ptsd_screen_tools___88.factor = factor(data$ptsd_screen_tools___88,levels=c("0","1"))
data$ptsd_tx_b___77.factor = factor(data$ptsd_tx_b___77,levels=c("0","1"))
data$ptsd_tx_b___6.factor = factor(data$ptsd_tx_b___6,levels=c("0","1"))
data$ptsd_tx_b___3.factor = factor(data$ptsd_tx_b___3,levels=c("0","1"))
data$ptsd_tx_b___4.factor = factor(data$ptsd_tx_b___4,levels=c("0","1"))
data$ptsd_tx_b___5.factor = factor(data$ptsd_tx_b___5,levels=c("0","1"))
data$ptsd_tx_b___88.factor = factor(data$ptsd_tx_b___88,levels=c("0","1"))
data$cog_screen_pt___77.factor = factor(data$cog_screen_pt___77,levels=c("0","1"))
data$cog_screen_pt___1.factor = factor(data$cog_screen_pt___1,levels=c("0","1"))
data$cog_screen_pt___2.factor = factor(data$cog_screen_pt___2,levels=c("0","1"))
data$cog_screen_pt___3.factor = factor(data$cog_screen_pt___3,levels=c("0","1"))
data$cog_screen_pt___4.factor = factor(data$cog_screen_pt___4,levels=c("0","1"))
data$cog_screen_pt___5.factor = factor(data$cog_screen_pt___5,levels=c("0","1"))
data$cog_screen_pt___88.factor = factor(data$cog_screen_pt___88,levels=c("0","1"))
data$cog_screen_tools___77.factor = factor(data$cog_screen_tools___77,levels=c("0","1"))
data$cog_screen_tools___1.factor = factor(data$cog_screen_tools___1,levels=c("0","1"))
data$cog_screen_tools___2.factor = factor(data$cog_screen_tools___2,levels=c("0","1"))
data$cog_screen_tools___88.factor = factor(data$cog_screen_tools___88,levels=c("0","1"))
data$si_screen_pt___77.factor = factor(data$si_screen_pt___77,levels=c("0","1"))
data$si_screen_pt___1.factor = factor(data$si_screen_pt___1,levels=c("0","1"))
data$si_screen_pt___2.factor = factor(data$si_screen_pt___2,levels=c("0","1"))
data$si_screen_pt___6.factor = factor(data$si_screen_pt___6,levels=c("0","1"))
data$si_screen_pt___7.factor = factor(data$si_screen_pt___7,levels=c("0","1"))
data$si_screen_pt___3.factor = factor(data$si_screen_pt___3,levels=c("0","1"))
data$si_screen_pt___4.factor = factor(data$si_screen_pt___4,levels=c("0","1"))
data$si_screen_pt___5.factor = factor(data$si_screen_pt___5,levels=c("0","1"))
data$si_screen_pt___88.factor = factor(data$si_screen_pt___88,levels=c("0","1"))
data$si_screen_tools___77.factor = factor(data$si_screen_tools___77,levels=c("0","1"))
data$si_screen_tools___1.factor = factor(data$si_screen_tools___1,levels=c("0","1"))
data$si_screen_tools___88.factor = factor(data$si_screen_tools___88,levels=c("0","1"))
data$protocol_suicide.factor = factor(data$protocol_suicide,levels=c("1","0","3"))
data$ipv_screen_pt___77.factor = factor(data$ipv_screen_pt___77,levels=c("0","1"))
data$ipv_screen_pt___9.factor = factor(data$ipv_screen_pt___9,levels=c("0","1"))
data$ipv_screen_pt___1.factor = factor(data$ipv_screen_pt___1,levels=c("0","1"))
data$ipv_screen_pt___2.factor = factor(data$ipv_screen_pt___2,levels=c("0","1"))
data$ipv_screen_pt___3.factor = factor(data$ipv_screen_pt___3,levels=c("0","1"))
data$ipv_screen_pt___4.factor = factor(data$ipv_screen_pt___4,levels=c("0","1"))
data$ipv_screen_pt___88.factor = factor(data$ipv_screen_pt___88,levels=c("0","1"))
data$sv_screen_pt___77.factor = factor(data$sv_screen_pt___77,levels=c("0","1"))
data$sv_screen_pt___9.factor = factor(data$sv_screen_pt___9,levels=c("0","1"))
data$sv_screen_pt___1.factor = factor(data$sv_screen_pt___1,levels=c("0","1"))
data$sv_screen_pt___2.factor = factor(data$sv_screen_pt___2,levels=c("0","1"))
data$sv_screen_pt___3.factor = factor(data$sv_screen_pt___3,levels=c("0","1"))
data$sv_screen_pt___4.factor = factor(data$sv_screen_pt___4,levels=c("0","1"))
data$sv_screen_pt___88.factor = factor(data$sv_screen_pt___88,levels=c("0","1"))
data$ipv_sv_support___77.factor = factor(data$ipv_sv_support___77,levels=c("0","1"))
data$ipv_sv_support___1.factor = factor(data$ipv_sv_support___1,levels=c("0","1"))
data$ipv_sv_support___2.factor = factor(data$ipv_sv_support___2,levels=c("0","1"))
data$ipv_sv_support___3.factor = factor(data$ipv_sv_support___3,levels=c("0","1"))
data$ipv_sv_support___4.factor = factor(data$ipv_sv_support___4,levels=c("0","1"))
data$ipv_sv_support___5.factor = factor(data$ipv_sv_support___5,levels=c("0","1"))
data$ipv_sv_support___6.factor = factor(data$ipv_sv_support___6,levels=c("0","1"))
data$ipv_sv_support___88.factor = factor(data$ipv_sv_support___88,levels=c("0","1"))
data$ipv_sv_support___99.factor = factor(data$ipv_sv_support___99,levels=c("0","1"))
data$ipv_sv_counseling___77.factor = factor(data$ipv_sv_counseling___77,levels=c("0","1"))
data$ipv_sv_counseling___1.factor = factor(data$ipv_sv_counseling___1,levels=c("0","1"))
data$ipv_sv_counseling___2.factor = factor(data$ipv_sv_counseling___2,levels=c("0","1"))
data$ipv_sv_counseling___3.factor = factor(data$ipv_sv_counseling___3,levels=c("0","1"))
data$ipv_sv_counseling___4.factor = factor(data$ipv_sv_counseling___4,levels=c("0","1"))
data$ipv_sv_counseling___5.factor = factor(data$ipv_sv_counseling___5,levels=c("0","1"))
data$ipv_sv_counseling___88.factor = factor(data$ipv_sv_counseling___88,levels=c("0","1"))
data$ipv_sv_counseling___99.factor = factor(data$ipv_sv_counseling___99,levels=c("0","1"))
data$stdrd_ipv.factor = factor(data$stdrd_ipv,levels=c("1","0","3"))
data$stdrd_sv.factor = factor(data$stdrd_sv,levels=c("1","0","3"))
data$space_ipv.factor = factor(data$space_ipv,levels=c("1","0","3"))
data$space_sv.factor = factor(data$space_sv,levels=c("1","0","3"))
data$protocol_ipv.factor = factor(data$protocol_ipv,levels=c("1","0","3"))
data$protocol_sv.factor = factor(data$protocol_sv,levels=c("1","0","3"))
data$educ_ipv.factor = factor(data$educ_ipv,levels=c("1","0","3"))
data$educ_sv.factor = factor(data$educ_sv,levels=c("1","0","3"))
data$oth_ipv.factor = factor(data$oth_ipv,levels=c("1","0","3"))
data$oth_sv.factor = factor(data$oth_sv,levels=c("1","0","3"))
data$cervical_screen.factor = factor(data$cervical_screen,levels=c("1","2","3","77"))
data$cervical_screen_pap.factor = factor(data$cervical_screen_pap,levels=c("1","2","3","77"))
data$hpv_molecular.factor = factor(data$hpv_molecular,levels=c("1","2","3","77"))
data$anal_pap.factor = factor(data$anal_pap,levels=c("1","2","3","77"))
data$hr_anoscopy.factor = factor(data$hr_anoscopy,levels=c("1","2","3","77"))
data$liver_ultrasound.factor = factor(data$liver_ultrasound,levels=c("1","2","3","77"))
data$liver_screen_oth.factor = factor(data$liver_screen_oth,levels=c("1","2","3","77"))
data$breast_exam.factor = factor(data$breast_exam,levels=c("1","2","3","77"))
data$breast_mammogram.factor = factor(data$breast_mammogram,levels=c("1","2","3","77"))
data$colon_screen.factor = factor(data$colon_screen,levels=c("1","2","3","77"))
data$lung_screen.factor = factor(data$lung_screen,levels=c("1","2","3","77"))
data$prostate_screen.factor = factor(data$prostate_screen,levels=c("1","2","3","77"))
data$cervical_routine___1.factor = factor(data$cervical_routine___1,levels=c("0","1"))
data$cervical_routine___2.factor = factor(data$cervical_routine___2,levels=c("0","1"))
data$cervical_routine___3.factor = factor(data$cervical_routine___3,levels=c("0","1"))
data$cervical_routine___4.factor = factor(data$cervical_routine___4,levels=c("0","1"))
data$cervical_routine___88.factor = factor(data$cervical_routine___88,levels=c("0","1"))
data$cervical_routine___77.factor = factor(data$cervical_routine___77,levels=c("0","1"))
data$anal_routine___1.factor = factor(data$anal_routine___1,levels=c("0","1"))
data$anal_routine___2.factor = factor(data$anal_routine___2,levels=c("0","1"))
data$anal_routine___3.factor = factor(data$anal_routine___3,levels=c("0","1"))
data$anal_routine___4.factor = factor(data$anal_routine___4,levels=c("0","1"))
data$anal_routine___88.factor = factor(data$anal_routine___88,levels=c("0","1"))
data$anal_routine___77.factor = factor(data$anal_routine___77,levels=c("0","1"))
data$liver_routine___1.factor = factor(data$liver_routine___1,levels=c("0","1"))
data$liver_routine___2.factor = factor(data$liver_routine___2,levels=c("0","1"))
data$liver_routine___3.factor = factor(data$liver_routine___3,levels=c("0","1"))
data$liver_routine___4.factor = factor(data$liver_routine___4,levels=c("0","1"))
data$liver_routine___88.factor = factor(data$liver_routine___88,levels=c("0","1"))
data$liver_routine___77.factor = factor(data$liver_routine___77,levels=c("0","1"))
data$breast_routine___1.factor = factor(data$breast_routine___1,levels=c("0","1"))
data$breast_routine___2.factor = factor(data$breast_routine___2,levels=c("0","1"))
data$breast_routine___3.factor = factor(data$breast_routine___3,levels=c("0","1"))
data$breast_routine___4.factor = factor(data$breast_routine___4,levels=c("0","1"))
data$breast_routine___88.factor = factor(data$breast_routine___88,levels=c("0","1"))
data$breast_routine___77.factor = factor(data$breast_routine___77,levels=c("0","1"))
data$colon_routine___1.factor = factor(data$colon_routine___1,levels=c("0","1"))
data$colon_routine___2.factor = factor(data$colon_routine___2,levels=c("0","1"))
data$colon_routine___3.factor = factor(data$colon_routine___3,levels=c("0","1"))
data$colon_routine___4.factor = factor(data$colon_routine___4,levels=c("0","1"))
data$colon_routine___88.factor = factor(data$colon_routine___88,levels=c("0","1"))
data$colon_routine___77.factor = factor(data$colon_routine___77,levels=c("0","1"))
data$lung_routine___1.factor = factor(data$lung_routine___1,levels=c("0","1"))
data$lung_routine___2.factor = factor(data$lung_routine___2,levels=c("0","1"))
data$lung_routine___3.factor = factor(data$lung_routine___3,levels=c("0","1"))
data$lung_routine___4.factor = factor(data$lung_routine___4,levels=c("0","1"))
data$lung_routine___88.factor = factor(data$lung_routine___88,levels=c("0","1"))
data$lung_routine___77.factor = factor(data$lung_routine___77,levels=c("0","1"))
data$prostate_routine___1.factor = factor(data$prostate_routine___1,levels=c("0","1"))
data$prostate_routine___2.factor = factor(data$prostate_routine___2,levels=c("0","1"))
data$prostate_routine___3.factor = factor(data$prostate_routine___3,levels=c("0","1"))
data$prostate_routine___4.factor = factor(data$prostate_routine___4,levels=c("0","1"))
data$prostate_routine___88.factor = factor(data$prostate_routine___88,levels=c("0","1"))
data$prostate_routine___77.factor = factor(data$prostate_routine___77,levels=c("0","1"))
data$cervical_brrier___1.factor = factor(data$cervical_brrier___1,levels=c("0","1"))
data$cervical_brrier___2.factor = factor(data$cervical_brrier___2,levels=c("0","1"))
data$cervical_brrier___3.factor = factor(data$cervical_brrier___3,levels=c("0","1"))
data$cervical_brrier___88.factor = factor(data$cervical_brrier___88,levels=c("0","1"))
data$cervical_brrier___77.factor = factor(data$cervical_brrier___77,levels=c("0","1"))
data$anal_barrier___1.factor = factor(data$anal_barrier___1,levels=c("0","1"))
data$anal_barrier___2.factor = factor(data$anal_barrier___2,levels=c("0","1"))
data$anal_barrier___3.factor = factor(data$anal_barrier___3,levels=c("0","1"))
data$anal_barrier___88.factor = factor(data$anal_barrier___88,levels=c("0","1"))
data$anal_barrier___77.factor = factor(data$anal_barrier___77,levels=c("0","1"))
data$liver_barrier___1.factor = factor(data$liver_barrier___1,levels=c("0","1"))
data$liver_barrier___2.factor = factor(data$liver_barrier___2,levels=c("0","1"))
data$liver_barrier___3.factor = factor(data$liver_barrier___3,levels=c("0","1"))
data$liver_barrier___88.factor = factor(data$liver_barrier___88,levels=c("0","1"))
data$liver_barrier___77.factor = factor(data$liver_barrier___77,levels=c("0","1"))
data$breast_barrier___1.factor = factor(data$breast_barrier___1,levels=c("0","1"))
data$breast_barrier___2.factor = factor(data$breast_barrier___2,levels=c("0","1"))
data$breast_barrier___3.factor = factor(data$breast_barrier___3,levels=c("0","1"))
data$breast_barrier___88.factor = factor(data$breast_barrier___88,levels=c("0","1"))
data$breast_barrier___77.factor = factor(data$breast_barrier___77,levels=c("0","1"))
data$colon_barrier___1.factor = factor(data$colon_barrier___1,levels=c("0","1"))
data$colon_barrier___2.factor = factor(data$colon_barrier___2,levels=c("0","1"))
data$colon_barrier___3.factor = factor(data$colon_barrier___3,levels=c("0","1"))
data$colon_barrier___88.factor = factor(data$colon_barrier___88,levels=c("0","1"))
data$colon_barrier___77.factor = factor(data$colon_barrier___77,levels=c("0","1"))
data$lung_barrier___1.factor = factor(data$lung_barrier___1,levels=c("0","1"))
data$lung_barrier___2.factor = factor(data$lung_barrier___2,levels=c("0","1"))
data$lung_barrier___3.factor = factor(data$lung_barrier___3,levels=c("0","1"))
data$lung_barrier___88.factor = factor(data$lung_barrier___88,levels=c("0","1"))
data$lung_barrier___77.factor = factor(data$lung_barrier___77,levels=c("0","1"))
data$prostate_barrier___1.factor = factor(data$prostate_barrier___1,levels=c("0","1"))
data$prostate_barrier___2.factor = factor(data$prostate_barrier___2,levels=c("0","1"))
data$prostate_barrier___3.factor = factor(data$prostate_barrier___3,levels=c("0","1"))
data$prostate_barrier___88.factor = factor(data$prostate_barrier___88,levels=c("0","1"))
data$prostate_barrier___77.factor = factor(data$prostate_barrier___77,levels=c("0","1"))
data$older_screen___77.factor = factor(data$older_screen___77,levels=c("0","1"))
data$older_screen___1.factor = factor(data$older_screen___1,levels=c("0","1"))
data$older_screen___2.factor = factor(data$older_screen___2,levels=c("0","1"))
data$older_screen___3.factor = factor(data$older_screen___3,levels=c("0","1"))
data$older_screen___4.factor = factor(data$older_screen___4,levels=c("0","1"))
data$older_screen___5.factor = factor(data$older_screen___5,levels=c("0","1"))
data$older_screen___6.factor = factor(data$older_screen___6,levels=c("0","1"))
data$older_polypharmacy___77.factor = factor(data$older_polypharmacy___77,levels=c("0","1"))
data$older_polypharmacy___1.factor = factor(data$older_polypharmacy___1,levels=c("0","1"))
data$older_polypharmacy___2.factor = factor(data$older_polypharmacy___2,levels=c("0","1"))
data$older_polypharmacy___3.factor = factor(data$older_polypharmacy___3,levels=c("0","1"))
data$older_polypharmacy___4.factor = factor(data$older_polypharmacy___4,levels=c("0","1"))
data$older_polypharmacy___88.factor = factor(data$older_polypharmacy___88,levels=c("0","1"))
data$older_capacity___77.factor = factor(data$older_capacity___77,levels=c("0","1"))
data$older_capacity___1.factor = factor(data$older_capacity___1,levels=c("0","1"))
data$older_capacity___2.factor = factor(data$older_capacity___2,levels=c("0","1"))
data$older_capacity___3.factor = factor(data$older_capacity___3,levels=c("0","1"))
data$older_capacity___4.factor = factor(data$older_capacity___4,levels=c("0","1"))
data$older_capacity___5.factor = factor(data$older_capacity___5,levels=c("0","1"))
data$older_capacity___88.factor = factor(data$older_capacity___88,levels=c("0","1"))
data$older_serv_pfmt.factor = factor(data$older_serv_pfmt,levels=c("1","2","3","77"))
data$older_serv_occ.factor = factor(data$older_serv_occ,levels=c("1","2","3","77"))
data$older_serv_ophthalmol.factor = factor(data$older_serv_ophthalmol,levels=c("1","2","3","77"))
data$older_serv_optical.factor = factor(data$older_serv_optical,levels=c("1","2","3","77"))
data$older_serv_audio.factor = factor(data$older_serv_audio,levels=c("1","2","3","77"))
data$older_serv_audio_dev.factor = factor(data$older_serv_audio_dev,levels=c("1","2","3","77"))
data$older_serv_diet_couns.factor = factor(data$older_serv_diet_couns,levels=c("1","2","3","77"))
data$older_serv_diet_supp.factor = factor(data$older_serv_diet_supp,levels=c("1","2","3","77"))
data$older_serv_mobility.factor = factor(data$older_serv_mobility,levels=c("1","2","3","77"))
data$older_malnutrition___77.factor = factor(data$older_malnutrition___77,levels=c("0","1"))
data$older_malnutrition___1.factor = factor(data$older_malnutrition___1,levels=c("0","1"))
data$older_malnutrition___2.factor = factor(data$older_malnutrition___2,levels=c("0","1"))
data$older_malnutrition___3.factor = factor(data$older_malnutrition___3,levels=c("0","1"))
data$older_malnutrition___4.factor = factor(data$older_malnutrition___4,levels=c("0","1"))
data$older_malnutrition___5.factor = factor(data$older_malnutrition___5,levels=c("0","1"))
data$older_malnutrition___88.factor = factor(data$older_malnutrition___88,levels=c("0","1"))
data$older_mobility___77.factor = factor(data$older_mobility___77,levels=c("0","1"))
data$older_mobility___1.factor = factor(data$older_mobility___1,levels=c("0","1"))
data$older_mobility___2.factor = factor(data$older_mobility___2,levels=c("0","1"))
data$older_mobility___3.factor = factor(data$older_mobility___3,levels=c("0","1"))
data$older_mobility___4.factor = factor(data$older_mobility___4,levels=c("0","1"))
data$older_mobility___5.factor = factor(data$older_mobility___5,levels=c("0","1"))
data$dermatologist_location.factor = factor(data$dermatologist_location,levels=c("1","2","3","4","5","99"))
data$sd_clin_exam.factor = factor(data$sd_clin_exam,levels=c("1","2","3","77"))
data$sd_biopsy.factor = factor(data$sd_biopsy,levels=c("1","2","3","77"))
data$sd_excision.factor = factor(data$sd_excision,levels=c("1","2","3","77"))
data$sd_scraping.factor = factor(data$sd_scraping,levels=c("1","2","3","77"))
data$sd_culture.factor = factor(data$sd_culture,levels=c("1","2","3","77"))
data$sd_other.factor = factor(data$sd_other,levels=c("1","2","3","77"))
data$sd_fee_clin_exam.factor = factor(data$sd_fee_clin_exam,levels=c("1","0","3","77"))
data$sd_fee_biopsy.factor = factor(data$sd_fee_biopsy,levels=c("1","0","3","77"))
data$sd_fee_excision.factor = factor(data$sd_fee_excision,levels=c("1","0","3","77"))
data$sd_fee_other.factor = factor(data$sd_fee_other,levels=c("1","0","3","77"))
data$language_chosen.factor = factor(data$language_chosen,levels=c("en","fr"))
data$status_general.factor = factor(data$status_general,levels=c("1","2","3","4","5","6"))
data$survey_status_complete.factor = factor(data$survey_status_complete,levels=c("0","1","2"))

levels(data$region.factor)=c("Asia-Pacific","NA-ACCORD (North America)","CCASAnet (Latin America)","Central Africa","East Africa","Southern Africa","West Africa")
levels(data$adultped.factor)=c("Adults (ADULT)","Children (PED)","Adults and children (BOTH)")
levels(data$rural.factor)=c("Urban","Mostly urban","Mostly rural","Rural","Unknown")
levels(data$level.factor)=c("Health centre","District hospital","Regional, provincial or university hospital","Unknown")
levels(data$country.factor)=c("Afghanistan","Ŭand Islands","Albania","Algeria","American Samoa","Andorra","Angola","Anguilla","Antarctica","Antigua and Barbuda","Argentina","Armenia","Aruba","Australia","Austria","Azerbaijan","Bahamas (the)","Bahrain","Bangladesh","Barbados","Belarus","Belgium","Belize","Benin","Bermuda","Bhutan","Bolivia (Plurinational State of)","Bonaire, Sint Eustatius and Saba","Bosnia and Herzegovina","Botswana","Bouvet Island","Brazil","British Indian Ocean Territory (the)","Brunei Darussalam","Bulgaria","Burkina Faso","Burundi","Cabo Verde","Cambodia","Cameroon","Canada","Cayman Islands (the)","Central African Republic (the)","Chad","Chile","China","Christmas Island","Cocos (Keeling) Islands (the)","Colombia","Comoros (the)","Congo (the Democratic Republic of the)","Congo (the)","Cook Islands (the)","Costa Rica","Côte dIvoire","Croatia","Cuba","Cura硯","Cyprus","Czechia","Denmark","Djibouti","Dominica","Dominican Republic (the)","Ecuador","Egypt","El Salvador","Equatorial Guinea","Eritrea","Estonia","Eswatini","Ethiopia","Falkland Islands (the) [Malvinas]","Faroe Islands (the)","Fiji","Finland","France","French Guiana","French Polynesia","French Southern Territories (the)","Gabon","Gambia (the)","Georgia","Germany","Ghana","Gibraltar","Greece","Greenland","Grenada","Guadeloupe","Guam","Guatemala","Guernsey","Guinea","Guinea-Bissau","Guyana","Haiti","Heard Island and McDonald Islands","Holy See (the)","Honduras","Hong Kong","Hungary","Iceland","India","Indonesia","Iran (Islamic Republic of)","Iraq","Ireland","Isle of Man","Israel","Italy","Jamaica","Japan","Jersey","Jordan","Kazakhstan","Kenya","Kiribati","Korea (the Democratic Peoples Republic of)","Korea (the Republic of)","Kuwait","Kyrgyzstan","Lao Peoples Democratic Republic (the)","Latvia","Lebanon","Lesotho","Liberia","Libya","Liechtenstein","Lithuania","Luxembourg","Macao","Macedonia (the former Yugoslav Republic of)","Madagascar","Malawi","Malaysia","Maldives","Mali","Malta","Marshall Islands (the)","Martinique","Mauritania","Mauritius","Mayotte","Mexico","Micronesia (Federated States of)","Moldova (the Republic of)","Monaco","Mongolia","Montenegro","Montserrat","Morocco","Mozambique","Myanmar","Namibia","Nauru","Nepal","Netherlands (the)","New Caledonia","New Zealand","Nicaragua","Niger (the)","Nigeria","Niue","Norfolk Island","Northern Mariana Islands (the)","Norway","Oman","Pakistan","Palau","Palestine, State of","Panama","Papua New Guinea","Paraguay","Peru","Philippines (the)","Pitcairn","Poland","Portugal","Puerto Rico","Qatar","R鵮ion","Romania","Russian Federation (the)","Rwanda","Saint Barth鬥my","Saint Helena, Ascension and Tristan da Cunha","Saint Kitts and Nevis","Saint Lucia","Saint Martin (French part)","Saint Pierre and Miquelon","Saint Vincent and the Grenadines","Samoa","San Marino","Sao Tome and Principe","Saudi Arabia","Senegal","Serbia","Seychelles","Sierra Leone","Singapore","Sint Maarten (Dutch part)","Slovakia","Slovenia","Solomon Islands","Somalia","South Africa","South Georgia and the South Sandwich Islands","South Sudan","Spain","Sri Lanka","Sudan (the)","Suriname","Svalbard and Jan Mayen","Sweden","Switzerland","Syrian Arab Republic","Taiwan (Province of China)","Tajikistan","Tanzania, United Republic of","Thailand","Timor-Leste","Togo","Tokelau","Tonga","Trinidad and Tobago","Tunisia","Turkey","Turkmenistan","Turks and Caicos Islands (the)","Tuvalu","Uganda","Ukraine","United Arab Emirates (the)","United Kingdom of Great Britain and Northern Ireland (the)","United States Minor Outlying Islands (the)","United States of America (the)","Uruguay","Uzbekistan","Vanuatu","Venezuela (Bolivarian Republic of)","Viet Nam","Virgin Islands (British)","Virgin Islands (U.S.)","Wallis and Futuna","Western Sahara","Yemen","Zambia","Zimbabwe")
levels(data$residence_setting.factor)=c("Predominantly Urban","Predominantly Rural","Mixed urban/rural")
levels(data$pediatrician_0.factor)=c("Available every day  clinic is open","Available some days","Never available")
levels(data$internist_0.factor)=c("Available every day  clinic is open","Available some days","Never available")
levels(data$id_specialist.factor)=c("Available every day  clinic is open","Available some days","Never available")
levels(data$midlevel_prov_0.factor)=c("Available every day  clinic is open","Available some days","Never available")
levels(data$adher_counselor.factor)=c("Available every day  clinic is open","Available some days","Not available")
levels(data$peer_educ.factor)=c("Available every day  clinic is open","Available some days","Not available")
levels(data$outreach.factor)=c("Available every day  clinic is open","Available some days","Not available")
levels(data$nutritionist.factor)=c("Available every day  clinic is open","Available some days","Not available")
levels(data$geriatrician.factor)=c("Available every day  clinic is open","Available some days","Never available")
levels(data$ophtalmologist.factor)=c("Available every day  clinic is open","Available some days","Never available")
levels(data$audiologist.factor)=c("Available every day  clinic is open","Available some days","Never available")
levels(data$psychologist.factor)=c("Available every day  clinic is open","Available some days","Never available")
levels(data$psychiatrist.factor)=c("Available every day  clinic is open","Available some days","Never available")
levels(data$occ_therapist.factor)=c("Available every day  clinic is open","Available some days","Never available")
levels(data$dermatologist.factor)=c("Available every day  clinic is open","Available some days","Never available")
levels(data$midlev_dermatologist.factor)=c("Available every day  clinic is open","Available some days","Never available")
levels(data$ct_services.factor)=c("Services available every day clinic is open","Services available some days","Services never available")
levels(data$test_services_type2_b___1.factor)=c("Unchecked","Checked")
levels(data$test_services_type2_b___2.factor)=c("Unchecked","Checked")
levels(data$test_services_type2_b___3.factor)=c("Unchecked","Checked")
levels(data$test_services_type2_b___4.factor)=c("Unchecked","Checked")
levels(data$test_services_type2_b___7.factor)=c("Unchecked","Checked")
levels(data$test_services_type2_b___5.factor)=c("Unchecked","Checked")
levels(data$test_services_type2_b___6.factor)=c("Unchecked","Checked")
levels(data$test_services_type2_b___88.factor)=c("Unchecked","Checked")
levels(data$confirm_test_art.factor)=c("Yes","No","Not applicable (All patients initiate ART prior to enrollment at this site)")
levels(data$confirm_dx_adults___1.factor)=c("Unchecked","Checked")
levels(data$confirm_dx_adults___2.factor)=c("Unchecked","Checked")
levels(data$confirm_dx_adults___88.factor)=c("Unchecked","Checked")
levels(data$confirm_dx_infants___77.factor)=c("Unchecked","Checked")
levels(data$confirm_dx_infants___1.factor)=c("Unchecked","Checked")
levels(data$confirm_dx_infants___2.factor)=c("Unchecked","Checked")
levels(data$confirm_dx_infants___88.factor)=c("Unchecked","Checked")
levels(data$dx_services_infants.factor)=c("Services available every day clinic is open","Services available some days","Services never available")
levels(data$same_day_poc_c.factor)=c("Always","Sometimes","Never")
levels(data$rpid_hivtest.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$hiv1_2_antigen.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$hiv_p24_antigen.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$hiv_nat.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$hiv1_2_antibody.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$entry_b___1.factor)=c("Unchecked","Checked")
levels(data$entry_b___23.factor)=c("Unchecked","Checked")
levels(data$entry_b___4.factor)=c("Unchecked","Checked")
levels(data$entry_b___5.factor)=c("Unchecked","Checked")
levels(data$entry_b___6.factor)=c("Unchecked","Checked")
levels(data$entry_b___8.factor)=c("Unchecked","Checked")
levels(data$entry_b___7.factor)=c("Unchecked","Checked")
levels(data$entry_b___88.factor)=c("Unchecked","Checked")
levels(data$services_type_3_b___77.factor)=c("Unchecked","Checked")
levels(data$services_type_3_b___12.factor)=c("Unchecked","Checked")
levels(data$services_type_3_b___3.factor)=c("Unchecked","Checked")
levels(data$services_type_3_b___4.factor)=c("Unchecked","Checked")
levels(data$services_type_3_b___5.factor)=c("Unchecked","Checked")
levels(data$services_type_3_b___88.factor)=c("Unchecked","Checked")
levels(data$screening_enrollment___77.factor)=c("Unchecked","Checked")
levels(data$screening_enrollment___1.factor)=c("Unchecked","Checked")
levels(data$screening_enrollment___2.factor)=c("Unchecked","Checked")
levels(data$screening_enrollment___3.factor)=c("Unchecked","Checked")
levels(data$screening_enrollment___4.factor)=c("Unchecked","Checked")
levels(data$screening_enrollment___5.factor)=c("Unchecked","Checked")
levels(data$screening_enrollment___8.factor)=c("Unchecked","Checked")
levels(data$screening_enrollment___9.factor)=c("Unchecked","Checked")
levels(data$screening_enrollment___10.factor)=c("Unchecked","Checked")
levels(data$screening_enrollment___11.factor)=c("Unchecked","Checked")
levels(data$screening_enrollment___12.factor)=c("Unchecked","Checked")
levels(data$screening_enrollment___13.factor)=c("Unchecked","Checked")
levels(data$screening_enrollment___14.factor)=c("Unchecked","Checked")
levels(data$screening_enrollment___15.factor)=c("Unchecked","Checked")
levels(data$cotrimoxazole_meds___77.factor)=c("Unchecked","Checked")
levels(data$cotrimoxazole_meds___1.factor)=c("Unchecked","Checked")
levels(data$cotrimoxazole_meds___2.factor)=c("Unchecked","Checked")
levels(data$cotrimoxazole_meds___3.factor)=c("Unchecked","Checked")
levels(data$cotrimoxazole_meds___4.factor)=c("Unchecked","Checked")
levels(data$cotrimoxazole_meds___5.factor)=c("Unchecked","Checked")
levels(data$cotrimoxazole_meds___6.factor)=c("Unchecked","Checked")
levels(data$cotrimoxazole_meds___7.factor)=c("Unchecked","Checked")
levels(data$cotrimoxazole_meds___88.factor)=c("Unchecked","Checked")
levels(data$cd4_testing.factor)=c("Yes","No")
levels(data$cd4_testing_old.factor)=c("Yes","No")
levels(data$lab_cd4_b.factor)=c("Onsite, at the same health facility as the HIV clinic","Offsite","Not available")
levels(data$sameday_cd4_b.factor)=c("Always","Sometimes","Never")
levels(data$care_preart.factor)=c("Yes","No")
levels(data$art_time2_b.factor)=c("Same day that ART eligibility is established","1 to 7 days after establishing ART eligibility","8 to 14 days after establishing ART eligibility","2-4 weeks after establishing ART eligibility",">1 month after establishing ART eligibility")
levels(data$art_visits.factor)=c("0","1","2","3","4 or more sessions")
levels(data$poc_pcr_rna_b.factor)=c("Always","Sometimes","Never")
levels(data$sms_retention_c___77.factor)=c("Unchecked","Checked")
levels(data$sms_retention_c___5.factor)=c("Unchecked","Checked")
levels(data$sms_retention_c___6.factor)=c("Unchecked","Checked")
levels(data$sms_retention_c___3.factor)=c("Unchecked","Checked")
levels(data$sms_retention_c___4.factor)=c("Unchecked","Checked")
levels(data$freq_reminders.factor)=c("Daily","Weekly","Bi-monthly (every 2 weeks)","Monthly","Other {freq_reminders_oth}")
levels(data$notstable_refil.factor)=c("Every 30 days (Monthly)","Every 3 months","Every 6 months","Other {notstable_refil_oth}")
levels(data$stable_refil.factor)=c("Every 30 days (Monthly)","Every 3 months","Every 6 months","Other {stable_refil_oth}")
levels(data$notstable_visits.factor)=c("Every 30 days (Monthly)","Every 3 months","Every 6 months","Other {notstable_visits_oth}")
levels(data$stable_visits.factor)=c("Every 30 days (Monthly)","Every 3 months","Every 6 months","Other {stable_visits_oth}")
levels(data$meds_art_b___77.factor)=c("Unchecked","Checked")
levels(data$meds_art_b___9.factor)=c("Unchecked","Checked")
levels(data$meds_art_b___10.factor)=c("Unchecked","Checked")
levels(data$meds_art_b___3.factor)=c("Unchecked","Checked")
levels(data$meds_art_b___5.factor)=c("Unchecked","Checked")
levels(data$meds_art_b___7.factor)=c("Unchecked","Checked")
levels(data$meds_art_b___88.factor)=c("Unchecked","Checked")
levels(data$adherence_self___77.factor)=c("Unchecked","Checked")
levels(data$adherence_self___1.factor)=c("Unchecked","Checked")
levels(data$adherence_self___2.factor)=c("Unchecked","Checked")
levels(data$adherence_self___3.factor)=c("Unchecked","Checked")
levels(data$adherence_self___4.factor)=c("Unchecked","Checked")
levels(data$adherence_self___5.factor)=c("Unchecked","Checked")
levels(data$adherence_self___88.factor)=c("Unchecked","Checked")
levels(data$adherence_freq.factor)=c("At every clinic visit","At every pharmacy pick-up","Other {adherence_freq_oth}")
levels(data$adherence_interv_pt___77.factor)=c("Unchecked","Checked")
levels(data$adherence_interv_pt___1.factor)=c("Unchecked","Checked")
levels(data$adherence_interv_pt___2.factor)=c("Unchecked","Checked")
levels(data$adherence_interv_pt___3.factor)=c("Unchecked","Checked")
levels(data$adherence_interv_pt___4.factor)=c("Unchecked","Checked")
levels(data$adherence_interv_pt___5.factor)=c("Unchecked","Checked")
levels(data$adherence_interv_pt___6.factor)=c("Unchecked","Checked")
levels(data$adherence_interv_pt___88.factor)=c("Unchecked","Checked")
levels(data$adh_educ.factor)=c("None","All patients","Eligible patients")
levels(data$adh_pillboxes.factor)=c("None","All patients","Eligible patients")
levels(data$adh_vis_aids.factor)=c("None","All patients","Eligible patients")
levels(data$adh_edevices.factor)=c("None","All patients","Eligible patients")
levels(data$adh_reminder_oth.factor)=c("None","All patients","Eligible patients")
levels(data$oneon1_adh.factor)=c("None","All patients","Eligible patients")
levels(data$grou_adh.factor)=c("None","All patients","Eligible patients")
levels(data$peer_adh.factor)=c("None","All patients","Eligible patients")
levels(data$ref_peer_adh.factor)=c("None","All patients","Eligible patients")
levels(data$facility_adh.factor)=c("None","All patients","Eligible patients")
levels(data$community_adh.factor)=c("None","All patients","Eligible patients")
levels(data$repeatvl_adh.factor)=c("None","All patients","Eligible patients")
levels(data$cbt_adh.factor)=c("None","All patients","Eligible patients")
levels(data$cash_adh.factor)=c("None","All patients","Eligible patients")
levels(data$food_adh.factor)=c("None","All patients","Eligible patients")
levels(data$supp_adh.factor)=c("None","All patients","Eligible patients")
levels(data$dot_adh.factor)=c("None","All patients","Eligible patients")
levels(data$oth_support_adh.factor)=c("None","All patients","Eligible patients")
levels(data$ltbi_screening.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$sti_screening.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$hbv_screening_b.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$hcv_screening_b.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$alc_screening.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$sud_screening_b.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$depression_screening.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$anxiety_screening.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$ptsd_screening.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$cog_imp_screening.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$suic_id_screening.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$counsel_disclosure_b.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$safesex_method_b.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$family_plan_b.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$harm_reduction_b.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$pmtct.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$prov_condoms_b.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$male_circum_b.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$famplan_methods_b.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$tx_depression.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$tx_ptsd.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$tx_anxiety.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$tx_alcohol.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$tx_sud.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$hpv_vacc_b.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$pneumococcal_vacc.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$hepa_vacc.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$hepb_vacc.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$covid_vacc.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$quantitative_pcr_vl.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$genotypic_dr_testing.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$hepv_b.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$hepv_c.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$helpc_b.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$hepc_c.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$syphilis.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$stis.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$crypto_antigen.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$crypto_csfindia.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$routine_visits_b.factor)=c("Yes","No","Dont Know","NA")
levels(data$specialty_visits_b.factor)=c("Yes","No","Dont Know","NA")
levels(data$first_line_art_b.factor)=c("Yes","No","Dont Know","NA")
levels(data$second_line_art_b.factor)=c("Yes","No","Dont Know","NA")
levels(data$oi_meds_b.factor)=c("Yes","No","Dont Know","NA")
levels(data$hepb_meds_b.factor)=c("Yes","No","Dont Know","NA")
levels(data$hepc_meds_b.factor)=c("Yes","No","Dont Know","NA")
levels(data$mh_tx_b.factor)=c("Yes","No","Dont Know","NA")
levels(data$psychiatric_meds_b.factor)=c("Yes","No","Dont Know","NA")
levels(data$rapid_hivtest_b.factor)=c("Yes","No","Dont Know","NA")
levels(data$hiv1_hiv2_test_b.factor)=c("Yes","No","Dont Know","NA")
levels(data$hiv1_p24_b.factor)=c("Yes","No","Dont Know","NA")
levels(data$cd4_test_b.factor)=c("Yes","No","Dont Know","NA")
levels(data$qual_pcr_eid_b.factor)=c("Yes","No","Dont Know","NA")
levels(data$quant_pcr_vl_b.factor)=c("Yes","No","Dont Know","NA")
levels(data$hiv1_dr_b.factor)=c("Yes","No","Dont Know","NA")
levels(data$hbv_test_b.factor)=c("Yes","No","Dont Know","NA")
levels(data$hcv_test_b.factor)=c("Yes","No","Dont Know","NA")
levels(data$pharmacy.factor)=c("Yes","No")
levels(data$first_line_arv3.factor)=c("Yes","No")
levels(data$first_line_arv_out3.factor)=c("Yes","No")
levels(data$second_line_arv3.factor)=c("Yes","No")
levels(data$second_line_arv_out3.factor)=c("Yes","No")
levels(data$third_line_arv3.factor)=c("Yes","No")
levels(data$third_line_arv_out3.factor)=c("Yes","No")
levels(data$injectable_art.factor)=c("Yes","No")
levels(data$injectable_art_out.factor)=c("Yes","No")
levels(data$tbp_meds.factor)=c("Yes","No")
levels(data$tbp_meds_out.factor)=c("Yes","No")
levels(data$ds_tbmeds.factor)=c("Yes","No")
levels(data$ds_tbmeds_out.factor)=c("Yes","No")
levels(data$mdr_tbmeds.factor)=c("Yes","No")
levels(data$mdr_tbmeds_out.factor)=c("Yes","No")
levels(data$cotrimoxazole3.factor)=c("Yes","No")
levels(data$cotrimoxazole_out3.factor)=c("Yes","No")
levels(data$malaria_tx3.factor)=c("Yes","No")
levels(data$malaria_tx_out3.factor)=c("Yes","No")
levels(data$fluconazole3.factor)=c("Yes","No")
levels(data$fluconazole_out3.factor)=c("Yes","No")
levels(data$amphotericin3.factor)=c("Yes","No")
levels(data$amphotericin_out3.factor)=c("Yes","No")
levels(data$flucytosine3.factor)=c("Yes","No")
levels(data$flucytosine_out3.factor)=c("Yes","No")
levels(data$contraceptives_short3.factor)=c("Yes","No")
levels(data$contraceptives_short_out3.factor)=c("Yes","No")
levels(data$contraceptives_long3.factor)=c("Yes","No")
levels(data$contraceptives_long_out3.factor)=c("Yes","No")
levels(data$ssris3.factor)=c("Yes","No")
levels(data$ssris_out3.factor)=c("Yes","No")
levels(data$snris3.factor)=c("Yes","No")
levels(data$snris_out3.factor)=c("Yes","No")
levels(data$antidepressants3.factor)=c("Yes","No")
levels(data$antidepressants_out3.factor)=c("Yes","No")
levels(data$benzodiazepines3.factor)=c("Yes","No")
levels(data$benzodiazepines_out3.factor)=c("Yes","No")
levels(data$antipsychotics3.factor)=c("Yes","No")
levels(data$antipsychotics_out3.factor)=c("Yes","No")
levels(data$mood_stab3.factor)=c("Yes","No")
levels(data$mood_stab_out3.factor)=c("Yes","No")
levels(data$alc_meds3.factor)=c("Yes","No")
levels(data$alc_meds_out3.factor)=c("Yes","No")
levels(data$wait_list_b.factor)=c("Yes","No","Dont Know")
levels(data$prep.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$pep.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$prepmeds.factor)=c("Yes","No")
levels(data$prepmeds_out.factor)=c("Yes","No")
levels(data$lai_prepmeds.factor)=c("Yes","No")
levels(data$lai_prepmeds_out.factor)=c("Yes","No")
levels(data$pep_meds.factor)=c("Yes","No")
levels(data$pep_meds_out.factor)=c("Yes","No")
levels(data$missapp_art___77.factor)=c("Unchecked","Checked")
levels(data$missapp_art___1.factor)=c("Unchecked","Checked")
levels(data$missapp_art___2.factor)=c("Unchecked","Checked")
levels(data$missapp_art___3.factor)=c("Unchecked","Checked")
levels(data$missapp_art___4.factor)=c("Unchecked","Checked")
levels(data$missapp_art___5.factor)=c("Unchecked","Checked")
levels(data$missapp_art___6.factor)=c("Unchecked","Checked")
levels(data$missapp_art___7.factor)=c("Unchecked","Checked")
levels(data$missapp_art___88.factor)=c("Unchecked","Checked")
levels(data$track_ltfu.factor)=c("Yes","No")
levels(data$track_ltfu_edms.factor)=c("Yes","No")
levels(data$track_ltfu_info2___1.factor)=c("Unchecked","Checked")
levels(data$track_ltfu_info2___1b.factor)=c("Unchecked","Checked")
levels(data$track_ltfu_info2___5.factor)=c("Unchecked","Checked")
levels(data$track_ltfu_info2___88.factor)=c("Unchecked","Checked")
levels(data$services_peds2_b___77.factor)=c("Unchecked","Checked")
levels(data$services_peds2_b___1.factor)=c("Unchecked","Checked")
levels(data$services_peds2_b___1b.factor)=c("Unchecked","Checked")
levels(data$services_peds2_b___2.factor)=c("Unchecked","Checked")
levels(data$services_peds2_b___3.factor)=c("Unchecked","Checked")
levels(data$services_peds2_b___4.factor)=c("Unchecked","Checked")
levels(data$services_peds2_b___5.factor)=c("Unchecked","Checked")
levels(data$services_peds2_b___6.factor)=c("Unchecked","Checked")
levels(data$services_peds2_b___7.factor)=c("Unchecked","Checked")
levels(data$services_peds2_b___8.factor)=c("Unchecked","Checked")
levels(data$services_peds2_b___10.factor)=c("Unchecked","Checked")
levels(data$care_infants.factor)=c("Yes","No")
levels(data$care_infants_site___1.factor)=c("Unchecked","Checked")
levels(data$care_infants_site___2.factor)=c("Unchecked","Checked")
levels(data$care_infants_site___3.factor)=c("Unchecked","Checked")
levels(data$care_infants_site___88.factor)=c("Unchecked","Checked")
levels(data$care_infants_art_site___1.factor)=c("Unchecked","Checked")
levels(data$care_infants_art_site___2.factor)=c("Unchecked","Checked")
levels(data$care_infants_art_site___3.factor)=c("Unchecked","Checked")
levels(data$care_infants_art_site___88.factor)=c("Unchecked","Checked")
levels(data$services_youth_b___77.factor)=c("Unchecked","Checked")
levels(data$services_youth_b___1.factor)=c("Unchecked","Checked")
levels(data$services_youth_b___2.factor)=c("Unchecked","Checked")
levels(data$services_youth_b___3.factor)=c("Unchecked","Checked")
levels(data$services_youth_b___4.factor)=c("Unchecked","Checked")
levels(data$services_youth_b___5.factor)=c("Unchecked","Checked")
levels(data$tst_tbdiag.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$cxr_tbdiag.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$sput_tbdiag.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$tbtrt.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$tbhiv_integration.factor)=c("Full-integration (TB diagnostics and TB treatment under same roof or same facility than HIV care)","Partial integration (either TB diagnostics or TB treatment available under same roof or same facility than HIV care)","Not integrated","Other, specify: {integration_oth}")
levels(data$tb_symptom_screen.factor)=c("Yes, at the time of enrollment into HIV care at this facility only","Yes, at every appointment","Other, specify: {tb_symptom_screen_oth}","No")
levels(data$screen_cough.factor)=c("Yes","No","Dont Know")
levels(data$screen_fever.factor)=c("Yes","No","Dont Know")
levels(data$screen_nightsweats.factor)=c("Yes","No","Dont Know")
levels(data$screen_weightloss.factor)=c("Yes","No","Dont Know")
levels(data$screen_contact.factor)=c("Yes","No","Dont Know")
levels(data$screen_fatigue.factor)=c("Yes","No","Dont Know")
levels(data$screen_oth.factor)=c("Yes","No","Dont Know")
levels(data$ltbi_testing___0.factor)=c("Unchecked","Checked")
levels(data$ltbi_testing___1.factor)=c("Unchecked","Checked")
levels(data$ltbi_testing___2.factor)=c("Unchecked","Checked")
levels(data$ltbi_testing___88.factor)=c("Unchecked","Checked")
levels(data$tpt_prov.factor)=c("Yes","No")
levels(data$ltbi_ligibility.factor)=c("Yes","No")
levels(data$tpt_eligible___1.factor)=c("Unchecked","Checked")
levels(data$tpt_eligible___2.factor)=c("Unchecked","Checked")
levels(data$tpt_eligible___3.factor)=c("Unchecked","Checked")
levels(data$tpt_eligible___4.factor)=c("Unchecked","Checked")
levels(data$tpt_eligible___5.factor)=c("Unchecked","Checked")
levels(data$tpt_eligible___88.factor)=c("Unchecked","Checked")
levels(data$tpt_eligible_adult___77.factor)=c("Unchecked","Checked")
levels(data$tpt_eligible_adult___1.factor)=c("Unchecked","Checked")
levels(data$tpt_eligible_adult___2.factor)=c("Unchecked","Checked")
levels(data$tpt_eligible_adult___3.factor)=c("Unchecked","Checked")
levels(data$tpt_eligible_adult___4.factor)=c("Unchecked","Checked")
levels(data$tpt_eligible_adult___5.factor)=c("Unchecked","Checked")
levels(data$tpt_eligible_adult___6.factor)=c("Unchecked","Checked")
levels(data$tpt_eligible_adult___88.factor)=c("Unchecked","Checked")
levels(data$tpt_lt12m.factor)=c("Yes","No","NA","Dont Know")
levels(data$tpt_ge1y.factor)=c("Yes","No","NA","Dont Know")
levels(data$tpt_g11y_tb.factor)=c("Yes","No","NA","Dont Know")
levels(data$tpt_adults.factor)=c("Yes","No","NA","Dont Know")
levels(data$tpt_peds_lt5.factor)=c("Yes","No","NA","Dont Know")
levels(data$tpt_peds_ge9.factor)=c("Yes","No","NA","Dont Know")
levels(data$tpt_hrcontacts.factor)=c("Yes","No","NA","Dont Know")
levels(data$tpt_atrisk___77.factor)=c("Unchecked","Checked")
levels(data$tpt_atrisk___1.factor)=c("Unchecked","Checked")
levels(data$tpt_atrisk___2.factor)=c("Unchecked","Checked")
levels(data$tpt_atrisk___3.factor)=c("Unchecked","Checked")
levels(data$tpt_atrisk___4.factor)=c("Unchecked","Checked")
levels(data$tpt_atrisk___5.factor)=c("Unchecked","Checked")
levels(data$tpt_atrisk___6.factor)=c("Unchecked","Checked")
levels(data$tpt_atrisk___7.factor)=c("Unchecked","Checked")
levels(data$tpt_atrisk___8.factor)=c("Unchecked","Checked")
levels(data$tpt_atrisk___9.factor)=c("Unchecked","Checked")
levels(data$tpt_atrisk___10.factor)=c("Unchecked","Checked")
levels(data$tpt_atrisk___11.factor)=c("Unchecked","Checked")
levels(data$tpt_atrisk___12.factor)=c("Unchecked","Checked")
levels(data$tpt_atrisk___13.factor)=c("Unchecked","Checked")
levels(data$inh6_b___1.factor)=c("Unchecked","Checked")
levels(data$inh6_b___2.factor)=c("Unchecked","Checked")
levels(data$inh6_b___77.factor)=c("Unchecked","Checked")
levels(data$inh6_b___3.factor)=c("Unchecked","Checked")
levels(data$inh9_b___1.factor)=c("Unchecked","Checked")
levels(data$inh9_b___2.factor)=c("Unchecked","Checked")
levels(data$inh9_b___77.factor)=c("Unchecked","Checked")
levels(data$inh9_b___3.factor)=c("Unchecked","Checked")
levels(data$inh12_b___1.factor)=c("Unchecked","Checked")
levels(data$inh12_b___2.factor)=c("Unchecked","Checked")
levels(data$inh12_b___77.factor)=c("Unchecked","Checked")
levels(data$inh12_b___3.factor)=c("Unchecked","Checked")
levels(data$inh36_b___1.factor)=c("Unchecked","Checked")
levels(data$inh36_b___2.factor)=c("Unchecked","Checked")
levels(data$inh36_b___77.factor)=c("Unchecked","Checked")
levels(data$inh36_b___3.factor)=c("Unchecked","Checked")
levels(data$rif3_b___1.factor)=c("Unchecked","Checked")
levels(data$rif3_b___2.factor)=c("Unchecked","Checked")
levels(data$rif3_b___77.factor)=c("Unchecked","Checked")
levels(data$rif3_b___3.factor)=c("Unchecked","Checked")
levels(data$rif4_b___1.factor)=c("Unchecked","Checked")
levels(data$rif4_b___2.factor)=c("Unchecked","Checked")
levels(data$rif4_b___77.factor)=c("Unchecked","Checked")
levels(data$rif4_b___3.factor)=c("Unchecked","Checked")
levels(data$inh_rif3_b___1.factor)=c("Unchecked","Checked")
levels(data$inh_rif3_b___2.factor)=c("Unchecked","Checked")
levels(data$inh_rif3_b___77.factor)=c("Unchecked","Checked")
levels(data$inh_rif3_b___3.factor)=c("Unchecked","Checked")
levels(data$inh_rif4_b___1.factor)=c("Unchecked","Checked")
levels(data$inh_rif4_b___2.factor)=c("Unchecked","Checked")
levels(data$inh_rif4_b___77.factor)=c("Unchecked","Checked")
levels(data$inh_rif4_b___3.factor)=c("Unchecked","Checked")
levels(data$hp3_12weeks_b___1.factor)=c("Unchecked","Checked")
levels(data$hp3_12weeks_b___2.factor)=c("Unchecked","Checked")
levels(data$hp3_12weeks_b___77.factor)=c("Unchecked","Checked")
levels(data$hp3_12weeks_b___3.factor)=c("Unchecked","Checked")
levels(data$hp3_1month_b___1.factor)=c("Unchecked","Checked")
levels(data$hp3_1month_b___2.factor)=c("Unchecked","Checked")
levels(data$hp3_1month_b___77.factor)=c("Unchecked","Checked")
levels(data$hp3_1month_b___3.factor)=c("Unchecked","Checked")
levels(data$mdrtb_specify_b___1.factor)=c("Unchecked","Checked")
levels(data$mdrtb_specify_b___2.factor)=c("Unchecked","Checked")
levels(data$mdrtb_specify_b___77.factor)=c("Unchecked","Checked")
levels(data$mdrtb_specify_b___3.factor)=c("Unchecked","Checked")
levels(data$other_specify_b___1.factor)=c("Unchecked","Checked")
levels(data$other_specify_b___2.factor)=c("Unchecked","Checked")
levels(data$other_specify_b___77.factor)=c("Unchecked","Checked")
levels(data$other_specify_b___3.factor)=c("Unchecked","Checked")
levels(data$tpt_training.factor)=c("Yes","No","Dont Know")
levels(data$tpt_barriers___77.factor)=c("Unchecked","Checked")
levels(data$tpt_barriers___1.factor)=c("Unchecked","Checked")
levels(data$tpt_barriers___2.factor)=c("Unchecked","Checked")
levels(data$tpt_barriers___3.factor)=c("Unchecked","Checked")
levels(data$tpt_barriers___4.factor)=c("Unchecked","Checked")
levels(data$tpt_barriers___5.factor)=c("Unchecked","Checked")
levels(data$tpt_barriers___6.factor)=c("Unchecked","Checked")
levels(data$tpt_barriers___7.factor)=c("Unchecked","Checked")
levels(data$tpt_barriers___88.factor)=c("Unchecked","Checked")
levels(data$aud_patient___77.factor)=c("Unchecked","Checked")
levels(data$aud_patient___1.factor)=c("Unchecked","Checked")
levels(data$aud_patient___2.factor)=c("Unchecked","Checked")
levels(data$aud_patient___3.factor)=c("Unchecked","Checked")
levels(data$aud_patient___4.factor)=c("Unchecked","Checked")
levels(data$aud_patient___88.factor)=c("Unchecked","Checked")
levels(data$aud_patient___99.factor)=c("Unchecked","Checked")
levels(data$aud_screen_tools___77.factor)=c("Unchecked","Checked")
levels(data$aud_screen_tools___1.factor)=c("Unchecked","Checked")
levels(data$aud_screen_tools___2.factor)=c("Unchecked","Checked")
levels(data$aud_screen_tools___3.factor)=c("Unchecked","Checked")
levels(data$aud_screen_tools___4.factor)=c("Unchecked","Checked")
levels(data$aud_screen_tools___88.factor)=c("Unchecked","Checked")
levels(data$aud_biomarkers___77.factor)=c("Unchecked","Checked")
levels(data$aud_biomarkers___1.factor)=c("Unchecked","Checked")
levels(data$aud_biomarkers___2.factor)=c("Unchecked","Checked")
levels(data$aud_biomarkers___3.factor)=c("Unchecked","Checked")
levels(data$aud_biomarkers___4.factor)=c("Unchecked","Checked")
levels(data$aud_biomarkers___88.factor)=c("Unchecked","Checked")
levels(data$aud_pos_tx___77.factor)=c("Unchecked","Checked")
levels(data$aud_pos_tx___1.factor)=c("Unchecked","Checked")
levels(data$aud_pos_tx___6.factor)=c("Unchecked","Checked")
levels(data$aud_pos_tx___2.factor)=c("Unchecked","Checked")
levels(data$aud_pos_tx___3.factor)=c("Unchecked","Checked")
levels(data$aud_pos_tx___4.factor)=c("Unchecked","Checked")
levels(data$aud_pos_tx___88.factor)=c("Unchecked","Checked")
levels(data$other_aud_screen___77.factor)=c("Unchecked","Checked")
levels(data$other_aud_screen___0.factor)=c("Unchecked","Checked")
levels(data$other_aud_screen___1.factor)=c("Unchecked","Checked")
levels(data$other_aud_screen___2.factor)=c("Unchecked","Checked")
levels(data$other_aud_screen___3.factor)=c("Unchecked","Checked")
levels(data$other_aud_screen___4.factor)=c("Unchecked","Checked")
levels(data$other_aud_screen___5.factor)=c("Unchecked","Checked")
levels(data$other_aud_screen___6.factor)=c("Unchecked","Checked")
levels(data$other_aud_screen___88.factor)=c("Unchecked","Checked")
levels(data$other_aud_patients___1.factor)=c("Unchecked","Checked")
levels(data$other_aud_patients___2.factor)=c("Unchecked","Checked")
levels(data$other_aud_patients___3.factor)=c("Unchecked","Checked")
levels(data$other_aud_patients___4.factor)=c("Unchecked","Checked")
levels(data$other_aud_patients___88.factor)=c("Unchecked","Checked")
levels(data$other_aud_patients___99.factor)=c("Unchecked","Checked")
levels(data$sud_tools___77.factor)=c("Unchecked","Checked")
levels(data$sud_tools___1.factor)=c("Unchecked","Checked")
levels(data$sud_tools___2.factor)=c("Unchecked","Checked")
levels(data$sud_tools___3.factor)=c("Unchecked","Checked")
levels(data$sud_tools___88.factor)=c("Unchecked","Checked")
levels(data$sud_pos_tx___77.factor)=c("Unchecked","Checked")
levels(data$sud_pos_tx___1.factor)=c("Unchecked","Checked")
levels(data$sud_pos_tx___7.factor)=c("Unchecked","Checked")
levels(data$sud_pos_tx___2.factor)=c("Unchecked","Checked")
levels(data$sud_pos_tx___3.factor)=c("Unchecked","Checked")
levels(data$sud_pos_tx___4.factor)=c("Unchecked","Checked")
levels(data$sud_pos_tx___9.factor)=c("Unchecked","Checked")
levels(data$sud_pos_tx___5.factor)=c("Unchecked","Checked")
levels(data$sud_pos_tx___88.factor)=c("Unchecked","Checked")
levels(data$clean_needles.factor)=c("Yes","No","Dont Know")
levels(data$depression_screen_pt_b___77.factor)=c("Unchecked","Checked")
levels(data$depression_screen_pt_b___1.factor)=c("Unchecked","Checked")
levels(data$depression_screen_pt_b___2.factor)=c("Unchecked","Checked")
levels(data$depression_screen_pt_b___3.factor)=c("Unchecked","Checked")
levels(data$depression_screen_pt_b___4.factor)=c("Unchecked","Checked")
levels(data$depression_screen_pt_b___5.factor)=c("Unchecked","Checked")
levels(data$depression_screen_pt_b___88.factor)=c("Unchecked","Checked")
levels(data$depression_screen_tools___77.factor)=c("Unchecked","Checked")
levels(data$depression_screen_tools___1.factor)=c("Unchecked","Checked")
levels(data$depression_screen_tools___2.factor)=c("Unchecked","Checked")
levels(data$depression_screen_tools___3.factor)=c("Unchecked","Checked")
levels(data$depression_screen_tools___4.factor)=c("Unchecked","Checked")
levels(data$depression_screen_tools___5.factor)=c("Unchecked","Checked")
levels(data$depression_screen_tools___6.factor)=c("Unchecked","Checked")
levels(data$depression_screen_tools___88.factor)=c("Unchecked","Checked")
levels(data$depression_screen_tools___99.factor)=c("Unchecked","Checked")
levels(data$depression_tx_b___77.factor)=c("Unchecked","Checked")
levels(data$depression_tx_b___1.factor)=c("Unchecked","Checked")
levels(data$depression_tx_b___3.factor)=c("Unchecked","Checked")
levels(data$depression_tx_b___4.factor)=c("Unchecked","Checked")
levels(data$depression_tx_b___5.factor)=c("Unchecked","Checked")
levels(data$depression_tx_b___88.factor)=c("Unchecked","Checked")
levels(data$anxiety_screen_pt_b___77.factor)=c("Unchecked","Checked")
levels(data$anxiety_screen_pt_b___1.factor)=c("Unchecked","Checked")
levels(data$anxiety_screen_pt_b___2.factor)=c("Unchecked","Checked")
levels(data$anxiety_screen_pt_b___3.factor)=c("Unchecked","Checked")
levels(data$anxiety_screen_pt_b___4.factor)=c("Unchecked","Checked")
levels(data$anxiety_screen_pt_b___5.factor)=c("Unchecked","Checked")
levels(data$anxiety_screen_pt_b___88.factor)=c("Unchecked","Checked")
levels(data$anxiety_screen_tools___77.factor)=c("Unchecked","Checked")
levels(data$anxiety_screen_tools___1.factor)=c("Unchecked","Checked")
levels(data$anxiety_screen_tools___2.factor)=c("Unchecked","Checked")
levels(data$anxiety_screen_tools___3.factor)=c("Unchecked","Checked")
levels(data$anxiety_screen_tools___4.factor)=c("Unchecked","Checked")
levels(data$anxiety_screen_tools___88.factor)=c("Unchecked","Checked")
levels(data$anxiety_tx_b___77.factor)=c("Unchecked","Checked")
levels(data$anxiety_tx_b___6.factor)=c("Unchecked","Checked")
levels(data$anxiety_tx_b___3.factor)=c("Unchecked","Checked")
levels(data$anxiety_tx_b___4.factor)=c("Unchecked","Checked")
levels(data$anxiety_tx_b___5.factor)=c("Unchecked","Checked")
levels(data$anxiety_tx_b___88.factor)=c("Unchecked","Checked")
levels(data$ptsd_screen_pt_b___77.factor)=c("Unchecked","Checked")
levels(data$ptsd_screen_pt_b___1.factor)=c("Unchecked","Checked")
levels(data$ptsd_screen_pt_b___2.factor)=c("Unchecked","Checked")
levels(data$ptsd_screen_pt_b___3.factor)=c("Unchecked","Checked")
levels(data$ptsd_screen_pt_b___4.factor)=c("Unchecked","Checked")
levels(data$ptsd_screen_pt_b___5.factor)=c("Unchecked","Checked")
levels(data$ptsd_screen_pt_b___88.factor)=c("Unchecked","Checked")
levels(data$ptsd_screen_tools___77.factor)=c("Unchecked","Checked")
levels(data$ptsd_screen_tools___1.factor)=c("Unchecked","Checked")
levels(data$ptsd_screen_tools___2.factor)=c("Unchecked","Checked")
levels(data$ptsd_screen_tools___4.factor)=c("Unchecked","Checked")
levels(data$ptsd_screen_tools___5.factor)=c("Unchecked","Checked")
levels(data$ptsd_screen_tools___6.factor)=c("Unchecked","Checked")
levels(data$ptsd_screen_tools___88.factor)=c("Unchecked","Checked")
levels(data$ptsd_tx_b___77.factor)=c("Unchecked","Checked")
levels(data$ptsd_tx_b___6.factor)=c("Unchecked","Checked")
levels(data$ptsd_tx_b___3.factor)=c("Unchecked","Checked")
levels(data$ptsd_tx_b___4.factor)=c("Unchecked","Checked")
levels(data$ptsd_tx_b___5.factor)=c("Unchecked","Checked")
levels(data$ptsd_tx_b___88.factor)=c("Unchecked","Checked")
levels(data$cog_screen_pt___77.factor)=c("Unchecked","Checked")
levels(data$cog_screen_pt___1.factor)=c("Unchecked","Checked")
levels(data$cog_screen_pt___2.factor)=c("Unchecked","Checked")
levels(data$cog_screen_pt___3.factor)=c("Unchecked","Checked")
levels(data$cog_screen_pt___4.factor)=c("Unchecked","Checked")
levels(data$cog_screen_pt___5.factor)=c("Unchecked","Checked")
levels(data$cog_screen_pt___88.factor)=c("Unchecked","Checked")
levels(data$cog_screen_tools___77.factor)=c("Unchecked","Checked")
levels(data$cog_screen_tools___1.factor)=c("Unchecked","Checked")
levels(data$cog_screen_tools___2.factor)=c("Unchecked","Checked")
levels(data$cog_screen_tools___88.factor)=c("Unchecked","Checked")
levels(data$si_screen_pt___77.factor)=c("Unchecked","Checked")
levels(data$si_screen_pt___1.factor)=c("Unchecked","Checked")
levels(data$si_screen_pt___2.factor)=c("Unchecked","Checked")
levels(data$si_screen_pt___6.factor)=c("Unchecked","Checked")
levels(data$si_screen_pt___7.factor)=c("Unchecked","Checked")
levels(data$si_screen_pt___3.factor)=c("Unchecked","Checked")
levels(data$si_screen_pt___4.factor)=c("Unchecked","Checked")
levels(data$si_screen_pt___5.factor)=c("Unchecked","Checked")
levels(data$si_screen_pt___88.factor)=c("Unchecked","Checked")
levels(data$si_screen_tools___77.factor)=c("Unchecked","Checked")
levels(data$si_screen_tools___1.factor)=c("Unchecked","Checked")
levels(data$si_screen_tools___88.factor)=c("Unchecked","Checked")
levels(data$protocol_suicide.factor)=c("Yes","No","Dont Know")
levels(data$ipv_screen_pt___77.factor)=c("Unchecked","Checked")
levels(data$ipv_screen_pt___9.factor)=c("Unchecked","Checked")
levels(data$ipv_screen_pt___1.factor)=c("Unchecked","Checked")
levels(data$ipv_screen_pt___2.factor)=c("Unchecked","Checked")
levels(data$ipv_screen_pt___3.factor)=c("Unchecked","Checked")
levels(data$ipv_screen_pt___4.factor)=c("Unchecked","Checked")
levels(data$ipv_screen_pt___88.factor)=c("Unchecked","Checked")
levels(data$sv_screen_pt___77.factor)=c("Unchecked","Checked")
levels(data$sv_screen_pt___9.factor)=c("Unchecked","Checked")
levels(data$sv_screen_pt___1.factor)=c("Unchecked","Checked")
levels(data$sv_screen_pt___2.factor)=c("Unchecked","Checked")
levels(data$sv_screen_pt___3.factor)=c("Unchecked","Checked")
levels(data$sv_screen_pt___4.factor)=c("Unchecked","Checked")
levels(data$sv_screen_pt___88.factor)=c("Unchecked","Checked")
levels(data$ipv_sv_support___77.factor)=c("Unchecked","Checked")
levels(data$ipv_sv_support___1.factor)=c("Unchecked","Checked")
levels(data$ipv_sv_support___2.factor)=c("Unchecked","Checked")
levels(data$ipv_sv_support___3.factor)=c("Unchecked","Checked")
levels(data$ipv_sv_support___4.factor)=c("Unchecked","Checked")
levels(data$ipv_sv_support___5.factor)=c("Unchecked","Checked")
levels(data$ipv_sv_support___6.factor)=c("Unchecked","Checked")
levels(data$ipv_sv_support___88.factor)=c("Unchecked","Checked")
levels(data$ipv_sv_support___99.factor)=c("Unchecked","Checked")
levels(data$ipv_sv_counseling___77.factor)=c("Unchecked","Checked")
levels(data$ipv_sv_counseling___1.factor)=c("Unchecked","Checked")
levels(data$ipv_sv_counseling___2.factor)=c("Unchecked","Checked")
levels(data$ipv_sv_counseling___3.factor)=c("Unchecked","Checked")
levels(data$ipv_sv_counseling___4.factor)=c("Unchecked","Checked")
levels(data$ipv_sv_counseling___5.factor)=c("Unchecked","Checked")
levels(data$ipv_sv_counseling___88.factor)=c("Unchecked","Checked")
levels(data$ipv_sv_counseling___99.factor)=c("Unchecked","Checked")
levels(data$stdrd_ipv.factor)=c("Yes","No","Dont Know")
levels(data$stdrd_sv.factor)=c("Yes","No","Dont Know")
levels(data$space_ipv.factor)=c("Yes","No","Dont Know")
levels(data$space_sv.factor)=c("Yes","No","Dont Know")
levels(data$protocol_ipv.factor)=c("Yes","No","Dont Know")
levels(data$protocol_sv.factor)=c("Yes","No","Dont Know")
levels(data$educ_ipv.factor)=c("Yes","No","Dont Know")
levels(data$educ_sv.factor)=c("Yes","No","Dont Know")
levels(data$oth_ipv.factor)=c("Yes","No","Dont Know")
levels(data$oth_sv.factor)=c("Yes","No","Dont Know")
levels(data$cervical_screen.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$cervical_screen_pap.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$hpv_molecular.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$anal_pap.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$hr_anoscopy.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$liver_ultrasound.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$liver_screen_oth.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$breast_exam.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$breast_mammogram.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$colon_screen.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$lung_screen.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$prostate_screen.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$cervical_routine___1.factor)=c("Unchecked","Checked")
levels(data$cervical_routine___2.factor)=c("Unchecked","Checked")
levels(data$cervical_routine___3.factor)=c("Unchecked","Checked")
levels(data$cervical_routine___4.factor)=c("Unchecked","Checked")
levels(data$cervical_routine___88.factor)=c("Unchecked","Checked")
levels(data$cervical_routine___77.factor)=c("Unchecked","Checked")
levels(data$anal_routine___1.factor)=c("Unchecked","Checked")
levels(data$anal_routine___2.factor)=c("Unchecked","Checked")
levels(data$anal_routine___3.factor)=c("Unchecked","Checked")
levels(data$anal_routine___4.factor)=c("Unchecked","Checked")
levels(data$anal_routine___88.factor)=c("Unchecked","Checked")
levels(data$anal_routine___77.factor)=c("Unchecked","Checked")
levels(data$liver_routine___1.factor)=c("Unchecked","Checked")
levels(data$liver_routine___2.factor)=c("Unchecked","Checked")
levels(data$liver_routine___3.factor)=c("Unchecked","Checked")
levels(data$liver_routine___4.factor)=c("Unchecked","Checked")
levels(data$liver_routine___88.factor)=c("Unchecked","Checked")
levels(data$liver_routine___77.factor)=c("Unchecked","Checked")
levels(data$breast_routine___1.factor)=c("Unchecked","Checked")
levels(data$breast_routine___2.factor)=c("Unchecked","Checked")
levels(data$breast_routine___3.factor)=c("Unchecked","Checked")
levels(data$breast_routine___4.factor)=c("Unchecked","Checked")
levels(data$breast_routine___88.factor)=c("Unchecked","Checked")
levels(data$breast_routine___77.factor)=c("Unchecked","Checked")
levels(data$colon_routine___1.factor)=c("Unchecked","Checked")
levels(data$colon_routine___2.factor)=c("Unchecked","Checked")
levels(data$colon_routine___3.factor)=c("Unchecked","Checked")
levels(data$colon_routine___4.factor)=c("Unchecked","Checked")
levels(data$colon_routine___88.factor)=c("Unchecked","Checked")
levels(data$colon_routine___77.factor)=c("Unchecked","Checked")
levels(data$lung_routine___1.factor)=c("Unchecked","Checked")
levels(data$lung_routine___2.factor)=c("Unchecked","Checked")
levels(data$lung_routine___3.factor)=c("Unchecked","Checked")
levels(data$lung_routine___4.factor)=c("Unchecked","Checked")
levels(data$lung_routine___88.factor)=c("Unchecked","Checked")
levels(data$lung_routine___77.factor)=c("Unchecked","Checked")
levels(data$prostate_routine___1.factor)=c("Unchecked","Checked")
levels(data$prostate_routine___2.factor)=c("Unchecked","Checked")
levels(data$prostate_routine___3.factor)=c("Unchecked","Checked")
levels(data$prostate_routine___4.factor)=c("Unchecked","Checked")
levels(data$prostate_routine___88.factor)=c("Unchecked","Checked")
levels(data$prostate_routine___77.factor)=c("Unchecked","Checked")
levels(data$cervical_brrier___1.factor)=c("Unchecked","Checked")
levels(data$cervical_brrier___2.factor)=c("Unchecked","Checked")
levels(data$cervical_brrier___3.factor)=c("Unchecked","Checked")
levels(data$cervical_brrier___88.factor)=c("Unchecked","Checked")
levels(data$cervical_brrier___77.factor)=c("Unchecked","Checked")
levels(data$anal_barrier___1.factor)=c("Unchecked","Checked")
levels(data$anal_barrier___2.factor)=c("Unchecked","Checked")
levels(data$anal_barrier___3.factor)=c("Unchecked","Checked")
levels(data$anal_barrier___88.factor)=c("Unchecked","Checked")
levels(data$anal_barrier___77.factor)=c("Unchecked","Checked")
levels(data$liver_barrier___1.factor)=c("Unchecked","Checked")
levels(data$liver_barrier___2.factor)=c("Unchecked","Checked")
levels(data$liver_barrier___3.factor)=c("Unchecked","Checked")
levels(data$liver_barrier___88.factor)=c("Unchecked","Checked")
levels(data$liver_barrier___77.factor)=c("Unchecked","Checked")
levels(data$breast_barrier___1.factor)=c("Unchecked","Checked")
levels(data$breast_barrier___2.factor)=c("Unchecked","Checked")
levels(data$breast_barrier___3.factor)=c("Unchecked","Checked")
levels(data$breast_barrier___88.factor)=c("Unchecked","Checked")
levels(data$breast_barrier___77.factor)=c("Unchecked","Checked")
levels(data$colon_barrier___1.factor)=c("Unchecked","Checked")
levels(data$colon_barrier___2.factor)=c("Unchecked","Checked")
levels(data$colon_barrier___3.factor)=c("Unchecked","Checked")
levels(data$colon_barrier___88.factor)=c("Unchecked","Checked")
levels(data$colon_barrier___77.factor)=c("Unchecked","Checked")
levels(data$lung_barrier___1.factor)=c("Unchecked","Checked")
levels(data$lung_barrier___2.factor)=c("Unchecked","Checked")
levels(data$lung_barrier___3.factor)=c("Unchecked","Checked")
levels(data$lung_barrier___88.factor)=c("Unchecked","Checked")
levels(data$lung_barrier___77.factor)=c("Unchecked","Checked")
levels(data$prostate_barrier___1.factor)=c("Unchecked","Checked")
levels(data$prostate_barrier___2.factor)=c("Unchecked","Checked")
levels(data$prostate_barrier___3.factor)=c("Unchecked","Checked")
levels(data$prostate_barrier___88.factor)=c("Unchecked","Checked")
levels(data$prostate_barrier___77.factor)=c("Unchecked","Checked")
levels(data$older_screen___77.factor)=c("Unchecked","Checked")
levels(data$older_screen___1.factor)=c("Unchecked","Checked")
levels(data$older_screen___2.factor)=c("Unchecked","Checked")
levels(data$older_screen___3.factor)=c("Unchecked","Checked")
levels(data$older_screen___4.factor)=c("Unchecked","Checked")
levels(data$older_screen___5.factor)=c("Unchecked","Checked")
levels(data$older_screen___6.factor)=c("Unchecked","Checked")
levels(data$older_polypharmacy___77.factor)=c("Unchecked","Checked")
levels(data$older_polypharmacy___1.factor)=c("Unchecked","Checked")
levels(data$older_polypharmacy___2.factor)=c("Unchecked","Checked")
levels(data$older_polypharmacy___3.factor)=c("Unchecked","Checked")
levels(data$older_polypharmacy___4.factor)=c("Unchecked","Checked")
levels(data$older_polypharmacy___88.factor)=c("Unchecked","Checked")
levels(data$older_capacity___77.factor)=c("Unchecked","Checked")
levels(data$older_capacity___1.factor)=c("Unchecked","Checked")
levels(data$older_capacity___2.factor)=c("Unchecked","Checked")
levels(data$older_capacity___3.factor)=c("Unchecked","Checked")
levels(data$older_capacity___4.factor)=c("Unchecked","Checked")
levels(data$older_capacity___5.factor)=c("Unchecked","Checked")
levels(data$older_capacity___88.factor)=c("Unchecked","Checked")
levels(data$older_serv_pfmt.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$older_serv_occ.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$older_serv_ophthalmol.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$older_serv_optical.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$older_serv_audio.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$older_serv_audio_dev.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$older_serv_diet_couns.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$older_serv_diet_supp.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$older_serv_mobility.factor)=c("Provided in HIV Clinic","In same health facility (but not at HIV clinic)","Only offsite (referral)","Not available")
levels(data$older_malnutrition___77.factor)=c("Unchecked","Checked")
levels(data$older_malnutrition___1.factor)=c("Unchecked","Checked")
levels(data$older_malnutrition___2.factor)=c("Unchecked","Checked")
levels(data$older_malnutrition___3.factor)=c("Unchecked","Checked")
levels(data$older_malnutrition___4.factor)=c("Unchecked","Checked")
levels(data$older_malnutrition___5.factor)=c("Unchecked","Checked")
levels(data$older_malnutrition___88.factor)=c("Unchecked","Checked")
levels(data$older_mobility___77.factor)=c("Unchecked","Checked")
levels(data$older_mobility___1.factor)=c("Unchecked","Checked")
levels(data$older_mobility___2.factor)=c("Unchecked","Checked")
levels(data$older_mobility___3.factor)=c("Unchecked","Checked")
levels(data$older_mobility___4.factor)=c("Unchecked","Checked")
levels(data$older_mobility___5.factor)=c("Unchecked","Checked")
levels(data$dermatologist_location.factor)=c("Within same health facility","Referral to provider within the same city or town","Referral to provider in different city or town","Requires referral, but not sure where closest dermatologist is located","Not available at all","Do not know")
levels(data$sd_clin_exam.factor)=c("Provided in HIV Clinic","Outpatient or inpatient ward","Operating theatre","Not available")
levels(data$sd_biopsy.factor)=c("Provided in HIV Clinic","Outpatient or inpatient ward","Operating theatre","Not available")
levels(data$sd_excision.factor)=c("Provided in HIV Clinic","Outpatient or inpatient ward","Operating theatre","Not available")
levels(data$sd_scraping.factor)=c("Provided in HIV Clinic","Outpatient or inpatient ward","Operating theatre","Not available")
levels(data$sd_culture.factor)=c("Provided in HIV Clinic","Outpatient or inpatient ward","Operating theatre","Not available")
levels(data$sd_other.factor)=c("Provided in HIV Clinic","Outpatient or inpatient ward","Operating theatre","Not available")
levels(data$sd_fee_clin_exam.factor)=c("Yes","No","Dont Know","NA (Not applicable)")
levels(data$sd_fee_biopsy.factor)=c("Yes","No","Dont Know","NA (Not applicable)")
levels(data$sd_fee_excision.factor)=c("Yes","No","Dont Know","NA (Not applicable)")
levels(data$sd_fee_other.factor)=c("Yes","No","Dont Know","NA (Not applicable)")
levels(data$language_chosen.factor)=c("English","French")
levels(data$status_general.factor)=c("Complete/Validated","Queries","e-Survey submitted","Pending data entry (paper)","Unknown","Site not participating")
levels(data$survey_status_complete.factor)=c("Incomplete","Unverified","Complete")

# import other data (HIV prevalence and income level) and add to the main dataframe

HBC <- read_excel("data_clean/High_burden_countries.xlsx") %>%
  mutate(Country = ifelse(Country == "United Republic of Tanzania", "Tanzania", Country)) %>% 
  rename('TB' = 'TB HBC',
         'TB/HIV' = 'TB/HIV HBC',
         'DR-TB' = 'DR-TB HBC')

income <- read_excel("data_raw/income.xlsx") %>% 
  mutate(Income_group = as.factor(case_when(`Income group` == "Low income" ~ "Low",
                                            `Income group` == "Lower middle income" ~ "Low middle",
                                            `Income group` == "Upper middle income" ~ "Upper middle",
                                            `Income group` == "High income" ~ "High")),
         country = Code)

HIV_prev <- read_excel("data_clean/hiv_prev.xlsx") %>% 
  mutate(Prev_numeric = case_when(Prevalence_perc == "<0.1" ~ 0.1,
                                  Prevalence_perc == "..." ~ NA,
                                  TRUE ~ as.numeric(Prevalence_perc))) %>% 
  mutate(Prev_cat = case_when(
    Prev_numeric < 1 ~ "Low (<1%)",
    Prev_numeric <= 5 ~ "Middle (1-5%)",
    Prev_numeric > 5 ~ "High (>5%)",
    country == "NGA" ~ "Middle (1-5%)",
    country == "CHN" ~ "Low (<1%)",
    TRUE ~ NA))%>% 
  mutate(Prev_cat.factor = factor(Prev_cat, 
                                  levels = c("Low (<1%)", "Middle (1-5%)", "High (>5%)"))) %>%
  select(country, Prev_cat.factor)

# main dataset
data2 <- data  %>% 
  filter(!is.na(region), survey_status_complete == 2) %>% 
  mutate(country = as.character(country),
         record_id = as.character(record_id)) %>%  # Convert 'country' to character type
  left_join(HBC, by = c("country" = "Code")) %>%
  rename(region_exact = region) %>% 
  mutate(
    HBC_ANY = as.factor(if_else(!is.na(`ANY`) & `ANY` == 1, "HBC", "Not HBC")),
    HBC_TB = as.factor(if_else(!is.na(`TB`) & `TB` == 1, "HBC", "Not HBC")),
    HBC_TB_HIV = as.factor(if_else(!is.na(`TB/HIV`) & `TB/HIV` == 1, "HBC", "Not HBC")),
    HBC_DR_TB = as.factor(if_else(!is.na(`DR-TB`) & `DR-TB` == 1, "HBC", "Not HBC")),
    region = as.factor(case_when(
      region_exact == "AP" ~ "Asia-Pacific",
      region_exact == "CN" ~ "Latin America",
      region_exact %in% c("CA", "EA", "SA", "WA") ~ "Africa")),
    tbhiv_integration.factor = case_when(record_id %in% c("102", "418") ~ "Partial integration (either TB diagnostics or TB treatment available under same roof or same facility than HIV care)",
                                         record_id == "523" ~ "Not integrated", ## checked these manually (responded 'other')
                                         TRUE ~ tbhiv_integration.factor),
    tbhiv_integration.factor = fct_recode(
      tbhiv_integration.factor,
      "Full" = "Full-integration (TB diagnostics and TB treatment under same roof or same facility than HIV care)",
      "Partial" = "Partial integration (either TB diagnostics or TB treatment available under same roof or same facility than HIV care)",
      "No" = "Not integrated"),
    rural.factor = case_when(rural.factor == "Mostly urban" ~ "Rural",
                             rural.factor == "Mostly rural" ~ "Urban",
                             TRUE ~ rural.factor),
    tb_symptom_screen.factor = case_when(tb_symptom_screen_oth %in% c("Oui, à chaque consultation", "at the time of enrollment and every appointment") ~ "Yes, at every appointment", 
                                         TRUE ~ tb_symptom_screen.factor)) %>%
  select(-c(`ANY`, `TB`, `TB/HIV`, `DR-TB`, Country)) %>% 
  left_join(income, by = "country") %>%
  left_join(HIV_prev, by = "country") %>% 
  filter(Income_group %in% c("Low", "Low middle", "Upper middle")) 

saveRDS(data2, "data_clean/data_clean.rds")

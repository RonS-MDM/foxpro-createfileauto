
LPARAMETERS lcWhatLocation

LOCAL lcGlobalPW,lcCryptorLibrary

m.lcCryptorLibrary = "C40FOX60.FLL"
m.lcGlobalPW = "MdM189iNsUrAnCe"

SET DEFAULT TO E:\RonDev\CreateFilesAuto
SET LIBRARY TO (m.lcCryptorLibrary) ADDITIVE


	GlobalPW = "MdM189iNsUrAnCe" && real pwd

	DO RegisterFiles WITH lcWhatLocation, "cdx", m.lcGlobalPW
	DO RegisterFiles WITH lcWhatLocation, "dbc", m.lcGlobalPW
	DO RegisterFiles WITH lcWhatLocation, "dbf", m.lcGlobalPW
	DO RegisterFiles WITH lcWhatLocation, "dct", m.lcGlobalPW
	DO RegisterFiles WITH lcWhatLocation, "dcx", m.lcGlobalPW
	DO RegisterFiles WITH lcWhatLocation, "fpt", m.lcGlobalPW
	
	DO RegisterFiles2 WITH lcWhatLocation, "cdx", m.lcGlobalPW
	DO RegisterFiles2 WITH lcWhatLocation, "dbc", m.lcGlobalPW
	DO RegisterFiles2 WITH lcWhatLocation, "dbf", m.lcGlobalPW
	DO RegisterFiles2 WITH lcWhatLocation, "dct", m.lcGlobalPW
	DO RegisterFiles2 WITH lcWhatLocation, "dcx", m.lcGlobalPW
	DO RegisterFiles2 WITH lcWhatLocation, "fpt", m.lcGlobalPW



clear

set default to "E:\MDM\MainTest\Charts\"

? "***** Start data loads - Charts *****"

delete file E:\SQL_File_Loads\pharmacy_full.txt

? "Start pharmacy load"
use pharmacy
COPY TO E:\SQL_File_Loads\pharmacy_full.txt DELIMITED WITH CHAR "~"
? "Finish pharmacy load"
use

delete file E:\SQL_File_Loads\dentist_full.txt

? "Start dentist load"
use dentist
COPY TO E:\SQL_File_Loads\dentist_full.txt DELIMITED WITH CHAR "~"
? "Finish dentist load"
use


delete file E:\SQL_File_Loads\drug_full.txt

? "Start drug load"
use drugs
COPY TO E:\SQL_File_Loads\drug_full.txt DELIMITED WITH CHAR "|"
? "Finish drug load"
use

delete file E:\SQL_File_Loads\hc_comp_full.txt

? "Start hc_comp load"
use hc_comp
COPY TO E:\SQL_File_Loads\hc_comp_full.txt DELIMITED WITH CHAR "|"
? "Finish hc_comp load"
use


delete file E:\SQL_File_Loads\hc_drug_full.txt

? "Start hc_drug load"
use hc_drug
COPY TO E:\SQL_File_Loads\hc_drug_full.txt DELIMITED WITH CHAR "~"
? "Finish hc_drug load"
use



delete file E:\SQL_File_Loads\insurer_full.txt

? "Start insurer load"
use insurer
COPY TO E:\SQL_File_Loads\insurer_full.txt DELIMITED WITH CHAR "|"
? "Finish insurer load"
use


delete file E:\SQL_File_Loads\ehc_procs_full.txt

? "Start EHC_Procs load"
use ehc_procs
COPY TO E:\SQL_File_Loads\ehc_procs_full.txt DELIMITED WITH CHAR "|"
? "Finish ehc_procs load"
use

delete file E:\SQL_File_Loads\Agency_full.txt

? "Start Agency load"
use Agency
COPY TO E:\SQL_File_Loads\Agency_full.txt DELIMITED WITH CHAR "|"
? "Finish Agency load"
use

delete file E:\SQL_File_Loads\Agents_full.txt

? "Start Agent load"
use Agents
COPY TO E:\SQL_File_Loads\Agents_full.txt DELIMITED WITH CHAR "|"
? "Finish Agents load"
use

delete file E:\SQL_File_Loads\ASOTaxPlan_full.txt

? "Start ASOTaxPlan load"
use ASOTaxPlan
COPY TO E:\SQL_File_Loads\ASOTaxPlan_full.txt DELIMITED WITH CHAR "~"
? "Finish ASOTaxPlan load"
use

delete file E:\SQL_File_Loads\insurer_full.txt
? "Start insurer load"
use insurer
COPY TO E:\SQL_File_Loads\insurer_full.txt DELIMITED WITH CHAR "~"

delete file E:\SQL_File_Loads\ehccodes_full.txt
? "Start ehccodes load"
use ehccodes
COPY TO E:\SQL_File_Loads\ehccodes_full.txt DELIMITED WITH CHAR "~"
? "Finish ehccodes load"

delete file E:\SQL_File_Loads\provider_full.txt
? "Start provider load"
use provider
COPY TO E:\SQL_File_Loads\provider_full.txt DELIMITED WITH CHAR "~"
? "Finish provider load"

delete file E:\SQL_File_Loads\oda_full.txt
? "Start oda load"
use oda
COPY TO E:\SQL_File_Loads\oda_full.txt DELIMITED WITH CHAR "~"
? "Finish provider load" 

delete file E:\SQL_File_Loads\budgetaso_full.txt
? "Start budgetaso load"
use budgetaso
COPY TO E:\SQL_File_Loads\budgetaso_full.txt DELIMITED WITH CHAR "~"
? "Finish budgetaso load" 


use

delete file E:\SQL_File_Loads\employment_status_full.txt
? "Start employment_status"
use employment_status
COPY TO E:\SQL_File_Loads\employment_status_full.txt DELIMITED WITH CHAR "~"
? "Finish employee status load"
use


delete file E:\SQL_File_Loads\insuredtaxplan_full.txt
? "Start insuredtaxplan load"
use insuredtaxplan
COPY TO E:\SQL_File_Loads\insuredtaxplan_full.txt DELIMITED WITH CHAR "~"
? "Finished chgdent"
use



? "***** Load Completed *****"


set default to "E:\MDM\MainTest\Data\"

SYS(3050, 1, MIN(536870912, VAL(SYS(3050, 1, 0))))

delete file EDITrans_InBound.dbf

select claim_no,mline(instring,1),mline(instring,2),mline(instring,3),mline(instring,4),mline(instring,5);
from editrans;
where;
	claim_no > 1251325;
	and claim_type = "H";
	and comm_type <> 0;
into table EDITrans_InBound

select 1
use
select 3
use

delete file EDITrans_OutBound.dbf

select claim_no,mline(outstring,1),mline(outstring,2),mline(outstring,3),mline(outstring,4);
from editrans;
where;
	claim_no > 1251325;
	and claim_type = "H";
	and comm_type <> 0;
into table EDITrans_OutBound

select 1
use
select 3
use

delete file SentEmails.dbf

select Ref_no,Type,Status,Sched_dt,Sent_dt,mline(email,2) + "                              " as to_email,mline(email,4) + "                              " as from_email,id;
from emailout;
into table SentEmails

select 1
use
select 3
use
select 4
use

delete file API_Trans_SQL.dbf

select;
	Trans_id,;
	Date_Time,;
	API_Key,;
	Cli_no,;
	Emp_No,;
	left(trim(script),250) as "Script",;
	left(trim(json_in),250) as "Json_In",;
	left(trim(json_out),250) as "Jason_Out",;
	left(trim(json_final),250) as "Jason_Final",;
	Errors,;
	Processed;
from Api_trans;
into table API_Trans_SQL


clear

? "***** Start data loads *****"

delete file E:\SQL_File_Loads\premcost_full.txt

? "Start premcost load"
use premcost
COPY TO E:\SQL_File_Loads\premcost_full.txt DELIMITED WITH CHAR "|"
? "Finish premcost load"
use

delete file E:\SQL_File_Loads\emp_full.txt
? "Start emp load"
use emp
COPY TO E:\SQL_File_Loads\emp_full.txt DELIMITED WITH CHAR "~"
? "Finish emp load"
use

delete file E:\SQL_File_Loads\adj_full.txt
? "Start adj load"
use adj
COPY TO E:\SQL_File_Loads\adj_full.txt DELIMITED WITH CHAR "~"
? "Finish adj load"
use


delete file E:\SQL_File_Loads\claim_full.txt
? "Start claim load"
use claim
COPY TO E:\SQL_File_Loads\claim_full.txt DELIMITED WITH CHAR "~"
? "Finish claim load"
use

delete file E:\SQL_File_Loads\chgemp_full.txt
? "Start chgemp load"
use chgemp
COPY TO E:\SQL_File_Loads\chgemp_full.txt DELIMITED WITH CHAR "~"
? "Finish chgemp load"
use

delete file E:\SQL_File_Loads\invoice_full.txt
? "Start invoice load"
use invoice
COPY TO E:\SQL_File_Loads\invoice_full.txt DELIMITED WITH CHAR "~"
? "Finish invoice load"
use

delete file E:\SQL_File_Loads\invoiceaso_full.txt
? "Start invoiceaso load"
use invoiceaso
COPY TO E:\SQL_File_Loads\invoiceaso_full.txt DELIMITED WITH CHAR "~"
? "Finish invoiceaso load"
use

delete file E:\SQL_File_Loads\invoiceins_full.txt
? "Start invoiceins load"
use invoiceins
COPY TO E:\SQL_File_Loads\invoiceins_full.txt DELIMITED WITH CHAR "~"
? "Finish invoiceaso load"


delete file E:\SQL_File_Loads\client_full.txt

use client
update client set contact2 = "" where cli_no = 1000125
use
use client
? "Start client load"
COPY TO E:\SQL_File_Loads\client_full.txt DELIMITED WITH CHAR "~"
? "Finish client load"

delete file E:\SQL_File_Loads\invoiceinsbalance_full.txt

use
use invoiceinsbalance
? "Start invoicebalance load"
COPY TO E:\SQL_File_Loads\invoiceinsbalance_full.txt DELIMITED WITH CHAR "~"
? "Finsih invoicebalance load"
use

delete file E:\SQL_File_Loads\empcoverage_full.txt
? "Start empcoverages load"
use empcoverage
COPY TO E:\SQL_File_Loads\empcoverage_full.txt DELIMITED WITH CHAR "~"
? "Finish empcoverages load"
use

delete file E:\SQL_File_Loads\claimdc_full.txt
? "Start claimdc load"
use claimdc
COPY TO E:\SQL_File_Loads\claimdc_full.txt DELIMITED WITH CHAR "~"
? "Finish claimdc load"
use

? "Pack Claimdd"
pack claimdd

delete file E:\SQL_File_Loads\claimdd_full.txt
? "Start claimdd load"
use claimdd
COPY TO E:\SQL_File_Loads\claimdd_full.txt DELIMITED WITH CHAR "~"
? "Finish claimdd load"
use

? "Pack claimhd table"
pack claimhd

delete file E:\SQL_File_Loads\claimhd_full.txt
? "Start claimhd load"
use claimhd
COPY TO E:\SQL_File_Loads\claimhd_full.txt DELIMITED WITH CHAR "~"
? "Finish claimhd load"

use

delete file E:\SQL_File_Loads\dcclaim_full.txt
? "Start dcclaim load"
use dcclaim
COPY TO E:\SQL_File_Loads\dcclaim_full.txt DELIMITED WITH CHAR "<"
? "Finish dcclaim load"


use

delete file E:\SQL_File_Loads\InvoiceInsAgentNetCommissions_full.txt
? "Start InvoiceInsAgentNetCommissions Load"

use InvoiceInsAgentNetCommissions
COPY TO E:\SQL_File_Loads\InvoiceInsAgentNetCommissions_full.txt DELIMITED WITH CHAR "|"
? "Finish InvoiceInsAgentNetCommissions load"



use

delete file E:\SQL_File_Loads\chgclass_full.txt
? "Start chgclass load"
use chgclass
COPY TO E:\SQL_File_Loads\chgclass_full.txt DELIMITED WITH CHAR "~"
? "Finish chgclass load"
use



use

delete file E:\SQL_File_Loads\cliclass_full.txt
? "Start cliclass load"
use cliclass
COPY TO E:\SQL_File_Loads\cliclass_full.txt DELIMITED WITH CHAR "~"
? "Finish cliclass load"
use

use

delete file E:\SQL_File_Loads\dirtran_full.txt
? "Start dirtran load"
use dirtran
COPY TO E:\SQL_File_Loads\dirtran_full.txt DELIMITED WITH CHAR "~"
? "Finish dirtran load"
use


use

delete file E:\SQL_File_Loads\beninfo_full.txt
? "Start beninfo load"
use beninfo
COPY TO E:\SQL_File_Loads\beninfo_full.txt DELIMITED WITH CHAR "~"
? "Finish beninfo load"
use


use

delete file E:\SQL_File_Loads\chgbenin_full.txt
? "Start chgbenin load"
use chgbenin
COPY TO E:\SQL_File_Loads\chgbenin_full.txt DELIMITED WITH CHAR "~"
? "Finish chgbenin load"
use


use

delete file E:\SQL_File_Loads\wwwuser_full.txt
? "Start wwwuser load"
use www_user
COPY TO E:\SQL_File_Loads\wwwuser_full.txt DELIMITED WITH CHAR "`"
? "Finish www_user load"
use



delete file E:\SQL_File_Loads\Drugexc_full.txt
? "Start drugexc load"
use drugexc
COPY TO E:\SQL_File_Loads\drugexc_full.txt DELIMITED WITH CHAR "~"
? "Finish drugexc load"
use

delete file E:\SQL_File_Loads\classehc_full.txt
? "Start classehc load"
use classehc
COPY TO E:\SQL_File_Loads\classehc_full.txt DELIMITED WITH CHAR "~"
? "Finish classehc load"
use

? "Pack Depends Table"
pack depends

delete file E:\SQL_File_Loads\depends_full.txt
? "Start depends load"
use depends
COPY TO E:\SQL_File_Loads\depends_full.txt DELIMITED WITH CHAR "~"
? "Finish depends load"
use

delete file E:\SQL_File_Loads\insurer_policy_full.txt
? "Start insurer_policy load"
use insurer_policy
COPY TO E:\SQL_File_Loads\insurer_policy_full.txt DELIMITED WITH CHAR "~"
? "Finish insurer_policy load"
use

delete file E:\SQL_File_Loads\chgdeps_full.txt
? "Start chgdeps load"
use chgdeps
COPY TO E:\SQL_File_Loads\chgdeps_full.txt DELIMITED WITH CHAR "~"
? "Finish chgdeps load"
use



delete file E:\SQL_File_Loads\studinfo_full.txt
? "Start studinfo load"
use studinfo
COPY TO E:\SQL_File_Loads\studinfo_full.txt DELIMITED WITH CHAR "~"
? "Finish studinfo load"
use


delete file E:\SQL_File_Loads\EDItrans_Outbound_full.txt
? "Start EDITrans_Outbound load"
use EDITrans_Outbound
COPY TO E:\SQL_File_Loads\EDITrans_Outbound_full.txt DELIMITED WITH CHAR "~"
? "Finish EDITrans_Outbound load"
use


delete file E:\SQL_File_Loads\EDItrans_Inbound_full.txt
? "Start EDITrans_Inbound load"
use EDITrans_Inbound
COPY TO E:\SQL_File_Loads\EDITrans_Inbound_full.txt DELIMITED WITH CHAR "~"
? "Finish EDITrans_Inbound load"
use


delete file E:\SQL_File_Loads\app_claims_full.txt
? "Start app_claims load"
use app_claims
COPY TO E:\SQL_File_Loads\app_claims_full.txt DELIMITED WITH CHAR "~"
? "Finish app_claims load"
use


delete file E:\SQL_File_Loads\has_emp_full.txt
? "Start hsa_emp load"
use hsa_emp
COPY TO E:\SQL_File_Loads\has_emp_full.txt DELIMITED WITH CHAR "~"
? "Finish hsa_emp load"
use



delete file E:\SQL_File_Loads\hsa_class_full.txt
? "Start hsa_class load"
use hsa_class
COPY TO E:\SQL_File_Loads\hsa_class_full.txt DELIMITED WITH CHAR "~"
? "Finish hsa_class load"
use

delete file E:\SQL_File_Loads\import_client_map_full.txt
? "Start import_client_map load"
use import_client_map
COPY TO E:\SQL_File_Loads\import_client_map_full.txt DELIMITED WITH CHAR "~"
? "Finish import_client_map load"
use

delete file E:\SQL_File_Loads\Chgcli_full.txt
? "Start ChgCli load"
use ChgCli
COPY TO E:\SQL_File_Loads\Chgcli_full.txt DELIMITED WITH CHAR "|"
? "Finish ChgCli load"
use

delete file E:\SQL_File_Loads\PremCost2_full.txt
? "Start PremCost2 load"
use premcost2
COPY TO E:\SQL_File_Loads\PremCost2_full.txt DELIMITED WITH CHAR "~"
? "Finish PremCost2 load"
use


delete file E:\SQL_File_Loads\Asocomreport_full.txt
? "Start Asocomreport load"
use Asocomreport
COPY TO E:\SQL_File_Loads\Asocomreport_full.txt DELIMITED WITH CHAR "~"
? "Finish Asocomreport load"
use

delete file E:\SQL_File_Loads\InvoiceTax_full.txt
? "Start InvoiceTax load"
use InvoiceTax
COPY TO E:\SQL_File_Loads\InvoiceTax_full.txt DELIMITED WITH CHAR "~"
? "Finish InvoiceTax load"
use

delete file E:\SQL_File_Loads\Ibcaddre_full.txt
? "Start Ibcaddre load"
use Ibcaddre
COPY TO E:\SQL_File_Loads\Ibcaddre_full.txt DELIMITED WITH CHAR "~"
? "Ibcaddre load"
use

delete file E:\SQL_File_Loads\Bankclm_full.txt
? "Start Bankclm load"
use Bankclm
COPY TO E:\SQL_File_Loads\Bankclm_full.txt DELIMITED WITH CHAR "~"
? "Bankclm load"
use

delete file E:\SQL_File_Loads\Users_full.txt
? "Start Users load"
use Users
COPY TO E:\SQL_File_Loads\Users_full.txt DELIMITED WITH CHAR "|"
? "Finished Users load"
use


delete file E:\SQL_File_Loads\SentEmails_full.txt
? "Start SentEmails load"
use SentEmails
COPY TO E:\SQL_File_Loads\SentEmails_full.txt DELIMITED WITH CHAR "~"
? "Finished SentEmails load"
use

delete file E:\SQL_File_Loads\Agency237CommissionSplitData_full.txt
? "Start Agency237CommissionSplitData load"
use Agency237CommissionSplitData
COPY TO E:\SQL_File_Loads\Agency237CommissionSplitData_full.txt DELIMITED WITH CHAR "~"
? "Finished Agency237CommissionSplitData load"
use

delete file E:\SQL_File_Loads\agency_commissions_full.txt
? "Start agency_commissions load"
use agency_commissions
COPY TO E:\SQL_File_Loads\agency_commissions_full.txt DELIMITED WITH CHAR "~"
? "Finished Aagency_commissions load"
use


delete file E:\SQL_File_Loads\arec_full.txt
? "Start arecload"
use arec
COPY TO E:\SQL_File_Loads\arec_full.txt DELIMITED WITH CHAR "~"
? "Finished arec load"
use

delete file E:\SQL_File_Loads\arex_full.txt
? "Start arex load"
use arex
COPY TO E:\SQL_File_Loads\arex_full.txt DELIMITED WITH CHAR "~"
? "Finished arex load"
use


delete file E:\SQL_File_Loads\ARHIST_full.txt
? "Start ARHIST load"
use ARHIST
COPY TO E:\SQL_File_Loads\ARHIST_full.txt DELIMITED WITH CHAR "~"
? "Finished ARHIST load"
use

delete file E:\SQL_File_Loads\aso_outstanding_full.txt
? "Start aso_outstanding load"
use aso_outstanding
COPY TO E:\SQL_File_Loads\aso_outstanding_full.txt DELIMITED WITH CHAR "~"
? "Finished aso_outstanding load"
use

delete file E:\SQL_File_Loads\aso_remit_full.txt
? "Start aso_remit load"
use aso_remit
COPY TO E:\SQL_File_Loads\aso_remit_full.txt DELIMITED WITH CHAR "~"
? "Finished aso_remit load"
use


delete file E:\SQL_File_Loads\AsoAcctRec_full.txt
? "Start AsoAcctRec load"
use AsoAcctRec
COPY TO E:\SQL_File_Loads\AsoAcctRec_full.txt DELIMITED WITH CHAR "~"
? "Finished AsoAcctRec load"
use

delete file E:\SQL_File_Loads\asoarec_full.txt
? "Start asoarec load"
use asoarec
COPY TO E:\SQL_File_Loads\asoarec_full.txt DELIMITED WITH CHAR "~"
? "Finished asoarecload"
use


delete file E:\SQL_File_Loads\asoarex_full.txt
? "Start asoarex load"
use asoarex
COPY TO E:\SQL_File_Loads\asoarex_full.txt DELIMITED WITH CHAR "~"
? "Finished asoarex"
use

delete file E:\SQL_File_Loads\asoarhis_full.txt
? "Start asoarhis load"
use asoarhis
COPY TO E:\SQL_File_Loads\asoarhis_full.txt DELIMITED WITH CHAR "~"
? "Finished asoarhis"
use


delete file E:\SQL_File_Loads\asocomreport_full.txt
? "Start asocomreport load"
use asocomreport
COPY TO E:\SQL_File_Loads\asocomreport_full.txt DELIMITED WITH CHAR "~"
? "Finished asocomreport"
use


delete file E:\SQL_File_Loads\ASOSplitComReport_full.txt
? "Start ASOSplitComReport load"
use ASOSplitComReport
COPY TO E:\SQL_File_Loads\ASOSplitComReport_full.txt DELIMITED WITH CHAR "~"
? "Finished ASOSplitComReport"
use

delete file E:\SQL_File_Loads\billing_schedule_full.txt
? "Start billing_schedule load"
use billing_schedule
COPY TO E:\SQL_File_Loads\billing_schedule_full.txt DELIMITED WITH CHAR "~"
? "Finished billing_schedule"
use


delete file E:\SQL_File_Loads\claimtot_full.txt
? "Start claimtot load"
use claimtot
COPY TO E:\SQL_File_Loads\claimtot_full.txt DELIMITED WITH CHAR "~"
? "Finished claimtot"
use


delete file E:\SQL_File_Loads\InsuredInvoiceStm_full.txt
? "Start InsuredInvoiceStmload"
use InsuredInvoiceStm
COPY TO E:\SQL_File_Loads\InsuredInvoiceStm_full.txt DELIMITED WITH CHAR "~"
? "Finished InsuredInvoiceStm"
use

delete file E:\SQL_File_Loads\insurerratehistory_full.txt
? "Start insurerratehistory load"
use insurerratehistory
COPY TO E:\SQL_File_Loads\insurerratehistory_full.txt DELIMITED WITH CHAR "~"
? "Finished insurerratehistory"
use

delete file E:\SQL_File_Loads\InvoiceAsoByClass_full.txt
? "Start InvoiceAsoByClass load"
use InvoiceAsoByClass
COPY TO E:\SQL_File_Loads\InvoiceAsoByClass_full.txt DELIMITED WITH CHAR "~"
? "Finished InvoiceAsoByClass"
use

delete file E:\SQL_File_Loads\InvoiceAsoHFees_full.txt
? "Start InvoiceAsoHFees load"
use InvoiceAsoHFees
COPY TO E:\SQL_File_Loads\InvoiceAsoHFees_full.txt DELIMITED WITH CHAR "~"
? "Finished InvoiceAsoHFees"
use


delete file E:\SQL_File_Loads\InvoiceInsCoopCostPremium_full.txt
? "Start InvoiceInsCoopCostPremium load"
use InvoiceInsCoopCostPremium
COPY TO E:\SQL_File_Loads\InvoiceInsCoopCostPremium_full.txt DELIMITED WITH CHAR "~"
? "Finished InvoiceInsCoopCostPremium"
use


delete file E:\SQL_File_Loads\InvoiceInsurerStm_full.txt
? "Start InvoiceInsurerStm load"
use InvoiceInsurerStm
COPY TO E:\SQL_File_Loads\InvoiceInsurerStm_full.txt DELIMITED WITH CHAR "~"
? "Finished InvoiceInsurerStm"
use

delete file E:\SQL_File_Loads\InvoiceTaxByClass_full.txt
? "Start InvoiceTaxByClass load"
use InvoiceTaxByClass
COPY TO E:\SQL_File_Loads\InvoiceTaxByClass_full.txt DELIMITED WITH CHAR "~"
? "Finished InvoiceInsurerStm"
use

delete file E:\SQL_File_Loads\guardme_claim_map_full.txt
? "Start guardme_claim_map load"
use guardme_claim_map
COPY TO E:\SQL_File_Loads\guardme_claim_map_full.txt DELIMITED WITH CHAR "~"
? "Finished guardme_claim_map"
use


delete file E:\SQL_File_Loads\hsa_journal_full.txt
? "Start hsa_journal load"
use hsa_journal
COPY TO E:\SQL_File_Loads\hsa_journal_full.txt DELIMITED WITH CHAR "~"
? "Finished hsa_journal"
use

delete file E:\SQL_File_Loads\LBILL_full.txt
? "Start LBILL load"
use LBILL
COPY TO E:\SQL_File_Loads\LBILL_full.txt DELIMITED WITH CHAR "~"
? "Finished LBILL"
use

delete file E:\SQL_File_Loads\masterid_full.txt
? "Start masterid load"
use masterid
COPY TO E:\SQL_File_Loads\masterid_full.txt DELIMITED WITH CHAR "~"
? "Finished masterid"
use


delete file E:\SQL_File_Loads\monthendrate_full.txt
? "Start monthendrate load"
use monthendrate
COPY TO E:\SQL_File_Loads\monthendrate_full.txt DELIMITED WITH CHAR "~"
? "Finished monthendrate"
use

delete file E:\SQL_File_Loads\pap_full.txt
? "Start pap load"
use pap
COPY TO E:\SQL_File_Loads\pap_full.txt DELIMITED WITH CHAR "~"
? "Finished pap"
use


delete file E:\SQL_File_Loads\psa_journal_full.txt
? "Start psa_journal load"
use psa_journal
COPY TO E:\SQL_File_Loads\psa_journal_full.txt DELIMITED WITH CHAR "~"
? "Finished psa_journal"
use

delete file E:\SQL_File_Loads\claimwd_full.txt
? "Start claimwd load"
use claimwd
COPY TO E:\SQL_File_Loads\claimwd_full.txt DELIMITED WITH CHAR "~"
? "Finished claimwd"
use


delete file E:\SQL_File_Loads\claimwi_full.txt
? "Start claimwi load"
use claimwi
COPY TO E:\SQL_File_Loads\claimwi_full.txt DELIMITED WITH CHAR "~"
? "Finished claimwi"
use


delete file E:\SQL_File_Loads\EFT_full.txt
? "Start EFT load"
use EFT
COPY TO E:\SQL_File_Loads\EFT_full.txt DELIMITED WITH CHAR "~"
? "Finished EFT"
use

delete file E:\SQL_File_Loads\hsa_deposits_full.txt
? "Start hsa_deposits load"
use hsa_deposits
COPY TO E:\SQL_File_Loads\hsa_deposits_full.txt DELIMITED WITH CHAR "~"
? "Finished hsa_deposits"
use

delete file E:\SQL_File_Loads\hsa_jrnl_detail_full.txt
? "Start hsa_jrnl_detail load"
use hsa_jrnl_detail
COPY TO E:\SQL_File_Loads\hsa_jrnl_detail_full.txt DELIMITED WITH CHAR "~"
? "Finished hsa_jrnl_detail"
use


delete file E:\SQL_File_Loads\stoploss_full.txt
? "Start stoploss load"
use stoploss
COPY TO E:\SQL_File_Loads\stoploss_full.txt DELIMITED WITH CHAR "~"
? "Finished stoploss"
use


delete file E:\SQL_File_Loads\chgstpls_full.txt
? "Start chgstpls load"
use chgstpls
COPY TO E:\SQL_File_Loads\chgstpls_full.txt DELIMITED WITH CHAR "~"
? "Finished chgstpls"
use


delete file E:\SQL_File_Loads\ehc_class_plan_types_full.txt
? "Start ehc_class_plan_types load"
use ehc_class_plan_types
COPY TO E:\SQL_File_Loads\ehc_class_plan_types_full.txt DELIMITED WITH CHAR "~"
? "Finished ehc_class_plan_types"
use



delete file E:\SQL_File_Loads\chg_class_plan_types_full.txt
? "Start chg_class_plan_types load"
use Chg_Class_Plan_Types
COPY TO E:\SQL_File_Loads\chg_class_plan_types_full.txt DELIMITED WITH CHAR "~"
? "Finished chg_class_plan_types"
use


delete file E:\SQL_File_Loads\ehc_adj_new_full.txt
? "Start ehc_adj_new load"
use ehc_adj_new
COPY TO E:\SQL_File_Loads\ehc_adj_new_full.txt DELIMITED WITH CHAR "~"
? "Finished ehc_adj_new"
use


delete file E:\SQL_File_Loads\psa_class_full.txt
? "Start psa_class load"
use psa_class
COPY TO E:\SQL_File_Loads\psa_class_full.txt DELIMITED WITH CHAR "~"
? "Finished psa_class"
use


delete file E:\SQL_File_Loads\psa_emp_full.txt
? "Start psa_emp load"
use psa_emp
COPY TO E:\SQL_File_Loads\psa_emp_full.txt DELIMITED WITH CHAR "~"
? "Finished psa_emp"
use


delete file E:\SQL_File_Loads\PSA_deposits_full.txt
? "Start PSA_deposits load"
use PSA_deposits
COPY TO E:\SQL_File_Loads\PSA_deposits_full.txt DELIMITED WITH CHAR "~"
? "Finished PSA_deposits"
use

delete file E:\SQL_File_Loads\psa_jrnl_detail_full.txt
? "Start psa_jrnl_detail load"
use psa_jrnl_detail
COPY TO E:\SQL_File_Loads\psa_jrnl_detail_full.txt DELIMITED WITH CHAR "~"
? "Finished psa_jrnl_detail"
use

delete file E:\SQL_File_Loads\clientagencyasocommsplit_detail_full.txt
? "Start clientagencyasocommsplit load"
use clientagencyasocommsplit
COPY TO E:\SQL_File_Loads\clientagencyasocommsplit_detail_full.txt DELIMITED WITH CHAR "~"
? "Finished clientagencyasocommsplit"
use

delete file E:\SQL_File_Loads\Cliclass2_detail_full.txt
? "Start Cliclass2 load"
use Cliclass2
COPY TO E:\SQL_File_Loads\cliclass2_detail_full.txt DELIMITED WITH CHAR "~"
? "Finished Cliclass2"
use

delete file E:\SQL_File_Loads\hsa_pending_detail_full.txt
? "Start hsa_pending load"
use hsa_pending
COPY TO E:\SQL_File_Loads\hsa_pending_detail_full.txt DELIMITED WITH CHAR "~"
? "Finished hsa_pending"
use

delete file E:\SQL_File_Loads\InvoiceAsoDeposits_full.txt
? "Start InvoiceAsoDeposits load"
use InvoiceAsoDeposits
COPY TO E:\SQL_File_Loads\InvoiceAsoDeposits_full.txt DELIMITED WITH CHAR "~"
? "Finished InvoiceAsoDeposits"
use

delete file E:\SQL_File_Loads\InvoiceAsoDepositsstatus_full.txt
? "Start InvoiceAsoDepositsstatus load"
use InvoiceAsoDepositsstatus
COPY TO E:\SQL_File_Loads\InvoiceAsoDepositsstatus_full.txt DELIMITED WITH CHAR "~"
? "Finished InvoiceAsoDepositsstatus"
use


delete file E:\SQL_File_Loads\ClientAgencyCommSplit_full.txt
? "Start ClientAgencyCommSplit load"
use ClientAgencyCommSplit
COPY TO E:\SQL_File_Loads\ClientAgencyCommSplit_full.txt DELIMITED WITH CHAR "~"
? "Finished ClientAgencyCommSplit"
use


delete file E:\SQL_File_Loads\adj2_full.txt
? "Start adj2 load"
use adj2
COPY TO E:\SQL_File_Loads\adj2_full.txt DELIMITED WITH CHAR "~"
? "Finished adj2"
use


delete file E:\SQL_File_Loads\asodisjr_full.txt
? "Start asodisjr load"
use asodisjr
COPY TO E:\SQL_File_Loads\asodisjr_full.txt DELIMITED WITH CHAR "~"
? "Finished asodisjr"
use

delete file E:\SQL_File_Loads\asorecjr_full.txt
? "Start asorecjr load"
use asorecjr
COPY TO E:\SQL_File_Loads\asorecjr_full.txt DELIMITED WITH CHAR "~"
? "Finished asorecjr"
use


delete file E:\SQL_File_Loads\recjrl_full.txt
? "Start recjrl load"
use recjrl
COPY TO E:\SQL_File_Loads\recjrl_full.txt DELIMITED WITH CHAR "~"
? "Finished recjrl"
use



delete file E:\SQL_File_Loads\disjrl_full.txt
? "Start disjrl load"
use disjrl
COPY TO E:\SQL_File_Loads\disjrl_full.txt DELIMITED WITH CHAR "~"
? "Finished disjrl"
use


delete file E:\SQL_File_Loads\dentalchanges_full.txt
? "Start dentalchanges load"
use dentalchanges
COPY TO E:\SQL_File_Loads\dentalchanges_full.txt DELIMITED WITH CHAR "~"
? "Finished dentalchanges"
use


delete file E:\SQL_File_Loads\dental_level_full.txt
? "Start dental_level load"
use dental_level
COPY TO E:\SQL_File_Loads\dental_level_full.txt DELIMITED WITH CHAR "~"
? "Finished dental_level"
use

delete file E:\SQL_File_Loads\www_admin_full.txt
? "Start www_admin load"
use www_admin
COPY TO E:\SQL_File_Loads\www_admin_full.txt DELIMITED WITH CHAR "~"
? "Finished www_admin"
use

delete file E:\SQL_File_Loads\dental_procedure_full.txt
? "Start dental_procedure load"
use dental_procedure
COPY TO E:\SQL_File_Loads\dental_procedure_full.txt DELIMITED WITH CHAR "~"
? "Finished dental_procedure"
use



delete file E:\SQL_File_Loads\ibcgroup_full.txt
? "Start dental_procedure load"
use ibcgroup
COPY TO E:\SQL_File_Loads\ibcgroup_full.txt DELIMITED WITH CHAR "~"
? "Finished ibcgroup"
use

delete file E:\SQL_File_Loads\Dental_Fee_full.txt
? "Start Dental_Fee load"
use Dental_Fee
COPY TO E:\SQL_File_Loads\Dental_Fee_full.txt DELIMITED WITH CHAR "~"
? "Finished Dental_Fee"
use

delete file E:\SQL_File_Loads\API_Trans_SQL_full.txt
? "Start API_Trans_SQL load"
use API_Trans_SQL
COPY TO E:\SQL_File_Loads\API_Trans_SQL_full.txt DELIMITED WITH CHAR "~"
? "Finished API_Trans_SQL"
use

delete file E:\SQL_File_Loads\Acp_full.txt
? "Start Acp load"
use Acp
COPY TO E:\SQL_File_Loads\Acp_full.txt DELIMITED WITH CHAR "~"
? "Finished Acp"
use


delete file E:\SQL_File_Loads\Bank_full.txt
? "Start Bank load"
use Bank
COPY TO E:\SQL_File_Loads\Bank_full.txt DELIMITED WITH CHAR "~"
? "Finished Bank"
use


delete file E:\SQL_File_Loads\Bank_acc_full.txt
? "Start Bank_acc load"
use Bank_acc
COPY TO E:\SQL_File_Loads\Bank_acc_full.txt DELIMITED WITH CHAR "~"
? "Finished Bank_acc"
use

delete file E:\SQL_File_Loads\Bankdc_full.txt
? "Start Bankdc load"
use Bankdc
COPY TO E:\SQL_File_Loads\Bankdc_full.txt DELIMITED WITH CHAR "~"
? "Finished Bankdc"
use



delete file E:\SQL_File_Loads\Chamber_full.txt
? "Start Chamber load"
use Chamber
COPY TO E:\SQL_File_Loads\Chamber_full.txt DELIMITED WITH CHAR "~"
? "Finished Chamber"
use


delete file E:\SQL_File_Loads\chgclass2_full.txt
? "Start chgclass2 load"
use chgclass2
COPY TO E:\SQL_File_Loads\chgclass2_full.txt DELIMITED WITH CHAR "~"
? "Finished chgclass2"
use



delete file E:\SQL_File_Loads\claims_bank_balance_full.txt
? "Start claims_bank_balance load"
use claims_bank_balance
COPY TO E:\SQL_File_Loads\claims_bank_balance_full.txt DELIMITED WITH CHAR "~"
? "Finished claims_bank_balance"
use


delete file E:\SQL_File_Loads\clientlocinvemailadresses_full.txt
? "Start clientlocinvemailadresses load"
use clientlocinvemailadresses
COPY TO E:\SQL_File_Loads\clientlocinvemailadresses_full.txt DELIMITED WITH CHAR "~"
? "Finished clientlocinvemailadresses"
use


delete file E:\SQL_File_Loads\dirtrrj_full.txt
? "Start dirtrrj load"
use dirtrrj
COPY TO E:\SQL_File_Loads\dirtrrj_full.txt DELIMITED WITH CHAR "~"
? "Finished dirtrrj"
use



delete file E:\SQL_File_Loads\email_template_full.txt
? "Start email_template load"
use email_template
COPY TO E:\SQL_File_Loads\email_template_full.txt DELIMITED WITH CHAR "~"
? "Finished email_template"
use



delete file E:\SQL_File_Loads\emailout_full.txt
? "Start emailout load"
use emailout
COPY TO E:\SQL_File_Loads\emailout_full.txt DELIMITED WITH CHAR "~"
? "Finished emailout"
use


delete file E:\SQL_File_Loads\Guardme_policies_full.txt
? "Start Guardme_policies load"
use Guardme_policies
COPY TO E:\SQL_File_Loads\Guardme_policies_full.txt DELIMITED WITH CHAR "~"
? "Finished Guardme_policies"
use



delete file E:\SQL_File_Loads\chg_dent_full.txt
? "Start chgdent load"
use chgdent
COPY TO E:\SQL_File_Loads\chg_dent_full.txt DELIMITED WITH CHAR "~"
? "Finished chgdent"
use


delete file E:\SQL_File_Loads\ehc_class_plan_drugs_full.txt
? "Start ehc_class_plan_drugsload"
use ehc_class_plan_drugs
COPY TO E:\SQL_File_Loads\ehc_class_plan_drugs_full.txt DELIMITED WITH CHAR "~"
? "Finished ehc_class_plan_drugs"
use


delete file E:\SQL_File_Loads\ChgEmp_Monitor_full.txt
? "Start Chg_Emp_Monitorload"
use ChgEmp_Monitor
COPY TO E:\SQL_File_Loads\ChgEmp_Monitor_full.txt DELIMITED WITH CHAR "~"
? "Finished ChgEmp_Monitor"
use


delete file E:\SQL_File_Loads\EmpLog_full.txt
? "Start EmpLog load"
use EmpLog
COPY TO E:\SQL_File_Loads\EmpLog_full.txt DELIMITED WITH CHAR "~"
? "Finished EmpLog"
use



delete file E:\SQL_File_Loads\Trxtype_full.txt
? "Start Trxtype load"
use TrxType
COPY TO E:\SQL_File_Loads\Trxtype_full.txt DELIMITED WITH CHAR "~"
? "Finished Trxtype"
use


delete file E:\SQL_File_Loads\Reimburesment_full.txt
? "Start Reimburesment load"
use reimbursement
COPY TO E:\SQL_File_Loads\Reimburesment_full.txt DELIMITED WITH CHAR "~"
? "Finished Reimbursment"
use


delete file E:\SQL_File_Loads\EHC_Procedure_full.txt
? "StartEHC_Procedure  load"
use EHC_Procedure
COPY TO E:\SQL_File_Loads\EHC_Procedure_full.txt DELIMITED WITH CHAR "~"
? "Finished EHC_Procedure"
use

delete file E:\SQL_File_Loads\cldentch_full.txt
? "Start  cldentchload"
use cldentch
COPY TO E:\SQL_File_Loads\cldentch_full.txt DELIMITED WITH CHAR "~"
? "Finished cldentch"
use






? "***** Finish Data Loads *****"








PROCEDURE RegisterFiles
	LPARAMETER lpWhatLocation, lpWhatExtension, lpGlobalPW
	
	lpWhatLocation = "E:\MDM\MainTest\Charts\"

	LOCAL str1, str2, str3, lErrCode
	str1 = m.lpWhatLocation + "*." + lpWhatExtension
	str2 = SYS(2000,str1)
	str3 = m.lpWhatLocation + str2

	DO WHILE LEN(str2)>0
		lErrCode = CRYPT_register(str3, m.lpGlobalPW)
		IF lErrCode<0 .AND. lErrCode<>-6 then	&& report all errors other then -6 already registered
			=MESSAGEBOX("Error registering " + str3 + " (" + CRYPT_GetErrorMsg(lErrCode) + ")")
		ENDIF

		str2 = SYS(2000, str1, 1)
		str3 = m.lpWhatLocation + str2

	ENDDO

ENDPROC

PROCEDURE RegisterFiles2
	LPARAMETER lpWhatLocation, lpWhatExtension, lpGlobalPW
	
	lpWhatLocation = "E:\MDM\MainTest\Data\"

	LOCAL str1, str2, str3, lErrCode
	str1 = m.lpWhatLocation + "*." + lpWhatExtension
	str2 = SYS(2000,str1)
	str3 = m.lpWhatLocation + str2

	DO WHILE LEN(str2)>0
		lErrCode = CRYPT_register(str3, m.lpGlobalPW)
		IF lErrCode<0 .AND. lErrCode<>-6 then	&& report all errors other then -6 already registered
			=MESSAGEBOX("Error registering " + str3 + " (" + CRYPT_GetErrorMsg(lErrCode) + ")")
		ENDIF

		str2 = SYS(2000, str1, 1)
		str3 = m.lpWhatLocation + str2

	ENDDO

ENDPROC


---CTE begins-------------------------------------------------------------------
WITH TOTALS AS (
SELECT
    r.INVDATE AS T_INVDATE,
    SUM(r.TOTAL_CONTRACTS) AS T_TOTAL_CONTRACTS,
	SUM(r.NEW_CONTRACTS) AS T_NEW_CONTRACTS,
    SUM(
        r.OP_VOICE_MRC+
        r.OP_DATA_MRC+
        r.OP_SPEED_MRC+
        r.OP_COMBO_MRC+
        r.OP_2_YR+
        r.OP_3_YR)
            AS T_OP_MRC_TOTAL,
    SUM(
        r.POOL_OP_Group_MRC+
        r.POOL_OP_Memeber_MRC+
        r.POOL_OP_Memeber_Penalty)
            AS T_OP_POOL_MRC_TOTAL,
    SUM(
        r.SBD_MRC+
        r.SBD_Suspend+
        r.SBD_Annual)
            AS T_SBD_MRC_TOTAL,
    SUM(
        r.POOL_SBD_GROUP_MRC+
        r.POOL_SBD_MEMEBER_MRC+
        r.POOL_SBD_SUSPEND_PENALTY+
        r.POOL_SBD_PENALTY)
            AS T_SBD_POOL_MRC_TOTAL,
    SUM(
        r.M2M_MRC+
        r.M2M_Susp)
            AS T_M2M_MRC_TOTAL,
    SUM(
        r.TEL_MRC+
        r.TEL_PLUS1_MRC+
        r.TEL_ARC)
            AS T_TEL_MRC_TOTAL,
    SUM(
        r.Pool_TEL_Group_MRC+
        r.POOL_TEL_Memeber_MRC+
        r.POOL_TEL_Memeber_Penalty)
            AS T_TEL_POOL_MRC_TOTAL,
    SUM(
        r.PTT_TG_MRC+
        r.PTT_DVC_MRC)
            AS T_PTT_MRC_TOTAL,
    SUM(
        r.CERTUS_VOICE_MRC+
        r.CERTUS_DATA_MRC+
        r.CERTUS_DATA_ARC)
            AS T_CERTUS_MRC_TOTAL,
    SUM(
        r.POOL_Cert_GRP_MRC+
        r.POOL_Cert_GRP_ARC+
        r.POOL_Cert_Member_MRC+
        r.Pool_Certus_ARC+
        r.POOL_Certus_Penalty)
            AS T_CERTUS_POOL_MRC_TOTAL,
    SUM(
		r.PAG_MRC)
			AS T_PAG_MRC_TOTAL,
    SUM(
        r.OP_VOICE_USG_GROSS+
        r.OP_VOICE_USG_DISC+
        r.OP_DATA_USG_GROSS+
        r.OP_DATA_USG_DISC+
        r.OP_COMBO_USG_CREDITS)
            AS T_OP_USG_TOTAL,
    SUM(
        r.Pool_OP_Voice_USG_GROSS+
        r.Pool_OP_Voice_Bytes_GROSS)
            AS T_OP_POOL_USG_TOTAL,
    SUM(
        r.SBD_Usg_Gross+
        r.SBD_Data_Disc+
        r.SBD_Incremental_Disc+
        r.SBD_Cyclefold+
        r.Mailbox_Gross+
        r.Mailbox_Discount+
        r.SBD_Registrations_Gross+
        r.SBD_Registrations_Disc)
            AS T_SBD_USG_TOTAL,
    SUM(
        r.POOL_SBD_BYTES_GROSS+
        r.POOL_MBX_USG_GROSS+
        r.POOL_SBD_REG_USG_GROSS)
            AS T_SBD_POOL_USG_TOTAL,
    SUM(
        r.M2M_RUDICS_GROSS+
        r.M2M_RUDICS_DISCOUNT+
        r.M2M_RUDICS_CF+
        r.M2M_Bytes_Gross+
        r.M2M_Bytes_Discount+
        r.M2M_Bytes_CF+
        r.M2M_Mailbox_Gross+
        r.M2M_Mailbox_Disc+
        r.M2M_Registrations_Gross+
        r.M2M_Registrations_Disc)
            AS T_M2M_USG_TOTAL,
    SUM(
        r.TEL_VOICE_GROSS+
        r.TEL_VOICE_DISCOUNT+
        r.TEL_VOICE_CYCLEFOLD+
        r.TEL_DATA_GROSS+
        r.TEL_DATA_DISCOUNT+
        r.TEL_DATA_CYCLEFOLD+
        r.TEL_SMS_MO_GROSS+
        r.TEL_SMS_MO_DISC+
        r.TEL_SMS_MO_CYCLEFOLD)
            AS T_TEL_USG_TOTAL,
    SUM(
        r.Pool_TEL_Voice_USG_GROSS+
        r.Pool_TEL_Data_Secs_GROSS)
            AS T_TEL_POOL_USG_TOTAL,
    SUM(
        r.PTT_TG_Voice_GROSS+
        r.PTT_TG_Voice_DISCOUNT+
        r.PTT_TG_CYCLE_FOLD)
            AS T_PTT_USG_TOTAL,
    SUM(
        r.CERTUS_VOICE_GROSS+
        r.CERTUS_VOICE_DISCOUNT+
        r.CERTUS_VOICE_CYCLEFOLD+
        r.CERTUS_DATA_GROSS+
        r.CERTUS_DATA_DISC+
        r.CERTUS_DATA_CYCLEFOLD+
        r.CERTUS_IMT_GROSS+
        r.CERTUS_IMT_DISC+
        r.CERTUS_IMT_CYCLEFOLD+
        r.CERTUS_WALLET_USG_CREDITS)
            AS T_CERTUS_USG_TOTAL,
    SUM(
        r.POOL_CERTUS_GROSS)
            AS T_CERTUS_POOL_USG_TOTAL,
    SUM(
		r.PAG_GROSS+
		r.PAG_DISCOUNT+
		r.PAG_CYCLEFOLD)
			AS T_PAG_USG_TOTAL,
    SUM(
        r.OCC_OP_VOICE_MRC+
        r.OCC_OP_DATA_MRC+
        r.OCC_SPEED_MRC+
        r.OCC_OP_VOICE_USG+
        r.OCC_OP_DATA_USG+
        r.OCC_OP_VOICE_CYCLEFOLD+
        r.OCC_OP_DATA_CYCLEFOLD+
        r.OCC_OP_SCRATCH_CARDS)
            AS T_OP_OTF_TOTAL,
    SUM(
        r.Pool_OP_Activations+
        r.Pool_OP_Deactivations)
            AS T_OP_POOL_OTF_TOTAL,
    SUM(
        r.SBD_Activations+
        r.SBD_Activations_Credits+
        r.SBD_Deactivations+
        r.SBD_MRC_OCC+
        r.OCC_SBD_Annual+
        r.OCC_SBD_Usg+
        r.OCC_SBD_Increm+
        r.OCC_SBD_Overage+
        r.OCC_SBD_Act+
        r.OCC_SBD_VPN_FEES+
        r.OCC_SBD_MISC)
            AS T_SBD_OTF_TOTAL,
    SUM(
        r.POOL_SBD_ACTIVATIONS)
            AS T_SBD_POOL_OTF_TOTAL,
    SUM(
        r.OCC_M2M_Access)
            AS T_M2M_OTF_TOTAL,
    SUM(
        r.TEL_ACTIVATIONS+
        r.OCC_TEL_MRC+
        r.OCC_TEL_PLUS1_MRC+
        r.OCC_TEL_USG+
        r.OCC_TEL_SMS_USG+
        r.PREPAID_CHARGE_EVOUCHERS+
        r.PREPAID_REFUND_EVOUCHERS+
        r.PREPAID_SPECIAL_HANDLING+
        r.OCC_TEL_SCRATCH_CARD+
        r.OCC_TEL_SIM_REACTIVATIONS+
        r.OCC_TEL_RUDICS_SETUP+
        r.OCC_TEL_CREDIT_CARD_USAGE+
        r.OCC_TEL_EVOUCHER+
        r.OCC_TEL_MISC)
            AS T_TEL_OTF_TOTAL,
    SUM(
        r.TEL_Pool_Activations+
        r.TEL_Pool_DeActivations)
            AS T_TEL_POOL_OTF_TOTAL,
    SUM(
        r.PTT_TG_Activations+
        r.PTT_DVC_Deactivations+
        r.PTT_TG_Deactivations+
        r.PTT_TG_1YR_CHANGE_FEE+
        r.OCC_PTT_TG_MRC+
        r.OCC_PTT_DVC_MRC+
        r.OCC_PTT_TG_VOICE_USG+
        r.OCC_PTT_TG_Activations+
        r.OCC_PTT_DVC_Activations+
        r.OCC_PTT_DVC_Other_Rev)
            AS T_PTT_OTF_TOTAL,
    SUM(
        r.CERTUS_DATA_ACTIVATIONS+
        r.CERTUS_ACTIVATIONS_CREDITS+
        r.CERTUS_DEACTIVATIONS+
        r.OCC_CERTUS_VERTICAL_DISC+
        r.OCC_CERTUS_VOICE_MRC+
        r.OCC_CERTUS_DATA_MRC+
        r.OCC_CERTUS_VOICE_USAGE+
        r.OCC_CERTUS_DATA_USAGE+
        r.OCC_CERTUS_IMT_USAGE+
        r.OCC_CERTUS_VOICE_SC+
        r.OCC_CERTUS_MISC)
            AS T_CERTUS_OTF_TOTAL,
    SUM(
        r.POOL_CERTUSACTS)       
            AS T_CERTUS_POOL_OTF_TOTAL,
    SUM(
		r.OCC_PAG_MRC+
		r.OCC_PAG_MISC)
			AS T_PAG_OTF_TOTAL,
    SUM(
        r.OCC_USFS+
        r.OCC_COLO+
        r.OCC_CONTRA_REV+
        r.OCC_SP_MISC+
        r.LPFS)
            AS T_SP_OTF_TOTAL,
	SUM(
		r.OP_VOICE_MRC+
        r.OP_DATA_MRC+
        r.OP_SPEED_MRC+
        r.OP_COMBO_MRC+
        r.OP_2_YR+
        r.OP_3_YR+
        r.OP_VOICE_USG_GROSS+
        r.OP_VOICE_USG_DISC+
        r.OP_VOICE_CYCLEFOLD+
        r.OP_DATA_USG_GROSS+
        r.OP_DATA_USG_DISC+
        r.OP_DATA_CYCLEFOLD+
        r.OP_COMBO_USG_CREDITS+
        r.OP_ACTIVATIONS+
        r.OP_DEACTIVATIONS+
        r.OP_2_YR_CHANGE_FEE+
        r.OP_3_YR_CHANGE_FEE+
        r.OCC_OP_VOICE_MRC+
        r.OCC_OP_DATA_MRC+
        r.OCC_SPEED_MRC+
        r.OCC_OP_VOICE_USG+
        r.OCC_OP_DATA_USG+
        r.OCC_OP_VOICE_CYCLEFOLD+
        r.OCC_OP_DATA_CYCLEFOLD+
        r.OCC_OP_SCRATCH_CARDS+
        r.OP_SIM_REACTIVATIONS+
        r.OP_MISC)
			AS T_TOTAL_OP,
	SUM(
		r.POOL_OP_Group_MRC+
        r.POOL_OP_Memeber_MRC+
        r.POOL_OP_Memeber_Penalty+
        r.Pool_OP_Voice_USG_GROSS+
        r.Pool_OP_Voice_Bytes_GROSS+
        r.Pool_OP_Activations+
        r.Pool_OP_Deactivations)
			AS T_TOTAL_OP_POOL,
	SUM(
		r.SBD_MRC+
        r.SBD_Suspend+
        r.SBD_Annual+
        r.SBD_Usg_Gross+
        r.SBD_Data_Disc+
        r.SBD_Incremental_Disc+
        r.SBD_Cyclefold+
        r.Mailbox_Gross+
        r.Mailbox_Discount+
        r.SBD_Registrations_Gross+
        r.SBD_Registrations_Disc+
        r.SBD_Activations+
        r.SBD_Activations_Credits+
        r.SBD_Deactivations+
        r.SBD_MRC_OCC+
        r.OCC_SBD_Annual+
        r.OCC_SBD_Usg+
        r.OCC_SBD_Increm+
        r.OCC_SBD_Overage+
        r.OCC_SBD_Act+
        r.OCC_SBD_VPN_FEES+
        r.OCC_SBD_MISC)
			AS T_TOTAL_SBD,
	SUM(
		r.POOL_SBD_GROUP_MRC+
        r.POOL_SBD_MEMEBER_MRC+
        r.POOL_SBD_SUSPEND_PENALTY+
        r.POOL_SBD_PENALTY+
        r.POOL_SBD_BYTES_GROSS+
        r.POOL_MBX_USG_GROSS+
        r.POOL_SBD_REG_USG_GROSS+
        r.POOL_SBD_ACTIVATIONS)
			AS T_TOTAL_SBD_POOL,
	SUM(
		r.M2M_MRC+
        r.M2M_Susp+
        r.M2M_RUDICS_GROSS+
        r.M2M_RUDICS_DISCOUNT+
        r.M2M_RUDICS_CF+
        r.M2M_Bytes_Gross+
        r.M2M_Bytes_Discount+
        r.M2M_Bytes_CF+
        r.M2M_Mailbox_Gross+
        r.M2M_Mailbox_Disc+
        r.M2M_Registrations_Gross+
        r.M2M_Registrations_Disc+
        r.OCC_M2M_Access)
			AS T_TOTAL_M2M,
	SUM(
		r.GDB_MRC+
		r.GDB_SUSPEND+
		r.GDB_GROSS+
		r.GDB_DISC+
		r.GDB_CF+
		r.GDB_ACTIVATIONS+
		r.GDB_DEACTS+
		r.OCC_GDB_MRC+
		r.OCC_GDB_USAGE+
		r.OCC_GDB_ACTIVATION+
		r.OCC_GDB_CYCLEFOLD+
		r.OCC_GDB_MISC)
			AS T_TOTAL_GDB,
	SUM(
		r.TEL_MRC+
        r.TEL_PLUS1_MRC+
        r.TEL_ARC+
        r.TEL_VOICE_GROSS+
        r.TEL_VOICE_DISCOUNT+
        r.TEL_VOICE_CYCLEFOLD+
        r.TEL_DATA_GROSS+
        r.TEL_DATA_DISCOUNT+
        r.TEL_DATA_CYCLEFOLD+
        r.TEL_SMS_MO_GROSS+
        r.TEL_SMS_MO_DISC+
        r.TEL_SMS_MO_CYCLEFOLD+
        r.TEL_ACTIVATIONS+
        r.OCC_TEL_MRC+
        r.OCC_TEL_PLUS1_MRC+
        r.OCC_TEL_USG+
        r.OCC_TEL_SMS_USG+
        r.PREPAID_CHARGE_EVOUCHERS+
        r.PREPAID_REFUND_EVOUCHERS+
        r.PREPAID_SPECIAL_HANDLING+
        r.OCC_TEL_SCRATCH_CARD+
        r.OCC_TEL_SIM_REACTIVATIONS+
        r.OCC_TEL_RUDICS_SETUP+
        r.OCC_TEL_CREDIT_CARD_USAGE+
        r.OCC_TEL_EVOUCHER+
        r.OCC_TEL_MISC)
			AS T_TOTAL_TEL,
	SUM(
		r.Pool_TEL_Group_MRC+
        r.POOL_TEL_Memeber_MRC+
        r.POOL_TEL_Memeber_Penalty+
        r.Pool_TEL_Voice_USG_GROSS+
        r.Pool_TEL_Data_Secs_GROSS+
        r.TEL_Pool_Activations+
        r.TEL_Pool_DeActivations)
			AS T_TOTAL_TEL_POOL,
	SUM(
		r.PAG_MRC+
		r.PAG_GROSS+
		r.PAG_DISCOUNT+
		r.PAG_CYCLEFOLD+
		r.OCC_PAG_MRC+
		r.OCC_PAG_MISC)
			AS T_TOTAL_PAG,
	SUM(
		r.PTT_TG_MRC+
        r.PTT_DVC_MRC+
        r.PTT_TG_1YrTermCommitment+
        r.PTT_TG_Voice_GROSS+
        r.PTT_TG_Voice_DISCOUNT+
        r.PTT_TG_CYCLE_FOLD+
        r.PTT_TG_Activations+
        r.PTT_DVC_Deactivations+
        r.PTT_TG_Deactivations+
        r.PTT_TG_1YR_CHANGE_FEE+
        r.OCC_PTT_TG_MRC+
        r.OCC_PTT_DVC_MRC+
        r.OCC_PTT_TG_VOICE_USG+
        r.OCC_PTT_TG_Activations+
        r.OCC_PTT_DVC_Activations+
        r.OCC_PTT_DVC_Other_Rev)
			AS T_TOTAL_PTT,
	SUM(
		r.certus_voice_mrc+
        r.certus_data_mrc+
        r.certus_data_arc+
        r.certus_voice_gross+
        r.certus_voice_discount+
        r.certus_voice_cyclefold+
        r.certus_data_gross+
        r.certus_data_disc+
        r.certus_data_cyclefold+
        r.certus_imt_gross+
        r.certus_imt_disc+
        r.certus_imt_cyclefold+
        r.certus_wallet_usg_credits+
        r.certus_data_activations+
        r.certus_activations_credits+
        r.certus_deactivations+
        r.OCC_CERTUS_VERTICAL_DISC+
        r.occ_certus_voice_mrc+
        r.occ_certus_data_mrc+
        r.occ_certus_voice_usage+
        r.occ_certus_data_usage+
        r.occ_certus_imt_usage+
        r.occ_certus_voice_sc+
        r.occ_certus_misc)
			AS T_TOTAL_CERTUS,
	SUM(
		r.POOL_Cert_GRP_MRC+
        r.POOL_Cert_GRP_ARC+
        r.POOL_Cert_Member_MRC+
        r.Pool_Certus_ARC+
        r.POOL_Certus_Penalty+
        r.Pool_Certus_Gross+
        r.POOL_CERTUSACTS)
			AS T_TOTAL_CERTUS_POOL,
	SUM(
		r.OCC_USFS+
		r.OCC_COLO+
		r.OCC_CONTRA_REV+
		r.OCC_SP_MISC+
		r.LPFS)
			AS T_TOTAL_SP,
---OP---------------------------------------------------------------------------
	SUM(r.OP_VOICE_MRC) AS T_OP_VOICE_MRC,
	SUM(r.OP_DATA_MRC) AS T_OP_DATA_MRC,
	SUM(r.OP_SPEED_MRC) AS T_OP_SPEED_MRC,
	SUM(r.OP_COMBO_MRC) AS T_OP_COMBO_MRC,
	SUM(r.OP_2_YR) AS T_OP_2_YR,
	SUM(r.OP_3_YR) AS T_OP_3_YR,
	SUM(r.OP_SC_SECS_ACTUAL) AS T_OP_SC_SECS_ACTUAL,
	SUM(r.OP_SC_SECS_RATED) AS T_OP_SC_SECS_RATED,
	SUM(r.OP_VOICE_SECS_ACTUAL) AS T_OP_VOICE_SECS_ACTUAL,
	SUM(r.OP_VOICE_SECS_RATED) AS T_OP_VOICE_SECS_RATED,
	SUM(r.OP_VOICE_USG_GROSS) AS T_OP_VOICE_USG_GROSS,
	SUM(r.OP_VOICE_USG_DISC) AS T_OP_VOICE_USG_DISC,
	SUM(r.OP_VOICE_CYCLEFOLD) AS T_OP_VOICE_CYCLEFOLD,
	SUM(r.OP_BYTES_ACTUAL) AS T_OP_BYTES_ACTUAL,
	SUM(r.OP_BYTES_RATED) AS T_OP_BYTES_RATED,
	SUM(r.OP_DATA_USG_GROSS) AS T_OP_DATA_USG_GROSS,
	SUM(r.OP_DATA_USG_DISC) AS T_OP_DATA_USG_DISC,
	SUM(r.OP_DATA_CYCLEFOLD) AS T_OP_DATA_CYCLEFOLD,
	SUM(r.OP_COMBO_USG_CREDITS) AS T_OP_COMBO_USG_CREDITS,
	SUM(r.OP_ACTIVATIONS) AS T_OP_ACTIVATIONS,
	SUM(r.OP_DEACTIVATIONS) AS T_OP_DEACTIVATIONS,
	SUM(r.OP_2_YR_CHANGE_FEE) AS T_OP_2_YR_CHANGE_FEE,
	SUM(r.OP_3_YR_CHANGE_FEE) AS T_OP_3_YR_CHANGE_FEE,
	SUM(r.OCC_OP_VOICE_MRC) AS T_OCC_OP_VOICE_MRC,
	SUM(r.OCC_OP_DATA_MRC) AS T_OCC_OP_DATA_MRC,
	SUM(r.OCC_SPEED_MRC) AS T_OCC_SPEED_MRC,
	0 AS T_OP_OCC_2YR_TERM_BACKCHARGE,
	0 AS T_OP_OCC_3YR_TERM_BACKCHARGE,
	SUM(r.OCC_OP_VOICE_USG) AS T_OCC_OP_VOICE_USG,
	SUM(r.OCC_OP_DATA_USG) AS T_OCC_OP_DATA_USG,
	SUM(r.OCC_OP_VOICE_CYCLEFOLD) AS T_OCC_OP_VOICE_CYCLEFOLD,
	SUM(r.OCC_OP_DATA_CYCLEFOLD) AS T_OCC_OP_DATA_CYCLEFOLD,
	SUM(r.OCC_OP_SCRATCH_CARDS) AS T_OCC_OP_SCRATCH_CARDS,
	SUM(r.OP_SIM_REACTIVATIONS) AS T_OP_SIM_REACTIVATIONS,
	SUM(r.OP_MISC) AS T_OP_MISC,
    ROUND(SUM(r.OP_VOICE_SECS_RATED)/60, 3)
        AS T_OP_MINS,	
    SUM(
        r.OP_VOICE_USG_GROSS+
        r.OP_VOICE_USG_DISC+
        r.OP_VOICE_CYCLEFOLD)
            AS T_OP_NET_VOICE,
    SUM(r.OP_BYTES_RATED)/1000000000
        AS T_OP_GB,
		    SUM(
        r.OP_DATA_USG_GROSS+
        r.OP_DATA_USG_DISC+
        r.OP_DATA_CYCLEFOLD)
            AS T_OP_NET_DATA,
---OP POOL----------------------------------------------------------------------
    SUM(r.POOL_OP_Member_Count) AS T_POOL_OP_MEMBER_COUNT,
    SUM(r.POOL_OP_Group_MRC) AS T_POOL_OP_GROUP_MRC,
    SUM(r.POOL_OP_Memeber_MRC) AS T_POOL_OP_MEMBER_MRC,
    SUM(r.POOL_OP_Memeber_Penalty) AS T_POOL_OP_MEMBER_PENALTY,
    SUM(r.Pool_OP_Voice_Secs_Actual) AS T_POOL_OP_VOICE_SECS_ACTUAL,
    SUM(r.Pool_OP_Voice_Secs_Rated) AS T_POOL_OP_VOICE_SECS_RATED,
    SUM(r.Pool_OP_Voice_USG_GROSS) AS T_POOL_OP_VOICE_USG_GROSS,
    SUM(r.Pool_OP_Voice_Bytes_Actual) AS T_POOL_OP_VOICE_BYTES_ACTUAL,
    SUM(r.Pool_OP_Voice_Bytes_Rated) AS T_POOL_OP_VOICE_BYTES_RATED,
    SUM(r.Pool_OP_Voice_Bytes_GROSS) AS T_POOL_OP_DATA_USG_GROSS,
    SUM(r.Pool_OP_Activations) AS T_POOL_OP_ACTIVATIONS,
    SUM(r.Pool_OP_Deactivations) AS T_POOL_OP_DEACTIVATIONS,
    SUM(r.Pool_OP_Voice_Secs_Rated) / 60
        AS T_OP_POOL_MINS,
    SUM(r.Pool_OP_Voice_Bytes_Rated) / 1000000000
        AS T_OP_POOL_GB,
---SBD--------------------------------------------------------------------------
    SUM(r.SBD_MRC) AS T_SBD_MRC,
    SUM(r.SBD_Suspend) AS T_SBD_SUSPEND,
    SUM(r.SBD_Annual) AS T_SBD_ANNUAL,
    SUM(r.SBD_Bytes_Actual) AS T_SBD_BYTES_ACTUAL,
    SUM(r.SBD_Bytes_Rated) AS T_SBD_BYTES_RATED,
    SUM(r.SBD_Usg_Gross) AS T_SBD_USG_GROSS,
    SUM(r.SBD_Data_Disc) AS T_SBD_Usg_Disc,
    SUM(r.SBD_Incremental_Disc) AS T_SBD_INCREMENTAL_DISC,
    SUM(r.SBD_Cyclefold) AS T_SBD_CYCLEFOLD,
    SUM(r.SBD_Mailbox_Checks) T_SBD_MAILBOX_CHECKS,
    SUM(r.Mailbox_Gross) AS T_SBD_Mbx_Usg_Gross,
    SUM(r.Mailbox_Discount) AS T_SBD_Mbx_Disc,
    SUM(r.SBD_Registrations) AS T_SBD_REGISTRATIONS,
    SUM(r.SBD_Registrations_Gross) AS T_SBD_Reg_Usg_Gross,
    SUM(r.SBD_Registrations_Disc) AS T_SBD_Reg_Usg_Disc,
    SUM(r.SBD_Activations) AS T_SBD_ACTIVATIONS,
    SUM(r.SBD_Activations_Credits) AS T_SBD_Activation_Credits,
    SUM(r.SBD_Deactivations) AS T_SBD_DEACTIVATIONS,
    SUM(r.SBD_MRC_OCC) AS T_OCC_SBD_MRC,
    SUM(r.OCC_SBD_Annual) AS T_OCC_SBD_ANNUAL,
    SUM(r.OCC_SBD_Usg) AS T_OCC_SBD_USG,
    SUM(r.OCC_SBD_Increm) AS T_OCC_SBD_Increm_Disc,
    SUM(r.OCC_SBD_Overage) AS T_OCC_SBD_Cyclefold,
    SUM(r.OCC_SBD_Act) AS T_OCC_SBD_Acts,
    SUM(r.OCC_SBD_VPN_FEES) AS T_OCC_SBD_VPN,
    SUM(r.OCC_SBD_MISC) AS T_OCC_SBD_MISC,
    ROUND(SUM(r.SBD_Bytes_Rated)/1000000, 0)
        AS T_SBD_MB,
    SUM(
        r.SBD_Usg_Gross+
        r.SBD_Data_Disc)
            AS T_SBD_Data_Usg_Amt,
    SUM(
        r.SBD_Usg_Gross+
        r.SBD_Data_Disc+
        r.SBD_Incremental_Disc)
            AS T_SBD_Data_Net_Amt,
---SBD POOL---------------------------------------------------------------------
    SUM(r.POOL_SBD_MEMEBER_COUNT) AS T_POOL_SBD_MEMBER_COUNT,
    SUM(r.POOL_SBD_GROUP_MRC) AS T_POOL_SBD_GROUP_MRC,
    SUM(r.POOL_SBD_MEMEBER_MRC) AS T_POOL_SBD_MEMBER_MRC,
    SUM(r.POOL_SBD_SUSPEND_PENALTY) AS T_POOL_SBD_SUSPEND,
    SUM(r.POOL_SBD_PENALTY) AS T_POOL_SBD_PENALTY,
    SUM(r.POOL_SBD_BYTES_ACTUAL) AS T_POOL_SBD_BYTES_ACTUAL,
    SUM(r.POOL_SBD_BYTES_RATED) AS T_POOL_SBD_BYTES_RATED,
    SUM(r.POOL_SBD_BYTES_GROSS) AS T_POOL_SBD_USG_GROSS,
    SUM(r.POOL_SBD_MBX_CHECKS) AS T_POOL_SBD_MAILBOX_CHECKS,
    SUM(r.POOL_MBX_USG_GROSS) AS T_POOL_MBX_USG_GROSS,
    SUM(r.POOL_SBD_REGISTRATIONS) AS T_POOL_SBD_REGISTRATIONS,
    SUM(r.POOL_SBD_REG_USG_GROSS) AS T_POOL_SBD_REG_USG_GROSS,
    SUM(r.POOL_SBD_ACTIVATIONS) AS T_POOL_SBD_ACTIVATIONS,
    SUM(r.POOL_SBD_BYTES_RATED)/1000000
        AS T_SBD_POOL_MB,
---M2M--------------------------------------------------------------------------
    SUM(r.M2M_MRC) AS T_M2M_MRC,
    SUM(r.M2M_Susp) AS T_M2M_SUSPEND,
    SUM(r.M2M_Rudics_Actual) AS T_M2M_RUDICS_SECS_ACTUAL,
    SUM(r.M2M_RUDICS_RATED) AS T_M2M_RUDICS_SECS_RATED,
    SUM(r.M2M_RUDICS_GROSS) AS T_M2M_RUDICS_USG_GROSS,
    SUM(r.M2M_RUDICS_DISCOUNT) AS T_M2M_RUDICS_USG_DISC,
    SUM(r.M2M_RUDICS_CF) AS T_M2M_RUDICS_CYCLEFOLD,
    SUM(r.M2M_Bytes_Actual) AS T_M2M_SBD_BYTES_ACTUAL,
    SUM(r.M2M_Bytes_RATED) AS T_M2M_SBD_BYTES_RATED,
    SUM(r.M2M_Bytes_Gross) AS T_M2M_SBD_USG_GROSS,
    SUM(r.M2M_Bytes_Discount) AS T_M2M_SBD_USG_DISC,
    SUM(r.M2M_Bytes_CF) AS T_M2M_SBD_CYCLEFOLD,
    SUM(r.M2M_Mailbox) AS T_M2M_SBD_MAILBOX,
    SUM(r.M2M_Mailbox_Gross) AS T_M2M_MB_USG_GROSS,
    SUM(r.M2M_Mailbox_Disc) AS T_M2M_MBX_USG_DISC,
    SUM(r.M2M_Registrations) AS T_M2M_SBD_REGISTRATIONS,
    SUM(r.M2M_Registrations_Gross) AS T_M2M_SBD_REG_USG_GROSS,
    SUM(r.M2M_Registrations_Disc) AS T_M2M_SBD_REG_USG_DISC,
    SUM(r.OCC_M2M_Access) AS T_OCC_M2M_MRC,
    ROUND(SUM(r.M2M_RUDICS_RATED)/60, 3)
        AS T_M2M_MINS,
    SUM(r.M2M_Bytes_RATED) / 1000
        AS T_M2M_KB,
---GDB--------------------------------------------------------------------------
	SUM(r.GDB_MRC) AS T_GDB_MRC,
	SUM(r.GDB_SUSPEND) AS T_GDB_SUSPEND,
	SUM(r.GDB_BYTES_ACTUAL) AS T_GDB_BYTES_ACTUAL,
	SUM(r.GDB_BYTES_RATED) AS T_GDB_BYTES_RATED,
	SUM(r.GDB_GROSS) AS T_GDB_GROSS,
	SUM(r.GDB_DISC) AS T_GDB_DISC,
	SUM(r.GDB_CF) AS T_GDB_CF,
	SUM(r.GDB_ACTIVATIONS) AS T_GDB_ACTIVATIONS,
	SUM(r.GDB_DEACTS) AS T_GDB_DEACTS,
	SUM(r.OCC_GDB_MRC) AS T_OCC_GDB_MRC,
	SUM(r.OCC_GDB_USAGE) AS T_OCC_GDB_USAGE,
	SUM(r.OCC_GDB_ACTIVATION) AS T_OCC_GDB_ACTIVATION,
	SUM(r.OCC_GDB_CYCLEFOLD) AS T_OCC_GDB_CYCLEFOLD,
	SUM(r.OCC_GDB_MISC) AS T_OCC_GDB_MISC,
---TEL--------------------------------------------------------------------------
    SUM(r.TEL_MRC) AS T_TEL_ACC,
    SUM(r.TEL_PLUS1_MRC) AS T_TEL_PLUS1_MRC,
    SUM(r.TEL_ARC) AS T_TEL_ARC,
    SUM(r.TEL_VOICE_ACTUAL) AS T_TEL_VOICE_ACTUAL,
    SUM(r.TEL_VOICE_RATED) AS T_TEL_VOICE_RATED,
    SUM(r.TEL_VOICE_GROSS) AS T_TEL_VOICE_USG_GROSS,
    SUM(r.TEL_VOICE_DISCOUNT) AS T_TEL_VOICE_USG_DISC,
    SUM(r.TEL_VOICE_CYCLEFOLD) AS T_TEL_VOICE_CYCLEFOLD,
    SUM(r.TEL_DATA_ACTUAL) AS T_TEL_DATA_ACTUAL,
    SUM(r.TEL_DATA_RATED) AS T_TEL_DATA_RATED,
    SUM(r.TEL_DATA_GROSS) AS T_TEL_DATA_USG_GROSS,
    SUM(r.TEL_DATA_DISCOUNT) AS T_TEL_DATA_USG_DISC,
    SUM(r.TEL_DATA_CYCLEFOLD) AS T_TEL_DATA_CYCLEFOLD,
    SUM(r.SMS_MT_MESSAGES) AS T_SMS_MT_MESSAGES,
    SUM(r.SMS_MO_MESSAGES) AS T_SMS_MO_MESSAGES,
    SUM(r.TEL_SMS_MO_GROSS) AS T_SMS_MO_USG_GROSS,
    SUM(r.TEL_SMS_MO_DISC) AS T_TEL_USG_SMS_MO_DISC,
    SUM(r.TEL_SMS_MO_CYCLEFOLD) AS T_SMS_MO_CYCLEFOLD,
    SUM(r.TEL_ACTIVATIONS) AS T_TEL_ACTIVATIONS,
    SUM(r.OCC_TEL_MRC) AS T_OCC_TEL_MRC,
    SUM(r.OCC_TEL_PLUS1_MRC) AS T_OCC_TEL_PLUS1_MRC,
    SUM(r.OCC_TEL_USG) AS T_OCC_TEL_USG,
    SUM(r.OCC_TEL_SMS_USG) AS T_OCC_SMS_USG,
    0 AS T_OCC_TEL_CYCLEFOLD,
    0 AS T_OCC_SMS_CYCLEFOLD,
    0 AS T_OCC_TEL_ACTS,
    SUM(r.PREPAID_CHARGE_EVOUCHERS) AS T_PREPAID_CHARGE_EVOUCHERS,
    SUM(r.PREPAID_REFUND_EVOUCHERS) AS T_PREPAID_REFUND_EVOUCHERS,
    SUM(r.PREPAID_SPECIAL_HANDLING) AS T_PREPAID_SPECIAL_HANDLING,
    SUM(r.OCC_TEL_SCRATCH_CARD) AS T_TEL_SCRATCH_CARDS,
    SUM(r.OCC_TEL_SIM_REACTIVATIONS) AS T_TEL_SIM_REACTIVATIONS,
    SUM(r.OCC_TEL_RUDICS_SETUP) AS T_OCC_RUDICS_SETUP,
    SUM(r.OCC_TEL_CREDIT_CARD_USAGE) AS T_OCC_CREDIT_CARD_USG,
    SUM(r.OCC_TEL_EVOUCHER) AS T_OCC_EVOUCHERS,
    SUM(r.OCC_TEL_MISC) AS T_OCC_TEL_MISC,
    SUM(
        r.PREPAID_CHARGE_EVOUCHERS+
        r.PREPAID_REFUND_EVOUCHERS+
        r.PREPAID_SPECIAL_HANDLING)
            AS T_TEL_PREPAID,
    SUM(
        r.PREPAID_CHARGE_EVOUCHERS)
            AS T_PURCHASES_ONLY,
    ROUND(SUM(r.TEL_VOICE_RATED)/60, 3)
        AS T_VOICE_MINS,
    SUM(
        r.TEL_VOICE_GROSS+
        r.TEL_VOICE_DISCOUNT)
            AS T_NET_VOICE_CHARGES,
    ROUND(SUM(r.TEL_DATA_RATED)/60, 3)
        AS T_DATA_MINS,
    SUM(
        r.TEL_DATA_GROSS+
        r.TEL_DATA_DISCOUNT) 
            AS T_NET_DATA_CHARGES,
    SUM(
        r.SMS_MT_MESSAGES+
        r.SMS_MO_MESSAGES)
            AS T_SMS_EVENTS,
    SUM(
        r.TEL_SMS_MO_GROSS+
        r.TEL_SMS_MO_DISC+
        r.TEL_SMS_MO_CYCLEFOLD) 
            AS T_NET_SMS_CHARGES,
---TEL POOL---------------------------------------------------------------------
    SUM(r.POOL_TEL_Memeber_Count) AS T_POOL_TEL_MEMBER_COUNT,
    SUM(r.Pool_TEL_Group_MRC) AS T_POOL_TEL_GROUP_MRC,
    SUM(r.POOL_TEL_Memeber_MRC) AS T_POOL_TEL_MEMBER_MRC,
    SUM(r.POOL_TEL_Memeber_Penalty) AS T_POOL_TEL_PENALTY,
    SUM(r.Pool_TEL_Voice_Secs_Actual) AS T_POOL_TEL_VOICE_SECS_ACTUAL,
    SUM(r.Pool_TEL_Voice_Secs_Rated) AS T_POOL_TEL_VOICE_SECS_RATED,
    SUM(r.Pool_TEL_Voice_USG_GROSS) AS T_POOL_TEL_VOICE_USG_GROSS,
    SUM(r.Pool_TEL_Data_Secs_Actual) AS T_POOL_TEL_DATA_ACTUAL,
    SUM(r.Pool_TEL_Data_Secs_Rated) AS T_POOL_TEL_DATA_RATED,
    SUM(r.Pool_TEL_Data_Secs_GROSS) AS T_POOL_TEL_DATA_USG_GROSS,
    SUM(r.TEL_Pool_Activations) AS T_POOL_TEL_ACTIVATIONS,
    SUM(r.TEL_Pool_DeActivations) AS T_POOL_TEL_DEACTIVATIONS,
    ROUND(SUM(r.Pool_TEL_Data_Secs_Rated)/60, 3)
        AS T_TEL_POOL_MINS,
---PAG--------------------------------------------------------------------------
	SUM(r.PAG_MRC) AS T_PAG_MRC,
	SUM(r.PAG_EVENTS) AS T_PAG_EVENTS,
	SUM(r.PAG_GROSS) AS T_PAG_GROSS,
	SUM(r.PAG_DISCOUNT) AS T_PAG_DISCOUNT,
	SUM(r.PAG_CYCLEFOLD) AS T_PAG_CYCLEFOLD,
	SUM(r.OCC_PAG_MRC) AS T_OCC_PAG_MRC,
	SUM(r.OCC_PAG_MISC) AS T_OCC_PAG_MISC,
---PTT--------------------------------------------------------------------------
    SUM(r.PTT_TG_MRC) AS T_PTT_TG_MRC,
    SUM(r.PTT_DVC_MRC) AS T_PTT_DVC_MRC,
    SUM(r.PTT_TG_1YrTermCommitment) AS T_PTT_1YR_TERM_COMMIT,
    SUM(r.PTT_TG_Voice_ACTAUL) AS T_PTT_TG_VOICE_ACTUAL,
    SUM(r.PTT_TG_VOICE_RATED) AS T_PTT_TG_VOICE_RATED,
    SUM(r.PTT_TG_Voice_GROSS) AS T_PTT_TG_VOICE_USG_GROSS,
    SUM(r.PTT_TG_Voice_DISCOUNT) AS T_PTT_TG_VOICE_USG_DISC,
    SUM(r.PTT_TG_CYCLE_FOLD) AS T_PTT_TG_VOICE_CYCLEFOLD,
    SUM(r.PTT_TG_Activations) AS T_PTT_TG_ACTIVATIONS,
    SUM(r.PTT_TG_Deactivations) AS T_PTT_TG_DEACTIVATIONS,
    SUM(r.PTT_DVC_Deactivations) AS T_PTT_DVC_DEACTIVATIONS,
    SUM(r.PTT_TG_1YR_CHANGE_FEE) AS T_PTT_TG_1YR_CHANGE_FEE,
    SUM(r.OCC_PTT_TG_MRC) AS T_OCC_PTT_TG_MRC,
    SUM(r.OCC_PTT_DVC_MRC) AS T_OCC_PTT_DVC_MRC,
    SUM(r.OCC_PTT_TG_VOICE_USG) AS T_OCC_PTT_TG_VOICE_USG,
    SUM(r.OCC_PTT_TG_Activations) AS T_OCC_PTT_TG_ACTS,
    SUM(r.OCC_PTT_DVC_Activations) AS T_OCC_PTT_DVC_ACTS,
    SUM(r.OCC_PTT_DVC_Other_Rev) AS T_OCC_PTT_DVC_OTHER_REVENUE,
        ROUND(SUM(r.PTT_TG_VOICE_RATED)/60,3)
                AS T_PTT_TG_MINS,
        SUM(r.PTT_TG_Voice_GROSS+
            r.PTT_TG_Voice_DISCOUNT)
                AS T_PTT_TG_NET_USG,
---CERT-------------------------------------------------------------------------
    SUM(r.certus_voice_mrc) AS T_Certus_Voice_MRC,
    SUM(r.certus_data_mrc) AS T_Certus_Data_MRC,
    0 AS T_Certus_SBD_MRC,
    0 AS T_Certus_Stream_MRC,
    0 AS T_Certus_Safety_MRC,
    0 AS T_Certus_Plus_1_MRC,
    0 AS T_Certus_Suspend,
    SUM(r.certus_data_arc) AS T_Certus_Data_ARC,
    SUM(r.certus_voice_actual) AS T_Certus_Voice_Actual,
    SUM(r.certus_voice_rated) AS T_Certus_Voice_Rated,
    SUM(r.certus_voice_gross) AS T_Certus_Voice_Usg_Gross,
    SUM(r.certus_voice_discount) AS T_Certus_Voice_Usg_Disc,
    SUM(r.certus_voice_cyclefold) AS T_Certus_Voice_Cyclefold,
    SUM(r.certus_data_actual) AS T_Certus_Data_Actual,
    SUM(r.certus_data_rated) AS T_Certus_Data_Rated,
    SUM(r.certus_data_gross) AS T_Certus_Data_Usg_Gross,
    SUM(r.certus_data_disc) AS T_Certus_Data_Usg_Disc,
    SUM(r.certus_data_cyclefold) AS T_Certus_Data_Cyclefold,
    0 AS T_Certus_SBD_Bytes_Actual,
    0 AS T_Certus_SBD_Bytes_Rated,
    0 AS T_Certus_SBD_Usg_Gross,
    0 AS T_Certus_SBD_Usg_Disc,
    0 AS T_Certus_SBD_Cyclefold,
    0 AS T_Certus_SBD_Mbx_Checks,
    0 AS T_Certus_SBD_Mbx_Usg_Gross,
    0 AS T_Certus_SBD_Mbx_Disc,
    0 AS T_Certus_SBD_Registrations,
    0 AS T_Certus_SBD_Reg_Usg_Gross,
    0 AS T_Certus_SBD_Reg_Usg_Disc,
    0 AS T_Certus_Streaming_Actual,
    0 AS T_Certus_Streaming_Rated,
    0 AS T_Certus_Streaming_Usg_Gross,
    0 AS T_Certus_Streaming_Usg_Disc,
    0 AS T_Certus_Streaming_Cyclefold,
    SUM(r.certus_imt_actual) AS T_Certus_IMT_Actual,
    SUM(r.certus_imt_rated) AS T_Certus_IMT_Rated,
    SUM(r.certus_imt_gross) AS T_Certus_IMT_Usg_Gross,
    SUM(r.certus_imt_disc) AS T_Certus_IMT_Usg_Disc,
    SUM(r.certus_imt_cyclefold) AS T_Certus_IMT_Cyclefold,
    SUM(r.certus_wallet_usg_credits) AS T_Certus_Wallet_Usg_Credits,
    SUM(r.certus_data_activations) AS T_Certus_Activations,
    SUM(r.certus_activations_credits) AS T_Certus_Activation_Credits,
    SUM(r.certus_deactivations) AS T_Certus_Deactivations,
    SUM(r.OCC_CERTUS_VERTICAL_DISC) AS T_OCC_CERTUS_VERTICAL_DISC,
    SUM(r.occ_certus_voice_mrc) AS T_OCC_Certus_Voice_MRC,
    SUM(r.occ_certus_data_mrc) AS T_OCC_Certus_Data_MRC,
    SUM(r.occ_certus_voice_usage) AS T_OCC_Certus_Voice_Usg,
    SUM(r.occ_certus_data_usage) AS T_OCC_Certus_Data_Usg,
    SUM(r.occ_certus_imt_usage) AS T_OCC_Certus_IMT_Usg,
    SUM(r.occ_certus_voice_sc) AS T_Certus_Scratch_Cards,
    SUM(r.occ_certus_misc) AS T_Certus_Misc,
    ROUND(SUM(r.certus_data_rated)/1000000000, 2)
        AS T_Certus_Data_GB,
    SUM(
        r.certus_data_gross+
        r.certus_data_disc+
        r.certus_data_cyclefold)
            AS T_Certus_Net_Data,
    ROUND(SUM(r.certus_voice_rated)/60, 3)
        AS T_Certus_Voice_Mins,
    SUM(
        r.certus_voice_gross+
        r.certus_voice_discount+
        r.certus_voice_cyclefold)
            AS T_Certus_Net_Voice,
---CERT POOL--------------------------------------------------------------------
    SUM(r.POOL_CERT_MEMBER_COUNT) AS T_POOL_CERT_MEMBER_COUNT,
    SUM(r.POOL_Cert_GRP_MRC) AS T_POOL_CERTUS_GROUP_MRC,
    SUM(r.POOL_Cert_GRP_ARC) AS T_POOL_CERTUS_GROUP_ARC,
    SUM(r.POOL_Cert_Member_MRC) AS T_POOL_CERTUS_MEMBER_MRC,
    SUM(r.Pool_Certus_ARC) AS T_POOL_CERTUS_MEMBER_ARC,
    SUM(r.POOL_Certus_Penalty) AS T_POOL_CERTUS_PENALTY,
    SUM(r.Pool_CertusBytesActual) AS T_POOL_CERTUS_DATA_ACTUAL,
    SUM(r.Pool_CertusBytesRated) AS T_POOL_CERTUS_DATA_RATED,
    SUM(r.Pool_Certus_Gross) AS T_POOL_CERTUS_DATA_USG_GROSS,
    SUM(r.POOL_CERTUSACTS) AS T_POOL_CERTUS_ACTIVATIONS,
    0 AS T_POOL_CERTUS_DEACTIVATIONS,
    SUM(r.Pool_CertusBytesRated)/1000000000
        AS T_CERTUS_POOL_GB,
---SP---------------------------------------------------------------------------
	SUM(r.OCC_USFS) AS T_OCC_USFS,
	SUM(r.OCC_COLO) AS T_OCC_COLO,
	SUM(r.OCC_CONTRA_REV) AS T_OCC_CONTRA_REV,
	SUM(r.OCC_SP_MISC) AS T_OCC_SP_MISC,
	SUM(r.LPFS) AS T_LPFS
FROM REVASSURANCE.RA_BILL_TRENDS r
WHERE EXTRACT(day FROM r.INVDATE) IN (1, 2, 5, 9, 11, 13, 17, 21, 26)
    AND r.INVDATE >= ADD_MONTHS(TRUNC(SYSDATE, 'MM'), -12)
    AND r.INVDATE < ADD_MONTHS(TRUNC(SYSDATE, 'MM'), 1)
GROUP BY r.INVDATE
ORDER BY r.INVDATE DESC
)
---CTE ends---------------------------------------------------------------------
SELECT
    t.T_INVDATE,
	SUM(t.T_TOTAL_CONTRACTS) AS TOTAL_CONTRACTS,
	SUM(t.T_NEW_CONTRACTS) AS NEW_CONTRACTS,
---MRC--------------------------------------------------------------------------
    SUM(t.T_OP_MRC_TOTAL) AS OP_MRC_TOTAL,
    SUM(t.T_OP_POOL_MRC_TOTAL) AS OP_POOL_MRC_TOTAL,
    SUM(t.T_SBD_MRC_TOTAL) AS SBD_MRC_TOTAL,
    SUM(t.T_SBD_POOL_MRC_TOTAL) AS SBD_POOL_MRC_TOTAL,
    SUM(t.T_M2M_MRC_TOTAL) AS M2M_MRC_TOTAL,
    SUM(t.T_TEL_MRC_TOTAL) AS TEL_MRC_TOTAL,
    SUM(t.T_TEL_POOL_MRC_TOTAL) AS TEL_POOL_MRC_TOTAL,
    SUM(t.T_PTT_MRC_TOTAL) AS PTT_MRC_TOTAL,
    SUM(t.T_CERTUS_MRC_TOTAL) AS CERTUS_MRC_TOTAL,
    SUM(t.T_CERTUS_POOL_MRC_TOTAL) AS CERTUS_POOL_MRC_TOTAL,
    SUM(t.T_PAG_MRC_TOTAL) AS PAG_MRC_TOTAL,
    SUM(
        t.T_OP_MRC_TOTAL+
        t.T_OP_POOL_MRC_TOTAL+
        t.T_SBD_MRC_TOTAL+
        t.T_SBD_POOL_MRC_TOTAL+
        t.T_M2M_MRC_TOTAL+
        t.T_TEL_MRC_TOTAL+
        t.T_TEL_POOL_MRC_TOTAL+
        t.T_PTT_MRC_TOTAL+
        t.T_CERTUS_MRC_TOTAL+
        t.T_CERTUS_POOL_MRC_TOTAL+
        t.T_PAG_MRC_TOTAL)
            AS TOTAL_MRC,
-----USG--------------------------------------------------------------------------
    SUM(t.T_OP_USG_TOTAL) AS OP_USG_TOTAL,
    SUM(t.T_OP_POOL_USG_TOTAL) AS OP_POOL_USG_TOTAL,
    SUM(t.T_SBD_USG_TOTAL) AS SBD_USG_TOTAL,
    SUM(t.T_SBD_POOL_USG_TOTAL) AS SBD_POOL_USG_TOTAL,
    SUM(t.T_M2M_USG_TOTAL) AS M2M_USG_TOTAL,
    SUM(t.T_TEL_USG_TOTAL) AS TEL_USG_TOTAL,
    SUM(t.T_TEL_POOL_USG_TOTAL) AS TEL_POOL_USG_TOTAL,
    SUM(t.T_PTT_USG_TOTAL) AS PTT_USG_TOTAL,
    SUM(t.T_CERTUS_USG_TOTAL) AS CERTUS_USG_TOTAL,
    SUM(t.T_CERTUS_POOL_USG_TOTAL) AS CERTUS_POOL_USG_TOTAL,
    SUM(t.T_PAG_USG_TOTAL) AS PAG_USG_TOTAL,
    SUM(
        t.T_OP_USG_TOTAL+
        t.T_OP_POOL_USG_TOTAL+
        t.T_SBD_USG_TOTAL+
        t.T_SBD_POOL_USG_TOTAL+
        t.T_M2M_USG_TOTAL+
        t.T_TEL_USG_TOTAL+
        t.T_TEL_POOL_USG_TOTAL+
        t.T_PTT_USG_TOTAL+
        t.T_CERTUS_USG_TOTAL+
        t.T_CERTUS_POOL_USG_TOTAL+
        t.T_PAG_USG_TOTAL)
            AS TOTAL_USG,
-----OTF--------------------------------------------------------------------------
    SUM(t.T_OP_OTF_TOTAL) AS OP_OTF_TOTAL,
    SUM(t.T_OP_POOL_OTF_TOTAL) AS OP_POOL_OTF_TOTAL,
    SUM(t.T_SBD_OTF_TOTAL) AS SBD_OTF_TOTAL,
    SUM(t.T_SBD_POOL_OTF_TOTAL) AS SBD_POOL_OTF_TOTAL,
    SUM(t.T_M2M_OTF_TOTAL) AS M2M_OTF_TOTAL,
    SUM(t.T_TEL_OTF_TOTAL) AS TEL_OTF_TOTAL,
    SUM(t.T_TEL_POOL_OTF_TOTAL) AS TEL_POOL_OTF_TOTAL,
    SUM(t.T_PTT_OTF_TOTAL) AS PTT_OTF_TOTAL,
    SUM(t.T_CERTUS_OTF_TOTAL) AS CERTUS_OTF_TOTAL,
    SUM(t.T_CERTUS_POOL_OTF_TOTAL) AS CERTUS_POOL_OTF_TOTAL,
    SUM(t.T_PAG_OTF_TOTAL) AS PAG_OTF_TOTAL,
    SUM(t.T_SP_OTF_TOTAL) AS SP_OTF_TOTAL,
    SUM(
        t.T_OP_OTF_TOTAL+
        t.T_OP_POOL_OTF_TOTAL+
        t.T_SBD_OTF_TOTAL+
        t.T_SBD_POOL_OTF_TOTAL+
        t.T_M2M_OTF_TOTAL+
        t.T_TEL_OTF_TOTAL+
        t.T_TEL_POOL_OTF_TOTAL+
        t.T_PTT_OTF_TOTAL+
        t.T_CERTUS_OTF_TOTAL+
        t.T_CERTUS_POOL_OTF_TOTAL+
        t.T_PAG_OTF_TOTAL+
        t.T_SP_OTF_TOTAL)
            AS TOTAL_OTF,
-----TOTALS-----------------------------------------------------------------------
    SUM(t.T_TOTAL_OP) AS TOTAL_OP,
    SUM(t.T_TOTAL_OP_POOL) AS TOTAL_OP_POOL,
    SUM(t.T_TOTAL_SBD) AS TOTAL_SBD,
    SUM(t.T_TOTAL_SBD_POOL) AS TOTAL_SBD_POOL,
    SUM(t.T_TOTAL_M2M) AS TOTAL_M2M,
    SUM(t.T_TOTAL_TEL) AS TOTAL_TEL,
    SUM(t.T_TOTAL_TEL_POOL) TOTAL_TEL_POOL,
	SUM(t.T_TOTAL_PAG) AS TOTAL_PAG,
    SUM(t.T_TOTAL_PTT) TOTAL_PTT,
    SUM(t.T_TOTAL_CERTUS) AS TOTAL_CERTUS,
    SUM(t.T_TOTAL_CERTUS_POOL) AS TOTAL_CERTUS_POOL,
    SUM(t.T_TOTAL_PAG) AS TOTAL_PAG,
    SUM(t.T_TOTAL_SP) AS TOTAL_SP,
	SUM(
		t.T_TOTAL_OP+
		t.T_TOTAL_OP_POOL+
		t.T_TOTAL_SBD+
		t.T_TOTAL_SBD_POOL+
		t.T_TOTAL_M2M+
		t.T_TOTAL_TEL+
		t.T_TOTAL_TEL_POOL+
		t.T_TOTAL_PAG+
		t.T_TOTAL_PTT+
		t.T_TOTAL_CERTUS+
		t.T_TOTAL_CERTUS_POOL+
		t.T_TOTAL_PAG+
		t.T_TOTAL_SP)
			AS TOTAL_BC,
-----OP---------------------------------------------------------------------------
	SUM(t.T_OP_VOICE_MRC) AS OP_VOICE_MRC,
	SUM(t.T_OP_DATA_MRC) AS OP_DATA_MRC,
	SUM(t.T_OP_SPEED_MRC) AS OP_SPEED_MRC,
	SUM(t.T_OP_COMBO_MRC) AS OP_COMBO_MRC,
	SUM(t.T_OP_2_YR) AS OP_2_YR,
	SUM(t.T_OP_3_YR) AS OP_3_YR,
	SUM(t.T_OP_SC_SECS_ACTUAL) AS OP_SC_SECS_ACTUAL,
	SUM(t.T_OP_SC_SECS_RATED) AS OP_SC_SECS_RATED,
	SUM(t.T_OP_VOICE_SECS_ACTUAL) AS OP_VOICE_SECS_ACTUAL,
	SUM(t.T_OP_VOICE_SECS_RATED) AS OP_VOICE_SECS_RATED,
	SUM(t.T_OP_VOICE_USG_GROSS) AS OP_VOICE_USG_GROSS,
	SUM(t.T_OP_VOICE_USG_DISC) AS OP_VOICE_USG_DISC,
	SUM(t.T_OP_VOICE_CYCLEFOLD) AS OP_VOICE_CYCLEFOLD,
	SUM(t.T_OP_BYTES_ACTUAL) AS OP_BYTES_ACTUAL,
	SUM(t.T_OP_BYTES_RATED) AS OP_BYTES_RATED,
	SUM(t.T_OP_DATA_USG_GROSS) AS OP_DATA_USG_GROSS,
	SUM(t.T_OP_DATA_USG_DISC) AS OP_DATA_USG_DISC,
	SUM(t.T_OP_DATA_CYCLEFOLD) AS OP_DATA_CYCLEFOLD,
	SUM(t.T_OP_COMBO_USG_CREDITS) AS OP_COMBO_USG_CREDITS,
	SUM(t.T_OP_ACTIVATIONS) AS OP_ACTIVATIONS,
	SUM(t.T_OP_DEACTIVATIONS) AS OP_DEACTIVATIONS,
	SUM(t.T_OP_2_YR_CHANGE_FEE) AS OP_2_YR_CHANGE_FEE,
	SUM(t.T_OP_3_YR_CHANGE_FEE) AS OP_3_YR_CHANGE_FEE,
	SUM(t.T_OCC_OP_VOICE_MRC) AS OCC_OP_VOICE_MRC,
	SUM(t.T_OCC_OP_DATA_MRC) AS OCC_OP_DATA_MRC,
	SUM(t.T_OCC_SPEED_MRC) AS OCC_SPEED_MRC,
	SUM(t.T_OP_OCC_2YR_TERM_BACKCHARGE) AS OP_OCC_2YR_TERM_BACKCHARGE,
	SUM(t.T_OP_OCC_3YR_TERM_BACKCHARGE) AS OP_OCC_3YR_TERM_BACKCHARGE,
	SUM(t.T_OCC_OP_VOICE_USG) AS OCC_OP_VOICE_USG,
	SUM(t.T_OCC_OP_DATA_USG) AS OCC_OP_DATA_USG,
	SUM(t.T_OCC_OP_VOICE_CYCLEFOLD) AS OCC_OP_VOICE_CYCLEFOLD,
	SUM(t.T_OCC_OP_DATA_CYCLEFOLD) AS OCC_OP_DATA_CYCLEFOLD,
	SUM(t.T_OCC_OP_SCRATCH_CARDS) AS OCC_OP_SCRATCH_CARDS,
	SUM(t.T_OP_SIM_REACTIVATIONS) AS OP_SIM_REACTIVATIONS,
	SUM(t.T_OP_MISC) AS OP_MISC,
	SUM(t.T_OP_MRC_TOTAL) /
		SUM(t.T_TOTAL_OP)
			AS OP_MRC_PERCENT,
	SUM(t.T_OP_USG_TOTAL) /
		SUM(t.T_TOTAL_OP)
			AS OP_USG_PERCENT,
	SUM(t.T_OP_OTF_TOTAL) /
		SUM(t.T_TOTAL_OP)
			AS OP_OTF_PERCENT,
    SUM(t.T_OP_MINS) AS OP_MINS,	
    SUM(t.T_OP_NET_VOICE) AS OP_NET_VOICE,
    SUM(t.T_OP_GB) AS OP_GB,
    SUM(t.T_OP_NET_DATA) AS OP_NET_DATA,
-----OP POOL----------------------------------------------------------------------
    SUM(t.T_POOL_OP_Member_Count) AS POOL_OP_MEMBER_COUNT,
    SUM(t.T_POOL_OP_Group_MRC) AS POOL_OP_GROUP_MRC,
    SUM(t.T_POOL_OP_Member_MRC) AS POOL_OP_MEMBER_MRC,
    SUM(t.T_POOL_OP_Member_Penalty) AS POOL_OP_PENALTY,
    SUM(t.T_Pool_OP_Voice_Secs_Actual) AS POOL_OP_VOICE_SECS_ACTUAL,
    SUM(t.T_Pool_OP_Voice_Secs_Rated) AS POOL_OP_VOICE_SECS_RATED,
    SUM(t.T_Pool_OP_Voice_USG_GROSS) AS POOL_OP_VOICE_USG_GROSS,
    SUM(t.T_Pool_OP_Voice_Bytes_Actual) AS POOL_OP_BYTES_ACTUAL,
    SUM(t.T_Pool_OP_Voice_Bytes_Rated) AS POOL_OP_BYTES_RATED,
    SUM(t.T_POOL_OP_DATA_USG_GROSS) AS POOL_OP_DATA_USG_GROSS,
    SUM(t.T_Pool_OP_Activations) AS POOL_OP_ACTIVAIONS,
    SUM(t.T_Pool_OP_Deactivations) AS POOL_OP_DEACTIVATIONS,
	SUM(t.T_OP_POOL_MRC_TOTAL) / NULLIF (
		SUM(t.T_TOTAL_OP_POOL), 0
	) AS OP_POOL_MRC_PERCENT,
	NULLIF(SUM(t.T_OP_POOL_USG_TOTAL), 0) /
		SUM(t.T_TOTAL_OP_POOL)
			AS OP_POOL_USG_PERCENT,
	NULLIF(SUM(t.T_OP_POOL_OTF_TOTAL), 0) /
		SUM(t.T_TOTAL_OP_POOL)
			AS OP_POOL_OTF_PERCENT,
    SUM(t.T_OP_POOL_MINS) AS OP_POOL_MINS,
    SUM(t.T_OP_POOL_GB) AS OP_POOL_GB,	
-----SBD--------------------------------------------------------------------------
    SUM(t.T_SBD_MRC) AS SBD_MRC,
    SUM(t.T_SBD_Suspend) AS SBD_SUSPEND,
    SUM(t.T_SBD_Annual) AS SBD_ANNUAL,
    SUM(t.T_SBD_Bytes_Actual) AS SBD_BYTES_ACTUAL,
    SUM(t.T_SBD_Bytes_Rated) AS SBD_BYTES_RATED,
    SUM(t.T_SBD_Usg_Gross) AS SBD_USG_GROSS,
    SUM(t.T_SBD_Usg_Disc) AS SBD_Usg_Disc,
    SUM(t.T_SBD_Incremental_Disc) AS SBD_INCREMENTAL_DISC,
    SUM(t.T_SBD_Cyclefold) AS SBD_CYCLEFOLD,
    SUM(t.T_SBD_Mailbox_Checks) SBD_MAILBOX_CHECKS,
    SUM(t.T_SBD_Mbx_Usg_Gross) AS SBD_Mbx_Usg_Gross,
    SUM(t.T_SBD_Mbx_Disc) AS SBD_Mbx_Disc,
    SUM(t.T_SBD_Registrations) AS SBD_REGISTRATIONS,
    SUM(t.T_SBD_Reg_Usg_Gross) AS SBD_Reg_Usg_Gross,
    SUM(t.T_SBD_Reg_Usg_Disc) AS SBD_Reg_Usg_Disc,
    SUM(t.T_SBD_Activations) AS SBD_ACTIVATIONS,
    SUM(t.T_SBD_Activation_Credits) AS SBD_Activation_Credits,
    SUM(t.T_SBD_Deactivations) AS SBD_DEACTIVATIONS,
    SUM(t.T_OCC_SBD_MRC) AS OCC_SBD_MRC,
    SUM(t.T_OCC_SBD_Annual) AS OCC_SBD_ANNUAL,
    SUM(t.T_OCC_SBD_Usg) AS OCC_SBD_USG,
    SUM(t.T_OCC_SBD_Increm_Disc) AS OCC_SBD_Increm_Disc,
    SUM(t.T_OCC_SBD_Cyclefold) AS OCC_SBD_Cyclefold,
    SUM(t.T_OCC_SBD_Acts) AS OCC_SBD_Acts,
    SUM(t.T_OCC_SBD_VPN) AS OCC_SBD_VPN,
    SUM(t.T_OCC_SBD_MISC) AS OCC_SBD_MISC,
	SUM(t.T_SBD_MRC_TOTAL) /
		SUM(t.T_TOTAL_SBD)
			AS SBD_MRC_PERCENT,
	SUM(t.T_SBD_USG_TOTAL) /
		SUM(t.T_TOTAL_SBD)
			AS SBD_MRC_PERCENT,
	SUM(t.T_SBD_OTF_TOTAL) /
		SUM(t.T_TOTAL_SBD)
			AS SBD_OTF_PERCENT,
    SUM(t.T_SBD_MB) AS SBD_MB,
    SUM(t.T_SBD_Data_Usg_Amt) AS SBD_Data_Usg_Amt,
    SUM(t.T_SBD_Data_Net_Amt) AS SBD_Data_Net_Amt,
-----SBD POOL---------------------------------------------------------------------
    SUM(t.T_POOL_SBD_MEMBER_COUNT) AS POOL_SBD_MEMBER_COUNT,
    SUM(t.T_POOL_SBD_GROUP_MRC) AS POOL_SBD_GROUP_MRC,
    SUM(t.T_POOL_SBD_MEMBER_MRC) AS POOL_SBD_MEMBER_MRC,
    SUM(t.T_POOL_SBD_SUSPEND) AS POOL_SBD_SUSPEND,
    SUM(t.T_POOL_SBD_PENALTY) AS POOL_SBD_PENALTY,
    SUM(t.T_POOL_SBD_BYTES_ACTUAL) AS POOL_SBD_BYTES_ACTUAL,
    SUM(t.T_POOL_SBD_BYTES_RATED) AS POOL_SBD_BYTES_RATED,
    SUM(t.T_POOL_SBD_USG_GROSS) AS POOL_SBD_USG_GROSS,
    SUM(t.T_POOL_SBD_MAILBOX_CHECKS) AS POOL_SBD_MAILBOX_CHECKS,
    SUM(t.T_POOL_MBX_USG_GROSS) AS POOL_MBX_USG_GROSS,
    SUM(t.T_POOL_SBD_REGISTRATIONS) AS POOL_SBD_REGISTRATIONS,
    SUM(t.T_POOL_SBD_REG_USG_GROSS) AS POOL_SBD_REG_USG_GROSS,
    SUM(t.T_POOL_SBD_ACTIVATIONS) AS POOL_SBD_ACTIVATIONS,
	SUM(t.T_SBD_POOL_MRC_TOTAL) / NULLIF (
		SUM(t.T_TOTAL_SBD_POOL), 0)
			AS SBD_POOL_MRC_PERCENT,
	SUM(t.T_SBD_POOL_USG_TOTAL) / NULLIF (
		SUM(t.T_TOTAL_SBD_POOL), 0 )
			AS SBD_POOL_USG_PERCENT,
	SUM(t.T_SBD_POOL_OTF_TOTAL) / NULLIF (
		SUM(t.T_TOTAL_SBD_POOL), 0 )
			AS SBD_POOL_OTF_PERCENT,
    SUM(t.T_SBD_POOL_MB) AS SBD_POOL_MB,
    SUM(t.T_TOTAL_SBD_POOL) / NULLIF(
        SUM(
            t.T_POOL_SBD_MEMBER_COUNT
        ),
        0
    )        AS ARPU,
-----M2M--------------------------------------------------------------------------
    SUM(t.T_M2M_MRC) AS M2M_MRC,
    SUM(t.T_M2M_SUSPEND) AS M2M_SUSPEND,
    SUM(t.T_M2M_RUDICS_SECS_ACTUAL) AS M2M_RUDICS_SECS_ACTUAL,
    SUM(t.T_M2M_RUDICS_SECS_RATED) AS M2M_RUDICS_SECS_RATED,
    SUM(t.T_M2M_RUDICS_USG_GROSS) AS M2M_RUDICS_USG_GROSS,
    SUM(t.T_M2M_RUDICS_USG_DISC) AS M2M_RUDICS_USG_DISC,
    SUM(t.T_M2M_RUDICS_CYCLEFOLD) AS M2M_RUDICS_CYCLEFOLD,
    SUM(t.T_M2M_SBD_BYTES_ACTUAL) AS M2M_SBD_BYTES_ACTUAL,
    SUM(t.T_M2M_SBD_BYTES_RATED) AS M2M_SBD_BYTES_RATED,
    SUM(t.T_M2M_SBD_USG_GROSS) AS M2M_SBD_USG_GROSS,
    SUM(t.T_M2M_SBD_USG_DISC) AS M2M_SBD_USG_DISC,
    SUM(t.T_M2M_SBD_CYCLEFOLD) AS M2M_SBD_CYCLEFOLD,
    SUM(t.T_M2M_SBD_MAILBOX) AS M2M_SBD_MAILBOX,
    SUM(t.T_M2M_MB_USG_GROSS) AS M2M_MB_USG_GROSS,
    SUM(t.T_M2M_MBX_USG_DISC) AS M2M_MBX_USG_DISC,
    SUM(t.T_M2M_SBD_REGISTRATIONS) AS M2M_SBD_REGISTRATIONS,
    SUM(t.T_M2M_SBD_REG_USG_GROSS) AS M2M_SBD_REG_USG_GROSS,
    SUM(t.T_M2M_SBD_REG_USG_DISC) AS M2M_SBD_REG_USG_DISC,
    SUM(t.T_OCC_M2M_MRC) AS OCC_M2M_MRC,
	SUM(t.T_M2M_MRC_TOTAL) / NULLIF (
		SUM(t.T_TOTAL_M2M), 0 )
			AS M2M_MRC_PERCENT,
	SUM(t.T_M2M_USG_TOTAL) / NULLIF (
		SUM(t.T_TOTAL_M2M), 0 )
			AS M2M_USG_PERCENT,
	SUM(t.T_M2M_OTF_TOTAL) / NULLIF (
		SUM(t.T_TOTAL_M2M), 0 )
			AS M2M_OTF_PERCENT,
    SUM(t.T_M2M_MINS) AS M2M_MINS,
    SUM(t.T_M2M_KB) AS M2M_KB,
-----GDB--------------------------------------------------------------------------
	SUM(t.T_GDB_MRC) AS GDB_MRC,
	SUM(t.T_GDB_SUSPEND) AS GDB_SUSPEND,
	SUM(t.T_GDB_BYTES_ACTUAL) AS GDB_BYTES_ACTUAL,
	SUM(t.T_GDB_BYTES_RATED) AS GDB_BYTES_RATED,
	SUM(t.T_GDB_GROSS) AS GDB_GROSS,
	SUM(t.T_GDB_DISC) AS GDB_DISC,
	SUM(t.T_GDB_CF) AS GDB_CF,
	SUM(t.T_GDB_ACTIVATIONS) AS GDB_ACTIVATIONS,
	SUM(t.T_GDB_DEACTS) AS GDB_DEACTS,
	SUM(t.T_OCC_GDB_MRC) AS OCC_GDB_MRC,
	SUM(t.T_OCC_GDB_USAGE) AS OCC_GDB_USAGE,
	SUM(t.T_OCC_GDB_ACTIVATION) AS OCC_GDB_ACTIVATION,
	SUM(t.T_OCC_GDB_CYCLEFOLD) AS OCC_GDB_CYCLEFOLD,
	SUM(t.T_OCC_GDB_MISC) AS OCC_GDB_MISC,
-----TEL--------------------------------------------------------------------------
    SUM(t.T_TEL_ACC) AS TEL_ACC,
    SUM(t.T_TEL_PLUS1_MRC) AS TEL_PLUS1_MRC,
    SUM(t.T_TEL_ARC) AS TEL_ARC,
    SUM(t.T_TEL_VOICE_ACTUAL) AS TEL_VOICE_ACTUAL,
    SUM(t.T_TEL_VOICE_RATED) AS TEL_VOICE_RATED,
    SUM(t.T_TEL_VOICE_USG_GROSS) AS TEL_VOICE_USG_GROSS,
    SUM(t.T_TEL_VOICE_USG_DISC) AS TEL_VOICE_USG_DISC,
    SUM(t.T_TEL_VOICE_CYCLEFOLD) AS TEL_VOICE_CYCLEFOLD,
    SUM(t.T_TEL_DATA_ACTUAL) AS TEL_DATA_ACTUAL,
    SUM(t.T_TEL_DATA_RATED) AS TEL_DATA_RATED,
    SUM(t.T_TEL_DATA_USG_GROSS) AS TEL_DATA_USG_GROSS,
    SUM(t.T_TEL_DATA_USG_DISC) AS TEL_DATA_USG_DISC,
    SUM(t.T_TEL_DATA_CYCLEFOLD) AS TEL_DATA_CYCLEFOLD,
    SUM(t.T_SMS_MT_MESSAGES) AS SMS_MT_MESSAGES,
    SUM(t.T_SMS_MO_MESSAGES) AS SMS_MO_MESSAGES,
    SUM(t.T_SMS_MO_USG_GROSS) AS SMS_MO_USG_GROSS,
    SUM(t.T_TEL_USG_SMS_MO_DISC) AS TEL_USG_SMS_MO_DISC,
    SUM(t.T_SMS_MO_CYCLEFOLD) AS SMS_MO_CYCLEFOLD,
    SUM(t.T_TEL_ACTIVATIONS) AS TEL_ACTIVATIONS,
    SUM(t.T_OCC_TEL_MRC) AS OCC_TEL_MRC,
    SUM(t.T_OCC_TEL_PLUS1_MRC) AS OCC_TEL_PLUS1_MRC,
    SUM(t.T_OCC_TEL_USG) AS OCC_TEL_USG,
    SUM(t.T_OCC_SMS_USG) AS OCC_SMS_USG,
    SUM(t.T_OCC_TEL_CYCLEFOLD) AS OCC_TEL_CYCLEFOLD,
    SUM(t.T_OCC_SMS_CYCLEFOLD) AS OCC_SMS_CYCLEFOLD,
    SUM(t.T_OCC_TEL_ACTS) AS OCC_SMS_CYCLEFOLD,
    SUM(t.T_PREPAID_CHARGE_EVOUCHERS) AS PREPAID_CHARGE_EVOUCHERS,
    SUM(t.T_PREPAID_REFUND_EVOUCHERS) AS PREPAID_REFUND_EVOUCHERS,
    SUM(t.T_PREPAID_SPECIAL_HANDLING) AS PREPAID_SPECIAL_HANDLING,
    SUM(t.T_TEL_SCRATCH_CARDS) AS TEL_SCRATCH_CARDS,
    SUM(t.T_TEL_SIM_REACTIVATIONS) AS TEL_SIM_REACTIVATIONS,
    SUM(t.T_OCC_RUDICS_SETUP) AS OCC_RUDICS_SETUP,
    SUM(t.T_OCC_CREDIT_CARD_USG) AS OCC_CREDIT_CARD_USG,
    SUM(t.T_OCC_EVOUCHERS) AS OCC_EVOUCHERS,
    SUM(t.T_OCC_TEL_MISC) AS OCC_TEL_MISC,
	SUM(t.T_TEL_MRC_TOTAL) / NULLIF (
		SUM(t.T_TOTAL_TEL), 0 )
			AS TEL_MRC_PERCENT,
	SUM(t.T_TEL_USG_TOTAL) / NULLIF (
		SUM(t.T_TOTAL_TEL), 0 )
			AS TEL_USG_PERCENT,
	SUM(t.T_TEL_OTF_TOTAL) / NULLIF (
		SUM(t.T_TOTAL_TEL), 0 )
			AS TEL_OTF_PERCENT,
	SUM(t.T_TEL_OTF_TOTAL) - 
		SUM(        
			t.T_PREPAID_CHARGE_EVOUCHERS+
			t.T_PREPAID_REFUND_EVOUCHERS+
			t.T_PREPAID_SPECIAL_HANDLING)
				AS TEL_OTF_NO_VOUCHERS,
	SUM(t.T_TOTAL_TEL) - 
		SUM(        
			t.T_PREPAID_CHARGE_EVOUCHERS+
			t.T_PREPAID_REFUND_EVOUCHERS+
			t.T_PREPAID_SPECIAL_HANDLING)
				AS TOTAL_TEL_NO_VOUCHERS,
    SUM(t.T_TEL_PREPAID) AS TEL_PREPAID,
    SUM(t.T_PURCHASES_ONLY) AS PURCHASES_ONLY,
	SUM(t.T_PREPAID_CHARGE_EVOUCHERS) /
		SUM(t.T_TOTAL_TEL)
			AS TEL_PREPAID_OVER_TOTAL,
    SUM(t.T_VOICE_MINS) AS VOICE_MINS,
    SUM(t.T_NET_VOICE_CHARGES) AS NET_VOICE_CHARGES,
    SUM(t.T_DATA_MINS) AS DATA_MINS,
    SUM(t.T_NET_DATA_CHARGES) AS NET_DATA_CHARGES,
    SUM(t.T_SMS_EVENTS) AS SMS_EVENTS,
    SUM(t.T_NET_SMS_CHARGES) AS NET_SMS_CHARGES,
-----TEL POOL---------------------------------------------------------------------
    SUM(t.T_POOL_TEL_MEMBER_COUNT) AS POOL_TEL_MEMBER_COUNT,
    SUM(t.T_Pool_TEL_Group_MRC) AS POOL_TEL_GROUP_MRC,
    SUM(t.T_POOL_TEL_MEMBER_MRC) AS POOL_TEL_MEMBER_MRC,
    SUM(t.T_POOL_TEL_PENALTY) AS POOL_TEL_PENALTY,
    SUM(t.T_Pool_TEL_Voice_Secs_Actual) AS POOL_TEL_VOICE_SECS_ACTUAL,
    SUM(t.T_Pool_TEL_Voice_Secs_Rated) AS POOL_TEL_VOICE_SECS_RATED,
    SUM(t.T_Pool_TEL_Voice_USG_GROSS) AS POOL_TEL_VOICE_USG_GROSS,
    SUM(t.T_POOL_TEL_DATA_ACTUAL) AS POOL_TEL_DATA_ACTUAL,
    SUM(t.T_POOL_TEL_DATA_RATED) AS POOL_TEL_DATA_RATED,
    SUM(t.T_POOL_TEL_DATA_USG_GROSS) AS POOL_TEL_DATA_USG_GROSS,
    SUM(t.T_POOL_TEL_ACTIVATIONS) AS POOL_TEL_ACTIVATIONS,
    SUM(t.T_POOL_TEL_DEACTIVATIONS) AS POOL_TEL_DEACTIVATIONS,
	SUM(t.T_TEL_POOL_MRC_TOTAL) / NULLIF (
		SUM(t.T_TOTAL_TEL_POOL), 0 )
			AS TEL_POOL_MRC_PERCENT,
	SUM(t.T_TEL_POOL_USG_TOTAL) / NULLIF (
		SUM(t.T_TOTAL_TEL_POOL), 0 )
			AS TEL_POOL_USG_PERCENT,
	SUM(t.T_TEL_POOL_OTF_TOTAL) / NULLIF (
		SUM(t.T_TOTAL_TEL_POOL), 0 )
			AS TEL_POOL_OTF_PERCENT,
    SUM(t.T_TEL_POOL_MINS) AS TEL_POOL_MINS,
-----PAG--------------------------------------------------------------------------
	SUM(t.T_PAG_MRC) AS PAG_MRC,
	SUM(t.T_PAG_EVENTS) AS PAG_EVENTS,
	SUM(t.T_PAG_GROSS) AS PAG_GROSS,
	SUM(t.T_PAG_DISCOUNT) AS PAG_DISCOUNT,
	SUM(t.T_PAG_CYCLEFOLD) AS PAG_CYCLEFOLD,
	SUM(t.T_OCC_PAG_MRC) AS OCC_PAG_MRC,
	SUM(t.T_OCC_PAG_MISC) AS OCC_PAG_MISC,
	SUM(t.T_PAG_MRC_TOTAL) / NULLIF (
		SUM(t.T_TOTAL_PAG), 0 )
			AS PAG_MRC_PERCENT,
	SUM(t.T_PAG_USG_TOTAL) / NULLIF (
		SUM(t.T_TOTAL_PAG), 0 )
			AS PAG_USG_PERCENT,
	SUM(t.T_PAG_OTF_TOTAL) / NULLIF (
		SUM(t.T_TOTAL_PAG), 0 )
			AS PAG_OTF_PERCENT,
-----PTT--------------------------------------------------------------------------
    SUM(t.T_PTT_TG_MRC) AS PTT_TG_MRC,
    SUM(t.T_PTT_DVC_MRC) AS PTT_DVC_MRC,
    SUM(t.T_PTT_1YR_TERM_COMMIT) AS PTT_1YR_TERM_COMMIT,
    SUM(t.T_PTT_TG_VOICE_ACTUAL) AS PTT_TG_VOICE_ACTUAL,
    SUM(t.T_PTT_TG_VOICE_RATED) AS PTT_TG_VOICE_RATED,
    SUM(t.T_PTT_TG_VOICE_USG_GROSS) AS PTT_TG_VOICE_USG_GROSS,
    SUM(t.T_PTT_TG_VOICE_USG_DISC) AS PTT_TG_VOICE_USG_DISC,
    SUM(t.T_PTT_TG_VOICE_CYCLEFOLD) AS PTT_TG_VOICE_CYCLEFOLD,
    SUM(t.T_PTT_TG_Activations) AS PTT_TG_ACTIVATIONS,
    SUM(t.T_PTT_TG_Deactivations) AS PTT_TG_DEACTIVATIONS,
    SUM(t.T_PTT_DVC_Deactivations) AS PTT_DVC_DEACTIVATIONS,
    SUM(t.T_PTT_TG_1YR_CHANGE_FEE) AS PTT_TG_1YR_CHANGE_FEE,
    SUM(t.T_OCC_PTT_TG_MRC) AS OCC_PTT_TG_MRC,
    SUM(t.T_OCC_PTT_DVC_MRC) AS OCC_PTT_DVC_MRC,
    SUM(t.T_OCC_PTT_TG_VOICE_USG) AS OCC_PTT_TG_VOICE_USG,
    SUM(t.T_OCC_PTT_TG_ACTS) AS OCC_PTT_TG_ACTS,
    SUM(t.T_OCC_PTT_DVC_ACTS) AS OCC_PTT_DVC_ACTS,
    SUM(t.T_OCC_PTT_DVC_OTHER_REVENUE) AS OCC_PTT_DVC_OTHER_REVENUE,
	SUM(t.T_PTT_MRC_TOTAL) / NULLIF (
		SUM(t.T_TOTAL_PTT), 0 )
			AS TEL_MRC_PERCENT,
	SUM(t.T_PTT_USG_TOTAL) / NULLIF (
		SUM(t.T_TOTAL_PTT), 0 )
			AS PTT_USG_PERCENT,
	SUM(t.T_PTT_OTF_TOTAL) / NULLIF (
		SUM(t.T_TOTAL_PTT), 0 )
			AS PTT_OTF_PERCENT,
        SUM(t.T_PTT_TG_MINS) AS PTT_TG_MINS,
        SUM(t.T_PTT_TG_NET_USG) AS PTT_TG_NET_USG,
-----CERT-------------------------------------------------------------------------
    SUM(t.T_certus_voice_mrc) AS Certus_Voice_MRC,
    SUM(t.T_certus_data_mrc) AS Certus_Data_MRC,
    SUM(t.T_Certus_SBD_MRC) AS Certus_SBD_MRC,
    SUM(t.T_Certus_Stream_MRC) AS Certus_Stream_MRC,
    SUM(t.T_Certus_Safety_MRC) AS Certus_Safety_MRC,
    SUM(t.T_Certus_Plus_1_MRC) AS Certus_Plus_1_MRC,
    SUM(t.T_Certus_Suspend) AS Certus_Suspend,
    SUM(t.T_certus_data_arc) AS Certus_Data_ARC,
    SUM(t.T_certus_voice_actual) AS Certus_Voice_Actual,
    SUM(t.T_certus_voice_rated) AS Certus_Voice_Rated,
    SUM(t.T_Certus_Voice_Usg_Gross) AS Certus_Voice_Usg_Gross,
    SUM(t.T_Certus_Voice_Usg_Disc) AS Certus_Voice_Usg_Disc,
    SUM(t.T_certus_voice_cyclefold) AS Certus_Voice_Cyclefold,
    SUM(t.T_certus_data_actual) AS Certus_Data_Actual,
    SUM(t.T_certus_data_rated) AS Certus_Data_Rated,
    SUM(t.T_Certus_Data_Usg_Gross) AS Certus_Data_Usg_Gross,
    SUM(t.T_Certus_Data_Usg_Disc) AS Certus_Data_Usg_Disc,
    SUM(t.T_certus_data_cyclefold) AS Certus_Data_Cyclefold,
    0 AS Certus_SBD_Bytes_Actual,
    0 AS Certus_SBD_Bytes_Rated,
    0 AS Certus_SBD_Usg_Gross,
    0 AS Certus_SBD_Usg_Disc,
    0 AS Certus_SBD_Cyclefold,
    0 AS Certus_SBD_Mbx_Checks,
    0 AS Certus_SBD_Mbx_Usg_Gross,
    0 AS Certus_SBD_Mbx_Disc,
    0 AS Certus_SBD_Registrations,
    0 AS Certus_SBD_Reg_Usg_Gross,
    0 AS Certus_SBD_Reg_Usg_Disc,
    0 AS Certus_Streaming_Actual,
    0 AS Certus_Streaming_Rated,
    0 AS Certus_Streaming_Usg_Gross,
    0 AS Certus_Streaming_Usg_Disc,
    0 AS Certus_Streaming_Cyclefold,
    SUM(t.T_Certus_IMT_Actual) AS Certus_IMT_Actual,
    SUM(t.T_Certus_IMT_Rated) AS Certus_IMT_Rated,
    SUM(t.T_Certus_IMT_Usg_Gross) AS Certus_IMT_Usg_Gross,
    SUM(t.T_Certus_IMT_Usg_Disc) AS Certus_IMT_Usg_Disc,
    SUM(t.T_Certus_IMT_Cyclefold) AS Certus_IMT_Cyclefold,
    SUM(t.T_Certus_Wallet_Usg_Credits) AS Certus_Wallet_Usg_Credits,
    SUM(t.T_Certus_Activations) AS Certus_Activations,
    SUM(t.T_Certus_Activation_Credits) AS Certus_Activation_Credits,
    SUM(t.T_Certus_Deactivations) AS Certus_Deactivations,
    SUM(t.T_OCC_CERTUS_VERTICAL_DISC) AS OCC_CERTUS_VERTICAL_DISC,
    SUM(t.T_OCC_Certus_Voice_MRC) AS OCC_Certus_Voice_MRC,
    SUM(t.T_OCC_Certus_Data_MRC) AS OCC_Certus_Data_MRC,
    SUM(t.T_OCC_Certus_Voice_Usg) AS OCC_Certus_Voice_Usg,
    SUM(t.T_OCC_Certus_Data_Usg) AS OCC_Certus_Data_Usg,
    SUM(t.T_OCC_Certus_IMT_Usg) AS OCC_Certus_IMT_Usg,
    SUM(t.T_Certus_Scratch_Cards) AS Certus_Scratch_Cards,
    SUM(t.T_Certus_Misc) AS Certus_Misc,
	SUM(t.T_CERTUS_MRC_TOTAL) / NULLIF (
		SUM(t.T_TOTAL_CERTUS), 0 )
			AS CERTUS_MRC_PERCENT,
	SUM(t.T_CERTUS_USG_TOTAL) / NULLIF (
		SUM(t.T_TOTAL_CERTUS), 0 )
			AS CERTUS_USG_PERCENT,
	SUM(t.T_CERTUS_OTF_TOTAL) / NULLIF (
		SUM(t.T_TOTAL_CERTUS), 0 )
			AS CERTUS_OTF_PERCENT,
    SUM(t.T_Certus_Data_GB) AS Certus_Data_GB,
    SUM(t.T_Certus_Net_Data) AS Certus_Net_Data,
    SUM(t.T_Certus_Voice_Mins) AS Certus_Voice_Mins,
    SUM(t.T_Certus_Net_Voice) AS Certus_Net_Voice,
-----CERT POOL--------------------------------------------------------------------
    SUM(t.T_POOL_CERT_MEMBER_COUNT) AS POOL_CERT_MEMBER_COUNT,
    SUM(t.T_POOL_CERTUS_GROUP_MRC) AS POOL_CERTUS_GROUP_MRC,
    SUM(t.T_POOL_CERTUS_GROUP_ARC) AS POOL_CERTUS_GROUP_ARC,
    SUM(t.T_POOL_CERTUS_MEMBER_MRC) AS POOL_CERTUS_MEMBER_MRC,
    SUM(t.T_POOL_CERTUS_MEMBER_ARC) AS POOL_CERTUS_MEMBER_ARC,
    SUM(t.T_POOL_CERTUS_PENALTY) AS POOL_CERTUS_PENALTY,
    SUM(t.T_POOL_CERTUS_DATA_ACTUAL) AS POOL_CERTUS_DATA_ACTUAL,
    SUM(t.T_POOL_CERTUS_DATA_RATED) AS POOL_CERTUS_DATA_RATED,
    SUM(t.T_POOL_CERTUS_DATA_USG_GROSS) AS POOL_CERTUS_DATA_USG_GROSS,
    SUM(t.T_POOL_CERTUS_ACTIVATIONS) AS POOL_CERTUS_ACTIVATIONS,
    SUM(t.T_POOL_CERTUS_DEACTIVATIONS) AS POOL_CERTUS_DEACTIVATIONS,
	SUM(t.T_CERTUS_POOL_MRC_TOTAL) / NULLIF (
		SUM(t.T_TOTAL_CERTUS_POOL), 0 )
			AS CERTUS_POOL_MRC_PERCENT,
	SUM(t.T_CERTUS_POOL_USG_TOTAL) / NULLIF (
		SUM(t.T_TOTAL_CERTUS_POOL), 0 )
			AS CERTUS_POOL_USG_PERCENT,
	SUM(t.T_CERTUS_POOL_OTF_TOTAL) / NULLIF (
		SUM(t.T_TOTAL_CERTUS_POOL), 0 )
			AS CERTUS_POOL_OTF_PERCENT,
    SUM(t.T_CERTUS_POOL_GB) AS CERTUS_POOL_GB,
        SUM(t.T_TOTAL_CERTUS_POOL) / NULLIF (
		SUM(t.T_POOL_CERT_MEMBER_COUNT), 0)
            AS ARPU_CERTUS_POOL,
-----SP---------------------------------------------------------------------------
	SUM(t.T_OCC_USFS) AS OCC_USFS,
	SUM(t.T_OCC_COLO) AS OCC_COLO,
	SUM(t.T_OCC_CONTRA_REV) AS OCC_CONTRA_REV,
	SUM(t.T_OCC_SP_MISC) AS OCC_SP_MISC,
	SUM(t.T_LPFS) AS LPFS
FROM TOTALS t
GROUP BY t.T_INVDATE
ORDER BY t.T_INVDATE DESC;
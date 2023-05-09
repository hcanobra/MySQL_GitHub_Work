SELECT 
	MKT,
	ENB,
	EUtranCell,
	administrativeState,
	operationalState,
    count(EUtranCell) as Appearance
    
FROM VZW_DB.WJ_EricssonRadioConfigs

WHERE EUtranCell IN
	(
		SELECT 
			EUtranCell
		FROM VZW_DB.WJ_EricssonRadioConfigs
		WHERE Date_import = "2021-08-25"
			AND
			administrativeState in ('UNLOCKED','LOCKED')
            AND
            operationalState = 'DISABLED'
	)
    AND
	administrativeState in ('UNLOCKED','LOCKED')
	AND
	operationalState = 'DISABLED'

GROUP BY 
	EUtranCell,
	MKT,
	ENB,
	administrativeState,
	operationalState

ORDER BY count(EUtranCell) DESC;

/***************************************************
***************************************************/

SELECT 
	Date_import,
	MKT,
	ENB,
	EUtranCell,
	administrativeState,
	operationalState
    
FROM VZW_DB.WJ_EricssonRadioConfigs

WHERE 
	administrativeState in ('UNLOCKED','LOCKED')
	AND
	operationalState = 'DISABLED'
	AND
	EUtranCell = '010415_1_4';
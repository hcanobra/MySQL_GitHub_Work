SELECT 
	MKT,
    NAME,
	ENB,
	EUtranCell,
	administrativeState,
	operationalState,
    count(EUtranCell) as Appearance,
    CURDATE() AS DAY_PULLED
    
FROM VZW_DB.WJ_EricssonRadioConfigs

WHERE EUtranCell IN
	(
		SELECT 
			EUtranCell
		FROM VZW_DB.WJ_EricssonRadioConfigs
		WHERE Date_import = CURDATE()
			AND
			administrativeState in ('UNLOCKED','LOCKED')
            AND
            operationalState = 'DISABLED'
		GROUP BY EUtranCell
	)
    AND
	administrativeState in ('UNLOCKED','LOCKED')
	AND
	operationalState = 'DISABLED'
    AND
    MKT IN (10,11,12,13)
	AND
	Date_import BETWEEN DATE_ADD(CURDATE(), INTERVAL -90 DAY) AND CURDATE()

GROUP BY 
	EUtranCell,
	MKT,
    NAME,
	ENB,
	administrativeState,
	operationalState

ORDER BY count(EUtranCell) DESC
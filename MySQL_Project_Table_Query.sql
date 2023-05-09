Select *

FROM SP_PROJECT_PRIORITY_LIST PL
LEFT JOIN SP_PROJECT_NOTES NT ON PL.Priority_id = NT.Priority_id;


/*************************************
*************************************/

Select 
	PL.Priority_id,
	PL.Site,
    PL.FUZE_Project_ID,
    NT.Notes_CODE,
    NT.Notes,
    NT.Date_trn

FROM SP_PROJECT_PRIORITY_LIST PL
LEFT JOIN SP_PROJECT_NOTES NT ON PL.Priority_id = NT.Priority_id;


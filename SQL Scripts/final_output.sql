CREATE TABLE final_output_synonyms
SELECT y.Id DescriptionId, x.ConceptId, y.TypeId, y.Term
FROM (SELECT * FROM final_output_conceptid) AS x
INNER JOIN sct_description_output AS y
ON x.ConceptId=y.ConceptId
ORDER BY x.ConceptId;

CREATE TABLE final_output_preferredname
SELECT y.ConceptId, y.DescriptionId, y.Term 
FROM (SELECT * FROM sct_language_set_output1 WHERE AcceptabilityId=900000000000548007) AS x
INNER JOIN final_output_synonyms AS y
ON y.DescriptionId=x.ReferencedComponentId
WHERE y.TypeId=900000000000013009
ORDER BY y.ConceptId;

-- SELECT DISTINCT final_output_synonyms.ConceptId FROM final_output_synonyms 
-- WHERE final_output_synonyms.ConceptId NOT IN (SELECT ConceptId FROM final_output_preferredname);

CREATE TABLE final_output_synonyms_NotInPreferredName
SELECT x.ConceptId, x.DescriptionId, x.Term Synonyms
FROM (SELECT * FROM final_output_synonyms WHERE TypeId=900000000000013009) AS x
INNER JOIN final_output_preferredname AS y
ON x.ConceptId=y.ConceptId AND x.DescriptionId!=y.DescriptionId
ORDER BY x.ConceptId;

CREATE TABLE final_output_mapping_ICD10
SELECT y.ConceptId, y.Term, x.MapTarget
FROM (SELECT * FROM final_output_preferredname) AS y
INNER JOIN sct_map_snapshot_output_icd10 AS x
ON x.ReferencedComponentId=y.ConceptId
ORDER BY x.ReferencedComponentId, x.MapGroup;

CREATE TABLE CountName
SELECT ConceptId, COUNT(*) AS num FROM `nhs_dbs_30.3.0`.final_output_synonyms_notinpreferredname GROUP BY ConceptId;

CREATE TABLE CountMapping
SELECT ConceptId, COUNT(*) AS num FROM `nhs_dbs_30.3.0`.final_output_mapping_icd10 GROUP BY ConceptId;
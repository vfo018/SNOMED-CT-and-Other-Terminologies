CREATE TABLE sct_relationship_tree
SELECT * FROM sct_relationship WHERE TypeId=116680003;



CREATE TABLE sct_relationship_output_tree
SELECT y.Id, y.EffectiveTime, ActiveStatus, ModuleId, y.SourceId, y.DestinationId, RelationshipGroup, TypeId, CharacteristicTypeId, ModifierId FROM (SELECT Id, SourceId, max(EffectiveTime) as EffectiveTime FROM sct_relationship_tree GROUP BY SourceId, Id) AS x
INNER JOIN sct_relationship_tree AS y 
ON x.SourceId = y.SourceId and y.EffectiveTime = x.EffectiveTime AND x.Id=y.Id
WHERE y.ActiveStatus = 1
ORDER BY y.SourceId;

CREATE TABLE sct_description_fsn
SELECT * FROM sct_description WHERE TypeId=900000000000003001;

CREATE TABLE sct_description_fsn_output AS 
SELECT Id, y.EffectiveTime, ActiveStatus, ModuleId, y.ConceptId, LanguageCode, TypeId, Term, CaseSignificanceId 
FROM (SELECT ConceptId, max(EffectiveTime) as EffectiveTime FROM sct_description_fsn GROUP BY ConceptId) AS x
INNER JOIN sct_description_fsn AS y 
ON x.ConceptId = y.ConceptId and x.EffectiveTime = y.EffectiveTime
WHERE y.ActiveStatus = 1
ORDER BY y.ConceptId;

CREATE TABLE sct_description_output AS 
SELECT Id, y.EffectiveTime, ActiveStatus, ModuleId, y.ConceptId, LanguageCode, TypeId, Term, CaseSignificanceId 
FROM (SELECT ConceptId, max(EffectiveTime) as EffectiveTime FROM sct_description GROUP BY ConceptId, Id) AS x
INNER JOIN sct_description AS y 
ON x.ConceptId = y.ConceptId and x.EffectiveTime = y.EffectiveTime
WHERE y.ActiveStatus = 1
GROUP BY y.ConceptId, y.Id
ORDER BY y.ConceptId;

CREATE TABLE sct_concept_output AS 
SELECT y.Id, y.EffectiveTime, ActiveStatus, ModuleId, DefinitionStatusId
FROM (SELECT Id, max(EffectiveTime) as EffectiveTime FROM sct_concept GROUP BY Id) AS x
INNER JOIN sct_concept AS y 
ON x.Id = y.Id and x.EffectiveTime = y.EffectiveTime
WHERE y.ActiveStatus = 1
ORDER BY y.Id;

CREATE TABLE sct_map_snapshot_active
SELECT * FROM sct_map_snapshot WHERE ActiveStatus=1 AND RefsetId=999002271000000101;

CREATE TABLE sct_map_snapshot_output_icd10
SELECT Id, EffectiveTime, ActiveStatus, ModuleId, RefsetId, y.ReferencedComponentId, y.MapGroup, y.MapPriority, MapRule, MapAdvice, MapTarget, CorrelationId, MapBlock
FROM (SELECT ReferencedComponentId, MapGroup, max(MapPriority+0) MapPriority FROM sct_map_snapshot_active WHERE MapBlock=1
GROUP BY ReferencedComponentId, MapGroup) AS x
INNER JOIN sct_map_snapshot_active AS y
ON x.ReferencedComponentId=y.ReferencedComponentId AND x.MapGroup=y.MapGroup AND x.MapPriority=y.MapPriority AND y.MapBlock=1
ORDER BY y.ReferencedComponentId, x.MapPriority, x.MapGroup;


CREATE TABLE sct_language_set_output AS 
SELECT * FROM sct_language_set WHERE (RefsetId=999001261000000100 OR RefsetId=999000691000001104) AND ActiveStatus=1;

CREATE TABLE sct_language_set_output1 AS 
SELECT Id, y.EffectiveTime, ActiveStatus, ModuleId, RefsetId, x.ReferencedComponentId, AcceptabilityId
FROM (SELECT ReferencedComponentId, max(EffectiveTime) as EffectiveTime FROM sct_language_set_output GROUP BY ReferencedComponentId) AS x
INNER JOIN sct_language_set_output AS y 
ON x.ReferencedComponentId = y.ReferencedComponentId and x.EffectiveTime = y.EffectiveTime
WHERE y.ActiveStatus = 1
ORDER BY y.ReferencedComponentId;



-- CREATE TABLE final_output_mapping_ICD10
-- SELECT y.ConceptId, y.Term, x.MapTarget
-- FROM (SELECT * FROM nhs_dbs.final_output_preferredname) AS y
-- INNER JOIN nhs_dbs.sct_map_snapshot_output_icd10 AS x
-- ON x.ReferencedComponentId=y.ConceptId
-- ORDER BY x.ReferencedComponentId, x.MapGroup;

CREATE TABLE sct_relationship_proceduresite
SELECT * FROM `nhs_dbs_32.2.0`.sct_relationship WHERE TypeId=363704007;

CREATE TABLE sct_relationship_proceduresite_direct
SELECT * FROM `nhs_dbs_32.2.0`.sct_relationship WHERE TypeId=405813007;

CREATE TABLE sct_relationship_proceduresite_indirect
SELECT * FROM `nhs_dbs_32.2.0`.sct_relationship WHERE TypeId=405814001;

CREATE TABLE sct_relationship_output_proceduresite
SELECT y.Id, y.EffectiveTime, ActiveStatus, ModuleId, y.SourceId, y.DestinationId, RelationshipGroup, TypeId, CharacteristicTypeId, ModifierId FROM (SELECT Id, SourceId, max(EffectiveTime) as EffectiveTime FROM sct_relationship_proceduresite GROUP BY SourceId, Id) AS x
INNER JOIN sct_relationship_proceduresite AS y 
ON x.SourceId = y.SourceId and y.EffectiveTime = x.EffectiveTime AND x.Id=y.Id
WHERE y.ActiveStatus = 1
ORDER BY y.SourceId;

CREATE TABLE sct_relationship_output_proceduresite_direct
SELECT y.Id, y.EffectiveTime, ActiveStatus, ModuleId, y.SourceId, y.DestinationId, RelationshipGroup, TypeId, CharacteristicTypeId, ModifierId FROM (SELECT Id, SourceId, max(EffectiveTime) as EffectiveTime FROM sct_relationship_proceduresite_direct GROUP BY SourceId, Id) AS x
INNER JOIN sct_relationship_proceduresite_direct AS y 
ON x.SourceId = y.SourceId and y.EffectiveTime = x.EffectiveTime AND x.Id=y.Id
WHERE y.ActiveStatus = 1
ORDER BY y.SourceId;

CREATE TABLE sct_relationship_output_proceduresite_indirect
SELECT y.Id, y.EffectiveTime, ActiveStatus, ModuleId, y.SourceId, y.DestinationId, RelationshipGroup, TypeId, CharacteristicTypeId, ModifierId FROM (SELECT Id, SourceId, max(EffectiveTime) as EffectiveTime FROM sct_relationship_proceduresite_indirect GROUP BY SourceId, Id) AS x
INNER JOIN sct_relationship_proceduresite_indirect AS y 
ON x.SourceId = y.SourceId and y.EffectiveTime = x.EffectiveTime AND x.Id=y.Id
WHERE y.ActiveStatus = 1
ORDER BY y.SourceId;

CREATE TABLE final_output_proceduresiteid
SELECT SourceId, DestinationId FROM sct_relationship_output_proceduresite;

CREATE TABLE final_output_proceduresiteid_direct
SELECT SourceId, DestinationId FROM sct_relationship_output_proceduresite_direct;

CREATE TABLE final_output_proceduresiteid_indirect
SELECT SourceId, DestinationId FROM sct_relationship_output_proceduresite_indirect;

CREATE TABLE final_output_synonyms_proceduresiteid
SELECT x.SourceId, x.DestinationId,y.Id DescriptionId, y.TypeId, y.Term
FROM (SELECT * FROM final_output_proceduresiteid) AS x
INNER JOIN sct_description_output AS y
ON x.DestinationId=y.ConceptId
ORDER BY x.SourceId;

CREATE TABLE final_output_synonyms_proceduresiteid_direct
SELECT x.SourceId, x.DestinationId,y.Id DescriptionId, y.TypeId, y.Term
FROM (SELECT * FROM final_output_proceduresiteid_direct) AS x
INNER JOIN sct_description_output AS y
ON x.DestinationId=y.ConceptId
ORDER BY x.SourceId;

CREATE TABLE final_output_synonyms_proceduresiteid_indirect
SELECT x.SourceId, x.DestinationId,y.Id DescriptionId, y.TypeId, y.Term
FROM (SELECT * FROM final_output_proceduresiteid_indirect) AS x
INNER JOIN sct_description_output AS y
ON x.DestinationId=y.ConceptId
ORDER BY x.SourceId;

CREATE TABLE final_output_preferredname_proceduresiteid
SELECT y.SourceId, y.DestinationId, y.DescriptionId, y.Term 
FROM (SELECT * FROM sct_language_set_output1 WHERE AcceptabilityId=900000000000548007) AS x
INNER JOIN final_output_synonyms_proceduresiteid AS y
ON y.DescriptionId=x.ReferencedComponentId
WHERE y.TypeId=900000000000013009
ORDER BY y.SourceId;

CREATE TABLE final_output_preferredname_proceduresiteid_direct
SELECT y.SourceId, y.DestinationId, y.DescriptionId, y.Term 
FROM (SELECT * FROM sct_language_set_output1 WHERE AcceptabilityId=900000000000548007) AS x
INNER JOIN final_output_synonyms_proceduresiteid_direct AS y
ON y.DescriptionId=x.ReferencedComponentId
WHERE y.TypeId=900000000000013009
ORDER BY y.SourceId;

CREATE TABLE final_output_preferredname_proceduresiteid_indirect
SELECT y.SourceId, y.DestinationId, y.DescriptionId, y.Term 
FROM (SELECT * FROM sct_language_set_output1 WHERE AcceptabilityId=900000000000548007) AS x
INNER JOIN final_output_synonyms_proceduresiteid_indirect AS y
ON y.DescriptionId=x.ReferencedComponentId
WHERE y.TypeId=900000000000013009
ORDER BY y.SourceId;



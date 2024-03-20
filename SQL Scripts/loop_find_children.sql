CREATE TABLE result0
SELECT * FROM sct_relationship_output_tree WHERE DestinationId=404684003 OR DestinationId=243796009 OR DestinationId=444071008 OR DestinationId=444107005;

CREATE TABLE Loop1
SELECT y.Id, y.EffectiveTime, y.ActiveStatus, y.ModuleId, y.SourceId, y.DestinationId, RelationshipGroup, TypeId, CharacteristicTypeId, ModifierId FROM 
(SELECT SourceId FROM result0) AS x
INNER JOIN sct_relationship_output_tree AS y
ON x.SourceId=y.DestinationId
GROUP BY SourceId;

CREATE TABLE Loop19
SELECT y.Id, y.EffectiveTime, y.ActiveStatus, y.ModuleId, y.SourceId, y.DestinationId, RelationshipGroup, TypeId, CharacteristicTypeId, ModifierId FROM 
(SELECT SourceId FROM Loop18) AS x
INNER JOIN sct_relationship_output_tree AS y
ON x.SourceId=y.DestinationId
GROUP BY SourceId;

INSERT INTO result0
SELECT * FROM loop1;

INSERT INTO result0
SELECT * FROM loop19;


CREATE TABLE final_output_ConceptId
SELECT SourceId AS ConceptId FROM result0 GROUP BY SourceId;


INSERT INTO final_output_ConceptId
VALUES('404684003');

INSERT INTO final_output_ConceptId
VALUES('243796009');

INSERT INTO final_output_ConceptId
VALUES('444071008');

INSERT INTO final_output_ConceptId
VALUES('444107005');

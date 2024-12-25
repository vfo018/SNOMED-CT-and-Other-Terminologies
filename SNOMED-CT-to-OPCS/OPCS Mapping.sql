-- CREATE TABLE sct_map_snapshot_active_opcs
-- SELECT * FROM sct_map_snapshot WHERE ActiveStatus=1 AND RefsetId=1126441000000105;

CREATE TABLE sct_map_snapshot_output_opcs
SELECT Id, EffectiveTime, ActiveStatus, ModuleId, RefsetId, y.ReferencedComponentId, y.MapGroup, y.MapPriority, MapRule, MapAdvice, MapTarget, CorrelationId, MapBlock
FROM (SELECT ReferencedComponentId, MapGroup, max(MapPriority+0) MapPriority FROM sct_map_snapshot_active_opcs WHERE MapBlock=1
GROUP BY ReferencedComponentId, MapGroup) AS x
INNER JOIN sct_map_snapshot_active_opcs AS y
ON x.ReferencedComponentId=y.ReferencedComponentId AND x.MapGroup=y.MapGroup AND x.MapPriority=y.MapPriority AND y.MapBlock=1
ORDER BY y.ReferencedComponentId, x.MapGroup, x.MapPriority;

-- SELECT ReferencedComponentId, COUNT(*) num FROM `nhs_dbs_32.5.0`.sct_map_snapshot_output_opcs GROUP BY ReferencedComponentId;
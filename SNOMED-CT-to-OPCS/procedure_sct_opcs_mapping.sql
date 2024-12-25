CREATE TABLE porcedureid_sct_opcs_mapping
SELECT y.ProcedureId, y.Term, x.MapTarget
FROM (SELECT * FROM procedureid_sct_mapping) AS y
INNER JOIN sct_map_snapshot_output_opcs AS x
ON x.ReferencedComponentId+0=y.ConceptId+0
ORDER BY y.ConceptId, x.MapGroup;
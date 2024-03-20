CREATE TABLE `nhs_dbs_32.12.0`.`sct_concept` (
	Id varchar(255),
    EffectiveTime int,
    ActiveStatus int,
    ModuleId varchar(255),
    DefinitionStatusId varchar(255)
);

CREATE TABLE `nhs_dbs_32.12.0`.`sct_concept_int` (
	Id varchar(255),
    EffectiveTime int,
    ActiveStatus int,
    ModuleId varchar(255),
    DefinitionStatusId varchar(255)
);


LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\sct2_Concept_Snapshot_INT_20210131.txt' INTO TABLE sct_concept_int;
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\sct2_Concept_Snapshot_INT_20210131.txt' INTO TABLE sct_concept;
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\sct2_Concept_UKCRSnapshot_GB1000000_20220413.txt' INTO TABLE sct_concept;
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\sct2_Concept_UKCLSnapshot_GB1000000_20220413.txt' INTO TABLE sct_concept;
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\sct2_Concept_UKEDSnapshot_GB_20220413.txt' INTO TABLE sct_concept;

CREATE TABLE `nhs_dbs_32.12.0`.`sct_description` (
	Id varchar(255),
    EffectiveTime varchar(255),
    ActiveStatus varchar(255),
    ModuleId varchar(255),
    ConceptId varchar(255),
    LanguageCode varchar(255),
    TypeId varchar(255),
		Term varchar(255),
    CaseSignificanceId varchar(255)
);

CREATE TABLE `nhs_dbs_32.12.0`.`sct_description_int` (
	Id varchar(255),
    EffectiveTime varchar(255),
    ActiveStatus varchar(255),
    ModuleId varchar(255),
    ConceptId varchar(255),
    LanguageCode varchar(255),
    TypeId varchar(255),
		Term varchar(255),
    CaseSignificanceId varchar(255)
);

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\sct2_Description_Snapshot-en_INT_20210131.txt' INTO TABLE sct_description_int;
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\sct2_Description_Snapshot-en_INT_20210131.txt' INTO TABLE sct_description;
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\sct2_Description_UKCLSnapshot-en_GB1000000_20220413.txt' INTO TABLE sct_description;
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\sct2_Description_UKCRSnapshot-en_GB1000000_20220413.txt' INTO TABLE sct_description;
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\sct2_Description_UKEDSnapshot-en_GB_20220413.txt' INTO TABLE sct_description;

CREATE TABLE `nhs_dbs_32.12.0`.`sct_relationship` (
	Id varchar(255),
    EffectiveTime varchar(255),
    ActiveStatus varchar(255),
    ModuleId varchar(255),
    SourceId varchar(255),
    DestinationId varchar(255),
    RelationshipGroup varchar(255),
    TypeId varchar(255),
	CharacteristicTypeId varchar(255),
    ModifierId varchar(255)
);

CREATE TABLE `nhs_dbs_32.12.0`.`sct_relationship_int` (
	Id varchar(255),
    EffectiveTime varchar(255),
    ActiveStatus varchar(255),
    ModuleId varchar(255),
    SourceId varchar(255),
    DestinationId varchar(255),
    RelationshipGroup varchar(255),
    TypeId varchar(255),
	CharacteristicTypeId varchar(255),
    ModifierId varchar(255)
);

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\sct2_Relationship_Snapshot_INT_20210131.txt' INTO TABLE sct_relationship;
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\sct2_Relationship_Snapshot_INT_20210131.txt' INTO TABLE sct_relationship_int;
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\sct2_Relationship_UKCLSnapshot_GB1000000_20220413.txt' INTO TABLE sct_relationship;
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\sct2_Relationship_UKCRSnapshot_GB1000000_20220413.txt' INTO TABLE sct_relationship;
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\sct2_Relationship_UKEDSnapshot_GB_20220413.txt' INTO TABLE sct_relationship;


CREATE TABLE `nhs_dbs_32.12.0`.`sct_map_snapshot` (
	Id varchar(255),
	EffectiveTime varchar(255),
	ActiveStatus varchar(255),
	ModuleId varchar(255),
	RefsetId varchar(255),
	ReferencedComponentId varchar(255),
	MapGroup varchar(255),
	MapPriority varchar(255),
	MapRule varchar(255),
	MapAdvice varchar(255),
	MapTarget varchar(255),
	CorrelationId varchar(255),
	MapBlock varchar(255)
);
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\der2_iisssciRefset_ExtendedMapUKCLSnapshot_GB1000000_20220413.txt' INTO TABLE sct_map_snapshot;
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\der2_iisssciRefset_ExtendedMapUKCRSnapshot_GB1000000_20220413.txt' INTO TABLE sct_map_snapshot;
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\der2_iisssciRefset_ExtendedMapUKEDSnapshot_GB_20220413.txt' INTO TABLE sct_map_snapshot;


CREATE TABLE `nhs_dbs_32.12.0`.`sct_language_set` (
       Id varchar(255),
       EffectiveTime varchar(255),
       ActiveStatus varchar(255),
       ModuleId varchar(255),
       RefsetId varchar(255),
       ReferencedComponentId varchar(255),
       AcceptabilityId varchar(255)
);
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\der2_cRefset_LanguageUKCLSnapshot-en_GB1000000_20220413.txt' INTO TABLE sct_language_set;
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\der2_cRefset_LanguageUKCRSnapshot-en_GB1000000_20220413.txt' INTO TABLE sct_language_set;
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\der2_cRefset_LanguageUKEDSnapshot-en_GB_20220413.txt' INTO TABLE sct_language_set;


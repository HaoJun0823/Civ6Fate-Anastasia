-- DATA_1
-- Author: HaoJun0823
-- DateCreated: 7/18/2022 4:09:42 PM
--------------------------------------------------------------
INSERT INTO TraitModifiers (TraitType, ModifierId) VALUES 
('TRAIT_LEADER_FGO_ANASTASIA', 'MODIFIER_ALL_PLOT_TILES');

INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES 
('MODIFIER_ALL_PLOT_TILES', 'MODIFIER_PLAYER_ADJUST_CITY_TILES', 0, 0, 0, NULL, NULL);

INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
('MODIFIER_ALL_PLOT_TILES', 'Amount', '7');

---

INSERT INTO TraitModifiers (TraitType, ModifierId) VALUES 
('TRAIT_LEADER_FGO_ANASTASIA', 'MODIFIER_ALL_DARK_COMBAT');

INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES 
('MODIFIER_ALL_DARK_COMBAT', 'MODIFIER_PLAYER_UNITS_ADJUST_COMBAT_STRENGTH', 0, 0, 0, 'REQSET_ANA_IS_DARK', NULL);

INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
('MODIFIER_ALL_DARK_COMBAT', 'Amount', '10');

-- RequirementSets

INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES 
('REQSET_ANA_IS_DARK', 'REQUIREMENTSET_TEST_ALL');

INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES 
('REQSET_ANA_IS_DARK', 'REQ_ANA_IS_DARK');

-- Requirements

INSERT INTO Requirements (RequirementId, RequirementType) VALUES 
('REQ_ANA_IS_DARK', 'REQUIREMENT_PLAYER_HAS_DARK_AGE');


---

INSERT INTO TraitModifiers (TraitType, ModifierId) VALUES 
('TRAIT_LEADER_FGO_ANASTASIA', 'MODIFIER_ALL_GOLD_DISTRICTS_PRODUCTION');

INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES 
('MODIFIER_ALL_GOLD_DISTRICTS_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_ALL_DISTRICTS_PRODUCTION', 0, 1, 0, 'REQSET_ANA_IS_GOLD', NULL);

INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
('MODIFIER_ALL_GOLD_DISTRICTS_PRODUCTION', 'Amount', '100');

-- RequirementSets

INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES 
('REQSET_ANA_IS_GOLD', 'REQUIREMENTSET_TEST_ALL');

INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES 
('REQSET_ANA_IS_GOLD', 'REQ_ANA_IS_GOLD');

-- Requirements

INSERT INTO Requirements (RequirementId, RequirementType) VALUES 
('REQ_ANA_IS_GOLD', 'REQUIREMENT_PLAYER_HAS_GOLDEN_AGE');

INSERT INTO TraitModifiers (TraitType, ModifierId) VALUES 
('TRAIT_LEADER_FGO_ANASTASIA', 'MODIFIER_ALL_MERCHANT');

INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES 
('MODIFIER_ALL_MERCHANT', 'MODIFIER_PLAYER_ADJUST_GREAT_PERSON_POINTS_PERCENT', 0, 1, 0, NULL, NULL);

INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
('MODIFIER_ALL_MERCHANT', 'Amount', '50'), 
('MODIFIER_ALL_MERCHANT', 'GreatPersonClassType', 'GREAT_PERSON_CLASS_MERCHANT');

INSERT INTO TraitModifiers (TraitType, ModifierId) VALUES 
('TRAIT_LEADER_FGO_ANASTASIA', 'MODIFIER_ALL_ENGINEER');

INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES 
('MODIFIER_ALL_ENGINEER', 'MODIFIER_PLAYER_ADJUST_GREAT_PERSON_POINTS_PERCENT', 0, 1, 0, NULL, NULL);

INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
('MODIFIER_ALL_ENGINEER', 'Amount', '50'), 
('MODIFIER_ALL_ENGINEER', 'GreatPersonClassType', 'GREAT_PERSON_CLASS_ENGINEER');

INSERT INTO TraitModifiers (TraitType, ModifierId) VALUES 
('TRAIT_LEADER_FGO_ANASTASIA', 'MODIFIER_ALL_SCIENTIST');

INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES 
('MODIFIER_ALL_SCIENTIST', 'MODIFIER_PLAYER_ADJUST_GREAT_PERSON_POINTS_PERCENT', 0, 1, 0, NULL, NULL);

INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
('MODIFIER_ALL_SCIENTIST', 'Amount', '50'), 
('MODIFIER_ALL_SCIENTIST', 'GreatPersonClassType', 'GREAT_PERSON_CLASS_SCIENTIST');

---

INSERT INTO TraitModifiers (TraitType, ModifierId) VALUES 
('TRAIT_LEADER_FGO_ANASTASIA', 'MODIFIER_UNIT_ANA_ATTACH');

INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES 
('MODIFIER_UNIT_ANA_ATTACH', 'MODIFIER_PLAYER_UNITS_ATTACH_MODIFIER', 0, 0, 0, NULL, NULL);

INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
('MODIFIER_UNIT_ANA_ATTACH', 'ModifierId', 'MODIFIER_ALL_HOMELAND_MOVEMENT');

INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES 
('MODIFIER_ALL_HOMELAND_MOVEMENT', 'MODIFIER_PLAYER_UNIT_ADJUST_MOVEMENT', 0, 1, 0, NULL, 'REQSET_FGO_ANA_HOMELAND');

INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
('MODIFIER_ALL_HOMELAND_MOVEMENT', 'Amount', '4');

-- RequirementSets

INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES 
('REQSET_FGO_ANA_HOMELAND', 'REQUIREMENTSET_TEST_ALL');

INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES 
('REQSET_FGO_ANA_HOMELAND', 'REQ_ANA_HOMELAND');

-- Requirements

INSERT INTO Requirements (RequirementId, RequirementType) VALUES 
('REQ_ANA_HOMELAND', 'REQUIREMENT_UNIT_ON_HOME_CONTINENT');
-- Create the D&D database and switch to it
CREATE DATABASE dnd_database;
USE dnd_database;

-- Equipment table for general items (excluding weapons, armor, and shields)
CREATE TABLE equipment (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,  -- Name of the item
    type VARCHAR(100) NOT NULL,  -- Type of equipment (e.g., wand, tool, etc.)
    description TEXT,  -- Item details
    weight FLOAT,  -- Item weight in lbs
    value INT,  -- Cost in gold pieces (GP)
    spell_effect TEXT NULL,  -- Optional magical effect
    rarity VARCHAR(50) NULL,  -- Common, Uncommon, Rare, etc.
    attunement BOOLEAN DEFAULT FALSE  -- Whether attunement is required
);

-- Armor and Shields table for defensive gear
CREATE TABLE armor_shields (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,  -- Name of the armor or shield
    armor_class INT NOT NULL,  -- AC bonus provided
    type ENUM('Light', 'Medium', 'Heavy', 'Shield') NOT NULL,  -- Armor category
    weight FLOAT,  -- Weight in lbs
    value INT,  -- Cost in GP
    properties TEXT,  -- Special properties (e.g., "Stealth Disadvantage")
    strength_requirement INT NULL,  -- Minimum strength required for use
    stealth_disadvantage BOOLEAN DEFAULT FALSE,  -- Whether it hinders stealth
    max_dex_bonus INT NULL  -- Maximum Dexterity bonus allowed
);

-- Weapons table for melee and `range`d weapons
CREATE TABLE weapons (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,  -- Weapon name
    damage VARCHAR(50) NOT NULL,  -- Damage dice (e.g., "1d8")
    damage_type VARCHAR(50) NOT NULL,  -- Slashing, Piercing, Bludgeoning, etc.
    weapon_type ENUM('Melee', '`range`d') NOT NULL,  -- Weapon category
    `range` VARCHAR(50) NULL,  -- `range` for `range`d weapons
    `range` VARCHAR(50) NULL,  -- `range` for `range`d weapons
    weight FLOAT,  -- Weight in lbs
    value INT,  -- Cost in GP
    properties TEXT,  -- Additional traits (e.g., "Finesse, Two-Handed")
    handedness ENUM('One-Handed', 'Two-Handed', 'Versatile') NULL,  -- How the weapon is wielded
    ammunition_type VARCHAR(50) NULL  -- Type of ammo if applicable (e.g., Arrows, Bolts)
);

-- Consumables table for items like potions, scrolls, and food
CREATE TABLE consumables (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,  -- Consumable name
    effect TEXT NOT NULL,  -- Effect description (e.g., "Restores 10 HP")
    duration VARCHAR(255),  -- Duration of effect (if applicable)
    value INT,  -- Cost in GP
    uses INT DEFAULT 1,  -- Number of uses before depletion
    restores VARCHAR(100) NULL,  -- What it restores (HP, Spell Slot, etc.)
    rarity VARCHAR(50) NULL  -- Common, Uncommon, Rare, etc.
);

-- Monsters table for various creatures and NPCs
CREATE TABLE monsters (
    name VARCHAR(255),
    size VARCHAR(50),
    type VARCHAR(50),
    alignment VARCHAR(50),
    armor_class INT,
    armor_type VARCHAR(50),
    hit_points INT,
    hit_dice VARCHAR(20),
    hit_points_roll VARCHAR(20),
    speed_walk VARCHAR(20),
    strength INT,
    dexterity INT,
    constitution INT,
    intelligence INT,
    wisdom INT,
    charisma INT,
    saving_throws TEXT,
    damage_vulnerabilities TEXT,
    damage_resistances TEXT,
    damage_immunities TEXT,
    condition_immunities TEXT,
    darkvision VARCHAR(20),
    passive_perception INT,
    languages TEXT,
    challenge_rating DECIMAL(4,2),
    proficiency_bonus INT,
    xp INT,
    special_abilities TEXT,
    actions TEXT,
    legendary_actions TEXT,
    image_url TEXT
);

CREATE TABLE spells ( 
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,  -- Spell name
    level INT NOT NULL,  -- Spell level (0 for cantrips)
    school VARCHAR(100) NOT NULL,  -- Magic school (e.g., Evocation, Necromancy)
    casting_time VARCHAR(50),  -- Time required to cast (e.g., "1 Action")
    `range` VARCHAR(50),  -- Spell range (e.g., "Self", "60 ft")
    duration VARCHAR(50),  -- Duration (e.g., "Up to 1 minute")
    description TEXT,  -- Full spell description
    components VARCHAR(50),  -- V, S, M (Verbal, Somatic, Material)
    concentration BOOLEAN DEFAULT FALSE,  -- If the spell requires concentration
    ritual BOOLEAN DEFAULT FALSE,  -- If the spell can be cast as a ritual
    attack_type VARCHAR(50),  -- Type of attack (e.g., melee)
    damage VARCHAR(100),  -- Damage details (e.g., "3d6 necrotic")
    higher_level VARCHAR(500),  -- Higher level spell effects (if any)
    classes VARCHAR(255),  -- List of classes that can cast the spell
    subclasses VARCHAR(255)  -- List of subclasses that can cast the spell
);


INSERT INTO monsters (name, size, type, alignment, armor_class, armor_type, hit_points, hit_dice, hit_points_roll,
                          speed_walk, strength, dexterity, constitution, intelligence, wisdom, charisma, saving_throws, 
                          damage_vulnerabilities, damage_resistances, damage_immunities, condition_immunities, 
                          darkvision, passive_perception, languages, challenge_rating, proficiency_bonus, xp, 
                          special_abilities, actions, legendary_actions, image_url)
    VALUES 
    ('Aboleth', 'Large', 'aberration', 'lawful evil', 17, 'natural', 135, 
            '18d10', '18d10+36', '10 ft.', 21, 9, 15, 18, 
            15, 18, 'Saving Throw: CON, Saving Throw: INT, Saving Throw: WIS, Skill: History, Skill: Perception', '', '', 
            '', '', '120 ft.', 20, 'Deep Speech, telepathy 120 ft.', 
            10, 4, 5900, 'Amphibious: The aboleth can breathe air and water.; Mucous Cloud: While underwater, the aboleth is surrounded by transformative mucus. A creature that touches the aboleth or that hits it with a melee attack while within 5 ft. of it must make a DC 14 Constitution saving throw. On a failure, the creature is diseased for 1d4 hours. The diseased creature can breathe only underwater.; Probing Telepathy: If a creature communicates telepathically with the aboleth, the aboleth learns the creature''s greatest desires if the aboleth can see the creature.', 'Multiattack: The aboleth makes three tentacle attacks.; Tentacle: Melee Weapon Attack: +9 to hit, reach 10 ft., one target. Hit: 12 (2d6 + 5) bludgeoning damage. If the target is a creature, it must succeed on a DC 14 Constitution saving throw or become diseased. The disease has no effect for 1 minute and can be removed by any magic that cures disease. After 1 minute, the diseased creature''s skin becomes translucent and slimy, the creature can''t regain hit points unless it is underwater, and the disease can be removed only by heal or another disease-curing spell of 6th level or higher. When the creature is outside a body of water, it takes 6 (1d12) acid damage every 10 minutes unless moisture is applied to the skin before 10 minutes have passed.; Tail: Melee Weapon Attack: +9 to hit, reach 10 ft., one target. Hit: 15 (3d6 + 5) bludgeoning damage.; Enslave: The aboleth targets one creature it can see within 30 ft. of it. The target must succeed on a DC 14 Wisdom saving throw or be magically charmed by the aboleth until the aboleth dies or until it is on a different plane of existence from the target. The charmed target is under the aboleth''s control and can''t take reactions, and the aboleth and the target can communicate telepathically with each other over any distance.
Whenever the charmed target takes damage, the target can repeat the saving throw. On a success, the effect ends. No more than once every 24 hours, the target can also repeat the saving throw when it is at least 1 mile away from the aboleth.', 'Detect: The aboleth makes a Wisdom (Perception) check.; Tail Swipe: The aboleth makes one tail attack.; Psychic Drain (Costs 2 Actions): One creature charmed by the aboleth takes 10 (3d6) psychic damage, and the aboleth regains hit points equal to the damage the creature takes.', '/api/2014/images/monsters/aboleth.png'),

    ('Acolyte', 'Medium', 'humanoid', 'any alignment', 10, 'dex', 9, 
            '2d8', '2d8', '30 ft.', 10, 10, 10, 10, 
            14, 11, 'Skill: Medicine, Skill: Religion', '', '', 
            '', '', 'None', 12, 'any one language (usually Common)', 
            0.25, 2, 50, 'Spellcasting: The acolyte is a 1st-level spellcaster. Its spellcasting ability is Wisdom (spell save DC 12, +4 to hit with spell attacks). The acolyte has following cleric spells prepared:

- Cantrips (at will): light, sacred flame, thaumaturgy
- 1st level (3 slots): bless, cure wounds, sanctuary', 'Club: Melee Weapon Attack: +2 to hit, reach 5 ft., one target. Hit: 2 (1d4) bludgeoning damage.', '', '/api/2014/images/monsters/acolyte.png'),
    

    ('Adult Black Dragon', 'Huge', 'dragon', 'chaotic evil', 19, 'natural', 195, 
            '17d12', '17d12+85', '40 ft.', 23, 14, 21, 14, 
            13, 17, 'Saving Throw: DEX, Saving Throw: CON, Saving Throw: WIS, Saving Throw: CHA, Skill: Perception, Skill: Stealth', '', '', 
            'acid', '', '120 ft.', 21, 'Common, Draconic', 
            14, 5, 11500, 'Amphibious: The dragon can breathe air and water.; Legendary Resistance: If the dragon fails a saving throw, it can choose to succeed instead.', 'Multiattack: The dragon can use its Frightful Presence. It then makes three attacks: one with its bite and two with its claws.; Bite: Melee Weapon Attack: +11 to hit, reach 10 ft., one target. Hit: 17 (2d10 + 6) piercing damage plus 4 (1d8) acid damage.; Claw: Melee Weapon Attack: +11 to hit, reach 5 ft., one target. Hit: 13 (2d6 + 6) slashing damage.; Tail: Melee Weapon Attack: +11 to hit, reach 15 ft., one target. Hit: 15 (2d8 + 6) bludgeoning damage.; Frightful Presence: Each creature of the dragon''s choice that is within 120 feet of the dragon and aware of it must succeed on a DC 16 Wisdom saving throw or become frightened for 1 minute. A creature can repeat the saving throw at the end of each of its turns, ending the effect on itself on a success. If a creature''s saving throw is successful or the effect ends for it, the creature is immune to the dragon''s Frightful Presence for the next 24 hours.; Acid Breath: The dragon exhales acid in a 60-foot line that is 5 feet wide. Each creature in that line must make a DC 18 Dexterity saving throw, taking 54 (12d8) acid damage on a failed save, or half as much damage on a successful one.', 'Detect: The dragon makes a Wisdom (Perception) check.; Tail Attack: The dragon makes a tail attack.; Wing Attack (Costs 2 Actions): The dragon beats its wings. Each creature within 10 ft. of the dragon must succeed on a DC 19 Dexterity saving throw or take 13 (2d6 + 6) bludgeoning damage and be knocked prone. The dragon can then fly up to half its flying speed.', '/api/2014/images/monsters/adult-black-dragon.png'),
    

    ('Adult Blue Dragon', 'Huge', 'dragon', 'lawful evil', 19, 'natural', 225, 
            '18d12', '18d12+108', '40 ft.', 25, 10, 23, 16, 
            15, 19, 'Saving Throw: DEX, Saving Throw: CON, Saving Throw: WIS, Saving Throw: CHA, Skill: Perception, Skill: Stealth', '', '', 
            'lightning', '', '120 ft.', 22, 'Common, Draconic', 
            16, 5, 15000, 'Legendary Resistance: If the dragon fails a saving throw, it can choose to succeed instead.', 'Multiattack: The dragon can use its Frightful Presence. It then makes three attacks: one with its bite and two with its claws.; Bite: Melee Weapon Attack: +12 to hit, reach 10 ft., one target. Hit: 18 (2d10 + 7) piercing damage plus 5 (1d10) lightning damage.; Claw: Melee Weapon Attack: +12 to hit, reach 5 ft., one target. Hit: 14 (2d6 + 7) slashing damage.; Tail: Melee Weapon Attack: +12 to hit, reach 15 ft., one target. Hit: 16 (2d8 + 7) bludgeoning damage.; Frightful Presence: Each creature of the dragon''s choice that is within 120 ft. of the dragon and aware of it must succeed on a DC 17 Wisdom saving throw or become frightened for 1 minute. A creature can repeat the saving throw at the end of each of its turns, ending the effect on itself on a success. If a creature''s saving throw is successful or the effect ends for it, the creature is immune to the dragon''s Frightful Presence for the next 24 hours.; Lightning Breath: The dragon exhales lightning in a 90-foot line that is 5 ft. wide. Each creature in that line must make a DC 19 Dexterity saving throw, taking 66 (12d10) lightning damage on a failed save, or half as much damage on a successful one.', 'Detect: The dragon makes a Wisdom (Perception) check.; Tail Attack: The dragon makes a tail attack.; Wing Attack (Costs 2 Actions): The dragon beats its wings. Each creature within 10 ft. of the dragon must succeed on a DC 20 Dexterity saving throw or take 14 (2d6 + 7) bludgeoning damage and be knocked prone. The dragon can then fly up to half its flying speed.', '/api/2014/images/monsters/adult-blue-dragon.png'),
    

    ('Adult Brass Dragon', 'Huge', 'dragon', 'chaotic good', 18, 'natural', 172, 
            '15d12', '15d12+75', '40 ft.', 23, 10, 21, 14, 
            13, 17, 'Saving Throw: DEX, Saving Throw: CON, Saving Throw: WIS, Saving Throw: CHA, Skill: History, Skill: Perception, Skill: Persuasion, Skill: Stealth', '', '', 
            'fire', '', '120 ft.', 21, 'Common, Draconic', 
            13, 5, 10000, 'Legendary Resistance: If the dragon fails a saving throw, it can choose to succeed instead.', 'Multiattack: The dragon can use its Frightful Presence. It then makes three attacks: one with its bite and two with its claws.; Bite: Melee Weapon Attack: +11 to hit, reach 10 ft., one target. Hit: 17 (2d10 + 6) piercing damage.; Claw: Melee Weapon Attack: +11 to hit, reach 5 ft., one target. Hit: 13 (2d6 + 6) slashing damage.; Tail: Melee Weapon Attack: +11 to hit, reach 15 ft., one target. Hit: 15 (2d8 + 6) bludgeoning damage.; Frightful Presence: Each creature of the dragon''s choice that is within 120 feet of the dragon and aware of it must succeed on a DC 16 Wisdom saving throw or become frightened for 1 minute. A creature can repeat the saving throw at the end of each of its turns, ending the effect on itself on a success. If a creature''s saving throw is successful or the effect ends for it, the creature is immune to the dragon''s Frightful Presence for the next 24 hours .; Breath Weapons: The dragon uses one of the following breath weapons.
Fire Breath. The dragon exhales fire in an 60-foot line that is 5 feet wide. Each creature in that line must make a DC 18 Dexterity saving throw, taking 45 (13d6) fire damage on a failed save, or half as much damage on a successful one.
Sleep Breath. The dragon exhales sleep gas in a 60-foot cone. Each creature in that area must succeed on a DC 18 Constitution saving throw or fall unconscious for 10 minutes. This effect ends for a creature if the creature takes damage or someone uses an action to wake it.', 'Detect: The dragon makes a Wisdom (Perception) check.; Tail Attack: The dragon makes a tail attack.; Wing Attack (Costs 2 Actions): The dragon beats its wings. Each creature within 10 ft. of the dragon must succeed on a DC 19 Dexterity saving throw or take 13 (2d6 + 6) bludgeoning damage and be knocked prone. The dragon can then fly up to half its flying speed.', '/api/2014/images/monsters/adult-brass-dragon.png'),
    

    ('Adult Bronze Dragon', 'Huge', 'dragon', 'lawful good', 19, 'natural', 212, 
            '17d12', '17d12+102', '40 ft.', 25, 10, 23, 16, 
            15, 19, 'Saving Throw: DEX, Saving Throw: CON, Saving Throw: WIS, Saving Throw: CHA, Skill: Insight, Skill: Perception, Skill: Stealth', '', '', 
            'lightning', '', '120 ft.', 22, 'Common, Draconic', 
            15, 5, 13000, 'Amphibious: The dragon can breathe air and water.; Legendary Resistance: If the dragon fails a saving throw, it can choose to succeed instead.', 'Multiattack: The dragon can use its Frightful Presence. It then makes three attacks: one with its bite and two with its claws.; Bite: Melee Weapon Attack: +12 to hit, reach 10 ft., one target. Hit: 18 (2d10 + 7) piercing damage.; Claw: Melee Weapon Attack: +12 to hit, reach 5 ft., one target. Hit: 14 (2d6 + 7) slashing damage.; Tail: Melee Weapon Attack: +12 to hit, reach 15 ft., one target. Hit: 16 (2d8 + 7) bludgeoning damage.; Frightful Presence: Each creature of the dragon''s choice that is within 120 feet of the dragon and aware of it must succeed on a DC 17 Wisdom saving throw or become frightened for 1 minute. A creature can repeat the saving throw at the end of each of its turns, ending the effect on itself on a success. If a creature''s saving throw is successful or the effect ends for it, the creature is immune to the dragon''s Frightful Presence for the next 24 hours.; Breath Weapons: The dragon uses one of the following breath weapons.
Lightning Breath. The dragon exhales lightning in a 90-foot line that is 5 feet wide. Each creature in that line must make a DC 19 Dexterity saving throw, taking 66 (12d10) lightning damage on a failed save, or half as much damage on a successful one.
Repulsion Breath. The dragon exhales repulsion energy in a 30-foot cone. Each creature in that area must succeed on a DC 19 Strength saving throw. On a failed save, the creature is pushed 60 feet away from the dragon.', 'Detect: The dragon makes a Wisdom (Perception) check.; Tail Attack: The dragon makes a tail attack.; Wing Attack (Costs 2 Actions): The dragon beats its wings. Each creature within 10 ft. of the dragon must succeed on a DC 20 Dexterity saving throw or take 14 (2d6 + 7) bludgeoning damage and be knocked prone. The dragon can then fly up to half its flying speed.', '/api/2014/images/monsters/adult-bronze-dragon.png'),
    

    ('Adult Copper Dragon', 'Huge', 'dragon', 'chaotic good', 18, 'natural', 184, 
            '16d12', '16d12+80', '40 ft.', 23, 12, 21, 18, 
            15, 17, 'Saving Throw: DEX, Saving Throw: CON, Saving Throw: WIS, Saving Throw: CHA, Skill: Deception, Skill: Perception, Skill: Stealth', '', '', 
            'acid', '', '120 ft.', 22, 'Common, Draconic', 
            14, 5, 11500, 'Legendary Resistance: If the dragon fails a saving throw, it can choose to succeed instead.', 'Multiattack: The dragon can use its Frightful Presence. It then makes three attacks: one with its bite and two with its claws.; Bite: Melee Weapon Attack: +11 to hit, reach 10 ft., one target. Hit: 17 (2d10 + 6) piercing damage.; Claw: Melee Weapon Attack: +11 to hit, reach 5 ft., one target. Hit: 13 (2d6 + 6) slashing damage.; Tail: Melee Weapon Attack: +11 to hit, reach 15 ft., one target. Hit: 15 (2d8 + 6) bludgeoning damage.; Frightful Presence: Each creature of the dragon''s choice that is within 120 feet of the dragon and aware of it must succeed on a DC 16 Wisdom saving throw or become frightened for 1 minute. A creature can repeat the saving throw at the end of each of its turns, ending the effect on itself on a success. If a creature''s saving throw is successful or the effect ends for it, the creature is immune to the dragon''s Frightful Presence for the next 24 hours.; Breath Weapons: The dragon uses one of the following breath weapons.
Acid Breath. The dragon exhales acid in an 60-foot line that is 5 feet wide. Each creature in that line must make a DC 18 Dexterity saving throw, taking 54 (12d8) acid damage on a failed save, or half as much damage on a successful one.
Slowing Breath. The dragon exhales gas in a 60-foot cone. Each creature in that area must succeed on a DC 18 Constitution saving throw. On a failed save, the creature can''t use reactions, its speed is halved, and it can''t make more than one attack on its turn. In addition, the creature can use either an action or a bonus action on its turn, but not both. These effects last for 1 minute. The creature can repeat the saving throw at the end of each of its turns, ending the effect on itself with a successful save.', 'Detect: The dragon makes a Wisdom (Perception) check.; Tail Attack: The dragon makes a tail attack.; Wing Attack (Costs 2 Actions): The dragon beats its wings. Each creature within 10 ft. of the dragon must succeed on a DC 19 Dexterity saving throw or take 13 (2d6 + 6) bludgeoning damage and be knocked prone. The dragon can then fly up to half its flying speed.', '/api/2014/images/monsters/adult-copper-dragon.png'),
    

    ('Adult Gold Dragon', 'Huge', 'dragon', 'lawful good', 19, 'natural', 256, 
            '19d12', '19d12+133', '40 ft.', 27, 14, 25, 16, 
            15, 24, 'Saving Throw: DEX, Saving Throw: CON, Saving Throw: WIS, Saving Throw: CHA, Skill: Insight, Skill: Perception, Skill: Persuasion, Skill: Stealth', '', '', 
            'fire', '', '120 ft.', 24, 'Common, Draconic', 
            17, 6, 18000, 'Amphibious: The dragon can breathe air and water.; Legendary Resistance: If the dragon fails a saving throw, it can choose to succeed instead.', 'Multiattack: The dragon can use its Frightful Presence. It then makes three attacks: one with its bite and two with its claws.; Bite: Melee Weapon Attack: +14 to hit, reach 10 ft., one target. Hit: 19 (2d10 + 8) piercing damage.; Claw: Melee Weapon Attack: +14 to hit, reach 5 ft., one target. Hit: 15 (2d6 + 8) slashing damage.; Tail: Melee Weapon Attack: +14 to hit, reach 15 ft., one target. Hit: 17 (2d8 + 8) bludgeoning damage.; Frightful Presence: Each creature of the dragon''s choice that is within 120 feet of the dragon and aware of it must succeed on a DC 21 Wisdom saving throw or become frightened for 1 minute. A creature can repeat the saving throw at the end of each of its turns, ending the effect on itself on a success. If a creature''s saving throw is successful or the effect ends for it, the creature is immune to the dragon''s Frightful Presence for the next 24 hours.; Breath Weapons: The dragon uses one of the following breath weapons.
Fire Breath. The dragon exhales fire in a 60-foot cone. Each creature in that area must make a DC 21 Dexterity saving throw, taking 66 (12d10) fire damage on a failed save, or half as much damage on a successful one.
Weakening Breath. The dragon exhales gas in a 60-foot cone. Each creature in that area must succeed on a DC 21 Strength saving throw or have disadvantage on Strength-based attack rolls, Strength checks, and Strength saving throws for 1 minute. A creature can repeat the saving throw at the end of each of its turns, ending the effect on itself on a success.', 'Detect: The dragon makes a Wisdom (Perception) check.; Tail Attack: The dragon makes a tail attack.; Wing Attack (Costs 2 Actions): The dragon beats its wings. Each creature within 10 ft. of the dragon must succeed on a DC 22 Dexterity saving throw or take 15 (2d6 + 8) bludgeoning damage and be knocked prone. The dragon can then fly up to half its flying speed.', '/api/2014/images/monsters/adult-gold-dragon.png'),
    

    ('Adult Green Dragon', 'Huge', 'dragon', 'lawful evil', 19, 'natural', 207, 
            '18d12', '18d12+90', '40 ft.', 23, 12, 21, 18, 
            15, 17, 'Saving Throw: DEX, Saving Throw: CON, Saving Throw: WIS, Saving Throw: CHA, Skill: Deception, Skill: Insight, Skill: Perception, Skill: Persuasion, Skill: Stealth', '', '', 
            'poison', 'Poisoned', '120 ft.', 22, 'Common, Draconic', 
            15, 5, 13000, 'Amphibious: The dragon can breathe air and water.; Legendary Resistance: If the dragon fails a saving throw, it can choose to succeed instead.', 'Multiattack: The dragon can use its Frightful Presence. It then makes three attacks: one with its bite and two with its claws.; Bite: Melee Weapon Attack: +11 to hit, reach 10 ft., one target. Hit: 17 (2d10 + 6) piercing damage plus 7 (2d6) poison damage.; Claw: Melee Weapon Attack: +11 to hit, reach 5 ft., one target. Hit: 13 (2d6 + 6) slashing damage.; Tail: Melee Weapon Attack: +11 to hit, reach 15 ft., one target. Hit: 15 (2d8 + 6) bludgeoning damage.; Frightful Presence: Each creature of the dragon''s choice that is within 120 feet of the dragon and aware of it must succeed on a DC 16 Wisdom saving throw or become frightened for 1 minute. A creature can repeat the saving throw at the end of each of its turns, ending the effect on itself on a success. If a creature''s saving throw is successful or the effect ends for it, the creature is immune to the dragon''s Frightful Presence for the next 24 hours .; Poison Breath: The dragon exhales poisonous gas in a 60-foot cone. Each creature in that area must make a DC 18 Constitution saving throw, taking 56 (16d6) poison damage on a failed save, or half as much damage on a successful one.', 'Detect: The dragon makes a Wisdom (Perception) check.; Tail Attack: The dragon makes a tail attack.; Wing Attack (Costs 2 Actions): The dragon beats its wings. Each creature within 10 ft. of the dragon must succeed on a DC 19 Dexterity saving throw or take 13 (2d6 + 6) bludgeoning damage and be knocked prone. The dragon can then fly up to half its flying speed.', '/api/2014/images/monsters/adult-green-dragon.png'),
    

    ('Adult Red Dragon', 'Huge', 'dragon', 'chaotic evil', 19, 'natural', 256, 
            '19d12', '19d12+133', '40 ft.', 27, 10, 25, 16, 
            13, 21, 'Saving Throw: DEX, Saving Throw: CON, Saving Throw: WIS, Saving Throw: CHA, Skill: Perception, Skill: Stealth', '', '', 
            'fire', '', '120 ft.', 23, 'Common, Draconic', 
            17, 6, 18000, 'Legendary Resistance: If the dragon fails a saving throw, it can choose to succeed instead.', 'Multiattack: The dragon can use its Frightful Presence. It then makes three attacks: one with its bite and two with its claws.; Bite: Melee Weapon Attack: +14 to hit, reach 10 ft., one target. Hit: 19 (2d10 + 8) piercing damage plus 7 (2d6) fire damage.; Claw: Melee Weapon Attack: +14 to hit, reach 5 ft., one target. Hit: 15 (2d6 + 8) slashing damage.; Tail: Melee Weapon Attack: +14 to hit, reach 15 ft., one target. Hit: 17 (2d8 + 8) bludgeoning damage.; Frightful Presence: Each creature of the dragon''s choice that is within 120 ft. of the dragon and aware of it must succeed on a DC 19 Wisdom saving throw or become frightened for 1 minute. A creature can repeat the saving throw at the end of each of its turns, ending the effect on itself on a success. If a creature''s saving throw is successful or the effect ends for it, the creature is immune to the dragon''s Frightful Presence for the next 24 hours.; Fire Breath: The dragon exhales fire in a 60-foot cone. Each creature in that area must make a DC 21 Dexterity saving throw, taking 63 (18d6) fire damage on a failed save, or half as much damage on a successful one.', 'Detect: The dragon makes a Wisdom (Perception) check.; Tail Attack: The dragon makes a tail attack.; Wing Attack (Costs 2 Actions): The dragon beats its wings. Each creature within 10 ft. of the dragon must succeed on a DC 22 Dexterity saving throw or take 15 (2d6 + 8) bludgeoning damage and be knocked prone. The dragon can then fly up to half its flying speed.', '/api/2014/images/monsters/adult-red-dragon.png'),
    

    ('Adult Silver Dragon', 'Huge', 'dragon', 'lawful good', 19, 'natural', 243, 
            '18d12', '18d12+126', '40 ft.', 27, 10, 25, 16, 
            13, 21, 'Saving Throw: DEX, Saving Throw: CON, Saving Throw: WIS, Saving Throw: CHA, Skill: Arcana, Skill: History, Skill: Perception, Skill: Stealth', '', '', 
            'cold', '', '120 ft.', 21, 'Common, Draconic', 
            16, 5, 15000, 'Legendary Resistance: If the dragon fails a saving throw, it can choose to succeed instead.', 'Multiattack: The dragon can use its Frightful Presence. It then makes three attacks: one with its bite and two with its claws.; Bite: Melee Weapon Attack: +13 to hit, reach 10 ft., one target. Hit: 19 (2d10 + 8) piercing damage.; Claw: Melee Weapon Attack: +13 to hit, reach 5 ft., one target. Hit: 15 (2d6 + 8) slashing damage.; Tail: Melee Weapon Attack: +13 to hit, reach 15 ft., one target. Hit: 17 (2d8 + 8) bludgeoning damage.; Frightful Presence: Each creature of the dragon''s choice that is within 120 feet of the dragon and aware of it must succeed on a DC 18 Wisdom saving throw or become frightened for 1 minute. A creature can repeat the saving throw at the end of each of its turns, ending the effect on itself on a success. If a creature''s saving throw is successful or the effect ends for it, the creature is immune to the dragon''s Frightful Presence for the next 24 hours.; Breath Weapons: The dragon uses one of the following breath weapons.
Cold Breath. The dragon exhales an icy blast in a 60-foot cone. Each creature in that area must make a DC 20 Constitution saving throw, taking 58 (13d8) cold damage on a failed save, or half as much damage on a successful one.
Paralyzing Breath. The dragon exhales paralyzing gas in a 60-foot cone. Each creature in that area must succeed on a DC 20 Constitution saving throw or be paralyzed for 1 minute. A creature can repeat the saving throw at the end of each of its turns, ending the effect on itself on a success.', 'Detect: The dragon makes a Wisdom (Perception) check.; Tail Attack: The dragon makes a tail attack.; Wing Attack (Costs 2 Actions): The dragon beats its wings. Each creature within 10 ft. of the dragon must succeed on a DC 22 Dexterity saving throw or take 15 (2d6 + 8) bludgeoning damage and be knocked prone. The dragon can then fly up to half its flying speed.', '/api/2014/images/monsters/adult-silver-dragon.png'),
    

    ('Adult White Dragon', 'Huge', 'dragon', 'chaotic evil', 18, 'natural', 200, 
            '16d12', '16d12+96', '40 ft.', 22, 10, 22, 8, 
            12, 12, 'Saving Throw: DEX, Saving Throw: CON, Saving Throw: WIS, Saving Throw: CHA, Skill: Perception, Skill: Stealth', '', '', 
            'cold', '', '120 ft.', 21, 'Common, Draconic', 
            13, 5, 10000, 'Ice Walk: The dragon can move across and climb icy surfaces without needing to make an ability check. Additionally, difficult terrain composed of ice or snow doesn''t cost it extra moment.; Legendary Resistance: If the dragon fails a saving throw, it can choose to succeed instead.', 'Multiattack: The dragon can use its Frightful Presence. It then makes three attacks: one with its bite and two with its claws.; Bite: Melee Weapon Attack: +11 to hit, reach 10 ft., one target. Hit: 17 (2d10 + 6) piercing damage plus 4 (1d8) cold damage.; Claw: Melee Weapon Attack: +11 to hit, reach 5 ft., one target. Hit: 13 (2d6 + 6) slashing damage.; Tail: Melee Weapon Attack: +11 to hit, reach 15 ft., one target. Hit: 15 (2d8 + 6) bludgeoning damage.; Frightful Presence: Each creature of the dragon''s choice that is within 120 ft. of the dragon and aware of it must succeed on a DC 14 Wisdom saving throw or become frightened for 1 minute. A creature can repeat the saving throw at the end of each of its turns, ending the effect on itself on a success. If a creature''s saving throw is successful or the effect ends for it, the creature is immune to the dragon''s Frightful Presence for the next 24 hours.; Cold Breath: The dragon exhales an icy blast in a 60-foot cone. Each creature in that area must make a DC 19 Constitution saving throw, taking 54 (12d8) cold damage on a failed save, or half as much damage on a successful one.', 'Detect: The dragon makes a Wisdom (Perception) check.; Tail Attack: The dragon makes a tail attack.; Wing Attack (Costs 2 Actions): The dragon beats its wings. Each creature within 10 ft. of the dragon must succeed on a DC 19 Dexterity saving throw or take 13 (2d6 + 6) bludgeoning damage and be knocked prone. The dragon can then fly up to half its flying speed.', '/api/2014/images/monsters/adult-white-dragon.png'),
    

    ('Air Elemental', 'Large', 'elemental', 'neutral', 15, 'dex', 90, 
            '12d10', '12d10+24', '0 ft.', 14, 20, 14, 6, 
            10, 6, '', '', 'lightning, thunder, bludgeoning, piercing, and slashing from nonmagical weapons', 
            'poison', 'Exhaustion, Grappled, Paralyzed, Petrified, Poisoned, Prone, Restrained, Unconscious', '60 ft.', 10, 'Auran', 
            5, 3, 1800, 'Air Form: The elemental can enter a hostile creature''s space and stop there. It can move through a space as narrow as 1 inch wide without squeezing.', 'Multiattack: The elemental makes two slam attacks.; Slam: Melee Weapon Attack: +8 to hit, reach 5 ft., one target. Hit: 14 (2d8 + 5) bludgeoning damage.; Whirlwind: Each creature in the elemental''s space must make a DC 13 Strength saving throw. On a failure, a target takes 15 (3d8 + 2) bludgeoning damage and is flung up 20 feet away from the elemental in a random direction and knocked prone. If a thrown target strikes an object, such as a wall or floor, the target takes 3 (1d6) bludgeoning damage for every 10 feet it was thrown. If the target is thrown at another creature, that creature must succeed on a DC 13 Dexterity saving throw or take the same damage and be knocked prone.
If the saving throw is successful, the target takes half the bludgeoning damage and isn''t flung away or knocked prone.', '', '/api/2014/images/monsters/air-elemental.png'),
    

    ('Ancient Black Dragon', 'Gargantuan', 'dragon', 'chaotic evil', 22, 'natural', 367, 
            '21d20', '21d20+147', '40 ft.', 27, 14, 25, 16, 
            15, 19, 'Saving Throw: DEX, Saving Throw: CON, Saving Throw: WIS, Saving Throw: CHA, Skill: Perception, Skill: Stealth', '', '', 
            'acid', '', '120 ft.', 26, 'Common, Draconic', 
            21, 7, 33000, 'Amphibious: The dragon can breathe air and water.; Legendary Resistance: If the dragon fails a saving throw, it can choose to succeed instead.', 'Multiattack: The dragon can use its Frightful Presence. It then makes three attacks: one with its bite and two with its claws.; Bite: Melee Weapon Attack:+ 15 to hit, reach 15 ft., one target. Hit: 19 (2d10 + 8) piercing damage plus 9 (2d8) acid damage.; Claw: Melee Weapon Attack: +15 to hit, reach 10 ft., one target. Hit: 15 (2d6 + 8) slashing damage.; Tail: Melee Weapon Attack: +15 to hit, reach 20 ft., one target. Hit: 17 (2d8 + 8) bludgeoning damage.; Frightful Presence: Each creature of the dragon''s choice that is within 120 feet of the dragon and aware of it must succeed on a DC 19 Wisdom saving throw or become frightened for 1 minute. A creature can repeat the saving throw at the end of each of its turns, ending the effect on itself on a success. If a creature''s saving throw is successful or the effect ends for it, the creature is immune to the dragon''s Frightful Presence for the next 24 hours.; Acid Breath: The dragon exhales acid in a 90-foot line that is 10 feet wide. Each creature in that line must make a DC 22 Dexterity saving throw, taking 67 (15d8) acid damage on a failed save, or half as much damage on a successful one.', 'Detect: The dragon makes a Wisdom (Perception) check.; Tail Attack: The dragon makes a tail attack.; Wing Attack (Costs 2 Actions): The dragon beats its wings. Each creature within 15 ft. of the dragon must succeed on a DC 23 Dexterity saving throw or take 15 (2d6 + 8) bludgeoning damage and be knocked prone. The dragon can then fly up to half its flying speed.', '/api/2014/images/monsters/ancient-black-dragon.png'),
    

    ('Ancient Blue Dragon', 'Gargantuan', 'dragon', 'lawful evil', 22, 'natural', 481, 
            '26d20', '26d20+208', '40 ft.', 29, 10, 27, 18, 
            17, 21, 'Saving Throw: DEX, Saving Throw: CON, Saving Throw: WIS, Saving Throw: CHA, Skill: Perception, Skill: Stealth', '', '', 
            'lightning', '', '120 ft.', 27, 'Common, Draconic', 
            23, 7, 50000, 'Legendary Resistance: If the dragon fails a saving throw, it can choose to succeed instead.', 'Multiattack: The dragon can use its Frightful Presence. It then makes three attacks: one with its bite and two with its claws.; Bite: Melee Weapon Attack: +16 to hit, reach 15 ft., one target. Hit: 20 (2d10 + 9) piercing damage plus 11 (2d10) lightning damage.; Claw: Melee Weapon Attack: +16 to hit, reach 10 ft., one target. Hit: 16 (2d6 + 9) slashing damage.; Tail: Melee Weapon Attack: +16 to hit, reach 20 ft., one target. Hit: 18 (2d8 + 9) bludgeoning damage.; Frightful Presence: Each creature of the dragon''s choice that is within 120 feet of the dragon and aware of it must succeed on a DC 20 Wisdom saving throw or become frightened for 1 minute. A creature can repeat the saving throw at the end of each of its turns, ending the effect on itself on a success. If a creature''s saving throw is successful or the effect ends for it, the creature is immune to the dragon''s Frightful Presence for the next 24 hours.; Lightning Breath: The dragon exhales lightning in a 120-foot line that is 10 feet wide. Each creature in that line must make a DC 23 Dexterity saving throw, taking 88 (16d10) lightning damage on a failed save, or half as much damage on a successful one.', 'Detect: The dragon makes a Wisdom (Perception) check.; Tail Attack: The dragon makes a tail attack.; Wing Attack (Costs 2 Actions): The dragon beats its wings. Each creature within 15 ft. of the dragon must succeed on a DC 24 Dexterity saving throw or take 16 (2d6 + 9) bludgeoning damage and be knocked prone. The dragon can then fly up to half its flying speed.', '/api/2014/images/monsters/ancient-blue-dragon.png'),
    

    ('Ancient Brass Dragon', 'Gargantuan', 'dragon', 'chaotic good', 20, 'natural', 297, 
            '17d20', '17d20+119', '40 ft.', 27, 10, 25, 16, 
            15, 19, 'Saving Throw: DEX, Saving Throw: CON, Saving Throw: WIS, Saving Throw: CHA, Skill: History, Skill: Perception, Skill: Persuasion, Skill: Stealth', '', '', 
            'fire', '', '120 ft.', 24, 'Common, Draconic', 
            20, 6, 25000, 'Legendary Resistance: If the dragon fails a saving throw, it can choose to succeed instead.', 'Multiattack: The dragon can use its Frightful Presence. It then makes three attacks: one with its bite and two with its claws.; Bite: Melee Weapon Attack: +14 to hit, reach 15 ft., one target. Hit: 19 (2d10 + 8) piercing damage.; Claw: Melee Weapon Attack: +14 to hit, reach 10 ft., one target. Hit: 15 (2d6 + 8) slashing damage.; Tail: Melee Weapon Attack: +14 to hit, reach 20 ft., one target. Hit: 17 (2d8 + 8) bludgeoning damage.; Frightful Presence: Each creature of the dragon''s choice that is within 120 feet of the dragon and aware of it must succeed on a DC 18 Wisdom saving throw or become frightened for 1 minute. A creature can repeat the saving throw at the end of each of its turns, ending the effect on itself on a success. If a creature''s saving throw is successful or the effect ends for it, the creature is immune to the dragon''s Frightful Presence for the next 24 hours.; Breath Weapons: The dragon uses one of the following breath weapons:
Fire Breath. The dragon exhales fire in an 90-foot line that is 10 feet wide. Each creature in that line must make a DC 21 Dexterity saving throw, taking 56 (16d6) fire damage on a failed save, or half as much damage on a successful one.
Sleep Breath. The dragon exhales sleep gas in a 90-foot cone. Each creature in that area must succeed on a DC 21 Constitution saving throw or fall unconscious for 10 minutes. This effect ends for a creature if the creature takes damage or someone uses an action to wake it.; Change Shape: The dragon magically polymorphs into a humanoid or beast that has a challenge rating no higher than its own, or back into its true form. It reverts to its true form if it dies. Any equipment it is wearing or carrying is absorbed or borne by the new form (the dragon''s choice).
In a new form, the dragon retains its alignment, hit points, Hit Dice, ability to speak, proficiencies, Legendary Resistance, lair actions, and Intelligence, Wisdom, and Charisma scores, as well as this action. Its statistics and capabilities are otherwise replaced by those of the new form, except any class features or legendary actions of that form.', 'Detect: The dragon makes a Wisdom (Perception) check.; Tail Attack: The dragon makes a tail attack.; Wing Attack (Costs 2 Actions): The dragon beats its wings. Each creature within 15 ft. of the dragon must succeed on a DC 22 Dexterity saving throw or take 15 (2d6 + 8) bludgeoning damage and be knocked prone. The dragon can then fly up to half its flying speed.', '/api/2014/images/monsters/ancient-brass-dragon.png'),
    
	('Ancient Bronze Dragon', 'Gargantuan', 'dragon', 'lawful good', 22, 'natural', 444, 
            '24d20', '24d20+192', '40 ft.', 29, 10, 27, 18, 
            17, 21, 'Saving Throw: DEX, Saving Throw: CON, Saving Throw: WIS, Saving Throw: CHA, Skill: Insight, Skill: Perception, Skill: Stealth', '', '', 
            'lightning', '', '120 ft.', 27, 'Common, Draconic', 
            22, 7, 41000, 'Amphibious: The dragon can breathe air and water.; Legendary Resistance: If the dragon fails a saving throw, it can choose to succeed instead.', 'Multiattack: The dragon can use its Frightful Presence. It then makes three attacks: one with its bite and two with its claws.; Bite: Melee Weapon Attack: +16 to hit, reach 15 ft., one target. Hit: 20 (2d10 + 9) piercing damage.; Claw: Melee Weapon Attack: +16 to hit, reach 10 ft., one target. Hit: 16 (2d6 + 9) slashing damage.; Tail: Melee Weapon Attack: +16 to hit, reach 20 ft., one target. Hit: 18 (2d8 + 9) bludgeoning damage.; Frightful Presence: Each creature of the dragon''s choice that is within 120 feet of the dragon and aware of it must succeed on a DC 20 Wisdom saving throw or become frightened for 1 minute. A creature can repeat the saving throw at the end of each of its turns, ending the effect on itself on a success. If a creature''s saving throw is successful or the effect ends for it, the creature is immune to the dragon''s Frightful Presence for the next 24 hours.; Breath Weapons: The dragon uses one of the following breath weapons.
Lightning Breath. The dragon exhales lightning in a 120-foot line that is 10 feet wide. Each creature in that line must make a DC 23 Dexterity saving throw, taking 88 (16d10) lightning damage on a failed save, or half as much damage on a successful one.
Repulsion Breath. The dragon exhales repulsion energy in a 30-foot cone. Each creature in that area must succeed on a DC 23 Strength saving throw. On a failed save, the creature is pushed 60 feet away from the dragon.; Change Shape: The dragon magically polymorphs into a humanoid or beast that has a challenge rating no higher than its own, or back into its true form. It reverts to its true form if it dies. Any equipment it is wearing or carrying is absorbed or borne by the new form (the dragon''s choice).
In a new form, the dragon retains its alignment, hit points, Hit Dice, ability to speak, proficiencies, Legendary Resistance, lair actions, and Intelligence, Wisdom, and Charisma scores, as well as this action. Its statistics and capabilities are otherwise replaced by those of the new form, except any class features or legendary actions of that form.', 'Detect: The dragon makes a Wisdom (Perception) check.; Tail Attack: The dragon makes a tail attack.; Wing Attack (Costs 2 Actions): The dragon beats its wings. Each creature within 15 ft. of the dragon must succeed on a DC 24 Dexterity saving throw or take 16 (2d6 + 9) bludgeoning damage and be knocked prone. The dragon can then fly up to half its flying speed.', '/api/2014/images/monsters/ancient-bronze-dragon.png'),
    

    ('Ancient Copper Dragon', 'Gargantuan', 'dragon', 'chaotic good', 21, 'natural', 350, 
            '20d20', '20d20+140', '40 ft.', 27, 12, 25, 20, 
            17, 19, 'Saving Throw: DEX, Saving Throw: CON, Saving Throw: WIS, Saving Throw: CHA, Skill: Deception, Skill: Perception, Skill: Stealth', '', '', 
            'acid', '', '120 ft.', 27, 'Common, Draconic', 
            21, 7, 33000, 'Legendary Resistance: If the dragon fails a saving throw, it can choose to succeed instead.', 'Multiattack: The dragon can use its Frightful Presence. It then makes three attacks: one with its bite and two with its claws.; Bite: Melee Weapon Attack: +15 to hit, reach 15 ft., one target. Hit: 19 (2d10 + 8) piercing damage.; Claw: Melee Weapon Attack: +15 to hit, reach 10 ft., one target. Hit: 15 (2d6 + 8) slashing damage.; Tail: Melee Weapon Attack: +15 to hit, reach 20 ft., one target. Hit: 17 (2d8 + 8) bludgeoning damage.; Frightful Presence: Each creature of the dragon''s choice that is within 120 feet of the dragon and aware of it must succeed on a DC 19 Wisdom saving throw or become frightened for 1 minute. A creature can repeat the saving throw at the end of each of its turns, ending the effect on itself on a success. If a creature''s saving throw is successful or the effect ends for it, the creature is immune to the dragon''s Frightful Presence for the next 24 hours.; Breath Weapons: The dragon uses one of the following breath weapons.
Acid Breath. The dragon exhales acid in an 90-foot line that is 10 feet wide. Each creature in that line must make a DC 22 Dexterity saving throw, taking 63 (14d8) acid damage on a failed save, or half as much damage on a successful one.
Slowing Breath. The dragon exhales gas in a 90-foot cone. Each creature in that area must succeed on a DC 22 Constitution saving throw. On a failed save, the creature can''t use reactions, its speed is halved, and it can''t make more than one attack on its turn. In addition, the creature can use either an action or a bonus action on its turn, but not both. These effects last for 1 minute. The creature can repeat the saving throw at the end of each of its turns, ending the effect on itself with a successful save.; Change Shape: The dragon magically polymorphs into a humanoid or beast that has a challenge rating no higher than its own, or back into its true form. It reverts to its true form if it dies. Any equipment it is wearing or carrying is absorbed or borne by the new form (the dragon''s choice).
In a new form, the dragon retains its alignment, hit points, Hit Dice, ability to speak, proficiencies, Legendary Resistance, lair actions, and Intelligence, Wisdom, and Charisma scores, as well as this action. Its statistics and capabilities are otherwise replaced by those of the new form, except any class features or legendary actions of that form.', 'Detect: The dragon makes a Wisdom (Perception) check.; Tail Attack: The dragon makes a tail attack.; Wing Attack (Costs 2 Actions): The dragon beats its wings. Each creature within 15 ft. of the dragon must succeed on a DC 23 Dexterity saving throw or take 15 (2d6 + 8) bludgeoning damage and be knocked prone. The dragon can then fly up to half its flying speed.', '/api/2014/images/monsters/ancient-copper-dragon.png'),
    

    ('Ancient Gold Dragon', 'Gargantuan', 'dragon', 'lawful good', 22, 'natural', 546, 
            '28d20', '28d20+252', '40 ft.', 30, 14, 29, 18, 
            17, 28, 'Saving Throw: DEX, Saving Throw: CON, Saving Throw: WIS, Saving Throw: CHA, Skill: Insight, Skill: Perception, Skill: Persuasion, Skill: Stealth', '', '', 
            'fire', '', '120 ft.', 27, 'Common, Draconic', 
            24, 7, 62000, 'Amphibious: The dragon can breathe air and water.; Legendary Resistance: If the dragon fails a saving throw, it can choose to succeed instead.', 'Multiattack: The dragon can use its Frightful Presence. It then makes three attacks: one with its bite and two with its claws.; Bite: Melee Weapon Attack: +17 to hit, reach 15 ft., one target. Hit: 21 (2d10 + 10) piercing damage.; Claw: Melee Weapon Attack: +17 to hit, reach 10 ft., one target. Hit: 17 (2d6 + 10) slashing damage.; Tail: Melee Weapon Attack: +17 to hit, reach 20 ft., one target. Hit: 19 (2d8 + 10) bludgeoning damage.; Frightful Presence: Each creature of the dragon''s choice that is within 120 feet of the dragon and aware of it must succeed on a DC 24 Wisdom saving throw or become frightened for 1 minute. A creature can repeat the saving throw at the end of each of its turns, ending the effect on itself on a success. If a creature''s saving throw is successful or the effect ends for it, the creature is immune to the dragon''s Frightful Presence for the next 24 hours.; Breath Weapons: The dragon uses one of the following breath weapons.
Fire Breath. The dragon exhales fire in a 90-foot cone. Each creature in that area must make a DC 24 Dexterity saving throw, taking 71 (13d10) fire damage on a failed save, or half as much damage on a successful one.
Weakening Breath. The dragon exhales gas in a 90-foot cone. Each creature in that area must succeed on a DC 24 Strength saving throw or have disadvantage on Strength-based attack rolls, Strength checks, and Strength saving throws for 1 minute. A creature can repeat the saving throw at the end of each of its turns, ending the effect on itself on a success.; Change Shape: The dragon magically polymorphs into a humanoid or beast that has a challenge rating no higher than its own, or back into its true form. It reverts to its true form if it dies. Any equipment it is wearing or carrying is absorbed or borne by the new form (the dragon''s choice).
In a new form, the dragon retains its alignment, hit points, Hit Dice, ability to speak, proficiencies, Legendary Resistance, lair actions, and Intelligence, Wisdom, and Charisma scores, as well as this action. Its statistics and capabilities are otherwise replaced by those of the new form, except any class features or legendary actions of that form.', 'Detect: The dragon makes a Wisdom (Perception) check.; Tail Attack: The dragon makes a tail attack.; Wing Attack (Costs 2 Actions): The dragon beats its wings. Each creature within 15 ft. of the dragon must succeed on a DC 25 Dexterity saving throw or take 17 (2d6 + 10) bludgeoning damage and be knocked prone. The dragon can then fly up to half its flying speed.', '/api/2014/images/monsters/ancient-gold-dragon.png'),
    

    ('Ancient Green Dragon', 'Gargantuan', 'dragon', 'lawful evil', 21, 'natural', 385, 
            '22d20', '22d20+154', '40 ft.', 27, 12, 25, 20, 
            17, 19, 'Saving Throw: DEX, Saving Throw: CON, Saving Throw: WIS, Saving Throw: CHA, Skill: Deception, Skill: Insight, Skill: Perception, Skill: Persuasion, Skill: Stealth', '', '', 
            'poison', 'Poisoned', '120 ft.', 27, 'Common, Draconic', 
            22, 7, 41000, 'Amphibious: The dragon can breathe air and water.; Legendary Resistance: If the dragon fails a saving throw, it can choose to succeed instead.', 'Multiattack: The dragon can use its Frightful Presence. It then makes three attacks: one with its bite and two with its claws.; Bite: Melee Weapon Attack: +15 to hit, reach 15 ft., one target. Hit: 19 (2d10 + 8) piercing damage plus 10 (3d6) poison damage.; Claw: Melee Weapon Attack: +15 to hit, reach 10 ft., one target. Hit: 22 (4d6 + 8) slashing damage.; Tail: Melee Weapon Attack: +15 to hit, reach 20 ft., one target. Hit: 17 (2d8 + 8) bludgeoning damage.; Frightful Presence: Each creature of the dragon''s choice that is within 120 feet of the dragon and aware of it must succeed on a DC 19 Wisdom saving throw or become frightened for 1 minute. A creature can repeat the saving throw at the end of each of its turns, ending the effect on itself on a success. If a creature''s saving throw is successful or the effect ends for it, the creature is immune to the dragon''s Frightful Presence for the next 24 hours.; Poison Breath: The dragon exhales poisonous gas in a 90-foot cone. Each creature in that area must make a DC 22 Constitution saving throw, taking 77 (22d6) poison damage on a failed save, or half as much damage on a successful one.', 'Detect: The dragon makes a Wisdom (Perception) check.; Tail Attack: The dragon makes a tail attack.; Wing Attack (Costs 2 Actions): The dragon beats its wings. Each creature within 15 ft. of the dragon must succeed on a DC 23 Dexterity saving throw or take 15 (2d6 + 8) bludgeoning damage and be knocked prone. The dragon can then fly up to half its flying speed.', '/api/2014/images/monsters/ancient-green-dragon.png'),
    

    ('Ancient Red Dragon', 'Gargantuan', 'dragon', 'chaotic evil', 22, 'natural', 546, 
            '28d20', '28d20+252', '40 ft.', 30, 10, 29, 18, 
            15, 23, 'Saving Throw: DEX, Saving Throw: CON, Saving Throw: WIS, Saving Throw: CHA, Skill: Perception, Skill: Stealth', '', '', 
            'fire', '', '120 ft.', 26, 'Common, Draconic', 
            24, 7, 62000, 'Legendary Resistance: If the dragon fails a saving throw, it can choose to succeed instead.', 'Multiattack: The dragon can use its Frightful Presence. It then makes three attacks: one with its bite and two with its claws.; Bite: Melee Weapon Attack: +17 to hit, reach 15 ft., one target. Hit: 21 (2d10 + 10) piercing damage plus 14 (4d6) fire damage.; Claw: Melee Weapon Attack: +17 to hit, reach 10 ft., one target. Hit: 17 (2d6 + 10) slashing damage.; Tail: Melee Weapon Attack: +17 to hit, reach 20 ft., one target. Hit: 19 (2d8 + 10) bludgeoning damage.; Frightful Presence: Each creature of the dragon''s choice that is within 120 feet of the dragon and aware of it must succeed on a DC 21 Wisdom saving throw or become frightened for 1 minute. A creature can repeat the saving throw at the end of each of its turns, ending the effect on itself on a success. If a creature''s saving throw is successful or the effect ends for it, the creature is immune to the dragon''s Frightful Presence for the next 24 hours.; Fire Breath: The dragon exhales fire in a 90-foot cone. Each creature in that area must make a DC 24 Dexterity saving throw, taking 91 (26d6) fire damage on a failed save, or half as much damage on a successful one.', 'Detect: The dragon makes a Wisdom (Perception) check.; Tail Attack: The dragon makes a tail attack.; Wing Attack (Costs 2 Actions): The dragon beats its wings. Each creature within 15 ft. of the dragon must succeed on a DC 25 Dexterity saving throw or take 17 (2d6 + 10) bludgeoning damage and be knocked prone. The dragon can then fly up to half its flying speed.', '/api/2014/images/monsters/ancient-red-dragon.png'),
    

    ('Ancient Silver Dragon', 'Gargantuan', 'dragon', 'lawful good', 22, 'natural', 487, 
            '25d20', '25d20+225', '40 ft.', 30, 10, 29, 18, 
            15, 23, 'Saving Throw: DEX, Saving Throw: CON, Saving Throw: WIS, Saving Throw: CHA, Skill: Arcana, Skill: History, Skill: Perception, Skill: Stealth', '', '', 
            'cold', '', '120 ft.', 26, 'Common, Draconic', 
            23, 7, 50000, 'Legendary Resistance: If the dragon fails a saving throw, it can choose to succeed instead.', 'Multiattack: The dragon can use its Frightful Presence. It then makes three attacks: one with its bite and two with its claws.; Bite: Melee Weapon Attack: +17 to hit, reach 15 ft., one target. Hit: 21 (2d10 + 10) piercing damage.; Claw: Melee Weapon Attack: +17 to hit, reach 10 ft., one target. Hit: 17 (2d6 + 10) slashing damage.; Tail: Melee Weapon Attack: +17 to hit, reach 20 ft., one target. Hit: 19 (2d8 + 10) bludgeoning damage.; Frightful Presence: Each creature of the dragon''s choice that is within 120 feet of the dragon and aware of it must succeed on a DC 21 Wisdom saving throw or become frightened for 1 minute. A creature can repeat the saving throw at the end of each of its turns, ending the effect on itself on a success. If a creature''s saving throw is successful or the effect ends for it, the creature is immune to the dragon''s Frightful Presence for the next 24 hours.; Breath Weapons: The dragon uses one of the following breath weapons.
Cold Breath. The dragon exhales an icy blast in a 90-foot cone. Each creature in that area must make a DC 24 Constitution saving throw, taking 67 (15d8) cold damage on a failed save, or half as much damage on a successful one.
Paralyzing Breath. The dragon exhales paralyzing gas in a 90- foot cone. Each creature in that area must succeed on a DC 24 Constitution saving throw or be paralyzed for 1 minute. A creature can repeat the saving throw at the end of each of its turns, ending the effect on itself on a success.; Change Shape: The dragon magically polymorphs into a humanoid or beast that has a challenge rating no higher than its own, or back into its true form. It reverts to its true form if it dies. Any equipment it is wearing or carrying is absorbed or borne by the new form (the dragon''s choice).
In a new form, the dragon retains its alignment, hit points, Hit Dice, ability to speak, proficiencies, Legendary Resistance, lair actions, and Intelligence, Wisdom, and Charisma scores, as well as this action. Its statistics and capabilities are otherwise replaced by those of the new form, except any class features or legendary actions of that form.', 'Detect: The dragon makes a Wisdom (Perception) check.; Tail Attack: The dragon makes a tail attack.; Wing Attack (Costs 2 Actions): The dragon beats its wings. Each creature within 15 ft. of the dragon must succeed on a DC 25 Dexterity saving throw or take 17 (2d6 + 10) bludgeoning damage and be knocked prone. The dragon can then fly up to half its flying speed.', '/api/2014/images/monsters/ancient-silver-dragon.png'),
    

    ('Ancient White Dragon', 'Gargantuan', 'dragon', 'chaotic evil', 20, 'natural', 333, 
            '18d20', '18d20+144', '40 ft.', 26, 10, 26, 10, 
            13, 14, 'Saving Throw: DEX, Saving Throw: CON, Saving Throw: WIS, Saving Throw: CHA, Skill: Perception, Skill: Stealth', '', '', 
            'cold', '', '120 ft.', 23, 'Common, Draconic', 
            20, 6, 25000, 'Ice Walk: The dragon can move across and climb icy surfaces without needing to make an ability check. Additionally, difficult terrain composed of ice or snow doesn''t cost it extra moment.; Legendary Resistance: If the dragon fails a saving throw, it can choose to succeed instead.', 'Multiattack: The dragon can use its Frightful Presence. It then makes three attacks: one with its bite and two with its claws.; Bite: Melee Weapon Attack: +14 to hit, reach 15 ft., one target. Hit: 19 (2d10 + 8) piercing damage plus 9 (2d8) cold damage.; Claw: Melee Weapon Attack: +14 to hit, reach 10 ft., one target. Hit: 15 (2d6 + 8) slashing damage.; Tail: Melee Weapon Attack: +14 to hit, reach 20 ft., one target. Hit: 17 (2d8 + 8) bludgeoning damage.; Frightful Presence: Each creature of the dragon''s choice that is within 120 feet of the dragon and aware of it must succeed on a DC 16 Wisdom saving throw or become frightened for 1 minute. A creature can repeat the saving throw at the end of each of its turns, ending the effect on itself on a success. If a creature''s saving throw is successful or the effect ends for it, the creature is immune to the dragon''s Frightful Presence for the next 24 hours .; Cold Breath: The dragon exhales an icy blast in a 90-foot cone. Each creature in that area must make a DC 22 Constitution saving throw, taking 72 (l6d8) cold damage on a failed save, or half as much damage on a successful one.', 'Detect: The dragon makes a Wisdom (Perception) check.; Tail Attack: The dragon makes a tail attack.; Wing Attack (Costs 2 Actions): The dragon beats its wings. Each creature within 15 ft. of the dragon must succeed on a DC 22 Dexterity saving throw or take 15 (2d6 + 8) bludgeoning damage and be knocked prone. The dragon can then fly up to half its flying speed.', '/api/2014/images/monsters/ancient-white-dragon.png'),
    

    ('Androsphinx', 'Large', 'monstrosity', 'lawful neutral', 17, 'natural', 199, 
            '19d10', '19d10+95', '40 ft.', 22, 10, 20, 16, 
            18, 23, 'Saving Throw: DEX, Saving Throw: CON, Saving Throw: INT, Saving Throw: WIS, Skill: Arcana, Skill: Perception, Skill: Religion', '', '', 
            'psychic, bludgeoning, piercing, and slashing from nonmagical weapons', 'Charmed, Frightened', 'None', 20, 'Common, Sphinx', 
            17, 6, 18000, 'Inscrutable: The sphinx is immune to any effect that would sense its emotions or read its thoughts, as well as any divination spell that it refuses. Wisdom (Insight) checks made to ascertain the sphinx''s intentions or sincerity have disadvantage.; Magic Weapons: The sphinx''s weapon attacks are magical.; Spellcasting: The sphinx is a 12th-level spellcaster. Its spellcasting ability is Wisdom (spell save DC 18, +10 to hit with spell attacks). It requires no material components to cast its spells. The sphinx has the following cleric spells prepared:

- Cantrips (at will): sacred flame, spare the dying, thaumaturgy
- 1st level (4 slots): command, detect evil and good, detect magic
- 2nd level (3 slots): lesser restoration, zone of truth
- 3rd level (3 slots): dispel magic, tongues
- 4th level (3 slots): banishment, freedom of movement
- 5th level (2 slots): flame strike, greater restoration
- 6th level (1 slot): heroes'' feast', 'Multiattack: The sphinx makes two claw attacks.; Claw: Melee Weapon Attack: +12 to hit, reach 5 ft., one target. Hit: 17 (2d10 + 6) slashing damage.; Roar: The sphinx emits a magical roar. Each time it roars before finishing a long rest, the roar is louder and the effect is different, as detailed below. Each creature within 500 feet of the sphinx and able to hear the roar must make a saving throw.

First Roar. Each creature that fails a DC 18 Wisdom saving throw is frightened for 1 minute. A frightened creature can repeat the saving throw at the end of each of its turns, ending the effect on itself on a success.

Second Roar. Each creature that fails a DC 18 Wisdom saving throw is deafened and frightened for 1 minute. A frightened creature is paralyzed and can repeat the saving throw at the end of each of its turns, ending the effect on itself on a success.

Third Roar. Each creature makes a DC 18 Constitution saving throw. On a failed save, a creature takes 44 (8d10) thunder damage and is knocked prone. On a successful save, the creature takes half as much damage and isn''t knocked prone.', 'Claw Attack: The sphinx makes one claw attack.; Teleport (Costs 2 Actions): The sphinx magically teleports, along with any equipment it is wearing or carrying, up to 120 feet to an unoccupied space it can see.; Cast a Spell (Costs 3 Actions): The sphinx casts a spell from its list of prepared spells, using a spell slot as normal.', '/api/2014/images/monsters/androsphinx.png'),
    

    ('Animated Armor', 'Medium', 'construct', 'unaligned', 18, 'natural', 33, 
            '6d8', '6d8+6', '25 ft.', 14, 11, 13, 1, 
            3, 1, '', '', '', 
            'poison, psychic', 'Blinded, Charmed, Deafened, Exhaustion, Frightened, Paralyzed, Petrified, Poisoned', 'None', 6, '', 
            1, 2, 200, 'Antimagic Susceptibility: The armor is incapacitated while in the area of an antimagic field. If targeted by dispel magic, the armor must succeed on a Constitution saving throw against the caster''s spell save DC or fall unconscious for 1 minute.; False Appearance: While the armor remains motionless, it is indistinguishable from a normal suit of armor.', 'Multiattack: The armor makes two melee attacks.; Slam: Melee Weapon Attack: +4 to hit, reach 5 ft., one target. Hit: 5 (1d6 + 2) bludgeoning damage.', '', '/api/2014/images/monsters/animated-armor.png'),
    

    ('Ankheg', 'Large', 'monstrosity', 'unaligned', 14, 'natural', 39, 
            '6d10', '6d10+6', '30 ft.', 17, 11, 13, 1, 
            13, 6, '', '', '', 
            '', '', '60 ft.', 11, '', 
            2, 2, 250, '', 'Bite: Melee Weapon Attack: +5 to hit, reach 5 ft., one target. Hit: 10 (2d6 + 3) slashing damage plus 3 (1d6) acid damage. If the target is a Large or smaller creature, it is grappled (escape DC 13). Until this grapple ends, the ankheg can bite only the grappled creature and has advantage on attack rolls to do so.; Acid Spray: The ankheg spits acid in a line that is 30 ft. long and 5 ft. wide, provided that it has no creature grappled. Each creature in that line must make a DC 13 Dexterity saving throw, taking 10 (3d6) acid damage on a failed save, or half as much damage on a successful one.', '', '/api/2014/images/monsters/ankheg.png'),
    

    ('Ape', 'Medium', 'beast', 'unaligned', 12, 'dex', 19, 
            '3d8', '3d8+6', '30 ft.', 16, 14, 14, 6, 
            12, 7, 'Skill: Athletics, Skill: Perception', '', '', 
            '', '', 'None', 13, '', 
            0.5, 2, 100, '', 'Multiattack: The ape makes two fist attacks.; Fist: Melee Weapon Attack: +5 to hit, reach 5 ft., one target. Hit: 6 (1d6 + 3) bludgeoning damage.; Rock: Ranged Weapon Attack: +5 to hit, range 25/50 ft., one target. Hit: 6 (1d6 + 3) bludgeoning damage.', '', '/api/2014/images/monsters/ape.png'),
    

    ('Archmage', 'Medium', 'humanoid', 'any alignment', 12, 'dex', 99, 
            '18d8', '18d8+18', '30 ft.', 10, 14, 12, 20, 
            15, 16, 'Saving Throw: INT, Saving Throw: WIS, Skill: Arcana, Skill: History', '', 'damage from spells, bludgeoning, piercing, and slashing from nonmagical attacks (from stoneskin)', 
            '', '', 'None', 12, 'any six languages', 
            12, 4, 8400, 'Magic Resistance: The archmage has advantage on saving throws against spells and other magical effects.; Spellcasting: The archmage is an 18th-level spellcaster. Its spellcasting ability is Intelligence (spell save DC 17, +9 to hit with spell attacks). The archmage can cast disguise self and invisibility at will and has the following wizard spells prepared:

- Cantrips (at will): fire bolt, light, mage hand, prestidigitation, shocking grasp
- 1st level (4 slots): detect magic, identify, mage armor*, magic missile
- 2nd level (3 slots): detect thoughts, mirror image, misty step
- 3rd level (3 slots): counterspell, fly, lightning bolt
- 4th level (3 slots): banishment, fire shield, stoneskin*
- 5th level (3 slots): cone of cold, scrying, wall of force
- 6th level (1 slot): globe of invulnerability
- 7th level (1 slot): teleport
- 8th level (1 slot): mind blank*
- 9th level (1 slot): time stop
* The archmage casts these spells on itself before combat.', 'Dagger: Melee or Ranged Weapon Attack: +6 to hit, reach 5 ft. or range 20/60 ft., one target. Hit: 4 (1d4 + 2) piercing damage.', '', '/api/2014/images/monsters/archmage.png'),
    

    ('Assassin', 'Medium', 'humanoid', 'any non-good alignment', 15, 'armor', 78, 
            '12d8', '12d8+24', '30 ft.', 11, 16, 14, 13, 
            11, 10, 'Saving Throw: DEX, Saving Throw: INT, Skill: Acrobatics, Skill: Deception, Skill: Perception, Skill: Stealth', '', 'poison', 
            '', '', 'None', 13, 'Thieves'' cant plus any two languages', 
            8, 3, 3900, 'Assassinate: During its first turn, the assassin has advantage on attack rolls against any creature that hasn''t taken a turn. Any hit the assassin scores against a surprised creature is a critical hit.; Evasion: If the assassin is subjected to an effect that allows it to make a Dexterity saving throw to take only half damage, the assassin instead takes no damage if it succeeds on the saving throw, and only half damage if it fails.; Sneak Attack (1/Turn): The assassin deals an extra 13 (4d6) damage when it hits a target with a weapon attack and has advantage on the attack roll, or when the target is within 5 ft. of an ally of the assassin that isn''t incapacitated and the assassin doesn''t have disadvantage on the attack roll.', 'Multiattack: The assassin makes two shortsword attacks.; Shortsword: Melee Weapon Attack: +6 to hit, reach 5 ft., one target. Hit: 6 (1d6 + 3) piercing damage, and the target must make a DC 15 Constitution saving throw, taking 24 (7d6) poison damage on a failed save, or half as much damage on a successful one.; Light Crossbow: Ranged Weapon Attack: +6 to hit, range 80/320 ft., one target. Hit: 7 (1d8 + 3) piercing damage, and the target must make a DC 15 Constitution saving throw, taking 24 (7d6) poison damage on a failed save, or half as much damage on a successful one.', '', '/api/2014/images/monsters/assassin.png'),
    

    ('Awakened Shrub', 'Small', 'plant', 'unaligned', 9, 'dex', 10, 
            '3d6', '3d6', '20 ft.', 3, 8, 11, 10, 
            10, 6, '', 'fire', 'piercing', 
            '', '', 'None', 10, 'one language known by its creator', 
            0, 2, 10, 'False Appearance: While the shrub remains motionless, it is indistinguishable from a normal shrub.', 'Rake: Melee Weapon Attack: +1 to hit, reach 5 ft., one target. Hit: 1 (1d4 - 1) slashing damage.', '', '/api/2014/images/monsters/awakened-shrub.png'),
    

    ('Awakened Tree', 'Huge', 'plant', 'unaligned', 13, 'natural', 59, 
            '7d12', '7d12+14', '20 ft.', 19, 6, 15, 10, 
            10, 7, '', 'fire', 'bludgeoning, piercing', 
            '', '', 'None', 10, 'one language known by its creator', 
            2, 2, 450, 'False Appearance: While the tree remains motionless, it is indistinguishable from a normal tree.', 'Slam: Melee Weapon Attack: +6 to hit, reach 10 ft., one target. Hit: 14 (3d6 + 4) bludgeoning damage.', '', '/api/2014/images/monsters/awakened-tree.png'),
    

    ('Axe Beak', 'Large', 'beast', 'unaligned', 11, 'dex', 19, 
            '3d10', '3d10+3', '50 ft.', 14, 12, 12, 2, 
            10, 5, '', '', '', 
            '', '', 'None', 10, '', 
            0.25, 2, 50, '', 'Beak: Melee Weapon Attack: +4 to hit, reach 5 ft., one target. Hit: 6 (1d8 + 2) slashing damage.', '', '/api/2014/images/monsters/axe-beak.png'),
    

    ('Azer', 'Medium', 'elemental', 'lawful neutral', 15, 'natural', 39, 
            '6d8', '6d8+12', '30 ft.', 17, 12, 15, 12, 
            13, 10, 'Saving Throw: CON', '', '', 
            'fire, poison', 'Poisoned', 'None', 11, 'Ignan', 
            2, 2, 450, 'Heated Body: A creature that touches the azer or hits it with a melee attack while within 5 ft. of it takes 5 (1d10) fire damage.; Heated Weapons: When the azer hits with a metal melee weapon, it deals an extra 3 (1d6) fire damage (included in the attack).; Illumination: The azer sheds bright light in a 10-foot radius and dim light for an additional 10 ft..', 'Warhammer: Melee Weapon Attack: +5 to hit, reach 5 ft., one target. Hit: 7 (1d8 + 3) bludgeoning damage, or 8 (1d10 + 3) bludgeoning damage if used with two hands to make a melee attack, plus 3 (1d6) fire damage.', '', 'None'),
    

    ('Baboon', 'Small', 'beast', 'unaligned', 12, 'dex', 3, 
            '1d6', '1d6', '30 ft.', 8, 14, 11, 4, 
            12, 6, '', '', '', 
            '', '', 'None', 11, '', 
            0, 2, 10, 'Pack Tactics: The baboon has advantage on an attack roll against a creature if at least one of the baboon''s allies is within 5 ft. of the creature and the ally isn''t incapacitated.', 'Bite: Melee Weapon Attack: +1 to hit, reach 5 ft., one target. Hit: 1 (1d4 - 1) piercing damage.', '', '/api/2014/images/monsters/baboon.png'),
    

    ('Badger', 'Tiny', 'beast', 'unaligned', 10, 'dex', 3, 
            '1d4', '1d4+1', '20 ft.', 4, 11, 12, 2, 
            12, 5, '', '', '', 
            '', '', '30 ft.', 11, '', 
            0, 2, 10, 'Keen Smell: The badger has advantage on Wisdom (Perception) checks that rely on smell.', 'Bite: Melee Weapon Attack: +2 to hit, reach 5 ft., one target. Hit: 1 piercing damage.', '', '/api/2014/images/monsters/badger.png'),
    

    ('Balor', 'Huge', 'fiend', 'chaotic evil', 19, 'natural', 262, 
            '21d12', '21d12+126', '40 ft.', 26, 15, 22, 20, 
            16, 22, 'Saving Throw: STR, Saving Throw: CON, Saving Throw: WIS, Saving Throw: CHA', '', 'cold, lightning, bludgeoning, piercing, and slashing from nonmagical weapons', 
            'fire, poison', 'Poisoned', 'None', 13, 'Abyssal, telepathy 120 ft.', 
            19, 6, 22000, 'Death Throes: When the balor dies, it explodes, and each creature within 30 feet of it must make a DC 20 Dexterity saving throw, taking 70 (20d6) fire damage on a failed save, or half as much damage on a successful one. The explosion ignites flammable objects in that area that aren''t being worn or carried, and it destroys the balor''s weapons.; Fire Aura: At the start of each of the balor''s turns, each creature within 5 feet of it takes 10 (3d6) fire damage, and flammable objects in the aura that aren''t being worn or carried ignite. A creature that touches the balor or hits it with a melee attack while within 5 feet of it takes 10 (3d6) fire damage.; Magic Resistance: The balor has advantage on saving throws against spells and other magical effects.; Magic Weapons: The balor''s weapon attacks are magical.', 'Multiattack: The balor makes two attacks: one with its longsword and one with its whip.; Longsword: Melee Weapon Attack: +14 to hit, reach 10 ft., one target. Hit: 21 (3d8 + 8) slashing damage plus 13 (3d8) lightning damage. If the balor scores a critical hit, it rolls damage dice three times, instead of twice.; Whip: Melee Weapon Attack: +14 to hit, reach 30 ft., one target. Hit: 15 (2d6 + 8) slashing damage plus 10 (3d6) fire damage, and the target must succeed on a DC 20 Strength saving throw or be pulled up to 25 feet toward the balor.; Teleport: The balor magically teleports, along with any equipment it is wearing or carrying, up to 120 feet to an unoccupied space it can see.', '', '/api/2014/images/monsters/balor.png'),
    

    ('Bandit', 'Medium', 'humanoid', 'any non-lawful alignment', 12, 'armor', 11, 
            '2d8', '2d8+2', '30 ft.', 11, 12, 12, 10, 
            10, 10, '', '', '', 
            '', '', 'None', 10, 'any one language (usually Common)', 
            0.125, 2, 25, '', 'Scimitar: Melee Weapon Attack: +3 to hit, reach 5 ft., one target. Hit: 4 (1d6 + 1) slashing damage.; Light Crossbow: Ranged Weapon Attack: +3 to hit, range 80 ft./320 ft., one target. Hit: 5 (1d8 + 1) piercing damage.', '', '/api/2014/images/monsters/bandit.png'),
    

    ('Bandit Captain', 'Medium', 'humanoid', 'any non-lawful alignment', 15, 'armor', 65, 
            '10d8', '10d8+20', '30 ft.', 15, 16, 14, 14, 
            11, 14, 'Saving Throw: STR, Saving Throw: DEX, Saving Throw: WIS, Skill: Athletics, Skill: Deception', '', '', 
            '', '', 'None', 10, 'any two languages', 
            2, 2, 450, '', 'Multiattack: The captain makes three melee attacks: two with its scimitar and one with its dagger. Or the captain makes two ranged attacks with its daggers.; Scimitar: Melee Weapon Attack: +5 to hit, reach 5 ft., one target. Hit: 6 (1d6 + 3) slashing damage.; Dagger: Melee or Ranged Weapon Attack: +5 to hit, reach 5 ft. or range 20/60 ft., one target. Hit: 5 (1d4 + 3) piercing damage.', '', '/api/2014/images/monsters/bandit-captain.png'),
    

    ('Barbed Devil', 'Medium', 'fiend', 'lawful evil', 15, 'natural', 110, 
            '13d8', '13d8+52', '30 ft.', 16, 17, 18, 12, 
            14, 14, 'Saving Throw: STR, Saving Throw: CON, Saving Throw: WIS, Saving Throw: CHA, Skill: Deception, Skill: Insight, Skill: Perception', '', 'cold, bludgeoning, piercing, and slashing from nonmagical weapons that aren''t silvered', 
            'fire, poison', 'Poisoned', '120 ft.', 18, 'Infernal, telepathy 120 ft.', 
            5, 3, 1800, 'Barbed Hide: At the start of each of its turns, the barbed devil deals 5 (1d10) piercing damage to any creature grappling it.; Devil''s Sight: Magical darkness doesn''t impede the devil''s darkvision.; Magic Resistance: The devil has advantage on saving throws against spells and other magical effects.', 'Multiattack: The devil makes three melee attacks: one with its tail and two with its claws. Alternatively, it can use Hurl Flame twice.; Claw: Melee Weapon Attack: +6 to hit, reach 5 ft., one target. Hit: 6 (1d6 + 3) piercing damage.; Tail: Melee Weapon Attack: +6 to hit, reach 5 ft., one target. Hit: 10 (2d6 + 3) piercing damage.; Hurl Flame: Ranged Spell Attack: +5 to hit, range 150 ft., one target. Hit: 10 (3d6) fire damage. If the target is a flammable object that isn''t being worn or carried, it also catches fire.', '', '/api/2014/images/monsters/barbed-devil.png'),
    

    ('Basilisk', 'Medium', 'monstrosity', 'unaligned', 12, 'natural', 52, 
            '8d8', '8d8+16', '20 ft.', 16, 8, 15, 2, 
            8, 7, '', '', '', 
            '', '', '60 ft.', 9, '', 
            3, 2, 700, 'Petrifying Gaze: If a creature starts its turn within 30 ft. of the basilisk and the two of them can see each other, the basilisk can force the creature to make a DC 12 Constitution saving throw if the basilisk isn''t incapacitated. On a failed save, the creature magically begins to turn to stone and is restrained. It must repeat the saving throw at the end of its next turn. On a success, the effect ends. On a failure, the creature is petrified until freed by the greater restoration spell or other magic.
A creature that isn''t surprised can avert its eyes to avoid the saving throw at the start of its turn. If it does so, it can''t see the basilisk until the start of its next turn, when it can avert its eyes again. If it looks at the basilisk in the meantime, it must immediately make the save.
If the basilisk sees its reflection within 30 ft. of it in bright light, it mistakes itself for a rival and targets itself with its gaze.', 'Bite: Melee Weapon Attack: +5 to hit, reach 5 ft., one target. Hit: 10 (2d6 + 3) piercing damage plus 7 (2d6) poison damage.', '', 'None'),
    

    ('Bat', 'Tiny', 'beast', 'unaligned', 12, 'dex', 1, 
            '1d4', '1d4-1', '5 ft.', 2, 15, 8, 2, 
            12, 4, '', '', '', 
            '', '', 'None', 11, '', 
            0, 2, 10, 'Echolocation: The bat can''t use its blindsight while deafened.; Keen Hearing: The bat has advantage on Wisdom (Perception) checks that rely on hearing.', 'Bite: Melee Weapon Attack: +0 to hit, reach 5 ft., one creature. Hit: 1 piercing damage.', '', 'None'),
    

    ('Bearded Devil', 'Medium', 'fiend', 'lawful evil', 13, 'natural', 52, 
            '8d8', '8d8+16', '30 ft.', 16, 15, 15, 9, 
            11, 11, 'Saving Throw: STR, Saving Throw: CON, Saving Throw: WIS', '', 'cold, bludgeoning, piercing, and slashing from nonmagical weapons that aren''t silvered', 
            'fire, poison', 'Poisoned', '120 ft.', 10, 'Infernal, telepathy 120 ft.', 
            3, 2, 700, 'Devil''s Sight: Magical darkness doesn''t impede the devil''s darkvision.; Magic Resistance: The devil has advantage on saving throws against spells and other magical effects.; Steadfast: The devil can''t be frightened while it can see an allied creature within 30 feet of it.', 'Multiattack: The devil makes two attacks: one with its beard and one with its glaive.; Beard: Melee Weapon Attack: +5 to hit, reach 5 ft., one creature. Hit: 6 (1d8 + 2) piercing damage, and the target must succeed on a DC 12 Constitution saving throw or be poisoned for 1 minute. While poisoned in this way, the target can''t regain hit points. The target can repeat the saving throw at the end of each of its turns, ending the effect on itself on a success.; Glaive: Melee Weapon Attack: +5 to hit, reach 10 ft., one target. Hit: 8 (1d10 + 3) slashing damage. If the target is a creature other than an undead or a construct, it must succeed on a DC 12 Constitution saving throw or lose 5 (1d10) hit points at the start of each of its turns due to an infernal wound. Each time the devil hits the wounded target with this attack, the damage dealt by the wound increases by 5 (1d10). Any creature can take an action to stanch the wound with a successful DC 12 Wisdom (Medicine) check. The wound also closes if the target receives magical healing.', '', 'None'),
    

    ('Behir', 'Huge', 'monstrosity', 'neutral evil', 17, 'natural', 168, 
            '16d12', '16d12+64', '50 ft.', 23, 16, 18, 7, 
            14, 12, 'Skill: Perception, Skill: Stealth', '', '', 
            'lightning', '', '90 ft.', 16, 'Draconic', 
            11, 4, 7200, '', 'Multiattack: The behir makes two attacks: one with its bite and one to constrict.; Bite: Melee Weapon Attack: +10 to hit, reach 10 ft., one target. Hit: 22 (3d10 + 6) piercing damage.; Constrict: Melee Weapon Attack: +10 to hit, reach 5 ft., one Large or smaller creature. Hit: 17 (2d10 + 6) bludgeoning damage plus 17 (2d10 + 6) slashing damage. The target is grappled (escape DC 16) if the behir isn''t already constricting a creature, and the target is restrained until this grapple ends.; Lightning Breath: The behir exhales a line of lightning that is 20 ft. long and 5 ft. wide. Each creature in that line must make a DC 16 Dexterity saving throw, taking 66 (12d10) lightning damage on a failed save, or half as much damage on a successful one.; Swallow: The behir makes one bite attack against a Medium or smaller target it is grappling. If the attack hits, the target is also swallowed, and the grapple ends. While swallowed, the target is blinded and restrained, it has total cover against attacks and other effects outside the behir, and it takes 21 (6d6) acid damage at the start of each of the behir''s turns. A behir can have only one creature swallowed at a time.
If the behir takes 30 damage or more on a single turn from the swallowed creature, the behir must succeed on a DC 14 Constitution saving throw at the end of that turn or regurgitate the creature, which falls prone in a space within 10 ft. of the behir. If the behir dies, a swallowed creature is no longer restrained by it and can escape from the corpse by using 15 ft. of movement, exiting prone.', '', 'None'),
    

    ('Berserker', 'Medium', 'humanoid', 'any chaotic alignment', 13, 'armor', 67, 
            '9d8', '9d8+27', '30 ft.', 16, 12, 17, 9, 
            11, 9, '', '', '', 
            '', '', 'None', 10, 'any one language (usually Common)', 
            2, 2, 450, 'Reckless: At the start of its turn, the berserker can gain advantage on all melee weapon attack rolls during that turn, but attack rolls against it have advantage until the start of its next turn.', 'Greataxe: Melee Weapon Attack: +5 to hit, reach 5 ft., one target. Hit: 9 (1d12 + 3) slashing damage.', '', 'None'),
    

    ('Black Bear', 'Medium', 'beast', 'unaligned', 11, 'natural', 19, 
            '3d8', '3d8+6', '40 ft.', 15, 10, 14, 2, 
            12, 7, '', '', '', 
            '', '', 'None', 13, '', 
            0.5, 2, 100, 'Keen Smell: The bear has advantage on Wisdom (Perception) checks that rely on smell.', 'Multiattack: The bear makes two attacks: one with its bite and one with its claws.; Bite: Melee Weapon Attack: +3 to hit, reach 5 ft., one target. Hit: 5 (1d6 + 2) piercing damage.; Claws: Melee Weapon Attack: +3 to hit, reach 5 ft., one target. Hit: 7 (2d4 + 2) slashing damage.', '', '/api/2014/images/monsters/black-bear.png'),
    

    ('Black Dragon Wyrmling', 'Medium', 'dragon', 'chaotic evil', 17, 'natural', 33, 
            '6d8', '6d8+6', '30 ft.', 15, 14, 13, 10, 
            11, 13, 'Saving Throw: DEX, Saving Throw: CON, Saving Throw: WIS, Saving Throw: CHA, Skill: Perception, Skill: Stealth', '', '', 
            'acid', '', '60 ft.', 14, 'Draconic', 
            2, 2, 450, 'Amphibious: The dragon can breathe air and water.', 'Bite: Melee Weapon Attack: +4 to hit, reach 5 ft., one target. Hit: 7 (1d10 + 2) piercing damage plus 2 (1d4) acid damage.; Acid Breath: The dragon exhales acid in a 15-foot line that is 5 feet wide. Each creature in that line must make a DC 11 Dexterity saving throw, taking 22 (Sd8) acid damage on a failed save, or half as much damage on a successful one.', '', '/api/2014/images/monsters/black-dragon-wyrmling.png'),
    

    ('Black Pudding', 'Large', 'ooze', 'unaligned', 7, 'dex', 85, 
            '10d10', '10d10+30', '20 ft.', 16, 5, 16, 1, 
            6, 1, '', '', '', 
            'acid, cold, lightning, slashing', 'Blinded, Charmed, Exhaustion, Frightened, Prone', 'None', 8, '', 
            4, 2, 1100, 'Amorphous: The pudding can move through a space as narrow as 1 inch wide without squeezing.; Corrosive Form: A creature that touches the pudding or hits it with a melee attack while within 5 feet of it takes 4 (1d8) acid damage. Any nonmagical weapon made of metal or wood that hits the pudding corrodes. After dealing damage, the weapon takes a permanent and cumulative -1 penalty to damage rolls. If its penalty drops to -5, the weapon is destroyed. Nonmagical ammunition made of metal or wood that hits the pudding is destroyed after dealing damage. The pudding can eat through 2-inch-thick, nonmagical wood or metal in 1 round.; Spider Climb: The pudding can climb difficult surfaces, including upside down on ceilings, without needing to make an ability check.', 'Pseudopod: Melee Weapon Attack: +5 to hit, reach 5 ft., one target. Hit: 6 (1d6 + 3) bludgeoning damage plus 18 (4d8) acid damage. In addition, nonmagical armor worn by the target is partly dissolved and takes a permanent and cumulative -1 penalty to the AC it offers. The armor is destroyed if the penalty reduces its AC to 10.', '', '/api/2014/images/monsters/black-pudding.png'),
    

    ('Blink Dog', 'Medium', 'fey', 'lawful good', 13, 'dex', 22, 
            '4d8', '4d8+4', '40 ft.', 12, 17, 12, 10, 
            13, 11, 'Skill: Perception, Skill: Stealth', '', '', 
            '', '', 'None', 10, 'Blink Dog, understands Sylvan but can''t speak it', 
            0.25, 2, 50, 'Keen Hearing and Smell: The dog has advantage on Wisdom (Perception) checks that rely on hearing or smell.', 'Bite: Melee Weapon Attack: +3 to hit, reach 5 ft., one target. Hit: 4 (1d6 + 1) piercing damage.; Teleport: The dog magically teleports, along with any equipment it is wearing or carrying, up to 40 ft. to an unoccupied space it can see. Before or after teleporting, the dog can make one bite attack.', '', '/api/2014/images/monsters/blink-dog.png'),
    

    ('Blood Hawk', 'Small', 'beast', 'unaligned', 12, 'dex', 7, 
            '2d6', '2d6', '10 ft.', 6, 14, 10, 3, 
            14, 5, 'Skill: Perception', '', '', 
            '', '', 'None', 14, '', 
            0.125, 2, 25, 'Keen Sight: The hawk has advantage on Wisdom (Perception) checks that rely on sight.; Pack Tactics: The hawk has advantage on an attack roll against a creature if at least one of the hawk''s allies is within 5 ft. of the creature and the ally isn''t incapacitated.', 'Beak: Melee Weapon Attack: +4 to hit, reach 5 ft., one target. Hit: 4 (1d4 + 2) piercing damage.', '', '/api/2014/images/monsters/blood-hawk.png'),
    

    ('Blue Dragon Wyrmling', 'Medium', 'dragon', 'lawful evil', 17, 'natural', 52, 
            '8d8', '8d8+16', '30 ft.', 17, 10, 15, 12, 
            11, 15, 'Saving Throw: DEX, Saving Throw: CON, Saving Throw: WIS, Saving Throw: CHA, Skill: Perception, Skill: Stealth', '', '', 
            'lightning', '', '60 ft.', 14, 'Draconic', 
            3, 2, 700, '', 'Bite: Melee Weapon Attack: +5 to hit, reach 5 ft., one target. Hit: 8 (1d10 + 3) piercing damage plus 3 (1d6) lightning damage.; Lightning Breath: The dragon exhales lightning in a 30-foot line that is 5 feet wide. Each creature in that line must make a DC 12 Dexterity saving throw, taking 22 (4d10) lightning damage on a failed save, or half as much damage on a successful one.', '', '/api/2014/images/monsters/blue-dragon-wyrmling.png'),
    

    ('Boar', 'Medium', 'beast', 'unaligned', 11, 'natural', 11, 
            '2d8', '2d8+2', '40 ft.', 13, 11, 12, 2, 
            9, 5, '', '', '', 
            '', '', 'None', 9, '', 
            0.25, 2, 50, 'Charge: If the boar moves at least 20 ft. straight toward a target and then hits it with a tusk attack on the same turn, the target takes an extra 3 (1d6) slashing damage. If the target is a creature, it must succeed on a DC 11 Strength saving throw or be knocked prone.; Relentless: If the boar takes 7 damage or less that would reduce it to 0 hit points, it is reduced to 1 hit point instead.', 'Tusk: Melee Weapon Attack: +3 to hit, reach 5 ft., one target. Hit: 4 (1d6 + 1) slashing damage.', '', '/api/2014/images/monsters/boar.png'),
    

    ('Bone Devil', 'Large', 'fiend', 'lawful evil', 19, 'natural', 142, 
            '15d10', '15d10+60', '40 ft.', 18, 16, 18, 13, 
            14, 16, 'Saving Throw: INT, Saving Throw: WIS, Saving Throw: CHA, Skill: Deception, Skill: Insight', '', 'cold, bludgeoning, piercing, and slashing from nonmagical weapons that aren''t silvered', 
            'fire, poison', 'Poisoned', '120 ft.', 12, 'Infernal, telepathy 120 ft.', 
            9, 4, 5000, 'Devil''s Sight: Magical darkness doesn''t impede the devil''s darkvision.; Magic Resistance: The devil has advantage on saving throws against spells and other magical effects.', 'Multiattack: The devil makes three attacks: two with its claws and one with its sting.; Claw: Melee Weapon Attack: +8 to hit, reach 10 ft., one target. Hit: 8 (1d8 + 4) slashing damage.; Sting: Melee Weapon Attack: +8 to hit, reach 10 ft., one target. Hit: 13 (2d8 + 4) piercing damage plus 17 (5d6) poison damage, and the target must succeed on a DC 14 Constitution saving throw or become poisoned for 1 minute. The target can repeat the saving throw at the end of each of its turns, ending the effect on itself on a success.', '', '/api/2014/images/monsters/bone-devil.png'),
    

    ('Brass Dragon Wyrmling', 'Medium', 'dragon', 'chaotic good', 16, 'natural', 16, 
            '3d8', '3d8+3', '30 ft.', 15, 10, 13, 10, 
            11, 13, 'Saving Throw: DEX, Saving Throw: CON, Saving Throw: WIS, Saving Throw: CHA, Skill: Perception, Skill: Stealth', '', '', 
            'fire', '', '60 ft.', 14, 'Draconic', 
            1, 2, 100, '', 'Bite: Melee Weapon Attack: +4 to hit, reach 5 ft., one target. Hit: 7 (1d10 + 2) piercing damage.; Breath Weapons: The dragon uses one of the following breath weapons.
Fire Breath. The dragon exhales fire in an 20-foot line that is 5 feet wide. Each creature in that line must make a DC 11 Dexterity saving throw, taking 14 (4d6) fire damage on a failed save, or half as much damage on a successful one.
Sleep Breath. The dragon exhales sleep gas in a 15-foot cone. Each creature in that area must succeed on a DC 11 Constitution saving throw or fall unconscious for 1 minute. This effect ends for a creature if the creature takes damage or someone uses an action to wake it.', '', '/api/2014/images/monsters/brass-dragon-wyrmling.png'),
    

    ('Bronze Dragon Wyrmling', 'Medium', 'dragon', 'lawful good', 17, 'natural', 32, 
            '5d8', '5d8+10', '30 ft.', 17, 10, 15, 12, 
            11, 15, 'Saving Throw: DEX, Saving Throw: CON, Saving Throw: WIS, Saving Throw: CHA, Skill: Perception, Skill: Stealth', '', '', 
            'lightning', '', '60 ft.', 14, 'Draconic', 
            2, 2, 450, 'Amphibious: The dragon can breathe air and water.', 'Bite: Melee Weapon Attack: +5 to hit, reach 5 ft., one target. Hit: 8 (1d10 + 3) piercing damage.; Breath Weapons: The dragon uses one of the following breath weapons.
Lightning Breath. The dragon exhales lightning in a 40-foot line that is 5 feet wide. Each creature in that line must make a DC 12 Dexterity saving throw, taking 16 (3d10) lightning damage on a failed save, or half as much damage on a successful one.
Repulsion Breath. The dragon exhales repulsion energy in a 30-foot cone. Each creature in that area must succeed on a DC 12 Strength saving throw. On a failed save, the creature is pushed 30 feet away from the dragon.', '', '/api/2014/images/monsters/bronze-dragon-wyrmling.png'),
    

    ('Brown Bear', 'Large', 'beast', 'unaligned', 11, 'natural', 34, 
            '4d10', '4d10+12', '40 ft.', 19, 10, 16, 2, 
            13, 7, 'Skill: Perception', '', '', 
            '', '', 'None', 13, '', 
            1, 2, 200, 'Keen Smell: The bear has advantage on Wisdom (Perception) checks that rely on smell.', 'Multiattack: The bear makes two attacks: one with its bite and one with its claws.; Bite: Melee Weapon Attack: +5 to hit, reach 5 ft., one target. Hit: 8 (1d8 + 4) piercing damage.; Claws: Melee Weapon Attack: +5 to hit, reach 5 ft., one target. Hit: 11 (2d6 + 4) slashing damage.', '', '/api/2014/images/monsters/brown-bear.png'),
    

    ('Bugbear', 'Medium', 'humanoid', 'chaotic evil', 16, 'armor', 27, 
            '5d8', '5d8+5', '30 ft.', 15, 14, 13, 8, 
            11, 9, 'Skill: Stealth, Skill: Survival', '', '', 
            '', '', '60 ft.', 10, 'Common, Goblin', 
            1, 2, 200, 'Brute: A melee weapon deals one extra die of its damage when the bugbear hits with it (included in the attack).; Surprise Attack: If the bugbear surprises a creature and hits it with an attack during the first round of combat, the target takes an extra 7 (2d6) damage from the attack.', 'Morningstar: Melee Weapon Attack: +4 to hit, reach 5 ft., one target. Hit: 11 (2d8 + 2) piercing damage.; Javelin: Melee or Ranged Weapon Attack: +4 to hit, reach 5 ft. or range 30/120 ft., one target. Hit: 9 (2d6 + 2) piercing damage in melee or 5 (1d6 + 2) piercing damage at range.', '', '/api/2014/images/monsters/bugbear.png'),
    

    ('Bulette', 'Large', 'monstrosity', 'unaligned', 17, 'natural', 94, 
            '9d10', '9d10+45', '40 ft.', 19, 11, 21, 2, 
            10, 5, 'Skill: Perception', '', '', 
            '', '', '60 ft.', 16, '', 
            5, 3, 1800, 'Standing Leap: The bulette''s long jump is up to 30 ft. and its high jump is up to 15 ft., with or without a running start.', 'Bite: Melee Weapon Attack: +7 to hit, reach 5 ft., one target. Hit: 30 (4d12 + 4) piercing damage.; Deadly Leap: If the bulette jumps at least 15 ft. as part of its movement, it can then use this action to land on its feet in a space that contains one or more other creatures. Each of those creatures must succeed on a DC 16 Strength or Dexterity saving throw (target''s choice) or be knocked prone and take 14 (3d6 + 4) bludgeoning damage plus 14 (3d6 + 4) slashing damage. On a successful save, the creature takes only half the damage, isn''t knocked prone, and is pushed 5 ft. out of the bulette''s space into an unoccupied space of the creature''s choice. If no unoccupied space is within range, the creature instead falls prone in the bulette''s space.', '', 'None'),
    

    ('Camel', 'Large', 'beast', 'unaligned', 9, 'dex', 15, 
            '2d10', '2d10+4', '50 ft.', 16, 8, 14, 2, 
            8, 5, '', '', '', 
            '', '', 'None', 9, '', 
            0.125, 2, 25, '', 'Bite: Melee Weapon Attack: +5 to hit, reach 5 ft., one target. Hit: 2 (1d4) bludgeoning damage.', '', '/api/2014/images/monsters/camel.png'),
    

    ('Cat', 'Tiny', 'beast', 'unaligned', 12, 'dex', 2, 
            '1d4', '1d4', '40 ft.', 3, 15, 10, 3, 
            12, 7, 'Skill: Perception, Skill: Stealth', '', '', 
            '', '', 'None', 13, '', 
            0, 2, 10, 'Keen Smell: The cat has advantage on Wisdom (Perception) checks that rely on smell.', 'Claws: Melee Weapon Attack: +0 to hit, reach 5 ft., one target. Hit: 1 slashing damage.', '', 'None'),
    

    ('Centaur', 'Large', 'monstrosity', 'neutral good', 12, 'dex', 45, 
            '6d10', '6d10+12', '50 ft.', 18, 14, 14, 9, 
            13, 11, 'Skill: Athletics, Skill: Perception, Skill: Survival', '', '', 
            '', '', 'None', 13, 'Elvish, Sylvan', 
            2, 2, 450, 'Charge: If the centaur moves at least 30 ft. straight toward a target and then hits it with a pike attack on the same turn, the target takes an extra 10 (3d6) piercing damage.', 'Multiattack: The centaur makes two attacks: one with its pike and one with its hooves or two with its longbow.; Pike: Melee Weapon Attack: +6 to hit, reach 10 ft., one target. Hit: 9 (1d10 + 4) piercing damage.; Hooves: Melee Weapon Attack: +6 to hit, reach 5 ft., one target. Hit: 11 (2d6 + 4) bludgeoning damage.; Longbow: Ranged Weapon Attack: +4 to hit, range 150/600 ft., one target. Hit: 6 (1d8 + 2) piercing damage.', '', 'None'),
    

    ('Chain Devil', 'Medium', 'fiend', 'lawful evil', 16, 'natural', 85, 
            '10d8', '10d8+40', '30 ft.', 18, 15, 18, 11, 
            12, 14, 'Saving Throw: CON, Saving Throw: WIS, Saving Throw: CHA', '', 'cold, bludgeoning, piercing, and slashing from nonmagical weapons that aren''t silvered', 
            'fire, poison', 'Poisoned', '120 ft.', 11, 'Infernal, telepathy 120 ft.', 
            8, 3, 3900, 'Devil''s Sight: Magical darkness doesn''t impede the devil''s darkvision.; Magic Resistance: The devil has advantage on saving throws against spells and other magical effects.', 'Multiattack: The devil makes two attacks with its chains.; Chain: Melee Weapon Attack: +8 to hit, reach 10 ft., one target. Hit: 11 (2d6 + 4) slashing damage. The target is grappled (escape DC 14) if the devil isn''t already grappling a creature. Until this grapple ends, the target is restrained and takes 7 (2d6) piercing damage at the start of each of its turns.; Animate Chains: Up to four chains the devil can see within 60 feet of it magically sprout razor-edged barbs and animate under the devil''s control, provided that the chains aren''t being worn or carried.
Each animated chain is an object with AC 20, 20 hit points, resistance to piercing damage, and immunity to psychic and thunder damage. When the devil uses Multiattack on its turn, it can use each animated chain to make one additional chain attack. An animated chain can grapple one creature of its own but can''t make attacks while grappling. An animated chain reverts to its inanimate state if reduced to 0 hit points or if the devil is incapacitated or dies.', '', '/api/2014/images/monsters/chain-devil.png'),
    

    ('Chimera', 'Large', 'monstrosity', 'chaotic evil', 14, 'natural', 114, 
            '12d10', '12d10+48', '30 ft.', 19, 11, 19, 3, 
            14, 10, 'Skill: Perception', '', '', 
            '', '', '60 ft.', 18, 'understands Draconic but can''t speak', 
            6, 3, 2300, '', 'Multiattack: The chimera makes three attacks: one with its bite, one with its horns, and one with its claws. When its fire breath is available, it can use the breath in place of its bite or horns.; Bite: Melee Weapon Attack: +7 to hit, reach 5 ft., one target. Hit: 11 (2d6 + 4) piercing damage.; Horns: Melee Weapon Attack: +7 to hit, reach 5 ft., one target. Hit: 10 (1d12 + 4) bludgeoning damage.; Claws: Melee Weapon Attack: +7 to hit, reach 5 ft., one target. Hit: 11 (2d6 + 4) slashing damage.; Fire Breath: The dragon head exhales fire in a 15-foot cone. Each creature in that area must make a DC 15 Dexterity saving throw, taking 31 (7d8) fire damage on a failed save, or half as much damage on a successful one.', '', 'None'),
    

    ('Chuul', 'Large', 'aberration', 'chaotic evil', 16, 'natural', 93, 
            '11d10', '11d10+33', '30 ft.', 19, 10, 16, 5, 
            11, 5, 'Skill: Perception', '', '', 
            'poison', 'Poisoned', '60 ft.', 14, 'understands Deep Speech but can''t speak', 
            4, 2, 1100, 'Amphibious: The chuul can breathe air and water.; Sense Magic: The chuul senses magic within 120 feet of it at will. This trait otherwise works like the detect magic spell but isn''t itself magical.', 'Multiattack: The chuul makes two pincer attacks. If the chuul is grappling a creature, the chuul can also use its tentacles once.; Pincer: Melee Weapon Attack: +6 to hit, reach 10 ft., one target. Hit: 11 (2d6 + 4) bludgeoning damage. The target is grappled (escape DC 14) if it is a Large or smaller creature and the chuul doesn''t have two other creatures grappled.; Tentacles: One creature grappled by the chuul must succeed on a DC 13 Constitution saving throw or be poisoned for 1 minute. Until this poison ends, the target is paralyzed. The target can repeat the saving throw at the end of each of its turns, ending the effect on itself on a success.', '', 'None'),
    

    ('Clay Golem', 'Large', 'construct', 'unaligned', 14, 'natural', 133, 
            '14d10', '14d10+56', '20 ft.', 20, 9, 18, 3, 
            8, 1, '', '', '', 
            'acid, poison, psychic, bludgeoning, piercing, and slashing from nonmagical weapons that aren''t adamantine', 'Charmed, Exhaustion, Frightened, Paralyzed, Petrified, Poisoned', '60 ft.', 9, 'understands the languages of its creator but can''t speak', 
            9, 4, 5000, 'Acid Absorption: Whenever the golem is subjected to acid damage, it takes no damage and instead regains a number of hit points equal to the acid damage dealt.; Berserk: Whenever the golem starts its turn with 60 hit points or fewer, roll a d6. On a 6, the golem goes berserk. On each of its turns while berserk, the golem attacks the nearest creature it can see. If no creature is near enough to move to and attack, the golem attacks an object, with preference for an object smaller than itself. Once the golem goes berserk, it continues to do so until it is destroyed or regains all its hit points.; Immutable Form: The golem is immune to any spell or effect that would alter its form.; Magic Resistance: The golem has advantage on saving throws against spells and other magical effects.; Magic Weapons: The golem''s weapon attacks are magical.', 'Multiattack: The golem makes two slam attacks.; Slam: Melee Weapon Attack: +8 to hit, reach 5 ft., one target. Hit: 16 (2d10 + 5) bludgeoning damage. If the target is a creature, it must succeed on a DC 15 Constitution saving throw or have its hit point maximum reduced by an amount equal to the damage taken. The target dies if this attack reduces its hit point maximum to 0. The reduction lasts until removed by the greater restoration spell or other magic.; Haste: Until the end of its next turn, the golem magically gains a +2 bonus to its AC, has advantage on Dexterity saving throws, and can use its slam attack as a bonus action.', '', '/api/2014/images/monsters/clay-golem.png'),
    

    ('Cloaker', 'Large', 'aberration', 'chaotic neutral', 14, 'natural', 78, 
            '12d10', '12d10+12', '10 ft.', 17, 15, 12, 13, 
            12, 14, 'Skill: Stealth', '', '', 
            '', '', '60 ft.', 11, 'Deep Speech, Undercommon', 
            8, 3, 3900, 'Damage Transfer: While attached to a creature, the cloaker takes only half the damage dealt to it (rounded down). and that creature takes the other half.; False Appearance: While the cloaker remains motionless without its underside exposed, it is indistinguishable from a dark leather cloak.; Light Sensitivity: While in bright light, the cloaker has disadvantage on attack rolls and Wisdom (Perception) checks that rely on sight.', 'Multiattack: The cloaker makes two attacks: one with its bite and one with its tail.; Bite: Melee Weapon Attack: +6 to hit, reach 5 ft., one creature. Hit: 10 (2d6 + 3) piercing damage, and if the target is Large or smaller, the cloaker attaches to it. If the cloaker has advantage against the target, the cloaker attaches to the target''s head, and the target is blinded and unable to breathe while the cloaker is attached. While attached, the cloaker can make this attack only against the target and has advantage on the attack roll. The cloaker can detach itself by spending 5 feet of its movement. A creature, including the target, can take its action to detach the cloaker by succeeding on a DC 16 Strength check.; Tail: Melee Weapon Attack: +6 to hit, reach 10 ft., one creature. Hit: 7 (1d8 + 3) slashing damage.; Moan: Each creature within 60 feet of the cloaker that can hear its moan and that isn''t an aberration must succeed on a DC 13 Wisdom saving throw or become frightened until the end of the cloaker''s next turn. If a creature''s saving throw is successful, the creature is immune to the cloaker''s moan for the next 24 hours.; Phantasms: The cloaker magically creates three illusory duplicates of itself if it isn''t in bright light. The duplicates move with it and mimic its actions, shifting position so as to make it impossible to track which cloaker is the real one. If the cloaker is ever in an area of bright light, the duplicates disappear.
Whenever any creature targets the cloaker with an attack or a harmful spell while a duplicate remains, that creature rolls randomly to determine whether it targets the cloaker or one of the duplicates. A creature is unaffected by this magical effect if it can''t see or if it relies on senses other than sight.
A duplicate has the cloaker''s AC and uses its saving throws. If an attack hits a duplicate, or if a duplicate fails a saving throw against an effect that deals damage, the duplicate disappears.', '', 'None'),
    

    ('Cloud Giant', 'Huge', 'giant', 'neutral good (50%) or neutral evil (50%)', 14, 'natural', 200, 
            '16d12', '16d12+96', '40 ft.', 27, 10, 22, 12, 
            16, 16, 'Saving Throw: CON, Saving Throw: WIS, Saving Throw: CHA, Skill: Insight, Skill: Perception', '', '', 
            '', '', 'None', 17, 'Common, Giant', 
            9, 4, 5000, 'Keen Smell: The giant has advantage on Wisdom (Perception) checks that rely on smell.; Innate Spellcasting: The giant''s innate spellcasting ability is Charisma. It can innately cast the following spells, requiring no material components:

At will: detect magic, fog cloud, light
3/day each: feather fall, fly, misty step, telekinesis
1/day each: control weather, gaseous form', 'Multiattack: The giant makes two morningstar attacks.; Morningstar: Melee Weapon Attack: +12 to hit, reach 10 ft., one target. Hit: 21 (3d8 + 8) piercing damage.; Rock: Ranged Weapon Attack: +12 to hit, range 60/240 ft., one target. Hit: 30 (4d10 + 8) bludgeoning damage.', '', 'None'),
    

    ('Cockatrice', 'Small', 'monstrosity', 'unaligned', 11, 'dex', 27, 
            '6d6', '6d6+6', '20 ft.', 6, 12, 12, 2, 
            13, 5, '', '', '', 
            '', '', '60 ft.', 11, '', 
            0.5, 2, 100, '', 'Bite: Melee Weapon Attack: +3 to hit, reach 5 ft., one creature. Hit: 3 (1d4 + 1) piercing damage, and the target must succeed on a DC 11 Constitution saving throw against being magically petrified. On a failed save, the creature begins to turn to stone and is restrained. It must repeat the saving throw at the end of its next turn. On a success, the effect ends. On a failure, the creature is petrified for 24 hours.', '', '/api/2014/images/monsters/cockatrice.png'),
    

    ('Commoner', 'Medium', 'humanoid', 'any alignment', 10, 'dex', 4, 
            '1d8', '1d8', '30 ft.', 10, 10, 10, 10, 
            10, 10, '', '', '', 
            '', '', 'None', 10, 'any one language (usually Common)', 
            0, 2, 10, '', 'Club: Melee Weapon Attack: +2 to hit, reach 5 ft., one target. Hit: 2 (1d4) bludgeoning damage.', '', '/api/2014/images/monsters/commoner.png'),
    

    ('Constrictor Snake', 'Large', 'beast', 'unaligned', 12, 'dex', 13, 
            '2d10', '2d10+2', '30 ft.', 15, 14, 12, 1, 
            10, 3, '', '', '', 
            '', '', 'None', 10, '', 
            0.25, 2, 50, '', 'Bite: Melee Weapon Attack: +4 to hit, reach 5 ft., one creature. Hit: 5 (1d6 + 2) piercing damage.; Constrict: Melee Weapon Attack: +4 to hit, reach 5 ft., one creature. Hit: 6 (1d8 + 2) bludgeoning damage, and the target is grappled (escape DC 14). Until this grapple ends, the creature is restrained, and the snake can''t constrict another target.', '', '/api/2014/images/monsters/constrictor-snake.png'),
    

    ('Copper Dragon Wyrmling', 'Medium', 'dragon', 'chaotic good', 16, 'natural', 22, 
            '4d8', '4d8+4', '30 ft.', 15, 12, 13, 14, 
            11, 13, 'Saving Throw: DEX, Saving Throw: CON, Saving Throw: WIS, Saving Throw: CHA, Skill: Perception, Skill: Stealth', '', '', 
            'acid', '', '60 ft.', 14, 'Draconic', 
            1, 2, 200, '', 'Bite: Melee Weapon Attack: +4 to hit, reach 5 ft., one target. Hit: 7 (1d10 + 2) piercing damage.; Breath Weapons: The dragon uses one of the following breath weapons.
Acid Breath. The dragon exhales acid in an 20-foot line that is 5 feet wide. Each creature in that line must make a DC 11 Dexterity saving throw, taking 18 (4d8) acid damage on a failed save, or half as much damage on a successful one.
Slowing Breath. The dragon exhales gas in a 15-foot cone. Each creature in that area must succeed on a DC 11 Constitution saving throw. On a failed save, the creature can''t use reactions, its speed is halved, and it can''t make more than one attack on its turn. In addition, the creature can use either an action or a bonus action on its turn, but not both. These effects last for 1 minute. The creature can repeat the saving throw at the end of each of its turns, ending the effect on itself with a successful save.', '', 'None'),
    

    ('Couatl', 'Medium', 'celestial', 'lawful good', 19, 'natural', 97, 
            '13d8', '13d8+39', '30 ft.', 16, 20, 17, 18, 
            20, 18, 'Saving Throw: CON, Saving Throw: WIS, Saving Throw: CHA', '', 'radiant', 
            'psychic, bludgeoning, piercing, and slashing from nonmagical weapons', '', 'None', 15, 'all, telepathy 120 ft.', 
            4, 2, 1100, 'Innate Spellcasting: The couatl''s spellcasting ability is Charisma (spell save DC 14). It can innately cast the following spells, requiring only verbal components:

At will: detect evil and good, detect magic, detect thoughts
3/day each: bless, create food and water, cure wounds, lesser restoration, protection from poison, sanctuary, shield
1/day each: dream, greater restoration, scrying; Magic Weapons: The couatl''s weapon attacks are magical.; Shielded Mind: The couatl is immune to scrying and to any effect that would sense its emotions, read its thoughts, or detect its location.', 'Bite: Melee Weapon Attack: +8 to hit, reach 5 ft., one creature. Hit: 8 (1d6 + 5) piercing damage, and the target must succeed on a DC 13 Constitution saving throw or be poisoned for 24 hours. Until this poison ends, the target is unconscious. Another creature can use an action to shake the target awake.; Constrict: Melee Weapon Attack: +6 to hit, reach 10 ft., one Medium or smaller creature. Hit: 10 (2d6 + 3) bludgeoning damage, and the target is grappled (escape DC 15). Until this grapple ends, the target is restrained, and the couatl can''t constrict another target.; Change Shape: The couatl magically polymorphs into a humanoid or beast that has a challenge rating equal to or less than its own, or back into its true form. It reverts to its true form if it dies. Any equipment it is wearing or carrying is absorbed or borne by the new form (the couatl''s choice).
In a new form, the couatl retains its game statistics and ability to speak, but its AC, movement modes, Strength, Dexterity, and other actions are replaced by those of the new form, and it gains any statistics and capabilities (except class features, legendary actions, and lair actions) that the new form has but that it lacks. If the new form has a bite attack, the couatl can use its bite in that form.', '', 'None'),
    

    ('Crab', 'Tiny', 'beast', 'unaligned', 11, 'natural', 2, 
            '1d4', '1d4', '20 ft.', 2, 11, 10, 1, 
            8, 2, 'Skill: Stealth', '', '', 
            '', '', 'None', 9, '', 
            0, 2, 10, 'Amphibious: The crab can breathe air and water.', 'Claw: Melee Weapon Attack: +0 to hit, reach 5 ft., one target. Hit: 1 bludgeoning damage.', '', 'None'),
    

    ('Crocodile', 'Large', 'beast', 'unaligned', 12, 'natural', 19, 
            '3d10', '3d10+3', '20 ft.', 15, 10, 13, 2, 
            10, 5, 'Skill: Stealth', '', '', 
            '', '', 'None', 10, '', 
            0.5, 2, 100, 'Hold Breath: The crocodile can hold its breath for 15 minutes.', 'Bite: Melee Weapon Attack: +4 to hit, reach 5 ft., one creature. Hit: 7 (1d10 + 2) piercing damage, and the target is grappled (escape DC 12). Until this grapple ends, the target is restrained, and the crocodile can''t bite another target', '', '/api/2014/images/monsters/crocodile.png'),
    

    ('Cult Fanatic', 'Medium', 'humanoid', 'any non-good alignment', 13, 'armor', 22, 
            '6d8', '6d8-5', '30 ft.', 11, 14, 12, 10, 
            13, 14, 'Skill: Deception, Skill: Persuasion, Skill: Religion', '', '', 
            '', '', 'None', 11, 'any one language (usually Common)', 
            2, 2, 450, 'Dark Devotion: The fanatic has advantage on saving throws against being charmed or frightened.; Spellcasting: The fanatic is a 4th-level spellcaster. Its spell casting ability is Wisdom (spell save DC 11, +3 to hit with spell attacks). The fanatic has the following cleric spells prepared:

Cantrips (at will): light, sacred flame, thaumaturgy
- 1st level (4 slots): command, inflict wounds, shield of faith
- 2nd level (3 slots): hold person, spiritual weapon', 'Multiattack: The fanatic makes two melee attacks.; Dagger: Melee or Ranged Weapon Attack: +4 to hit, reach 5 ft. or range 20/60 ft., one creature. Hit: 4 (1d4 + 2) piercing damage.', '', 'None'),
    

    ('Cultist', 'Medium', 'humanoid', 'any non-good alignment', 12, 'armor', 9, 
            '2d8', '2d8', '30 ft.', 11, 12, 10, 10, 
            11, 10, 'Skill: Deception, Skill: Religion', '', '', 
            '', '', 'None', 10, 'any one language (usually Common)', 
            0.125, 2, 25, 'Dark Devotion: The cultist has advantage on saving throws against being charmed or frightened.', 'Scimitar: Melee Weapon Attack: +3 to hit, reach 5 ft., one creature. Hit: 4 (1d6 + 1) slashing damage.', '', 'None'),
    

    ('Darkmantle', 'Small', 'monstrosity', 'unaligned', 11, 'dex', 22, 
            '5d6', '5d6+5', '10 ft.', 16, 12, 13, 2, 
            10, 5, 'Skill: Stealth', '', '', 
            '', '', 'None', 10, '', 
            0.5, 2, 100, 'Echolocation: The darkmantle can''t use its blindsight while deafened.; False Appearance: While the darkmantle remains motionless, it is indistinguishable from a cave formation such as a stalactite or stalagmite.', 'Crush: Melee Weapon Attack: +5 to hit, reach 5 ft., one creature. Hit: 6 (1d6 + 3) bludgeoning damage, and the darkmantle attaches to the target. If the target is Medium or smaller and the darkmantle has advantage on the attack roll, it attaches by engulfing the target''s head, and the target is also blinded and unable to breathe while the darkmantle is attached in this way.
While attached to the target, the darkmantle can attack no other creature except the target but has advantage on its attack rolls. The darkmantle''s speed also becomes 0, it can''t benefit from any bonus to its speed, and it moves with the target.
A creature can detach the darkmantle by making a successful DC 13 Strength check as an action. On its turn, the darkmantle can detach itself from the target by using 5 feet of movement.; Darkness Aura: A 15-foot radius of magical darkness extends out from the darkmantle, moves with it, and spreads around corners. The darkness lasts as long as the darkmantle maintains concentration, up to 10 minutes (as if concentrating on a spell). Darkvision can''t penetrate this darkness, and no natural light can illuminate it. If any of the darkness overlaps with an area of light created by a spell of 2nd level or lower, the spell creating the light is dispelled.', '', 'None'),
    

    ('Death Dog', 'Medium', 'monstrosity', 'neutral evil', 12, 'dex', 39, 
            '6d8', '6d8+12', '40 ft.', 15, 14, 14, 3, 
            13, 6, 'Skill: Perception, Skill: Stealth', '', '', 
            '', '', '120 ft.', 15, '', 
            1, 2, 200, 'Two-Headed: The dog has advantage on Wisdom (Perception) checks and on saving throws against being blinded, charmed, deafened, frightened, stunned, or knocked unconscious.', 'Multiattack: The dog makes two bite attacks.; Bite: Melee Weapon Attack: +4 to hit, reach 5 ft., one target. Hit: 5 (1d6 + 2) piercing damage. If the target is a creature, it must succeed on a DC 12 Constitution saving throw against disease or become poisoned until the disease is cured. Every 24 hours that elapse, the creature must repeat the saving throw, reducing its hit point maximum by 5 (1d10) on a failure. This reduction lasts until the disease is cured. The creature dies if the disease reduces its hit point maximum to 0.', '', 'None'),
    

    ('Deep Gnome (Svirfneblin)', 'Small', 'humanoid', 'neutral good', 15, 'armor', 16, 
            '3d6', '3d6+6', '20 ft.', 15, 14, 14, 12, 
            10, 9, 'Skill: Investigation, Skill: Perception, Skill: Stealth', '', '', 
            '', '', '120 ft.', 12, 'Gnomish, Terran, Undercommon', 
            0.5, 2, 50, 'Stone Camouflage: The gnome has advantage on Dexterity (Stealth) checks made to hide in rocky terrain.; Gnome Cunning: The gnome has advantage on Intelligence, Wisdom, and Charisma saving throws against magic.; Innate Spellcasting: The gnome''s innate spellcasting ability is Intelligence (spell save DC 11). It can innately cast the following spells, requiring no material components:
At will: nondetection (self only)
1/day each: blindness/deafness, blur, disguise self', 'War Pick: Melee Weapon Attack: +4 to hit, reach 5 ft., one target. Hit: 6 (1d8 + 2) piercing damage.; Poisoned Dart: Ranged Weapon Attack: +4 to hit, range 30/120 ft., one creature. Hit: 4 (1d4 + 2) piercing damage, and the target must succeed on a DC 12 Constitution saving throw or be poisoned for 1 minute. The target can repeat the saving throw at the end of each of its turns, ending the effect on itself on a success', '', 'None'),
    

    ('Deer', 'Medium', 'beast', 'unaligned', 13, 'dex', 4, 
            '1d8', '1d8', '50 ft.', 11, 16, 11, 2, 
            14, 5, '', '', '', 
            '', '', 'None', 12, '', 
            0, 2, 10, '', 'Bite: Melee Weapon Attack: +2 to hit, reach 5 ft., one target. Hit: 2 (1d4) piercing damage.', '', 'None'),
    

    ('Deva', 'Medium', 'celestial', 'lawful good', 17, 'natural', 136, 
            '16d8', '16d8+64', '30 ft.', 18, 18, 18, 17, 
            20, 20, 'Saving Throw: WIS, Saving Throw: CHA, Skill: Insight, Skill: Perception', '', 'radiant, bludgeoning, piercing, and slashing from nonmagical weapons', 
            '', 'Charmed, Exhaustion, Frightened', '120 ft.', 19, 'all, telepathy 120 ft.', 
            10, 4, 5900, 'Angelic Weapons: The deva''s weapon attacks are magical. When the deva hits with any weapon, the weapon deals an extra 4d8 radiant damage (included in the attack).; Innate Spellcasting: The deva''s spellcasting ability is Charisma (spell save DC 17). The deva can innately cast the following spells, requiring only verbal components:
At will: detect evil and good
1/day each: commune, raise dead; Magic Resistance: The deva has advantage on saving throws against spells and other magical effects.', 'Multiattack: The deva makes two melee attacks.; Mace: Melee Weapon Attack: +8 to hit, reach 5 ft., one target. Hit: 7 (1d6 + 4) bludgeoning damage plus 18 (4d8) radiant damage.; Healing Touch: The deva touches another creature. The target magically regains 20 (4d8 + 2) hit points and is freed from any curse, disease, poison, blindness, or deafness.; Change Shape: The deva magically polymorphs into a humanoid or beast that has a challenge rating equal to or less than its own, or back into its true form. It reverts to its true form if it dies. Any equipment it is wearing or carrying is absorbed or borne by the new form (the deva''s choice).
In a new form, the deva retains its game statistics and ability to speak, but its AC, movement modes, Strength, Dexterity, and special senses are replaced by those of the new form, and it gains any statistics and capabilities (except class features, legendary actions, and lair actions) that the new form has but that it lacks.', '', 'None'),
    

    ('Dire Wolf', 'Large', 'beast', 'unaligned', 14, 'natural', 37, 
            '5d10', '5d10+10', '50 ft.', 17, 15, 15, 3, 
            12, 7, 'Skill: Perception, Skill: Stealth', '', '', 
            '', '', 'None', 13, '', 
            1, 2, 200, 'Keen Hearing and Smell: The wolf has advantage on Wisdom (Perception) checks that rely on hearing or smell.; Pack Tactics: The wolf has advantage on an attack roll against a creature if at least one of the wolf''s allies is within 5 ft. of the creature and the ally isn''t incapacitated.', 'Bite: Melee Weapon Attack: +5 to hit, reach 5 ft., one target. Hit: 10 (2d6 + 3) piercing damage. If the target is a creature, it must succeed on a DC 13 Strength saving throw or be knocked prone.', '', 'None'),
    

    ('Djinni', 'Large', 'elemental', 'chaotic good', 17, 'natural', 161, 
            '14d10', '14d10+84', '30 ft.', 21, 15, 22, 15, 
            16, 20, 'Saving Throw: DEX, Saving Throw: WIS, Saving Throw: CHA', '', '', 
            'lightning, thunder', '', '120 ft.', 13, 'Auran', 
            11, 4, 7200, 'Elemental Demise: If the djinni dies, its body disintegrates into a warm breeze, leaving behind only equipment the djinni was wearing or carrying.; Innate Spellcasting: The djinni''s innate spellcasting ability is Charisma (spell save DC 17, +9 to hit with spell attacks). It can innately cast the following spells, requiring no material components:

At will: detect evil and good, detect magic, thunderwave
3/day each: create food and water (can create wine instead of water), tongues, wind walk
1/day each: conjure elemental (air elemental only), creation, gaseous form, invisibility, major image, plane shift', 'Multiattack: The djinni makes three scimitar attacks.; Scimitar: Melee Weapon Attack: +9 to hit, reach 5 ft., one target. Hit: 12 (2d6 + 5) slashing damage plus 3 (1d6) lightning or thunder damage (djinni''s choice).; Create Whirlwind: A 5-foot-radius, 30-foot-tall cylinder of swirling air magically forms on a point the djinni can see within 120 feet of it. The whirlwind lasts as long as the djinni maintains concentration (as if concentrating on a spell). Any creature but the djinni that enters the whirlwind must succeed on a DC 18 Strength saving throw or be restrained by it. The djinni can move the whirlwind up to 60 feet as an action, and creatures restrained by the whirlwind move with it. The whirlwind ends if the djinni loses sight of it.
A creature can use its action to free a creature restrained by the whirlwind, including itself, by succeeding on a DC 18 Strength check. If the check succeeds, the creature is no longer restrained and moves to the nearest space outside the whirlwind.', '', 'None'),
    

    ('Doppelganger', 'Medium', 'monstrosity', 'unaligned', 14, 'dex', 52, 
            '8d8', '8d8+16', '30 ft.', 11, 18, 14, 11, 
            12, 14, 'Skill: Deception, Skill: Insight', '', '', 
            '', 'Charmed', '60 ft.', 11, 'Common', 
            3, 2, 700, 'Shapechanger: The doppelganger can use its action to polymorph into a Small or Medium humanoid it has seen, or back into its true form. Its statistics, other than its size, are the same in each form. Any equipment it is wearing or carrying isn''t transformed. It reverts to its true form if it dies.; Ambusher: In the first round of combat, the doppelganger has advantage on attack rolls against any creature it has surprised.; Surprise Attack: If the doppelganger surprises a creature and hits it with an attack during the first round of combat, the target takes an extra 10 (3d6) damage from the attack.', 'Multiattack: The doppelganger makes two melee attacks.; Slam: Melee Weapon Attack: +6 to hit, reach 5 ft., one target. Hit: 7 (1d6 + 4) bludgeoning damage.; Read Thoughts: The doppelganger magically reads the surface thoughts of one creature within 60 ft. of it. The effect can penetrate barriers, but 3 ft. of wood or dirt, 2 ft. of stone, 2 inches of metal, or a thin sheet of lead blocks it. While the target is in range, the doppelganger can continue reading its thoughts, as long as the doppelganger''s concentration isn''t broken (as if concentrating on a spell). While reading the target''s mind, the doppelganger has advantage on Wisdom (Insight) and Charisma (Deception, Intimidation, and Persuasion) checks against the target.', '', 'None'),
    

    ('Draft Horse', 'Large', 'beast', 'unaligned', 10, 'dex', 19, 
            '3d10', '3d10+3', '40 ft.', 18, 10, 12, 2, 
            11, 7, '', '', '', 
            '', '', 'None', 10, '', 
            0.25, 2, 50, '', 'Hooves: Melee Weapon Attack: +6 to hit, reach 5 ft., one target. Hit: 9 (2d4 + 4) bludgeoning damage.', '', 'None'),
    

    ('Dragon Turtle', 'Gargantuan', 'dragon', 'neutral', 20, 'natural', 341, 
            '22d20', '22d20+110', '20 ft.', 25, 10, 20, 10, 
            12, 12, 'Saving Throw: DEX, Saving Throw: CON, Saving Throw: WIS', '', 'fire', 
            '', '', '120 ft.', 11, 'Aquan, Draconic', 
            17, 6, 18000, 'Amphibious: The dragon turtle can breathe air and water.', 'Multiattack: The dragon turtle makes three attacks: one with its bite and two with its claws. It can make one tail attack in place of its two claw attacks.; Bite: Melee Weapon Attack: +13 to hit, reach 15 ft., one target. Hit: 26 (3d12 + 7) piercing damage.; Claw: Melee Weapon Attack: +13 to hit, reach 10 ft., one target. Hit: 16 (2d8 + 7) slashing damage.; Tail: Melee Weapon Attack: +13 to hit, reach 15 ft., one target. Hit: 26 (3d12 + 7) bludgeoning damage. If the target is a creature, it must succeed on a DC 20 Strength saving throw or be pushed up to 10 feet away from the dragon turtle and knocked prone.; Steam Breath: The dragon turtle exhales scalding steam in a 60-foot cone. Each creature in that area must make a DC 18 Constitution saving throw, taking 52 (15d6) fire damage on a failed save, or half as much damage on a successful one. Being underwater doesn''t grant resistance against this damage.', '', 'None'),
    

    ('Dretch', 'Small', 'fiend', 'chaotic evil', 11, 'natural', 18, 
            '4d6', '4d6+4', '20 ft.', 11, 11, 12, 5, 
            8, 3, '', '', 'cold, fire, lightning', 
            'poison', 'Poisoned', '60 ft.', 9, 'Abyssal, telepathy 60 ft. (works only with creatures that understand Abyssal)', 
            0.25, 2, 25, '', 'Multiattack: The dretch makes two attacks: one with its bite and one with its claws.; Bite: Melee Weapon Attack: +2 to hit, reach 5 ft., one target. Hit: 3 (1d6) piercing damage.; Claws: Melee Weapon Attack: +2 to hit, reach 5 ft., one target. Hit: 5 (2d4) slashing damage.; Fetid Cloud: A 10-foot radius of disgusting green gas extends out from the dretch. The gas spreads around corners, and its area is lightly obscured. It lasts for 1 minute or until a strong wind disperses it. Any creature that starts its turn in that area must succeed on a DC 11 Constitution saving throw or be poisoned until the start of its next turn. While poisoned in this way, the target can take either an action or a bonus action on its turn, not both, and can''t take reactions.', '', 'None'),
    

    ('Drider', 'Large', 'monstrosity', 'chaotic evil', 19, 'natural', 123, 
            '13d10', '13d10+52', '30 ft.', 16, 16, 18, 13, 
            14, 12, 'Skill: Perception, Skill: Stealth', '', '', 
            '', '', '120 ft.', 15, 'Elvish, Undercommon', 
            6, 3, 2300, 'Fey Ancestry: The drider has advantage on saving throws against being charmed, and magic can''t put the drider to sleep.; Innate Spellcasting: The drider''s innate spellcasting ability is Wisdom (spell save DC 13). The drider can innately cast the following spells, requiring no material components:
At will: dancing lights
1/day each: darkness, faerie fire; Spider Climb: The drider can climb difficult surfaces, including upside down on ceilings, without needing to make an ability check.; Sunlight Sensitivity: While in sunlight, the drider has disadvantage on attack rolls, as well as on Wisdom (Perception) checks that rely on sight.; Web Walker: The drider ignores movement restrictions caused by webbing.', 'Multiattack: The drider makes three attacks, either with its longsword or its longbow. It can replace one of those attacks with a bite attack.; Bite: Melee Weapon Attack: +6 to hit, reach 5 ft., one creature. Hit: 2 (1d4) piercing damage plus 9 (2d8) poison damage.; Longsword: Melee Weapon Attack: +6 to hit, reach 5 ft., one target. Hit: 7 (1d8 + 3) slashing damage, or 8 (1d10 + 3) slashing damage if used with two hands.; Longbow: Ranged Weapon Attack: +6 to hit, range 150/600 ft., one target. Hit: 7 (1d8 + 3) piercing damage plus 4 (1d8) poison damage.', '', 'None'),
    

    ('Drow', 'Medium', 'humanoid', 'neutral evil', 15, 'armor', 13, 
            '3d8', '3d8', '30 ft.', 10, 14, 10, 11, 
            11, 12, 'Skill: Perception, Skill: Stealth', '', '', 
            '', '', '120 ft.', 12, 'Elvish, Undercommon', 
            0.25, 2, 50, 'Fey Ancestry: The drow has advantage on saving throws against being charmed, and magic can''t put the drow to sleep.; Innate Spellcasting: The drow''s spellcasting ability is Charisma (spell save DC 11). It can innately cast the following spells, requiring no material components:
At will: dancing lights
1/day each: darkness, faerie fire; Sunlight Sensitivity: While in sunlight, the drow has disadvantage on attack rolls, as well as on Wisdom (Perception) checks that rely on sight.', 'Shortsword: Melee Weapon Attack: +4 to hit, reach 5 ft., one target. Hit: 5 (1d6 + 2) piercing damage.; Hand Crossbow: Ranged Weapon Attack: +4 to hit, range 30/120 ft., one target. Hit: 5 (1d6 + 2) piercing damage, and the target must succeed on a DC 13 Constitution saving throw or be poisoned for 1 hour. If the saving throw fails by 5 or more, the target is also unconscious while poisoned in this way. The target wakes up if it takes damage or if another creature takes an action to shake it awake.', '', 'None'),
    

    ('Druid', 'Medium', 'humanoid', 'any alignment', 11, 'dex', 27, 
            '5d8', '5d8+5', '30 ft.', 10, 12, 13, 12, 
            15, 11, 'Skill: Medicine, Skill: Nature, Skill: Perception', '', '', 
            '', '', 'None', 14, 'Druidic plus any two languages', 
            2, 2, 450, 'Spellcasting: The druid is a 4th-level spellcaster. Its spellcasting ability is Wisdom (spell save DC 12, +4 to hit with spell attacks). It has the following druid spells prepared:

- Cantrips (at will): druidcraft, produce flame, shillelagh
- 1st level (4 slots): entangle, longstrider, speak with animals, thunderwave
- 2nd level (3 slots): animal messenger, barkskin', 'Quarterstaff:  Melee Weapon Attack: +2 to hit (+4 to hit with shillelagh), reach 5 ft., one target. Hit: 3 (1d6) bludgeoning damage, 4 (1d8) bludgeoning damage if wielded with two hands, or 6 (1d8 + 2) bludgeoning damage with shillelagh.', '', 'None'),
    

    ('Dryad', 'Medium', 'fey', 'neutral', 11, 'dex', 22, 
            '5d8', '5d8', '30 ft.', 10, 12, 11, 14, 
            15, 18, 'Skill: Perception, Skill: Stealth', '', '', 
            '', '', '60 ft.', 14, 'Elvish, Sylvan', 
            1, 2, 200, 'Innate Spellcasting: The dryad''s innate spellcasting ability is Charisma (spell save DC 14). The dryad can innately cast the following spells, requiring no material components:

At will: druidcraft
3/day each: entangle, goodberry
1/day each: barkskin, pass without trace, shillelagh; Magic Resistance: The dryad has advantage on saving throws against spells and other magical effects.; Speak with Beasts and Plants: The dryad can communicate with beasts and plants as if they shared a language.; Tree Stride: Once on her turn, the dryad can use 10 ft. of her movement to step magically into one living tree within her reach and emerge from a second living tree within 60 ft. of the first tree, appearing in an unoccupied space within 5 ft. of the second tree. Both trees must be large or bigger.', 'Club: Melee Weapon Attack: +2 to hit (+6 to hit with shillelagh), reach 5 ft., one target. Hit: 2 (1 d4) bludgeoning damage, or 8 (1d8 + 4) bludgeoning damage with shillelagh.; Fey Charm: The dryad targets one humanoid or beast that she can see within 30 feet of her. If the target can see the dryad, it must succeed on a DC 14 Wisdom saving throw or be magically charmed. The charmed creature regards the dryad as a trusted friend to be heeded and protected. Although the target isn''t under the dryad''s control, it takes the dryad''s requests or actions in the most favorable way it can.
Each time the dryad or its allies do anything harmful to the target, it can repeat the saving throw, ending the effect on itself on a success. Otherwise, the effect lasts 24 hours or until the dryad dies, is on a different plane of existence from the target, or ends the effect as a bonus action. If a target''s saving throw is successful, the target is immune to the dryad''s Fey Charm for the next 24 hours.
The dryad can have no more than one humanoid and up to three beasts charmed at a time.', '', '/api/2014/images/monsters/dryad.png'),
    

    ('Duergar', 'Medium', 'humanoid', 'lawful evil', 16, 'armor', 26, 
            '4d8', '4d8+8', '25 ft.', 14, 11, 14, 11, 
            10, 9, '', '', 'poison', 
            '', '', '120 ft.', 10, 'Dwarvish, Undercommon', 
            1, 2, 200, 'Duergar Resilience: The duergar has advantage on saving throws against poison, spells, and illusions, as well as to resist being charmed or paralyzed.; Sunlight Sensitivity: While in sunlight, the duergar has disadvantage on attack rolls, as well as on Wisdom (Perception) checks that rely on sight.', 'Enlarge: For 1 minute, the duergar magically increases in size, along with anything it is wearing or carrying. While enlarged, the duergar is Large, doubles its damage dice on Strength-based weapon attacks (included in the attacks), and makes Strength checks and Strength saving throws with advantage. If the duergar lacks the room to become Large, it attains the maximum size possible in the space available.; War Pick: Melee Weapon Attack: +4 to hit, reach 5 ft., one target. Hit: 6 (1d8 + 2) piercing damage, or 11 (2d8 + 2) piercing damage while enlarged.; Javelin: Melee or Ranged Weapon Attack: +4 to hit, reach 5 ft. or range 30/120 ft., one target. Hit: 5 (1d6 + 2) piercing damage, or 9 (2d6 + 2) piercing damage while enlarged.; Invisibility: The duergar magically turns invisible until it attacks, casts a spell, or uses its Enlarge, or until its concentration is broken, up to 1 hour (as if concentrating on a spell). Any equipment the duergar wears or carries is invisible with it.', '', 'None'),
    

    ('Dust Mephit', 'Small', 'elemental', 'neutral evil', 12, 'dex', 17, 
            '5d6', '5d6', '30 ft.', 5, 14, 10, 9, 
            11, 10, 'Skill: Perception, Skill: Stealth', 'fire', '', 
            'poison', 'Poisoned', '60 ft.', 12, 'Auran, Terran', 
            0.5, 2, 100, 'Death Burst: When the mephit dies, it explodes in a burst of dust. Each creature within 5 ft. of it must then succeed on a DC 10 Constitution saving throw or be blinded for 1 minute. A blinded creature can repeat the saving throw on each of its turns, ending the effect on itself on a success.; Innate Spellcasting: The mephit can innately cast sleep, requiring no material components. Its innate spellcasting ability is Charisma.', 'Claws: Melee Weapon Attack: +4 to hit, reach 5 ft., one creature. Hit: 4 (1d4 + 2) slashing damage.; Blinding Breath: The mephit exhales a 15-foot cone of blinding dust. Each creature in that area must succeed on a DC 10 Dexterity saving throw or be blinded for 1 minute. A creature can repeat the saving throw at the end of each of its turns, ending the effect on itself on a success.', '', 'None'),
    

    ('Eagle', 'Small', 'beast', 'unaligned', 12, 'dex', 3, 
            '1d6', '1d6', '10 ft.', 6, 15, 10, 2, 
            14, 7, 'Skill: Perception', '', '', 
            '', '', 'None', 14, '', 
            0, 2, 10, 'Keen Sight: The eagle has advantage on Wisdom (Perception) checks that rely on sight.', 'Talons: Melee Weapon Attack: +4 to hit, reach 5 ft., one target. Hit: 4 (1d4 + 2) slashing damage.', '', 'None'),
    

    ('Earth Elemental', 'Large', 'elemental', 'neutral', 17, 'natural', 126, 
            '12d10', '12d10+60', '30 ft.', 20, 8, 20, 5, 
            10, 5, '', 'thunder', 'bludgeoning, piercing, and slashing from nonmagical weapons', 
            'poison', 'Exhaustion, Paralyzed, Petrified, Poisoned, Unconscious', '60 ft.', 10, 'Terran', 
            5, 3, 1800, 'Earth Glide: The elemental can burrow through nonmagical, unworked earth and stone. While doing so, the elemental doesn''t disturb the material it moves through.; Siege Monster: The elemental deals double damage to objects and structures.', 'Multiattack: The elemental makes two slam attacks.; Slam: Melee Weapon Attack: +8 to hit, reach 10 ft., one target. Hit: 14 (2d8 + 5) bludgeoning damage.', '', '/api/2014/images/monsters/earth-elemental.png'),
    

    ('Efreeti', 'Large', 'elemental', 'lawful evil', 17, 'natural', 200, 
            '16d10', '16d10+112', '40 ft.', 22, 12, 24, 16, 
            15, 16, 'Saving Throw: INT, Saving Throw: WIS, Saving Throw: CHA', '', '', 
            'fire', '', '120 ft.', 12, 'Ignan', 
            11, 4, 7200, 'Elemental Demise: If the efreeti dies, its body disintegrates in a flash of fire and puff of smoke, leaving behind only equipment the djinni was wearing or carrying.; Innate Spellcasting: The efreeti''s innate spell casting ability is Charisma (spell save DC 15, +7 to hit with spell attacks). It can innately cast the following spells, requiring no material components:

At will: detect magic
3/day: enlarge/reduce, tongues
1/day each: conjure elemental (fire elemental only), gaseous form, invisibility, major image, plane shift, wall of fire', 'Multiattack: The efreeti makes two scimitar attacks or uses its Hurl Flame twice.; Scimitar: Melee Weapon Attack: +10 to hit, reach 5 ft., one target. Hit: 13 (2d6 + 6) slashing damage plus 7 (2d6) fire damage.; Hurl Flame: Ranged Spell Attack: +7 to hit, range 120 ft., one target. Hit: 17 (5d6) fire damage.', '', 'None'),
    

    ('Elephant', 'Huge', 'beast', 'unaligned', 12, 'natural', 76, 
            '8d12', '8d12+24', '40 ft.', 22, 9, 17, 3, 
            11, 6, '', '', '', 
            '', '', 'None', 10, '', 
            4, 2, 1100, 'Trampling Charge: If the elephant moves at least 20 ft. straight toward a creature and then hits it with a gore attack on the same turn, that target must succeed on a DC 12 Strength saving throw or be knocked prone. If the target is prone, the elephant can make one stomp attack against it as a bonus action.', 'Gore: Melee Weapon Attack: +8 to hit, reach 5 ft., one target. Hit: 19 (3d8 + 6) piercing damage.; Stomp: Melee Weapon Attack: +8 to hit, reach 5 ft., one prone creature. Hit: 22 (3d10 + 6) bludgeoning damage.', '', 'None'),
    

    ('Elk', 'Large', 'beast', 'unaligned', 10, 'dex', 13, 
            '2d10', '2d10+2', '50 ft.', 16, 10, 12, 2, 
            10, 6, '', '', '', 
            '', '', 'None', 10, '', 
            0.25, 2, 50, 'Charge: If the elk moves at least 20 ft. straight toward a target and then hits it with a ram attack on the same turn, the target takes an extra 7 (2d6) damage. If the target is a creature, it must succeed on a DC 13 Strength saving throw or be knocked prone.', 'Ram: Melee Weapon Attack: +5 to hit, reach 5 ft., one target. Hit: 6 (1d6 + 3) bludgeoning damage.; Hooves: Melee Weapon Attack: +5 to hit, reach 5 ft., one prone creature. Hit: 8 (2d4 + 3) bludgeoning damage.', '', 'None'),
    

    ('Erinyes', 'Medium', 'fiend', 'lawful evil', 18, 'armor', 153, 
            '18d8', '18d8+72', '30 ft.', 18, 16, 18, 14, 
            14, 18, 'Saving Throw: DEX, Saving Throw: CON, Saving Throw: WIS, Saving Throw: CHA', '', 'cold, bludgeoning, piercing, and slashing from nonmagical weapons that aren''t silvered', 
            'fire, poison', 'Poisoned', 'None', 12, 'Infernal, telepathy 120 ft.', 
            12, 4, 8400, 'Hellish Weapons: The erinyes''s weapon attacks are magical and deal an extra 13 (3d8) poison damage on a hit (included in the attacks).; Magic Resistance: The erinyes has advantage on saving throws against spells and other magical effects.', 'Multiattack: The erinyes makes three attacks; Longsword: Melee Weapon Attack: +8 to hit, reach 5 ft., one target. Hit: 8 (1d8 + 4) slashing damage, or 9 (1d10 + 4) slashing damage if used with two hands, plus 13 (3d8) poison damage.; Longbow: Ranged Weapon Attack: +7 to hit, range 150/600 ft., one target. Hit: 7 (1d8 + 3) piercing damage plus 13 (3d8) poison damage, and the target must succeed on a DC 14 Constitution saving throw or be poisoned. The poison lasts until it is removed by the lesser restoration spell or similar magic.', '', 'None'),
    

    ('Ettercap', 'Medium', 'monstrosity', 'neutral evil', 13, 'natural', 44, 
            '8d8', '8d8+8', '30 ft.', 14, 15, 13, 7, 
            12, 8, 'Skill: Perception, Skill: Stealth, Skill: Survival', '', '', 
            '', '', '60 ft.', 13, '', 
            2, 2, 450, 'Spider Climb: The ettercap can climb difficult surfaces, including upside down on ceilings, without needing to make an ability check.; Web Sense: While in contact with a web, the ettercap knows the exact location of any other creature in contact with the same web.; Web Walker: The ettercap ignores movement restrictions caused by webbing.', 'Multiattack: The ettercap makes two attacks: one with its bite and one with its claws.; Bite: Melee Weapon Attack: +4 to hit, reach 5 ft., one creature. Hit: 6 (1d8 + 2) piercing damage plus 4 (1d8) poison damage. The target must succeed on a DC 11 Constitution saving throw or be poisoned for 1 minute. The creature can repeat the saving throw at the end of each of its turns, ending the effect on itself on a success.; Claws: Melee Weapon Attack: +4 to hit, reach 5 ft., one target. Hit: 7 (2d4 + 2) slashing damage.; Web: Ranged Weapon Attack: +4 to hit, range 30/60 ft., one Large or smaller creature. Hit: The creature is restrained by webbing. As an action, the restrained creature can make a DC 11 Strength check, escaping from the webbing on a success. The effect ends if the webbing is destroyed. The webbing has AC 10, 5 hit points, is vulnerable to fire damage and immune to bludgeoning damage.', '', 'None'),
    

    ('Ettin', 'Large', 'giant', 'chaotic evil', 12, 'natural', 85, 
            '10d10', '10d10+30', '40 ft.', 21, 8, 17, 6, 
            10, 8, 'Skill: Perception', '', '', 
            '', '', '60 ft.', 14, 'Giant, Orc', 
            4, 2, 1100, 'Two Heads: The ettin has advantage on Wisdom (Perception) checks and on saving throws against being blinded, charmed, deafened, frightened, stunned, and knocked unconscious.; Wakeful: When one of the ettin''s heads is asleep, its other head is awake.', 'Multiattack: The ettin makes two attacks: one with its battleaxe and one with its morningstar.; Battleaxe: Melee Weapon Attack: +7 to hit, reach 5 ft., one target. Hit: 14 (2d8 + 5) slashing damage.; Morningstar: Melee Weapon Attack: +7 to hit, reach 5 ft., one target. Hit: 14 (2d8 + 5) piercing damage.', '', 'None'),
    

    ('Fire Elemental', 'Large', 'elemental', 'neutral', 13, 'dex', 102, 
            '12d10', '12d10+36', '50 ft.', 10, 17, 16, 6, 
            10, 7, '', '', 'bludgeoning, piercing, and slashing from nonmagical weapons', 
            'fire, poison', 'Exhaustion, Grappled, Paralyzed, Petrified, Poisoned, Prone, Restrained, Unconscious', '60 ft.', 10, 'Ignan', 
            5, 3, 1800, 'Fire Form: The elemental can move through a space as narrow as 1 inch wide without squeezing. A creature that touches the elemental or hits it with a melee attack while within 5 ft. of it takes 5 (1d10) fire damage. In addition, the elemental can enter a hostile creature''s space and stop there. The first time it enters a creature''s space on a turn, that creature takes 5 (1d10) fire damage and catches fire; until someone takes an action to douse the fire, the creature takes 5 (1d10) fire damage at the start of each of its turns.; Illumination: The elemental sheds bright light in a 30-foot radius and dim light in an additional 30 ft..; Water Susceptibility: For every 5 ft. the elemental moves in water, or for every gallon of water splashed on it, it takes 1 cold damage.', 'Multiattack: The elemental makes two touch attacks.; Touch: Melee Weapon Attack: +6 to hit, reach 5 ft., one target. Hit: 10 (2d6 + 3) fire damage. If the target is a creature or a flammable object, it ignites. Until a creature takes an action to douse the fire, the target takes 5 (1d10) fire damage at the start of each of its turns.', '', 'None'),
    

    ('Fire Giant', 'Huge', 'giant', 'lawful evil', 18, 'armor', 162, 
            '13d12', '13d12+78', '30 ft.', 25, 9, 23, 10, 
            14, 13, 'Saving Throw: DEX, Saving Throw: CON, Saving Throw: CHA, Skill: Athletics, Skill: Perception', '', '', 
            'fire', '', 'None', 16, 'Giant', 
            9, 4, 5000, '', 'Multiattack: The giant makes two greatsword attacks.; Greatsword: Melee Weapon Attack: +11 to hit, reach 10 ft., one target. Hit: 28 (6d6 + 7) slashing damage.; Rock: Ranged Weapon Attack: +11 to hit, range 60/240 ft., one target. Hit: 29 (4d10 + 7) bludgeoning damage.', '', 'None'),
    

    ('Flesh Golem', 'Medium', 'construct', 'neutral', 9, 'dex', 93, 
            '11d8', '11d8+44', '30 ft.', 19, 9, 18, 6, 
            10, 5, '', '', '', 
            'lightning, poison, bludgeoning, piercing, and slashing from nonmagical weapons that aren''t adamantine', 'Charmed, Exhaustion, Frightened, Paralyzed, Petrified, Poisoned', '60 ft.', 10, 'understands the languages of its creator but can''t speak', 
            5, 3, 1800, 'Berserk: Whenever the golem starts its turn with 40 hit points or fewer, roll a d6. On a 6, the golem goes berserk. On each of its turns while berserk, the golem attacks the nearest creature it can see. If no creature is near enough to move to and attack, the golem attacks an object, with preference for an object smaller than itself. Once the golem goes berserk, it continues to do so until it is destroyed or regains all its hit points.
The golem''s creator, if within 60 feet of the berserk golem, can try to calm it by speaking firmly and persuasively. The golem must be able to hear its creator, who must take an action to make a DC 15 Charisma (Persuasion) check. If the check succeeds, the golem ceases being berserk. If it takes damage while still at 40 hit points or fewer, the golem might go berserk again.; Aversion of Fire: If the golem takes fire damage, it has disadvantage on attack rolls and ability checks until the end of its next turn.; Immutable Form: The golem is immune to any spell or effect that would alter its form.; Lightning Absorption: Whenever the golem is subjected to lightning damage, it takes no damage and instead regains a number of hit points equal to the lightning damage dealt.; Magic Resistance: The golem has advantage on saving throws against spells and other magical effects.; Magic Weapons: The golem''s weapon attacks are magical.', 'Multiattack: The golem makes two slam attacks.; Slam: Melee Weapon Attack: +7 to hit, reach 5 ft., one target. Hit: 13 (2d8 + 4) bludgeoning damage.', '', 'None'),
    

    ('Flying Snake', 'Tiny', 'beast', 'unaligned', 14, 'dex', 5, 
            '2d4', '2d4', '30 ft.', 4, 18, 11, 2, 
            12, 5, '', '', '', 
            '', '', 'None', 11, '', 
            0.125, 2, 25, 'Flyby: The snake doesn''t provoke opportunity attacks when it flies out of an enemy''s reach.', 'Bite: Melee Weapon Attack: +6 to hit, reach 5 ft., one target. Hit: 1 piercing damage plus 7 (3d4) poison damage.', '', 'None'),
    

    ('Flying Sword', 'Small', 'construct', 'unaligned', 17, 'natural', 17, 
            '5d6', '5d6', '0 ft.', 12, 15, 11, 1, 
            5, 1, 'Saving Throw: DEX', '', '', 
            'poison, psychic', 'Blinded, Charmed, Blinded, Frightened, Paralyzed, Petrified, Poisoned', 'None', 7, '', 
            0.25, 2, 50, 'Antimagic Susceptibility: The sword is incapacitated while in the area of an antimagic field. If targeted by dispel magic, the sword must succeed on a Constitution saving throw against the caster''s spell save DC or fall unconscious for 1 minute.; False Appearance: While the sword remains motionless and isn''t flying, it is indistinguishable from a normal sword.', 'Longsword: Melee Weapon Attack: +3 to hit, reach 5 ft., one target. Hit: 5 (1d8 + 1) slashing damage.', '', 'None'),
    

    ('Frog', 'Tiny', 'beast', 'unaligned', 11, 'dex', 1, 
            '1d4', '1d4-1', '20 ft.', 1, 13, 8, 1, 
            8, 3, 'Skill: Perception, Skill: Stealth', '', '', 
            '', '', '30 ft.', 11, '', 
            0, 2, 0, 'Amphibious: The frog can breathe air and water; Standing Leap: The frog''s long jump is up to 10 ft. and its high jump is up to 5 ft., with or without a running start.', '', '', 'None'),
    

    ('Frost Giant', 'Huge', 'giant', 'neutral evil', 15, 'armor', 138, 
            '12d12', '12d12+60', '40 ft.', 23, 9, 21, 9, 
            10, 12, 'Saving Throw: CON, Saving Throw: WIS, Saving Throw: CHA, Skill: Athletics, Skill: Perception', '', '', 
            'cold', '', 'None', 13, 'Giant', 
            8, 3, 3900, '', 'Multiattack: The giant makes two greataxe attacks.; Greataxe: Melee Weapon Attack: +9 to hit, reach 10 ft., one target. Hit: 25 (3d12 + 6) slashing damage.; Rock: Ranged Weapon Attack: +9 to hit, range 60/240 ft., one target. Hit: 28 (4d10 + 6) bludgeoning damage.', '', 'None'),
    

    ('Gargoyle', 'Medium', 'elemental', 'chaotic evil', 15, 'natural', 52, 
            '7d8', '7d8+21', '30 ft.', 15, 11, 16, 6, 
            11, 7, '', '', 'bludgeoning, piercing, and slashing from nonmagical weapons that aren''t adamantine', 
            'poison', 'Exhaustion, Petrified, Poisoned', '60 ft.', 10, 'Terran', 
            2, 2, 450, 'False Appearance: While the gargoyle remains motion less, it is indistinguishable from an inanimate statue.', 'Multiattack: The gargoyle makes two attacks: one with its bite and one with its claws.; Bite: Melee Weapon Attack: +4 to hit, reach 5 ft., one target. Hit: 5 (1d6 + 2) piercing damage.; Claws: Melee Weapon Attack: +4 to hit, reach 5 ft., one target. Hit: 5 (1d6 + 2) slashing damage.', '', 'None'),
    

    ('Gelatinous Cube', 'Large', 'ooze', 'unaligned', 6, 'dex', 84, 
            '8d10', '8d10+40', '15 ft.', 14, 3, 20, 1, 
            6, 1, '', '', '', 
            '', 'Blinded, Charmed, Deafened, Exhaustion, Frightened, Prone', 'None', 8, '', 
            2, 2, 450, 'Ooze Cube: The cube takes up its entire space. Other creatures can enter the space, but a creature that does so is subjected to the cube''s Engulf and has disadvantage on the saving throw.
Creatures inside the cube can be seen but have total cover.
A creature within 5 feet of the cube can take an action to pull a creature or object out of the cube. Doing so requires a successful DC 12 Strength check, and the creature making the attempt takes 10 (3d6) acid damage.
The cube can hold only one Large creature or up to four Medium or smaller creatures inside it at a time.; Transparent: Even when the cube is in plain sight, it takes a successful DC 15 Wisdom (Perception) check to spot a cube that has neither moved nor attacked. A creature that tries to enter the cube''s space while unaware of the cube is surprised by the cube.', 'Pseudopod: Melee Weapon Attack: +4 to hit, reach 5 ft., one creature. Hit: 10 (3d6) acid damage.; Engulf: The cube moves up to its speed. While doing so, it can enter Large or smaller creatures'' spaces. Whenever the cube enters a creature''s space, the creature must make a DC 12 Dexterity saving throw.
On a successful save, the creature can choose to be pushed 5 feet back or to the side of the cube. A creature that chooses not to be pushed suffers the consequences of a failed saving throw.
On a failed save, the cube enters the creature''s space, and the creature takes 10 (3d6) acid damage and is engulfed. The engulfed creature can''t breathe, is restrained, and takes 21 (6d6) acid damage at the start of each of the cube''s turns. When the cube moves, the engulfed creature moves with it.
An engulfed creature can try to escape by taking an action to make a DC 12 Strength check. On a success, the creature escapes and enters a space of its choice within 5 feet of the cube.', '', 'None'),
    

    ('Ghast', 'Medium', 'undead', 'chaotic evil', 13, 'dex', 36, 
            '8d8', '8d8', '30 ft.', 16, 17, 10, 11, 
            10, 8, '', '', 'necrotic', 
            'poison', 'Poisoned, Charmed, Exhaustion', '60 ft.', 10, 'Common', 
            2, 2, 450, 'Stench: Any creature that starts its turn within 5 ft. of the ghast must succeed on a DC 10 Constitution saving throw or be poisoned until the start of its next turn. On a successful saving throw, the creature is immune to the ghast''s Stench for 24 hours.; Turn Defiance: The ghast and any ghouls within 30 ft. of it have advantage on saving throws against effects that turn undead.', 'Bite: Melee Weapon Attack: +3 to hit, reach 5 ft., one creature. Hit: 12 (2d8 + 3) piercing damage.; Claws: Melee Weapon Attack: +5 to hit, reach 5 ft., one target. Hit: 10 (2d6 + 3) slashing damage. If the target is a creature other than an undead, it must succeed on a DC 10 Constitution saving throw or be paralyzed for 1 minute. The target can repeat the saving throw at the end of each of its turns, ending the effect on itself on a success.', '', 'None'),
    

    ('Ghost', 'Medium', 'undead', 'any alignment', 11, 'dex', 45, 
            '10d8', '10d8', '0 ft.', 7, 13, 10, 10, 
            12, 17, '', '', 'acid, fire, lightning, thunder, bludgeoning, piercing, and slashing from nonmagical weapons', 
            'cold, necrotic, poison', 'Charmed, Exhaustion, Frightened, Grappled, Paralyzed, Petrified, Poisoned, Prone, Restrained', '60 ft.', 11, 'any languages it knew in life', 
            4, 2, 1100, 'Ethereal Sight: The ghost can see 60 ft. into the Ethereal Plane when it is on the Material Plane, and vice versa.; Incorporeal Movement: The ghost can move through other creatures and objects as if they were difficult terrain. It takes 5 (1d10) force damage if it ends its turn inside an object.', 'Withering Touch: Melee Weapon Attack: +5 to hit, reach 5 ft., one target. Hit: 17 (4d6 + 3) necrotic damage.; Etherealness: The ghost enters the Ethereal Plane from the Material Plane, or vice versa. It is visible on the Material Plane while it is in the Border Ethereal, and vice versa, yet it can''t affect or be affected by anything on the other plane.; Horrifying Visage: Each non-undead creature within 60 ft. of the ghost that can see it must succeed on a DC 13 Wisdom saving throw or be frightened for 1 minute. If the save fails by 5 or more, the target also ages 1d4 × 10 years. A frightened target can repeat the saving throw at the end of each of its turns, ending the frightened condition on itself on a success. If a target''s saving throw is successful or the effect ends for it, the target is immune to this ghost''s Horrifying Visage for the next 24 hours. The aging effect can be reversed with a greater restoration spell, but only within 24 hours of it occurring.; Possession: One humanoid that the ghost can see within 5 ft. of it must succeed on a DC 13 Charisma saving throw or be possessed by the ghost; the ghost then disappears, and the target is incapacitated and loses control of its body. The ghost now controls the body but doesn''t deprive the target of awareness. The ghost can''t be targeted by any attack, spell, or other effect, except ones that turn undead, and it retains its alignment, Intelligence, Wisdom, Charisma, and immunity to being charmed and frightened. It otherwise uses the possessed target''s statistics, but doesn''t gain access to the target''s knowledge, class features, or proficiencies.
The possession lasts until the body drops to 0 hit points, the ghost ends it as a bonus action, or the ghost is turned or forced out by an effect like the dispel evil and good spell. When the possession ends, the ghost reappears in an unoccupied space within 5 ft. of the body. The target is immune to this ghost''s Possession for 24 hours after succeeding on the saving throw or after the possession ends.', '', 'None'),
    

    ('Ghoul', 'Medium', 'undead', 'chaotic evil', 12, 'dex', 22, 
            '5d8', '5d8', '30 ft.', 13, 15, 10, 7, 
            10, 6, '', '', '', 
            'poison', 'Poisoned, Charmed, Exhaustion', '60 ft.', 10, 'Common', 
            1, 2, 200, '', 'Bite: Melee Weapon Attack: +2 to hit, reach 5 ft., one creature. Hit: 9 (2d6 + 2) piercing damage.; Claws: Melee Weapon Attack: +4 to hit, reach 5 ft., one target. Hit: 7 (2d4 + 2) slashing damage. If the target is a creature other than an elf or undead, it must succeed on a DC 10 Constitution saving throw or be paralyzed for 1 minute. The target can repeat the saving throw at the end of each of its turns, ending the effect on itself on a success.', '', 'None'),
    

    ('Giant Ape', 'Huge', 'beast', 'unaligned', 12, 'dex', 157, 
            '15d12', '15d12+60', '40 ft.', 23, 14, 18, 7, 
            12, 7, 'Skill: Athletics, Skill: Perception', '', '', 
            '', '', 'None', 14, '', 
            7, 3, 2900, '', 'Multiattack: The ape makes two fist attacks.; Fist: Melee Weapon Attack: +9 to hit, reach 10 ft., one target. Hit: 22 (3d10 + 6) bludgeoning damage.; Rock: Ranged Weapon Attack: +9 to hit, range 50/100 ft., one target. Hit: 30 (7d6 + 6) bludgeoning damage.', '', 'None'),
    

    ('Giant Badger', 'Medium', 'beast', 'unaligned', 10, 'dex', 13, 
            '2d8', '2d8+4', '30 ft.', 13, 10, 15, 2, 
            12, 5, '', '', '', 
            '', '', '30 ft.', 11, '', 
            0.25, 2, 50, 'Keen Smell: The badger has advantage on Wisdom (Perception) checks that rely on smell.', 'Multiattack: The badger makes two attacks: one with its bite and one with its claws.; Bite: Melee Weapon Attack: +3 to hit, reach 5 ft., one target. Hit: 4 (1d6 + 1) piercing damage.; Claws: Melee Weapon Attack: +3 to hit, reach 5 ft., one target. Hit: 6 (2d4 + 1) slashing damage.', '', 'None'),
    

    ('Giant Bat', 'Large', 'beast', 'unaligned', 13, 'dex', 22, 
            '4d10', '4d10', '10 ft.', 15, 16, 11, 2, 
            12, 6, '', '', '', 
            '', '', 'None', 11, '', 
            0.25, 2, 50, 'Echolocation: The bat can''t use its blindsight while deafened.; Keen Hearing: The bat has advantage on Wisdom (Perception) checks that rely on hearing.', 'Bite: Melee Weapon Attack: +4 to hit, reach 5 ft., one creature. Hit: 5 (1d6 + 2) piercing damage.', '', 'None'),
    

    ('Giant Boar', 'Large', 'beast', 'unaligned', 12, 'natural', 42, 
            '5d10', '5d10+15', '40 ft.', 17, 10, 16, 2, 
            7, 5, '', '', '', 
            '', '', 'None', 8, '', 
            2, 2, 450, 'Charge: If the boar moves at least 20 ft. straight toward a target and then hits it with a tusk attack on the same turn, the target takes an extra 7 (2d6) slashing damage. If the target is a creature, it must succeed on a DC 13 Strength saving throw or be knocked prone.; Relentless: If the boar takes 10 damage or less that would reduce it to 0 hit points, it is reduced to 1 hit point instead.', 'Tusk: Melee Weapon Attack: +5 to hit, reach 5 ft., one target. Hit: 10 (2d6 + 3) slashing damage.', '', 'None'),
    

    ('Giant Centipede', 'Small', 'beast', 'unaligned', 13, 'natural', 4, 
            '1d6', '1d6+1', '30 ft.', 5, 14, 12, 1, 
            7, 3, '', '', '', 
            '', '', 'None', 8, '', 
            0.25, 2, 50, '', 'Bite: Melee Weapon Attack: +4 to hit, reach 5 ft., one creature. Hit: 4 (1d4 + 2) piercing damage, and the target must succeed on a DC 11 Constitution saving throw or take 10 (3d6) poison damage. If the poison damage reduces the target to 0 hit points, the target is stable but poisoned for 1 hour, even after regaining hit points, and is paralyzed while poisoned in this way.', '', 'None'),
    

    ('Giant Constrictor Snake', 'Huge', 'beast', 'unaligned', 12, 'dex', 60, 
            '8d12', '8d12+8', '30 ft.', 19, 14, 12, 1, 
            10, 3, 'Skill: Perception', '', '', 
            '', '', 'None', 12, '', 
            2, 2, 450, '', 'Bite: Melee Weapon Attack: +6 to hit, reach 10 ft., one creature. Hit: 11 (2d6 + 4) piercing damage.; Constrict: Melee Weapon Attack: +6 to hit, reach 5 ft., one creature. Hit: 13 (2d8 + 4) bludgeoning damage, and the target is grappled (escape DC 16). Until this grapple ends, the creature is restrained, and the snake can''t constrict another target.', '', 'None'),
    

    ('Giant Crab', 'Medium', 'beast', 'unaligned', 15, 'natural', 13, 
            '3d8', '3d8', '30 ft.', 13, 15, 11, 1, 
            9, 3, 'Skill: Stealth', '', '', 
            '', '', 'None', 9, '', 
            0.125, 2, 25, 'Amphibious: The crab can breathe air and water.', 'Claw: Melee Weapon Attack: +3 to hit, reach 5 ft., one target. Hit: 4 (1d6 + 1) bludgeoning damage, and the target is grappled (escape DC 11). The crab has two claws, each of which can grapple only one target.', '', 'None'),
    

    ('Giant Crocodile', 'Huge', 'beast', 'unaligned', 14, 'natural', 85, 
            '9d12', '9d12+27', '30 ft.', 21, 9, 17, 2, 
            10, 7, 'Skill: Stealth', '', '', 
            '', '', 'None', 10, '', 
            5, 3, 1800, 'Hold Breath: The crocodile can hold its breath for 30 minutes.', 'Multiattack: The crocodile makes two attacks: one with its bite and one with its tail.; Bite: Melee Weapon Attack: +8 to hit, reach 5 ft., one target. Hit: 21 (3d10 + 5) piercing damage, and the target is grappled (escape DC 16). Until this grapple ends, the target is restrained, and the crocodile can''t bite another target.; Tail: Melee Weapon Attack: +8 to hit, reach 10 ft., one target not grappled by the crocodile. Hit: 14 (2d8 + 5) bludgeoning damage. If the target is a creature, it must succeed on a DC 16 Strength saving throw or be knocked prone.', '', 'None'),
    

    ('Giant Eagle', 'Large', 'beast', 'neutral good', 13, 'dex', 26, 
            '4d10', '4d10+4', '10 ft.', 16, 17, 13, 8, 
            14, 10, 'Skill: Perception', '', '', 
            '', '', 'None', 14, 'Giant Eagle, understands Common and Auran but can''t speak', 
            1, 2, 200, 'Keen Sight: The eagle has advantage on Wisdom (Perception) checks that rely on sight.', 'Multiattack: The eagle makes two attacks: one with its beak and one with its talons.; Beak: Melee Weapon Attack: +5 to hit, reach 5 ft., one target. Hit: 6 (1d6 + 3) piercing damage.; Talons: Melee Weapon Attack: +5 to hit, reach 5 ft., one target. Hit: 10 (2d6 + 3) slashing damage.', '', 'None'),
    

    ('Giant Elk', 'Huge', 'beast', 'unaligned', 14, 'natural', 42, 
            '5d12', '5d12+10', '60 ft.', 19, 16, 14, 7, 
            14, 10, 'Skill: Perception', '', '', 
            '', '', 'None', 14, 'Giant Elk, understands Common, Elvish, and Sylvan but can''t speak', 
            2, 2, 450, 'Charge: If the elk moves at least 20 ft. straight toward a target and then hits it with a ram attack on the same turn, the target takes an extra 7 (2d6) damage. If the target is a creature, it must succeed on a DC 14 Strength saving throw or be knocked prone.', 'Ram: Melee Weapon Attack: +6 to hit, reach 10 ft., one target. Hit: 11 (2d6 + 4) bludgeoning damage.; Hooves: Melee Weapon Attack: +6 to hit, reach 5 ft., one prone creature. Hit: 22 (4d8 + 4) bludgeoning damage.', '', 'None'),
    

    ('Giant Fire Beetle', 'Small', 'beast', 'unaligned', 13, 'natural', 4, 
            '1d6', '1d6+1', '30 ft.', 8, 10, 12, 1, 
            7, 3, '', '', '', 
            '', '', 'None', 8, '', 
            0, 2, 10, 'Illumination: The beetle sheds bright light in a 10-foot radius and dim light for an additional 10 ft..', 'Bite: Melee Weapon Attack: +1 to hit, reach 5 ft., one target. Hit: 2 (1d6 - 1) slashing damage.', '', 'None'),
    

    ('Giant Frog', 'Medium', 'beast', 'unaligned', 11, 'dex', 18, 
            '4d8', '4d8', '30 ft.', 12, 13, 11, 2, 
            10, 3, 'Skill: Perception, Skill: Stealth', '', '', 
            '', '', '30 ft.', 12, '', 
            0.25, 2, 50, 'Amphibious: The frog can breathe air and water; Standing Leap: The frog''s long jump is up to 20 ft. and its high jump is up to 10 ft., with or without a running start.', 'Bite: Melee Weapon Attack: +3 to hit, reach 5 ft., one target. Hit: 4 (1d6 + 1) piercing damage, and the target is grappled (escape DC 11). Until this grapple ends, the target is restrained, and the frog can''t bite another target.; Swallow: The frog makes one bite attack against a Small or smaller target it is grappling. If the attack hits, the target is swallowed, and the grapple ends. The swallowed target is blinded and restrained, it has total cover against attacks and other effects outside the frog, and it takes 5 (2d4) acid damage at the start of each of the frog''s turns. The frog can have only one target swallowed at a time. If the frog dies, a swallowed creature is no longer restrained by it and can escape from the corpse using 5 ft. of movement, exiting prone.', '', 'None'),
    

    ('Giant Goat', 'Large', 'beast', 'unaligned', 11, 'dex', 19, 
            '3d10', '3d10+3', '40 ft.', 17, 11, 12, 3, 
            12, 6, '', '', '', 
            '', '', 'None', 11, '', 
            0.5, 2, 100, 'Charge: If the goat moves at least 20 ft. straight toward a target and then hits it with a ram attack on the same turn, the target takes an extra 5 (2d4) bludgeoning damage. If the target is a creature, it must succeed on a DC 13 Strength saving throw or be knocked prone.; Sure-Footed: The goat has advantage on Strength and Dexterity saving throws made against effects that would knock it prone.', 'Ram: Melee Weapon Attack: +5 to hit, reach 5 ft., one target. Hit: 8 (2d4 + 3) bludgeoning damage.', '', 'None'),
    

    ('Giant Hyena', 'Large', 'beast', 'unaligned', 12, 'dex', 45, 
            '6d10', '6d10+12', '50 ft.', 16, 14, 14, 2, 
            12, 7, 'Skill: Perception', '', '', 
            '', '', 'None', 13, '', 
            1, 2, 200, 'Rampage: When the hyena reduces a creature to 0 hit points with a melee attack on its turn, the hyena can take a bonus action to move up to half its speed and make a bite attack.', 'Bite: Melee Weapon Attack: +5 to hit, reach 5 ft., one target. Hit: 10 (2d6 + 3) piercing damage.', '', 'None'),
    

    ('Giant Lizard', 'Large', 'beast', 'unaligned', 12, 'natural', 19, 
            '3d10', '3d10+3', '30 ft.', 15, 12, 13, 2, 
            10, 5, '', '', '', 
            '', '', '30 ft.', 10, '', 
            0.25, 2, 50, '', 'Bite: Melee Weapon Attack: +4 to hit, reach 5 ft., one target. Hit: 6 (1d8 + 2) piercing damage.', '', 'None'),
    

    ('Giant Octopus', 'Large', 'beast', 'unaligned', 11, 'dex', 52, 
            '8d10', '8d10+8', '10 ft.', 17, 13, 13, 4, 
            10, 4, 'Skill: Perception, Skill: Stealth', '', '', 
            '', '', '60 ft.', 14, '', 
            1, 2, 200, 'Hold Breath: While out of water, the octopus can hold its breath for 1 hour.; Underwater Camouflage: The octopus has advantage on Dexterity (Stealth) checks made while underwater.; Water Breathing: The octopus can breathe only underwater.', 'Tentacles: Melee Weapon Attack: +5 to hit, reach 15 ft., one target. Hit: 10 (2d6 + 3) bludgeoning damage. If the target is a creature, it is grappled (escape DC 16). Until this grapple ends, the target is restrained, and the octopus can''t use its tentacles on another target.; Ink Cloud: A 20-foot-radius cloud of ink extends all around the octopus if it is underwater. The area is heavily obscured for 1 minute, although a significant current can disperse the ink. After releasing the ink, the octopus can use the Dash action as a bonus action.', '', 'None'),
    

    ('Giant Owl', 'Large', 'beast', 'neutral', 12, 'dex', 19, 
            '3d10', '3d10+3', '5 ft.', 13, 15, 12, 8, 
            13, 10, 'Skill: Perception, Skill: Stealth', '', '', 
            '', '', '120 ft.', 15, 'Giant Owl, understands Common, Elvish, and Sylvan but can''t speak', 
            0.25, 2, 50, 'Flyby: The owl doesn''t provoke opportunity attacks when it flies out of an enemy''s reach.; Keen Hearing and Sight: The owl has advantage on Wisdom (Perception) checks that rely on hearing or sight.', 'Talons: Melee Weapon Attack: +3 to hit, reach 5 ft., one target. Hit: 8 (2d6 + 1) slashing damage.', '', 'None'),
    

    ('Giant Poisonous Snake', 'Medium', 'beast', 'unaligned', 14, 'dex', 11, 
            '2d8', '2d8+2', '30 ft.', 10, 18, 13, 2, 
            10, 3, 'Skill: Perception', '', '', 
            '', '', 'None', 12, '', 
            0.25, 2, 50, '', 'Bite: Melee Weapon Attack: +6 to hit, reach 10 ft., one target. Hit: 6 (1d4 + 4) piercing damage, and the target must make a DC 11 Constitution saving throw, taking 10 (3d6) poison damage on a failed save, or half as much damage on a successful one.', '', 'None'),
    

    ('Giant Rat', 'Small', 'beast', 'unaligned', 12, 'dex', 7, 
            '2d6', '2d6', '30 ft.', 7, 15, 11, 2, 
            10, 4, '', '', '', 
            '', '', '60 ft.', 10, '', 
            0.125, 2, 25, 'Keen Smell: The rat has advantage on Wisdom (Perception) checks that rely on smell.; Pack Tactics: The rat has advantage on an attack roll against a creature if at least one of the rat''s allies is within 5 ft. of the creature and the ally isn''t incapacitated.', 'Bite: Melee Weapon Attack: +4 to hit, reach 5 ft., one target. Hit: 4 (1d4 + 2) piercing damage.', '', 'None'),
    

    ('Giant Rat (Diseased)', 'Small', 'beast', 'unaligned', 12, 'dex', 7, 
            '2d6', '2d6', '30 ft.', 7, 15, 11, 2, 
            10, 4, '', '', '', 
            '', '', '60 ft.', 10, '', 
            0.125, 2, 25, 'Keen Smell: The rat has advantage on Wisdom (Perception) checks that rely on smell.; Pack Tactics: The rat has advantage on an attack roll against a creature if at least one of the rat''s allies is within 5 ft. of the creature and the ally isn''t incapacitated.', 'Bite: Melee Weapon Attack: +4 to hit, reach 5 ft., one target. Hit: 3 (1d4 + 2) piercing damage. If the target is a creature, it must succeed on a DC 10 Constitution saving throw or contract a disease. Until the disease is cured, the target can''t regain hit points except by magical means, and the target''s hit point maximum decreases by 3 (1d6) every 24 hours. If the target''s hit point maximum drops to 0 as a result of this disease, the target dies.', '', 'None'),
    

    ('Giant Scorpion', 'Large', 'beast', 'unaligned', 15, 'natural', 52, 
            '7d10', '7d10+14', '40 ft.', 15, 13, 15, 1, 
            9, 3, '', '', '', 
            '', '', 'None', 9, '', 
            3, 2, 700, '', 'Claw: Melee Weapon Attack: +4 to hit, reach 5 ft., one target. Hit: 6 (1d8 + 2) bludgeoning damage, and the target is grappled (escape DC 12). The scorpion has two claws, each of which can grapple only one target.; Multiattack: The scorpion makes three attacks: two with its claws and one with its sting.; Sting: Melee Weapon Attack: +4 to hit, reach 5 ft., one creature. Hit: 7 (1d10 + 2) piercing damage, and the target must make a DC 12 Constitution saving throw, taking 22 (4d10) poison damage on a failed save, or half as much damage on a successful one.', '', 'None'),
    

    ('Giant Sea Horse', 'Large', 'beast', 'unaligned', 13, 'natural', 16, 
            '3d10', '3d10', '0 ft.', 12, 15, 11, 2, 
            12, 5, '', '', '', 
            '', '', 'None', 11, '', 
            0.5, 2, 100, 'Charge: If the sea horse moves at least 20 ft. straight toward a target and then hits it with a ram attack on the same turn, the target takes an extra 7 (2d6) bludgeoning damage. If the target is a creature, it must succeed on a DC 11 Strength saving throw or be knocked prone.; Water Breathing: The sea horse can breathe only underwater.', 'Ram: Melee Weapon Attack: +3 to hit, reach 5 ft., one target. Hit: 4 (1d6 + 1) bludgeoning damage.', '', 'None'),
    

    ('Giant Shark', 'Huge', 'beast', 'unaligned', 13, 'natural', 126, 
            '11d12', '11d12+55', '0 ft.', 23, 11, 21, 1, 
            10, 5, 'Skill: Perception', '', '', 
            '', '', 'None', 13, '', 
            5, 3, 1800, 'Blood Frenzy: The shark has advantage on melee attack rolls against any creature that doesn''t have all its hit points.; Water Breathing: The shark can breathe only underwater.', 'Bite: Melee Weapon Attack: +9 to hit, reach 5 ft., one target. Hit: 22 (3d10 + 6) piercing damage.', '', 'None'),
    

    ('Giant Spider', 'Large', 'beast', 'unaligned', 14, 'natural', 26, 
            '4d10', '4d10+4', '30 ft.', 14, 16, 12, 2, 
            11, 4, 'Skill: Stealth', '', '', 
            '', '', '60 ft.', 10, '', 
            1, 2, 200, 'Spider Climb: The spider can climb difficult surfaces, including upside down on ceilings, without needing to make an ability check.; Web Sense: While in contact with a web, the spider knows the exact location of any other creature in contact with the same web.; Web Walker: The spider ignores movement restrictions caused by webbing.', 'Bite: Melee Weapon Attack: +5 to hit, reach 5 ft., one creature. Hit: 7 (1d8 + 3) piercing damage, and the target must make a DC 11 Constitution saving throw, taking 9 (2d8) poison damage on a failed save, or half as much damage on a successful one. If the poison damage reduces the target to 0 hit points, the target is stable but poisoned for 1 hour, even after regaining hit points, and is paralyzed while poisoned in this way.; Web: Ranged Weapon Attack: +5 to hit, range 30/60 ft., one creature. Hit: The target is restrained by webbing. As an action, the restrained target can make a DC 12 Strength check, bursting the webbing on a success. The webbing can also be attacked and destroyed (AC 10; hp 5; vulnerability to fire damage; immunity to bludgeoning, poison, and psychic damage).', '', 'None'),
    

    ('Giant Toad', 'Large', 'beast', 'unaligned', 11, 'dex', 39, 
            '6d10', '6d10+6', '20 ft.', 15, 13, 13, 2, 
            10, 3, '', '', '', 
            '', '', '30 ft.', 10, '', 
            1, 2, 200, 'Amphibious: The toad can breathe air and water; Standing Leap: The toad''s long jump is up to 20 ft. and its high jump is up to 10 ft., with or without a running start.', 'Bite: Melee Weapon Attack: +4 to hit, reach 5 ft., one target. Hit: 7 (1d10 + 2) piercing damage plus 5 (1d10) poison damage, and the target is grappled (escape DC 13). Until this grapple ends, the target is restrained, and the toad can''t bite another target.; Swallow: The toad makes one bite attack against a Medium or smaller target it is grappling. If the attack hits, the target is swallowed, and the grapple ends. The swallowed target is blinded and restrained, it has total cover against attacks and other effects outside the toad, and it takes 10 (3d6) acid damage at the start of each of the toad''s turns. The toad can have only one target swallowed at a time.
If the toad dies, a swallowed creature is no longer restrained by it and can escape from the corpse using 5 feet of movement, exiting prone.', '', 'None'),
    

    ('Giant Vulture', 'Large', 'beast', 'neutral evil', 10, 'dex', 22, 
            '3d10', '3d10+6', '10 ft.', 15, 10, 15, 6, 
            12, 7, 'Skill: Perception', '', '', 
            '', '', 'None', 13, 'understands Common but can''t speak', 
            1, 2, 200, 'Keen Sight and Smell: The vulture has advantage on Wisdom (Perception) checks that rely on sight or smell.; Pack Tactics: The vulture has advantage on an attack roll against a creature if at least one of the vulture''s allies is within 5 ft. of the creature and the ally isn''t incapacitated.', 'Multiattack: The vulture makes two attacks: one with its beak and one with its talons.; Beak: Melee Weapon Attack: +4 to hit, reach 5 ft., one target. Hit: 7 (2d4 + 2) piercing damage.; Talons: Melee Weapon Attack: +4 to hit, reach 5 ft., one target. Hit: 9 (2d6 + 2) slashing damage.', '', 'None'),
    

    ('Giant Wasp', 'Medium', 'beast', 'unaligned', 12, 'dex', 13, 
            '3d8', '3d8', '10 ft.', 10, 14, 10, 1, 
            10, 3, '', '', '', 
            '', '', 'None', 10, '', 
            0.5, 2, 100, '', 'Sting: Melee Weapon Attack: +4 to hit, reach 5 ft., one creature. Hit: 5 (1d6 + 2) piercing damage, and the target must make a DC 11 Constitution saving throw, taking 10 (3d6) poison damage on a failed save, or half as much damage on a successful one. If the poison damage reduces the target to 0 hit points, the target is stable but poisoned for 1 hour, even after regaining hit points, and is paralyzed while poisoned in this way.', '', 'None'),
    

    ('Giant Weasel', 'Medium', 'beast', 'unaligned', 13, 'dex', 9, 
            '2d8', '2d8', '40 ft.', 11, 16, 10, 4, 
            12, 5, 'Skill: Perception, Skill: Stealth', '', '', 
            '', '', '60 ft.', 13, '', 
            0.125, 2, 25, 'Keen Hearing and Smell: The weasel has advantage on Wisdom (Perception) checks that rely on hearing or smell.', 'Bite: Melee Weapon Attack: +5 to hit, reach 5 ft., one target. Hit: 5 (1d4 + 3) piercing damage.', '', 'None'),
    

    ('Giant Wolf Spider', 'Medium', 'beast', 'unaligned', 13, 'dex', 11, 
            '2d8', '2d8+2', '40 ft.', 12, 16, 13, 3, 
            12, 4, 'Skill: Perception, Skill: Stealth', '', '', 
            '', '', '60 ft.', 13, '', 
            0.25, 2, 50, 'Spider Climb: The spider can climb difficult surfaces, including upside down on ceilings, without needing to make an ability check.; Web Sense: While in contact with a web, the spider knows the exact location of any other creature in contact with the same web.; Web Walker: The spider ignores movement restrictions caused by webbing.', 'Bite: Melee Weapon Attack: +3 to hit, reach 5 ft., one creature. Hit: 4 (1d6 + 1) piercing damage, and the target must make a DC 11 Constitution saving throw, taking 7 (2d6) poison damage on a failed save, or half as much damage on a successful one. If the poison damage reduces the target to 0 hit points, the target is stable but poisoned for 1 hour, even after regaining hit points, and is paralyzed while poisoned in this way.', '', 'None'),
    

    ('Gibbering Mouther', 'Medium', 'aberration', 'neutral', 9, 'dex', 67, 
            '9d8', '9d8+27', '10 ft.', 10, 8, 16, 3, 
            10, 6, '', '', '', 
            '', 'Prone', '60 ft.', 10, '', 
            2, 2, 450, 'Aberrant Ground: The ground in a 10-foot radius around the mouther is doughlike difficult terrain. Each creature that starts its turn in that area must succeed on a DC 10 Strength saving throw or have its speed reduced to 0 until the start of its next turn.; Gibbering: The mouther babbles incoherently while it can see any creature and isn''t incapacitated. Each creature that starts its turn within 20 feet of the mouther and can hear the gibbering must succeed on a DC 10 Wisdom saving throw. On a failure, the creature can''t take reactions until the start of its next turn and rolls a d8 to determine what it does during its turn. On a 1 to 4, the creature does nothing. On a 5 or 6, the creature takes no action or bonus action and uses all its movement to move in a randomly determined direction. On a 7 or 8, the creature makes a melee attack against a randomly determined creature within its reach or does nothing if it can''t make such an attack.', 'Multiattack: The gibbering mouther makes one bite attack and, if it can, uses its Blinding Spittle.; Bites: Melee Weapon Attack: +2 to hit, reach 5 ft., one creature. Hit: 17 (5d6) piercing damage. If the target is Medium or smaller, it must succeed on a DC 10 Strength saving throw or be knocked prone. If the target is killed by this damage, it is absorbed into the mouther.; Blinding Spittle: The mouther spits a chemical glob at a point it can see within 15 feet of it. The glob explodes in a blinding flash of light on impact. Each creature within 5 feet of the flash must succeed on a DC 13 Dexterity saving throw or be blinded until the end of the mouther''s next turn.', '', 'None'),
    

    ('Glabrezu', 'Large', 'fiend', 'chaotic evil', 17, 'natural', 157, 
            '15d10', '15d10+75', '40 ft.', 20, 15, 21, 19, 
            17, 16, 'Saving Throw: STR, Saving Throw: CON, Saving Throw: WIS, Saving Throw: CHA', '', 'cold, fire, lightning, bludgeoning, piercing, and slashing from nonmagical weapons', 
            'poison', 'Poisoned', 'None', 13, 'Abyssal, telepathy 120 ft.', 
            9, 4, 5000, 'Innate Spellcasting: The glabrezu''s spellcasting ability is Intelligence (spell save DC 16). The glabrezu can innately cast the following spells, requiring no material components:
At will: darkness, detect magic, dispel magic
1/day each: confusion, fly, power word stun; Magic Resistance: The glabrezu has advantage on saving throws against spells and other magical effects.', 'Multiattack: The glabrezu makes four attacks: two with its pincers and two with its fists. Alternatively, it makes two attacks with its pincers and casts one spell.; Pincer: Melee Weapon Attack: +9 to hit, reach 10 ft., one target. Hit: 16 (2d10 + 5) bludgeoning damage. If the target is a Medium or smaller creature, it is grappled (escape DC 15). The glabrezu has two pincers, each of which can grapple only one target.; Fist: Melee Weapon Attack: +9 to hit, reach 5 ft., one target. Hit: 7 (2d4 + 2) bludgeoning damage.', '', 'None'),
    

    ('Gladiator', 'Medium', 'humanoid', 'any alignment', 16, 'armor', 112, 
            '15d8', '15d8+45', '30 ft.', 18, 15, 16, 10, 
            12, 15, 'Saving Throw: STR, Saving Throw: DEX, Saving Throw: CON, Skill: Athletics, Skill: Intimidation', '', '', 
            '', '', 'None', 11, 'any one language (usually Common)', 
            5, 3, 1800, 'Brave: The gladiator has advantage on saving throws against being frightened.; Brute: A melee weapon deals one extra die of its damage when the gladiator hits with it (included in the attack).', 'Multiattack: The gladiator makes three melee attacks or two ranged attacks.; Spear: Melee or Ranged Weapon Attack: +7 to hit, reach 5 ft. and range 20/60 ft., one target. Hit: 11 (2d6 + 4) piercing damage, or 13 (2d8 + 4) piercing damage if used with two hands to make a melee attack.; Shield Bash: Melee Weapon Attack: +7 to hit, reach 5 ft., one creature. Hit: 9 (2d4 + 4) bludgeoning damage. If the target is a Medium or smaller creature, it must succeed on a DC 15 Strength saving throw or be knocked prone.', '', 'None'),
    

    ('Gnoll', 'Medium', 'humanoid', 'chaotic evil', 15, 'armor', 22, 
            '5d8', '5d8', '30 ft.', 14, 12, 11, 6, 
            10, 7, '', '', '', 
            '', '', '60 ft.', 10, 'Gnoll', 
            0.5, 2, 100, 'Rampage: When the gnoll reduces a creature to 0 hit points with a melee attack on its turn, the gnoll can take a bonus action to move up to half its speed and make a bite attack.', 'Bite: Melee Weapon Attack: +4 to hit, reach 5 ft., one creature. Hit: 4 (1d4 + 2) piercing damage.; Spear: Melee or Ranged Weapon Attack: +4 to hit, reach 5 ft. or range 20/60 ft., one target. Hit: 5 (1d6 + 2) piercing damage, or 6 (1d8 + 2) piercing damage if used with two hands to make a melee attack.; Longbow: Ranged Weapon Attack: +3 to hit, range 150/600 ft., one target. Hit: 5 (1d8 + 1) piercing damage.', '', 'None'),
    

    ('Goat', 'Medium', 'beast', 'unaligned', 10, 'dex', 4, 
            '1d8', '1d8', '40 ft.', 12, 10, 11, 2, 
            10, 5, '', '', '', 
            '', '', 'None', 10, '', 
            0, 2, 10, 'Charge: If the goat moves at least 20 ft. straight toward a target and then hits it with a ram attack on the same turn, the target takes an extra 2 (1d4) bludgeoning damage. If the target is a creature, it must succeed on a DC 10 Strength saving throw or be knocked prone.; Sure-Footed: The goat has advantage on Strength and Dexterity saving throws made against effects that would knock it prone.', 'Ram: Melee Weapon Attack: +3 to hit, reach 5 ft., one target. Hit: 3 (1d4 + 1) bludgeoning damage.', '', 'None'),
    

    ('Goblin', 'Small', 'humanoid', 'neutral evil', 15, 'armor', 7, 
            '2d6', '2d6', '30 ft.', 8, 14, 10, 10, 
            8, 8, 'Skill: Stealth', '', '', 
            '', '', '60 ft.', 9, 'Common, Goblin', 
            0.25, 2, 50, 'Nimble Escape: The goblin can take the Disengage or Hide action as a bonus action on each of its turns.', 'Scimitar: Melee Weapon Attack: +4 to hit, reach 5 ft., one target. Hit: 5 (1d6 + 2) slashing damage.; Shortbow: Ranged Weapon Attack: +4 to hit, range 80/320 ft., one target. Hit: 5 (1d6 + 2) piercing damage.', '', '/api/2014/images/monsters/goblin.png'),
    

    ('Gold Dragon Wyrmling', 'Medium', 'dragon', 'lawful good', 17, 'natural', 60, 
            '8d8', '8d8+24', '30 ft.', 19, 14, 17, 14, 
            11, 16, 'Saving Throw: DEX, Saving Throw: CON, Saving Throw: WIS, Saving Throw: CHA, Skill: Perception, Skill: Stealth', '', '', 
            'fire', '', '60 ft.', 14, 'Draconic', 
            3, 2, 700, 'Amphibious: The dragon can breathe air and water.', 'Bite: Melee Weapon Attack: +6 to hit, reach 5 ft., one target. Hit: 9 (1d10 + 4) piercing damage.; Breath Weapons: The dragon uses one of the following breath weapons.
Fire Breath. The dragon exhales fire in a 15-foot cone. Each creature in that area must make a DC 13 Dexterity saving throw, taking 22 (4d10) fire damage on a failed save, or half as much damage on a successful one.
Weakening Breath. The dragon exhales gas in a 15-foot cone. Each creature in that area must succeed on a DC 13 Strength saving throw or have disadvantage on Strength-based attack rolls, Strength checks, and Strength saving throws for 1 minute. A creature can repeat the saving throw at the end of each of its turns, ending the effect on itself on a success.', '', 'None'),
    

    ('Gorgon', 'Large', 'monstrosity', 'unaligned', 19, 'natural', 114, 
            '12d10', '12d10+48', '40 ft.', 20, 11, 18, 2, 
            12, 7, 'Skill: Perception', '', '', 
            '', 'Petrified', '60 ft.', 14, '', 
            5, 3, 1800, 'Trampling Charge: If the gorgon moves at least 20 feet straight toward a creature and then hits it with a gore attack on the same turn, that target must succeed on a DC 16 Strength saving throw or be knocked prone. If the target is prone, the gorgon can make one attack with its hooves against it as a bonus action.', 'Gore: Melee Weapon Attack: +8 to hit, reach 5 ft., one target. Hit: 18 (2d12 + 5) piercing damage.; Hooves: Melee Weapon Attack: +8 to hit, reach 5 ft., one target. Hit: 16 (2d10 + 5) bludgeoning damage.; Petrifying Breath: The gorgon exhales petrifying gas in a 30-foot cone. Each creature in that area must succeed on a DC 13 Constitution saving throw. On a failed save, a target begins to turn to stone and is restrained. The restrained target must repeat the saving throw at the end of its next turn. On a success, the effect ends on the target. On a failure, the target is petrified until freed by the greater restoration spell or other magic.', '', 'None'),
    

    ('Gray Ooze', 'Medium', 'ooze', 'unaligned', 8, 'dex', 22, 
            '3d8', '3d8+9', '10 ft.', 12, 6, 16, 1, 
            6, 2, 'Skill: Stealth', '', 'acid, cold, fire', 
            '', 'Blinded, Charmed, Deafened, Exhaustion, Frightened, Prone', 'None', 8, '', 
            0.5, 2, 100, 'Amorphous: The ooze can move through a space as narrow as 1 inch wide without squeezing.; Corrode Metal: Any nonmagical weapon made of metal that hits the ooze corrodes. After dealing damage, the weapon takes a permanent and cumulative -1 penalty to damage rolls. If its penalty drops to -5, the weapon is destroyed. Nonmagical ammunition made of metal that hits the ooze is destroyed after dealing damage.
The ooze can eat through 2-inch-thick, nonmagical metal in 1 round.; False Appearance: While the ooze remains motionless, it is indistinguishable from an oily pool or wet rock.', 'Pseudopod: Melee Weapon Attack: +3 to hit, reach 5 ft., one target. Hit: 4 (1d6 + 1) bludgeoning damage plus 7 (2d6) acid damage, and if the target is wearing nonmagical metal armor, its armor is partly corroded and takes a permanent and cumulative -1 penalty to the AC it offers. The armor is destroyed if the penalty reduces its AC to 10.', '', 'None'),
    

    ('Green Dragon Wyrmling', 'Medium', 'dragon', 'lawful evil', 17, 'natural', 38, 
            '7d8', '7d8+7', '30 ft.', 15, 12, 13, 14, 
            11, 13, 'Saving Throw: DEX, Saving Throw: CON, Saving Throw: WIS, Saving Throw: CHA, Skill: Perception, Skill: Stealth', '', '', 
            'poison', 'Poisoned', '60 ft.', 14, 'Draconic', 
            2, 2, 450, 'Amphibious: The dragon can breathe air and water.', 'Bite: Melee Weapon Attack: +4 to hit, reach 5 ft., one target. Hit: 7 (1d10 + 2) piercing damage plus 3 (1d6) poison damage.; Poison Breath: The dragon exhales poisonous gas in a 15-foot cone. Each creature in that area must make a DC 11 Constitution saving throw, taking 21 (6d6) poison damage on a failed save, or half as much damage on a successful one.', '', 'None'),
    

    ('Green Hag', 'Medium', 'fey', 'neutral evil', 17, 'natural', 82, 
            '11d8', '11d8+33', '30 ft.', 18, 12, 16, 13, 
            14, 14, 'Skill: Arcana, Skill: Deception, Skill: Perception, Skill: Stealth', '', '', 
            '', '', '60 ft.', 14, 'Common, Draconic, Sylvan', 
            3, 2, 700, 'Amphibious: The hag can breathe air and water.; Innate Spellcasting: The hag''s innate spellcasting ability is Charisma (spell save DC 12). She can innately cast the following spells, requiring no material components:

At will: dancing lights, minor illusion, vicious mockery; Mimicry: The hag can mimic animal sounds and humanoid voices. A creature that hears the sounds can tell they are imitations with a successful DC 14 Wisdom (Insight) check.', 'Claws: Melee Weapon Attack: +6 to hit, reach 5 ft., one target. Hit: 13 (2d8 + 4) slashing damage.; Illusory Appearance: The hag covers herself and anything she is wearing or carrying with a magical illusion that makes her look like another creature of her general size and humanoid shape. The illusion ends if the hag takes a bonus action to end it or if she dies.
The changes wrought by this effect fail to hold up to physical inspection. For example, the hag could appear to have smooth skin, but someone touching her would feel her rough flesh. Otherwise, a creature must take an action to visually inspect the illusion and succeed on a DC 20 Intelligence (Investigation) check to discern that the hag is disguised.; Invisible Passage: The hag magically turns invisible until she attacks or casts a spell, or until her concentration ends (as if concentrating on a spell). While invisible, she leaves no physical evidence of her passage, so she can be tracked only by magic. Any equipment she wears or carries is invisible with her.', '', 'None'),
    

    ('Grick', 'Medium', 'monstrosity', 'neutral', 14, 'natural', 27, 
            '6d8', '6d8', '30 ft.', 14, 14, 11, 3, 
            14, 5, '', '', 'bludgeoning, piercing, and slashing from nonmagical weapons', 
            '', '', '60 ft.', 12, '', 
            2, 2, 450, 'Stone Camouflage: The grick has advantage on Dexterity (Stealth) checks made to hide in rocky terrain.', 'Multiattack: The grick makes one attack with its tentacles. If that attack hits, the grick can make one beak attack against the same target.; Tentacles: Melee Weapon Attack: +4 to hit, reach 5 ft., one target. Hit: 9 (2d6 + 2) slashing damage.; Beak: Melee Weapon Attack: +4 to hit, reach 5 ft., one target. Hit: 5 (1d6 + 2) piercing damage.', '', 'None'),
    

    ('Griffon', 'Large', 'monstrosity', 'unaligned', 12, 'dex', 59, 
            '7d10', '7d10+21', '30 ft.', 18, 15, 16, 2, 
            13, 8, 'Skill: Perception', '', '', 
            '', '', '60 ft.', 15, '', 
            2, 2, 450, 'Keen Sight: The griffon has advantage on Wisdom (Perception) checks that rely on sight.', 'Multiattack: The griffon makes two attacks: one with its beak and one with its claws.; Beak: Melee Weapon Attack: +6 to hit, reach 5 ft., one target. Hit: 8 (1d8 + 4) piercing damage.; Claws: Melee Weapon Attack: +6 to hit, reach 5 ft., one target. Hit: 11 (2d6 + 4) slashing damage.', '', 'None'),
    

    ('Grimlock', 'Medium', 'humanoid', 'neutral evil', 11, 'dex', 11, 
            '2d8', '2d8+2', '30 ft.', 16, 12, 12, 9, 
            8, 6, 'Skill: Athletics, Skill: Perception, Skill: Stealth', '', '', 
            '', 'Blinded', 'None', 13, 'Undercommon', 
            0.25, 2, 50, 'Blind Senses: The grimlock can''t use its blindsight while deafened and unable to smell.; Keen Hearing and Smell: The grimlock has advantage on Wisdom (Perception) checks that rely on hearing or smell.; Stone Camouflage: The grimlock has advantage on Dexterity (Stealth) checks made to hide in rocky terrain.', 'Spiked Bone Club: Melee Weapon Attack: +5 to hit, reach 5 ft., one target. Hit: 5 (1d4 + 3) bludgeoning damage plus 2 (1d4) piercing damage.', '', 'None'),
    

    ('Guard', 'Medium', 'humanoid', 'any alignment', 16, 'armor', 11, 
            '2d8', '2d8+2', '30 ft.', 13, 12, 12, 10, 
            11, 10, 'Skill: Perception', '', '', 
            '', '', 'None', 12, 'any one language (usually Common)', 
            0.125, 2, 25, '', 'Spear: Melee or Ranged Weapon Attack: +3 to hit, reach 5 ft. or range 20/60 ft., one target. Hit: 4 (1d6 + 1) piercing damage or 5 (1d8 + 1) piercing damage if used with two hands to make a melee attack.', '', 'None'),
    

    ('Guardian Naga', 'Large', 'monstrosity', 'lawful good', 18, 'natural', 127, 
            '15d10', '15d10+45', '40 ft.', 19, 18, 16, 16, 
            19, 18, 'Saving Throw: DEX, Saving Throw: CON, Saving Throw: INT, Saving Throw: WIS, Saving Throw: CHA', '', '', 
            'poison', 'Charmed, Poisoned', '60 ft.', 14, 'Celestial, Common', 
            10, 4, 5900, 'Rejuvenation: If it dies, the naga returns to life in 1d6 days and regains all its hit points. Only a wish spell can prevent this trait from functioning.; Spellcasting: The naga is an 11th-level spellcaster. Its spellcasting ability is Wisdom (spell save DC 16, +8 to hit with spell attacks), and it needs only verbal components to cast its spells. It has the following cleric spells prepared:

- Cantrips (at will): mending, sacred flame, thaumaturgy
- 1st level (4 slots): command, cure wounds, shield of faith
- 2nd level (3 slots): calm emotions, hold person
- 3rd level (3 slots): bestow curse, clairvoyance
- 4th level (3 slots): banishment, freedom of movement
- 5th level (2 slots): flame strike, geas
- 6th level (1 slot): true seeing', 'Bite: Melee Weapon Attack: +8 to hit, reach 10 ft., one creature. Hit: 8 (1d8 + 4) piercing damage, and the target must make a DC 15 Constitution saving throw, taking 45 (10d8) poison damage on a failed save, or half as much damage on a successful one.; Spit Poison: Ranged Weapon Attack: +8 to hit, range 15/30 ft., one creature. Hit: The target must make a DC 15 Constitution saving throw, taking 45 (10d8) poison damage on a failed save, or half as much damage on a successful one.', '', 'None'),
    

    ('Gynosphinx', 'Large', 'monstrosity', 'lawful neutral', 17, 'natural', 136, 
            '16d10', '16d10+48', '40 ft.', 18, 15, 16, 18, 
            18, 18, 'Skill: Arcana, Skill: History, Skill: Perception, Skill: Religion', '', 'bludgeoning, piercing, and slashing from nonmagical weapons', 
            'psychic', 'Charmed, Frightened', 'None', 18, 'Common, Sphinx', 
            11, 4, 7200, 'Inscrutable: The sphinx is immune to any effect that would sense its emotions or read its thoughts, as well as any divination spell that it refuses. Wisdom (Insight) checks made to ascertain the sphinx''s intentions or sincerity have disadvantage.; Magic Weapons: The sphinx''s weapon attacks are magical.; Spellcasting: The sphinx is a 9th-level spellcaster. Its spellcasting ability is Intelligence (spell save DC 16, +8 to hit with spell attacks). It requires no material components to cast its spells. The sphinx has the following wizard spells prepared:

- Cantrips (at will): mage hand, minor illusion, prestidigitation
- 1st level (4 slots): detect magic, identify, shield
- 2nd level (3 slots): darkness, locate object, suggestion
- 3rd level (3 slots): dispel magic, remove curse, tongues
- 4th level (3 slots): banishment, greater invisibility
- 5th level (1 slot): legend lore', 'Multiattack: The sphinx makes two claw attacks.; Claw: Melee Weapon Attack: +9 to hit, reach 5 ft., one target. Hit: 13 (2d8 + 4) slashing damage.', 'Claw Attack: The sphinx makes one claw attack.; Teleport (Costs 2 Actions): The sphinx magically teleports, along with any equipment it is wearing or carrying, up to 120 feet to an unoccupied space it can see.; Cast a Spell (Costs 3 Actions): The sphinx casts a spell from its list of prepared spells, using a spell slot as normal.', 'None'),
    

    ('Half-Red Dragon Veteran', 'Medium', 'humanoid', 'any alignment', 18, 'armor', 65, 
            '10d8', '10d8+20', '30 ft.', 16, 13, 14, 10, 
            11, 10, '', '', 'fire', 
            '', '', '60 ft.', 12, 'Common, Draconic', 
            5, 3, 1800, '', 'Multiattack: The veteran makes two longsword attacks. If it has a shortsword drawn, it can also make a shortsword attack.; Longsword: Melee Weapon Attack: +5 to hit, reach 5 ft., one target. Hit: 7 (1d8 + 3) slashing damage, or 8 (1d10 + 3) slashing damage if used with two hands.; Shortsword: Melee Weapon Attack: +5 to hit, reach 5 ft., one target. Hit: 6 (1d6 + 3) piercing damage.; Heavy Crossbow: Ranged Weapon Attack: +3 to hit, range 100/400 ft., one target. Hit: 6 (1d10 + 1) piercing damage.; Fire Breath: The veteran exhales fire in a 15-foot cone. Each creature in that area must make a DC 15 Dexterity saving throw, taking 24 (7d6) fire damage on a failed save, or half as much damage on a successful one.', '', 'None'),
    

    ('Harpy', 'Medium', 'monstrosity', 'chaotic evil', 11, 'dex', 38, 
            '7d8', '7d8+7', '20 ft.', 12, 13, 12, 7, 
            10, 13, '', '', '', 
            '', '', 'None', 10, 'Common', 
            1, 2, 200, '', 'Multiattack: The harpy makes two attacks: one with its claws and one with its club.; Claws: Melee Weapon Attack: +3 to hit, reach 5 ft., one target. Hit: 6 (2d4 + 1) slashing damage.; Club: Melee Weapon Attack: +3 to hit, reach 5 ft., one target. Hit: 3 (1d4 + 1) bludgeoning damage.; Luring Song: The harpy sings a magical melody. Every humanoid and giant within 300 ft. of the harpy that can hear the song must succeed on a DC 11 Wisdom saving throw or be charmed until the song ends. The harpy must take a bonus action on its subsequent turns to continue singing. It can stop singing at any time. The song ends if the harpy is incapacitated.
While charmed by the harpy, a target is incapacitated and ignores the songs of other harpies. If the charmed target is more than 5 ft. away from the harpy, the must move on its turn toward the harpy by the most direct route. It doesn''t avoid opportunity attacks, but before moving into damaging terrain, such as lava or a pit, and whenever it takes damage from a source other than the harpy, a target can repeat the saving throw. A creature can also repeat the saving throw at the end of each of its turns. If a creature''s saving throw is successful, the effect ends on it.
A target that successfully saves is immune to this harpy''s song for the next 24 hours.', '', 'None'),
    

    ('Hawk', 'Tiny', 'beast', 'unaligned', 13, 'dex', 1, 
            '1d4', '1d4-1', '10 ft.', 5, 16, 8, 2, 
            14, 6, 'Skill: Perception', '', '', 
            '', '', 'None', 14, '', 
            0, 2, 10, 'Keen Sight: The hawk has advantage on Wisdom (Perception) checks that rely on sight.', 'Talons: Melee Weapon Attack: +5 to hit, reach 5 ft., one target. Hit: 1 slashing damage.', '', 'None'),
    

    ('Hell Hound', 'Medium', 'fiend', 'lawful evil', 15, 'natural', 45, 
            '7d8', '7d8+14', '50 ft.', 17, 12, 14, 6, 
            13, 6, 'Skill: Perception', '', '', 
            'fire', '', '60 ft.', 15, 'understands Infernal but can''t speak it', 
            3, 2, 700, 'Keen Hearing and Smell: The hound has advantage on Wisdom (Perception) checks that rely on hearing or smell.; Pack Tactics: The hound has advantage on an attack roll against a creature if at least one of the hound''s allies is within 5 ft. of the creature and the ally isn''t incapacitated.', 'Bite: Melee Weapon Attack: +5 to hit, reach 5 ft., one target. Hit: 7 (1d8 + 3) piercing damage plus 7 (2d6) fire damage.; Fire Breath: The hound exhales fire in a 15-foot cone. Each creature in that area must make a DC 12 Dexterity saving throw, taking 21 (6d6) fire damage on a failed save, or half as much damage on a successful one.', '', 'None'),
    

    ('Hezrou', 'Large', 'fiend', 'chaotic evil', 16, 'natural', 136, 
            '13d10', '13d10+65', '30 ft.', 19, 17, 20, 5, 
            12, 13, 'Saving Throw: STR, Saving Throw: CON, Saving Throw: WIS', '', 'cold, fire, lightning, bludgeoning, piercing, and slashing from nonmagical weapons', 
            'poison', 'Poisoned', '120 ft.', 11, 'Abyssal, telepathy 120 ft.', 
            8, 3, 3900, 'Magic Resistance: The hezrou has advantage on saving throws against spells and other magical effects.; Stench: Any creature that starts its turn within 10 feet of the hezrou must succeed on a DC 14 Constitution saving throw or be poisoned until the start of its next turn. On a successful saving throw, the creature is immune to the hezrou''s stench for 24 hours.', 'Multiattack: The hezrou makes three attacks: one with its bite and two with its claws.; Bite: Melee Weapon Attack: +7 to hit, reach 5 ft., one target. Hit: 15 (2d10 + 4) piercing damage.; Claws: Melee Weapon Attack: +7 to hit, reach 5 ft., one target. Hit: 11 (2d6 + 4) slashing damage.', '', 'None'),
    

    ('Hill Giant', 'Huge', 'giant', 'chaotic evil', 13, 'natural', 105, 
            '10d12', '10d12+40', '40 ft.', 21, 8, 19, 5, 
            9, 6, 'Skill: Perception', '', '', 
            '', '', 'None', 12, 'Giant', 
            5, 3, 1800, '', 'Multiattack: The giant makes two greatclub attacks.; Greatclub: Melee Weapon Attack: +8 to hit, reach 10 ft., one target. Hit: 18 (3d8 + 5) bludgeoning damage.; Rock: Ranged Weapon Attack: +8 to hit, range 60/240 ft., one target. Hit: 21 (3d10 + 5) bludgeoning damage.', '', 'None'),
    

    ('Hippogriff', 'Large', 'monstrosity', 'unaligned', 11, 'dex', 19, 
            '3d10', '3d10+3', '40 ft.', 17, 13, 13, 2, 
            12, 8, 'Skill: Perception', '', '', 
            '', '', 'None', 15, '', 
            1, 2, 200, 'Keen Sight: The hippogriff has advantage on Wisdom (Perception) checks that rely on sight.', 'Multiattack: The hippogriff makes two attacks: one with its beak and one with its claws.; Beak: Melee Weapon Attack: +5 to hit, reach 5 ft., one target. Hit: 8 (1d10 + 3) piercing damage.; Claws: Melee Weapon Attack: +5 to hit, reach 5 ft., one target. Hit: 10 (2d6 + 3) slashing damage.', '', 'None'),
    

    ('Hobgoblin', 'Medium', 'humanoid', 'lawful evil', 18, 'armor', 11, 
            '2d8', '2d8+2', '30 ft.', 13, 12, 12, 10, 
            10, 9, '', '', '', 
            '', '', '60 ft.', 10, 'Common, Goblin', 
            0.5, 2, 100, 'Martial Advantage: Once per turn, the hobgoblin can deal an extra 7 (2d6) damage to a creature it hits with a weapon attack if that creature is within 5 ft. of an ally of the hobgoblin that isn''t incapacitated.', 'Longsword: Melee Weapon Attack: +3 to hit, reach 5 ft., one target. Hit: 5 (1d8 + 1) slashing damage, or 6 (1d10 + 1) slashing damage if used with two hands.; Longbow: Ranged Weapon Attack: +3 to hit, range 150/600 ft., one target. Hit: 5 (1d8 + 1) piercing damage.', '', 'None'),
    

    ('Homunculus', 'Tiny', 'construct', 'neutral', 13, 'natural', 5, 
            '2d4', '2d4', '20 ft.', 4, 15, 11, 10, 
            10, 7, '', '', '', 
            'poison', 'Charmed, Poisoned', '60 ft.', 10, 'understands the languages of its creator but can''t speak', 
            0, 2, 10, 'Telepathic Bond: While the homunculus is on the same plane of existence as its master, it can magically convey what it senses to its master, and the two can communicate telepathically.', 'Bite: Melee Weapon Attack: +4 to hit, reach 5 ft., one creature. Hit: 1 piercing damage, and the target must succeed on a DC 10 Constitution saving throw or be poisoned for 1 minute. If the saving throw fails by 5 or more, the target is instead poisoned for 5 (1d10) minutes and unconscious while poisoned in this way.', '', 'None'),
    

    ('Horned Devil', 'Large', 'fiend', 'lawful evil', 18, 'natural', 178, 
            '17d10', '17d10+85', '20 ft.', 22, 17, 21, 12, 
            16, 17, 'Saving Throw: STR, Saving Throw: DEX, Saving Throw: WIS, Saving Throw: CHA', '', 'cold, bludgeoning, piercing, and slashing from nonmagical weapons that aren''t silvered', 
            'fire, poison', 'Poisoned', '120 ft.', 13, 'Infernal, telepathy 120 ft.', 
            11, 4, 7200, 'Devil''s Sight: Magical darkness doesn''t impede the devil''s darkvision.; Magic Resistance: The devil has advantage on saving throws against spells and other magical effects.', 'Multiattack: The devil makes three melee attacks: two with its fork and one with its tail. It can use Hurl Flame in place of any melee attack.; Fork: Melee Weapon Attack: +10 to hit, reach 10 ft., one target. Hit: 15 (2d8 + 6) piercing damage.; Tail: Melee Weapon Attack: +10 to hit, reach 10 ft., one target. Hit: 10 (1d8 + 6) piercing damage. If the target is a creature other than an undead or a construct, it must succeed on a DC 17 Constitution saving throw or lose 10 (3d6) hit points at the start of each of its turns due to an infernal wound. Each time the devil hits the wounded target with this attack, the damage dealt by the wound increases by 10 (3d6). Any creature can take an action to stanch the wound with a successful DC 12 Wisdom (Medicine) check. The wound also closes if the target receives magical healing.; Hurl Flame: Ranged Spell Attack: +7 to hit, range 150 ft., one target. Hit: 14 (4d6) fire damage. If the target is a flammable object that isn''t being worn or carried, it also catches fire.', '', 'None'),
    

    ('Hunter Shark', 'Large', 'beast', 'unaligned', 12, 'dex', 45, 
            '6d10', '6d10+12', '0 ft.', 18, 13, 15, 1, 
            10, 4, 'Skill: Perception', '', '', 
            '', '', '30 ft.', 12, '', 
            2, 2, 450, 'Blood Frenzy: The shark has advantage on melee attack rolls against any creature that doesn''t have all its hit points.; Water Breathing: The shark can breathe only underwater.', 'Bite: Melee Weapon Attack: +6 to hit, reach 5 ft., one target. Hit: 13 (2d8 + 4) piercing damage.', '', 'None'),
    

    ('Hydra', 'Huge', 'monstrosity', 'unaligned', 15, 'natural', 172, 
            '15d12', '15d12+75', '30 ft.', 20, 12, 20, 2, 
            10, 7, 'Skill: Perception', '', '', 
            '', '', '60 ft.', 16, '', 
            8, 3, 3900, 'Hold Breath: The hydra can hold its breath for 1 hour.; Multiple Heads: The hydra has five heads. While it has more than one head, the hydra has advantage on saving throws against being blinded, charmed, deafened, frightened, stunned, and knocked unconscious.
Whenever the hydra takes 25 or more damage in a single turn, one of its heads dies. If all its heads die, the hydra dies.
At the end of its turn, it grows two heads for each of its heads that died since its last turn, unless it has taken fire damage since its last turn. The hydra regains 10 hit points for each head regrown in this way.; Reactive Heads: For each head the hydra has beyond one, it gets an extra reaction that can be used only for opportunity attacks.; Wakeful: While the hydra sleeps, at least one of its heads is awake.', 'Multiattack: The hydra makes as many bite attacks as it has heads.; Bite: Melee Weapon Attack: +8 to hit, reach 10 ft., one target. Hit: 10 (1d10 + 5) piercing damage.', '', 'None'),
    

    ('Hyena', 'Medium', 'beast', 'unaligned', 11, 'dex', 5, 
            '1d8', '1d8+1', '50 ft.', 11, 13, 12, 2, 
            12, 5, 'Skill: Perception', '', '', 
            '', '', 'None', 13, '', 
            0, 2, 10, 'Pack Tactics: The hyena has advantage on an attack roll against a creature if at least one of the hyena''s allies is within 5 ft. of the creature and the ally isn''t incapacitated.', 'Bite: Melee Weapon Attack: +2 to hit, reach 5 ft., one target. Hit: 3 (1d6) piercing damage.', '', 'None'),
    

    ('Ice Devil', 'Large', 'fiend', 'lawful evil', 18, 'natural', 180, 
            '19d10', '19d10+76', '40 ft.', 21, 14, 18, 18, 
            15, 18, 'Saving Throw: DEX, Saving Throw: CON, Saving Throw: WIS, Saving Throw: CHA', '', 'bludgeoning, piercing, and slashing from nonmagical weapons that aren''t silvered', 
            'fire, poison', 'Poisoned', '120 ft.', 12, 'Infernal, telepathy 120 ft.', 
            14, 5, 11500, 'Devil''s Sight: Magical darkness doesn''t impede the devil''s darkvision.; Magic Resistance: The devil has advantage on saving throws against spells and other magical effects.', 'Multiattack: The devil makes three attacks: one with its bite, one with its claws, and one with its tail.; Bite: Melee Weapon Attack: +10 to hit, reach 5 ft., one target. Hit: 12 (2d6 + 5) piercing damage plus 10 (3d6) cold damage.; Claws: Melee Weapon Attack: +10 to hit, reach 5 ft., one target. Hit: 10 (2d4 + 5) slashing damage plus 10 (3d6) cold damage.; Tail: Melee Weapon Attack: +10 to hit, reach 10 ft., one target. Hit: 12 (2d6 + 5) bludgeoning damage plus 10 (3d6) cold damage.; Wall of Ice: The devil magically forms an opaque wall of ice on a solid surface it can see within 60 feet of it. The wall is 1 foot thick and up to 30 feet long and 10 feet high, or it''s a hemispherical dome up to 20 feet in diameter.
When the wall appears, each creature in its space is pushed out of it by the shortest route. The creature chooses which side of the wall to end up on, unless the creature is incapacitated. The creature then makes a DC 17 Dexterity saving throw, taking 35 (10d6) cold damage on a failed save, or half as much damage on a successful one.
The wall lasts for 1 minute or until the devil is incapacitated or dies. The wall can be damaged and breached; each 10-foot section has AC 5, 30 hit points, vulnerability to fire damage, and immunity to acid, cold, necrotic, poison, and psychic damage. If a section is destroyed, it leaves behind a sheet of frigid air in the space the wall occupied. Whenever a creature finishes moving through the frigid air on a turn, willingly or otherwise, the creature must make a DC 17 Constitution saving throw, taking 17 (5d6) cold damage on a failed save, or half as much damage on a successful one. The frigid air dissipates when the rest of the wall vanishes.', '', 'None'),
    

    ('Ice Mephit', 'Small', 'elemental', 'neutral evil', 11, 'dex', 21, 
            '6d6', '6d6', '30 ft.', 7, 13, 10, 9, 
            11, 12, 'Skill: Perception, Skill: Stealth', 'bludgeoning, fire', '', 
            'cold, poison', 'Poisoned', '60 ft.', 12, 'Aquan, Auran', 
            0.5, 2, 100, 'Death Burst: When the mephit dies, it explodes in a burst of jagged ice. Each creature within 5 ft. of it must make a DC 10 Dexterity saving throw, taking 4 (1d8) slashing damage on a failed save, or half as much damage on a successful one.; False Appearance: While the mephit remains motionless, it is indistinguishable from an ordinary shard of ice.; Innate Spellcasting: The mephit can innately cast fog cloud, requiring no material components. Its innate spellcasting ability is Charisma.', 'Claws: Melee Weapon Attack: +3 to hit, reach 5 ft., one creature. Hit: 3 (1d4 + 1) slashing damage plus 2 (1d4) cold damage.; Frost Breath: The mephit exhales a 15-foot cone of cold air. Each creature in that area must succeed on a DC 10 Dexterity saving throw, taking 5 (2d4) cold damage on a failed save, or half as much damage on a successful one.', '', 'None'),
    

    ('Imp', 'Tiny', 'fiend', 'lawful evil', 13, 'dex', 10, 
            '3d4', '3d4+3', '20 ft.', 6, 17, 13, 11, 
            12, 14, 'Skill: Deception, Skill: Insight, Skill: Persuasion, Skill: Stealth', '', 'cold, bludgeoning, piercing, and slashing from nonmagical weapons that aren''t silvered', 
            'fire, poison', 'Poisoned', '120 ft.', 11, 'Infernal, Common', 
            1, 2, 200, 'Shapechanger: The imp can use its action to polymorph into a beast form that resembles a rat (speed 20 ft.), a raven (20 ft., fly 60 ft.), or a spider (20 ft., climb 20 ft.), or back into its true form. Its statistics are the same in each form, except for the speed changes noted. Any equipment it is wearing or carrying isn''t transformed. It reverts to its true form if it dies.; Devil''s Sight: Magical darkness doesn''t impede the imp''s darkvision.; Magic Resistance: The imp has advantage on saving throws against spells and other magical effects.', 'Sting (Bite in Beast Form): Melee Weapon Attack: +5 to hit, reach 5 ft., one target. Hit: 5 (1d4 + 3) piercing damage, and the target must make on a DC 11 Constitution saving throw, taking 10 (3d6) poison damage on a failed save, or half as much damage on a successful one.; Invisibility: The imp magically turns invisible until it attacks, or until its concentration ends (as if concentrating on a spell). Any equipment the imp wears or carries is invisible with it.', '', 'None'),
    

    ('Invisible Stalker', 'Medium', 'elemental', 'neutral', 14, 'dex', 104, 
            '16d8', '16d8+32', '50 ft.', 16, 19, 14, 10, 
            15, 11, 'Skill: Perception, Skill: Stealth', '', 'bludgeoning, piercing, and slashing from nonmagical weapons', 
            'poison', 'Exhaustion, Grappled, Paralyzed, Petrified, Poisoned, Prone, Restrained, Unconscious', '60 ft.', 18, 'Auran, understands Common but doesn''t speak it', 
            6, 3, 2300, 'Invisibility: The stalker is invisible.; Faultless Tracker: The stalker is given a quarry by its summoner. The stalker knows the direction and distance to its quarry as long as the two of them are on the same plane of existence. The stalker also knows the location of its summoner.', 'Multiattack: The stalker makes two slam attacks.; Slam: Melee Weapon Attack: +6 to hit, reach 5 ft., one target. Hit: 10 (2d6 + 3) bludgeoning damage.', '', 'None'),
    

    ('Iron Golem', 'Large', 'construct', 'unaligned', 20, 'natural', 210, 
            '20d10', '20d10+100', '30 ft.', 24, 9, 20, 3, 
            11, 1, '', '', '', 
            'fire, poison, psychic, bludgeoning, piercing, and slashing from nonmagical weapons that aren''t adamantine', 'Charmed, Exhaustion, Frightened, Paralyzed, Petrified, Poisoned', '120 ft.', 10, 'understands the languages of its creator but can''t speak', 
            16, 5, 15000, 'Fire Absorption: Whenever the golem is subjected to fire damage, it takes no damage and instead regains a number of hit points equal to the fire damage dealt.; Immutable Form: The golem is immune to any spell or effect that would alter its form.; Magic Resistance: The golem has advantage on saving throws against spells and other magical effects.; Magic Weapons: The golem''s weapon attacks are magical.', 'Multiattack: The golem makes two melee attacks.; Slam: Melee Weapon Attack: +13 to hit, reach 5 ft., one target. Hit: 20 (3d8 + 7) bludgeoning damage.; Sword: Melee Weapon Attack: +13 to hit, reach 10 ft., one target. Hit: 23 (3d10 + 7) slashing damage.; Poison Breath: The golem exhales poisonous gas in a 15-foot cone. Each creature in that area must make a DC 19 Constitution saving throw, taking 45 (10d8) poison damage on a failed save, or half as much damage on a successful one.', '', 'None'),
    

    ('Jackal', 'Small', 'beast', 'unaligned', 12, 'dex', 3, 
            '1d6', '1d6', '40 ft.', 8, 15, 11, 3, 
            12, 6, 'Skill: Perception', '', '', 
            '', '', 'None', 13, '', 
            0, 2, 10, 'Keen Hearing and Smell: The jackal has advantage on Wisdom (Perception) checks that rely on hearing or smell.; Pack Tactics: The jackal has advantage on an attack roll against a creature if at least one of the jackal''s allies is within 5 ft. of the creature and the ally isn''t incapacitated.', 'Bite: Melee Weapon Attack: +1 to hit, reach 5 ft., one target. Hit: 1 (1d4 - 1) piercing damage.', '', 'None'),
    

    ('Killer Whale', 'Huge', 'beast', 'unaligned', 12, 'natural', 90, 
            '12d12', '12d12+12', '0 ft.', 19, 10, 13, 3, 
            12, 7, 'Skill: Perception', '', '', 
            '', '', 'None', 13, '', 
            3, 2, 700, 'Echolocation: The whale can''t use its blindsight while deafened.; Hold Breath: The whale can hold its breath for 30 minutes; Keen Hearing: The whale has advantage on Wisdom (Perception) checks that rely on hearing.', 'Bite: Melee Weapon Attack: +6 to hit, reach 5 ft., one target. Hit: 21 (5d6 + 4) piercing damage.', '', 'None'),
    

    ('Knight', 'Medium', 'humanoid', 'any alignment', 18, 'armor', 52, 
            '8d8', '8d8+16', '30 ft.', 16, 11, 14, 11, 
            11, 15, 'Saving Throw: CON, Saving Throw: WIS', '', '', 
            '', '', 'None', 10, 'any one language (usually Common)', 
            3, 2, 700, 'Brave: The knight has advantage on saving throws against being frightened.', 'Multiattack: The knight makes two melee attacks.; Greatsword: Melee Weapon Attack: +5 to hit, reach 5 ft., one target. Hit: 10 (2d6 + 3) slashing damage.; Heavy Crossbow: Ranged Weapon Attack: +2 to hit, range 100/400 ft., one target. Hit: 5 (1d10) piercing damage.; Leadership: For 1 minute, the knight can utter a special command or warning whenever a nonhostile creature that it can see within 30 ft. of it makes an attack roll or a saving throw. The creature can add a d4 to its roll provided it can hear and understand the knight. A creature can benefit from only one Leadership die at a time. This effect ends if the knight is incapacitated.', '', 'None'),
    

    ('Kobold', 'Small', 'humanoid', 'lawful evil', 12, 'dex', 5, 
            '2d6', '2d6-2', '30 ft.', 7, 15, 9, 8, 
            7, 8, '', '', '', 
            '', '', '60 ft.', 8, 'Common, Draconic', 
            0.125, 2, 25, 'Sunlight Sensitivity: While in sunlight, the kobold has disadvantage on attack rolls, as well as on Wisdom (Perception) checks that rely on sight.; Pack Tactics: The kobold has advantage on an attack roll against a creature if at least one of the kobold''s allies is within 5 ft. of the creature and the ally isn''t incapacitated.', 'Dagger: Melee Weapon Attack: +4 to hit, reach 5 ft., one target. Hit: 4 (1d4 + 2) piercing damage.; Sling: Ranged Weapon Attack: +4 to hit, range 30/120 ft., one target. Hit: 4 (1d4 + 2) bludgeoning damage.', '', 'None'),
    

    ('Kraken', 'Gargantuan', 'monstrosity', 'chaotic evil', 18, 'natural', 472, 
            '27d20', '27d20+189', '20 ft.', 30, 11, 25, 22, 
            18, 20, 'Saving Throw: STR, Saving Throw: DEX, Saving Throw: CON, Saving Throw: INT, Saving Throw: WIS', '', '', 
            'lightning, bludgeoning, piercing, and slashing from nonmagical weapons', 'Frightened, Paralyzed', 'None', 14, 'understands Abyssal, Celestial, Infernal, and Primordial but can''t speak, telepathy 120 ft.', 
            23, 7, 50000, 'Amphibious: The kraken can breathe air and water.; Freedom of Movement: The kraken ignores difficult terrain, and magical effects can''t reduce its speed or cause it to be restrained. It can spend 5 feet of movement to escape from nonmagical restraints or being grappled.; Siege Monster: The kraken deals double damage to objects and structures.', 'Multiattack: The kraken makes three tentacle attacks, each of which it can replace with one use of Fling.; Bite: Melee Weapon Attack: +7 to hit, reach 5 ft., one target. Hit: 23 (3d8 + 10) piercing damage. If the target is a Large or smaller creature grappled by the kraken, that creature is swallowed, and the grapple ends. While swallowed, the creature is blinded and restrained, it has total cover against attacks and other effects outside the kraken, and it takes 42 (12d6) acid damage at the start of each of the kraken''s turns. If the kraken takes 50 damage or more on a single turn from a creature inside it, the kraken must succeed on a DC 25 Constitution saving throw at the end of that turn or regurgitate all swallowed creatures, which fall prone in a space within 10 feet of the kraken. If the kraken dies, a swallowed creature is no longer restrained by it and can escape from the corpse using 15 feet of movement, exiting prone.; Tentacle: Melee Weapon Attack: +7 to hit, reach 30 ft., one target. Hit: 20 (3d6 + 10) bludgeoning damage, and the target is grappled (escape DC 18). Until this grapple ends, the target is restrained. The kraken has ten tentacles, each of which can grapple one target.; Fling: One Large or smaller object held or creature grappled by the kraken is thrown up to 60 feet in a random direction and knocked prone. If a thrown target strikes a solid surface, the target takes 3 (1d6) bludgeoning damage for every 10 feet it was thrown. If the target is thrown at another creature, that creature must succeed on a DC 18 Dexterity saving throw or take the same damage and be knocked prone.; Lightning Storm: The kraken magically creates three bolts of lightning, each of which can strike a target the kraken can see within 120 feet of it. A target must make a DC 23 Dexterity saving throw, taking 22 (4d10) lightning damage on a failed save, or half as much damage on a successful one.', 'Tentacle Attack or Fling: The kraken makes one tentacle attack or uses its Fling.; Lightning Storm (Costs 2 Actions): The kraken uses Lightning Storm.; Ink Cloud (Costs 3 Actions): While underwater, the kraken expels an ink cloud in a 60-foot radius. The cloud spreads around corners, and that area is heavily obscured to creatures other than the kraken. Each creature other than the kraken that ends its turn there must succeed on a DC 23 Constitution saving throw, taking 16 (3d10) poison damage on a failed save, or half as much damage on a successful one. A strong current disperses the cloud, which otherwise disappears at the end of the kraken''s next turn.', 'None'),
    

    ('Lamia', 'Large', 'monstrosity', 'chaotic evil', 13, 'natural', 97, 
            '13d10', '13d10+26', '30 ft.', 16, 13, 15, 14, 
            15, 16, 'Skill: Deception, Skill: Insight, Skill: Stealth', '', '', 
            '', '', '60 ft.', 12, 'Abyssal, Common', 
            4, 2, 1100, 'Innate Spellcasting: The lamia''s innate spellcasting ability is Charisma (spell save DC 13). It can innately cast the following spells, requiring no material components. At will: disguise self (any humanoid form), major image 3/day each: charm person, mirror image, scrying, suggestion 1/day: geas', 'Multiattack: The lamia makes two attacks: one with its claws and one with its dagger or Intoxicating Touch.; Claws: Melee Weapon Attack: +5 to hit, reach 5 ft., one target. Hit: 14 (2d10 + 3) slashing damage.; Dagger: Melee Weapon Attack: +5 to hit, reach 5 ft., one target. Hit: 5 (1d4 + 3) piercing damage.; Intoxicating Touch: Melee Spell Attack: +5 to hit, reach 5 ft., one creature. Hit: The target is magically cursed for 1 hour. Until the curse ends, the target has disadvantage on Wisdom saving throws and all ability checks.', '', 'None'),
    

    ('Lemure', 'Medium', 'fiend', 'lawful evil', 7, 'dex', 13, 
            '3d8', '3d8', '15 ft.', 10, 5, 11, 1, 
            11, 3, '', '', 'cold', 
            'fire, poison', 'Charmed, Frightened, Poisoned', '120 ft.', 10, 'understands infernal but can''t speak', 
            0, 2, 10, 'Devil''s Sight: Magical darkness doesn''t impede the lemure''s darkvision.; Hellish Rejuvenation: A lemure that dies in the Nine Hells comes back to life with all its hit points in 1d10 days unless it is killed by a good-aligned creature with a bless spell cast on that creature or its remains are sprinkled with holy water.', 'Fist: Melee Weapon Attack: +3 to hit, reach 5 ft., one target. Hit: 2 (1d4) bludgeoning damage.', '', 'None'),
    

    ('Lich', 'Medium', 'undead', 'any evil alignment', 17, 'natural', 135, 
            '18d8', '18d8+54', '30 ft.', 11, 16, 16, 20, 
            14, 16, 'Saving Throw: CON, Saving Throw: INT, Saving Throw: WIS, Skill: Arcana, Skill: History, Skill: Insight, Skill: Perception', '', 'cold, lightning, necrotic', 
            'poison, bludgeoning, piercing, and slashing from nonmagical weapons', 'Charmed, Exhaustion, Frightened, Paralyzed, Poisoned', 'None', 19, 'Common plus up to five other languages', 
            21, 7, 33000, 'Legendary Resistance: If the lich fails a saving throw, it can choose to succeed instead.; Rejuvenation: If it has a phylactery, a destroyed lich gains a new body in 1d10 days, regaining all its hit points and becoming active again. The new body appears within 5 feet of the phylactery.; Spellcasting: The lich is an 18th-level spellcaster. Its spellcasting ability is Intelligence (spell save DC 20, +12 to hit with spell attacks). The lich has the following wizard spells prepared:

- Cantrips (at will): mage hand, prestidigitation, ray of frost
- 1st level (4 slots): detect magic, magic missile, shield, thunderwave
- 2nd level (3 slots): acid arrow, detect thoughts, invisibility, mirror image
- 3rd level (3 slots): animate dead, counterspell, dispel magic, fireball
- 4th level (3 slots): blight, dimension door
- 5th level (3 slots): cloudkill, scrying
- 6th level (1 slot): disintegrate, globe of invulnerability
- 7th level (1 slot): finger of death, plane shift
- 8th level (1 slot): dominate monster, power word stun
- 9th level (1 slot): power word kill; Turn Resistance: The lich has advantage on saving throws against any effect that turns undead.', 'Paralyzing Touch: Melee Spell Attack: +12 to hit, reach 5 ft., one creature. Hit: 10 (3d6) cold damage. The target must succeed on a DC 18 Constitution saving throw or be paralyzed for 1 minute. The target can repeat the saving throw at the end of each of its turns, ending the effect on itself on a success.', 'Cantrip: The lich casts a cantrip.; Paralyzing Touch (Costs 2 Actions): The lich uses its Paralyzing Touch.; Frightening Gaze (Costs 2 Actions): The lich fixes its gaze on one creature it can see within 10 feet of it. The target must succeed on a DC 18 Wisdom saving throw against this magic or become frightened for 1 minute. The frightened target can repeat the saving throw at the end of each of its turns, ending the effect on itself on a success. If a target''s saving throw is successful or the effect ends for it, the target is immune to the lich''s gaze for the next 24 hours.; Disrupt Life (Costs 3 Actions): Each living creature within 20 feet of the lich must make a DC 18 Constitution saving throw against this magic, taking 21 (6d6) necrotic damage on a failed save, or half as much damage on a successful one.', 'None'),
    

    ('Lion', 'Large', 'beast', 'unaligned', 12, 'dex', 26, 
            '4d10', '4d10+4', '50 ft.', 17, 15, 13, 3, 
            12, 8, 'Skill: Perception, Skill: Stealth', '', '', 
            '', '', 'None', 13, '', 
            1, 2, 200, 'Keen Smell: The lion has advantage on Wisdom (Perception) checks that rely on smell.; Pack Tactics: The lion has advantage on an attack roll against a creature if at least one of the lion''s allies is within 5 ft. of the creature and the ally isn''t incapacitated.; Pounce: If the lion moves at least 20 ft. straight toward a creature and then hits it with a claw attack on the same turn, that target must succeed on a DC 13 Strength saving throw or be knocked prone. If the target is prone, the lion can make one bite attack against it as a bonus action.; Running Leap: With a 10-foot running start, the lion can long jump up to 25 ft..', 'Bite: Melee Weapon Attack: +5 to hit, reach 5 ft., one target. Hit: 7 (1d8 + 3) piercing damage.; Claw: Melee Weapon Attack: +5 to hit, reach 5 ft., one target. Hit: 6 (1d6 + 3) slashing damage.', '', 'None'),
    

    ('Lizard', 'Tiny', 'beast', 'unaligned', 10, 'dex', 2, 
            '1d4', '1d4', '20 ft.', 2, 11, 10, 1, 
            8, 3, '', '', '', 
            '', '', '30 ft.', 9, '', 
            0, 2, 10, '', 'Bite: Melee Weapon Attack: +0 to hit, reach 5 ft., one target. Hit: 1 piercing damage.', '', 'None'),
    

    ('Lizardfolk', 'Medium', 'humanoid', 'neutral', 13, 'natural', 22, 
            '4d8', '4d8+4', '30 ft.', 15, 10, 13, 7, 
            12, 7, 'Skill: Perception, Skill: Stealth, Skill: Survival', '', '', 
            '', '', 'None', 13, 'Draconic', 
            0.5, 2, 100, 'Hold Breath: The lizardfolk can hold its breath for 15 minutes.', 'Multiattack: The lizardfolk makes two melee attacks, each one with a different weapon.; Bite: Melee Weapon Attack: +4 to hit, reach 5 ft., one target. Hit: 5 (1d6 + 2) piercing damage.; Heavy Club: Melee Weapon Attack: +4 to hit, reach 5 ft., one target. Hit: 5 (1d6 + 2) bludgeoning damage.; Javelin: Melee or Ranged Weapon Attack: +4 to hit, reach 5 ft. or range 30/120 ft., one target. Hit: 5 (1d6 + 2) piercing damage.; Spiked Shield: Melee Weapon Attack: +4 to hit, reach 5 ft., one target. Hit: 5 (1d6 + 2) piercing damage.', '', 'None'),
    

    ('Mage', 'Medium', 'humanoid', 'any alignment', 12, 'dex', 40, 
            '9d8', '9d8', '30 ft.', 9, 14, 11, 17, 
            12, 11, 'Saving Throw: INT, Saving Throw: WIS, Skill: Arcana, Skill: History', '', '', 
            '', '', 'None', 11, 'any four languages', 
            6, 3, 2300, 'Spellcasting: The mage is a 9th-level spellcaster. Its spellcasting ability is Intelligence (spell save DC 14, +6 to hit with spell attacks). The mage has the following wizard spells prepared:

- Cantrips (at will): fire bolt, light, mage hand, prestidigitation
- 1st level (4 slots): detect magic, mage armor, magic missile, shield
- 2nd level (3 slots): misty step, suggestion
- 3rd level (3 slots): counterspell, fireball, fly
- 4th level (3 slots): greater invisibility, ice storm
- 5th level (1 slot): cone of cold', 'Dagger: Melee or Ranged Weapon Attack: +5 to hit, reach 5 ft. or range 20/60 ft., one target. Hit: 4 (1d4 + 2) piercing damage.', '', 'None'),
    

    ('Magma Mephit', 'Small', 'elemental', 'neutral evil', 11, 'dex', 22, 
            '5d6', '5d6+5', '30 ft.', 8, 12, 12, 7, 
            10, 10, 'Skill: Stealth', 'cold', '', 
            'fire, poison', 'Poisoned', '60 ft.', 10, 'Ignan, Terran', 
            0.5, 2, 100, 'Death Burst: When the mephit dies, it explodes in a burst of lava. Each creature within 5 ft. of it must make a DC 11 Dexterity saving throw, taking 7 (2d6) fire damage on a failed save, or half as much damage on a successful one.; False Appearance: While the mephit remains motionless, it is indistinguishable from an ordinary mound of magma.; Innate Spellcasting: The mephit can innately cast heat metal (spell save DC 10), requiring no material components. Its innate spellcasting ability is Charisma.', 'Claws: Melee Weapon Attack: +3 to hit, reach 5 ft., one creature. Hit: 3 (1d4 + 1) slashing damage plus 2 (1d4) fire damage.; Fire Breath: The mephit exhales a 15-foot cone of fire. Each creature in that area must make a DC 11 Dexterity saving throw, taking 7 (2d6) fire damage on a failed save, or half as much damage on a successful one.', '', 'None'),
    

    ('Magmin', 'Small', 'elemental', 'chaotic neutral', 14, 'natural', 9, 
            '2d6', '2d6+2', '30 ft.', 7, 15, 12, 8, 
            11, 10, '', '', 'bludgeoning, piercing, and slashing from nonmagical weapons', 
            'fire', '', '60 ft.', 10, 'Ignan', 
            0.5, 2, 100, 'Death Burst: When the magmin dies, it explodes in a burst of fire and magma. Each creature within 10 ft. of it must make a DC 11 Dexterity saving throw, taking 7 (2d6) fire damage on a failed save, or half as much damage on a successful one. Flammable objects that aren''t being worn or carried in that area are ignited.; Ignited Illumination: As a bonus action, the magmin can set itself ablaze or extinguish its flames. While ablaze, the magmin sheds bright light in a 10-foot radius and dim light for an additional 10 ft.', 'Touch: Melee Weapon Attack: +4 to hit, reach 5 ft., one target. Hit: 7 (2d6) fire damage. If the target is a creature or a flammable object, it ignites. Until a target takes an action to douse the fire, the target takes 3 (1d6) fire damage at the end of each of its turns.', '', 'None'),
    

    ('Mammoth', 'Huge', 'beast', 'unaligned', 13, 'natural', 126, 
            '11d12', '11d12+55', '40 ft.', 24, 9, 21, 3, 
            11, 6, '', '', '', 
            '', '', 'None', 10, '', 
            6, 3, 2300, 'Trampling Charge: If the mammoth moves at least 20 ft. straight toward a creature and then hits it with a gore attack on the same turn, that target must succeed on a DC 18 Strength saving throw or be knocked prone. If the target is prone, the mammoth can make one stomp attack against it as a bonus action.', 'Gore: Melee Weapon Attack: +10 to hit, reach 10 ft., one target. Hit: 25 (4d8 + 7) piercing damage.; Stomp: Melee Weapon Attack: +10 to hit, reach 5 ft., one prone creature. Hit: 29 (4d10 + 7) bludgeoning damage.', '', 'None'),
    

    ('Manticore', 'Large', 'monstrosity', 'lawful evil', 14, 'natural', 68, 
            '8d10', '8d10+24', '30 ft.', 17, 16, 17, 7, 
            12, 8, '', '', '', 
            '', '', '60 ft.', 11, '', 
            3, 2, 700, 'Tail Spike Regrowth: The manticore has twenty-four tail spikes. Used spikes regrow when the manticore finishes a long rest.', 'Multiattack: The manticore makes three attacks: one with its bite and two with its claws or three with its tail spikes.; Bite: Melee Weapon Attack: +5 to hit, reach 5 ft., one target. Hit: 7 (1d8 + 3) piercing damage.; Claw: Melee Weapon Attack: +5 to hit, reach 5 ft., one target. Hit: 6 (1d6 + 3) slashing damage.; Tail Spike: Ranged Weapon Attack: +5 to hit, range 100/200 ft., one target. Hit: 7 (1d8 + 3) piercing damage.', '', 'None'),
    

    ('Marilith', 'Large', 'fiend', 'chaotic evil', 18, 'natural', 189, 
            '18d10', '18d10+90', '40 ft.', 18, 20, 20, 18, 
            16, 20, 'Saving Throw: STR, Saving Throw: CON, Saving Throw: WIS, Saving Throw: CHA', '', 'cold, fire, lightning, bludgeoning, piercing, and slashing from nonmagical weapons', 
            'poison', 'Poisoned', 'None', 13, 'Abyssal, telepathy 120 ft.', 
            16, 5, 15000, 'Magic Resistance: The marilith has advantage on saving throws against spells and other magical effects.; Magic Weapons: The marilith''s weapon attacks are magical.; Reactive: The marilith can take one reaction on every turn in combat.', 'Multiattack: The marilith can make seven attacks: six with its longswords and one with its tail.; Longsword: Melee Weapon Attack: +9 to hit, reach 5 ft., one target. Hit: 13 (2d8 + 4) slashing damage.; Tail: Melee Weapon Attack: +9 to hit, reach 10 ft., one creature. Hit: 15 (2d10 + 4) bludgeoning damage. If the target is Medium or smaller, it is grappled (escape DC 19). Until this grapple ends, the target is restrained, the marilith can automatically hit the target with its tail, and the marilith can''t make tail attacks against other targets.; Teleport: The marilith magically teleports, along with any equipment it is wearing or carrying, up to 120 feet to an unoccupied space it can see.', '', 'None'),
    

    ('Mastiff', 'Medium', 'beast', 'unaligned', 12, 'dex', 5, 
            '1d8', '1d8+1', '40 ft.', 13, 14, 12, 3, 
            12, 7, 'Skill: Perception', '', '', 
            '', '', 'None', 13, '', 
            0.125, 2, 25, 'Keen Hearing and Smell: The mastiff has advantage on Wisdom (Perception) checks that rely on hearing or smell.', 'Bite: Melee Weapon Attack: +3 to hit, reach 5 ft., one target. Hit: 4 (1d6 + 1) piercing damage. If the target is a creature, it must succeed on a DC 11 Strength saving throw or be knocked prone.', '', 'None'),
    

    ('Medusa', 'Medium', 'monstrosity', 'lawful evil', 15, 'natural', 127, 
            '17d8', '17d8+51', '30 ft.', 10, 15, 16, 12, 
            13, 15, 'Skill: Deception, Skill: Insight, Skill: Perception, Skill: Stealth', '', '', 
            '', '', '60 ft.', 14, 'Common', 
            6, 3, 2300, 'Petrifying Gaze: When a creature that can see the medusa''s eyes starts its turn within 30 ft. of the medusa, the medusa can force it to make a DC 14 Constitution saving throw if the medusa isn''t incapacitated and can see the creature. If the saving throw fails by 5 or more, the creature is instantly petrified. Otherwise, a creature that fails the save begins to turn to stone and is restrained. The restrained creature must repeat the saving throw at the end of its next turn, becoming petrified on a failure or ending the effect on a success. The petrification lasts until the creature is freed by the greater restoration spell or other magic.
Unless surprised, a creature can avert its eyes to avoid the saving throw at the start of its turn. If the creature does so, it can''t see the medusa until the start of its next turn, when it can avert its eyes again. If the creature looks at the medusa in the meantime, it must immediately make the save.
If the medusa sees itself reflected on a polished surface within 30 ft. of it and in an area of bright light, the medusa is, due to its curse, affected by its own gaze.', 'Multiattack: The medusa makes either three melee attacks--one with its snake hair and two with its shortsword--or two ranged attacks with its longbow.; Snake Hair: Melee Weapon Attack: +5 to hit, reach 5 ft., one creature. Hit: 4 (1d4 + 2) piercing damage plus 14 (4d6) poison damage.; Shortsword: Melee Weapon Attack: +5 to hit, reach 5 ft., one target. Hit: 5 (1d6 + 2) piercing damage.; Longbow: Ranged Weapon Attack: +5 to hit, range 150/600 ft., one target. Hit: 6 (1d8 + 2) piercing damage plus 7 (2d6) poison damage.', '', 'None'),
    

    ('Merfolk', 'Medium', 'humanoid', 'neutral', 11, 'dex', 11, 
            '2d8', '2d8+2', '10 ft.', 10, 13, 12, 11, 
            11, 12, 'Skill: Perception', '', '', 
            '', '', 'None', 12, 'Aquan, Common', 
            0.125, 2, 25, 'Amphibious: The merfolk can breathe air and water.', 'Spear: Melee or Ranged Weapon Attack: +2 to hit, reach 5 ft. or range 20/60 ft., one target. Hit: 3 (1d6) piercing damage, or 4 (1d8) piercing damage if used with two hands to make a melee attack.', '', 'None'),
    

    ('Merrow', 'Large', 'monstrosity', 'chaotic evil', 13, 'natural', 45, 
            '6d10', '6d10+12', '10 ft.', 18, 10, 15, 8, 
            10, 9, '', '', '', 
            '', '', '60 ft.', 10, 'Abyssal, Aquan', 
            2, 2, 450, 'Amphibious: The merrow can breathe air and water.', 'Multiattack: The merrow makes two attacks: one with its bite and one with its claws or harpoon.; Bite: Melee Weapon Attack: +6 to hit, reach 5 ft., one target. Hit: 8 (1d8 + 4) piercing damage.; Claws: Melee Weapon Attack: +6 to hit, reach 5 ft., one target. Hit: 9 (2d4 + 4) slashing damage.; Harpoon: Melee or Ranged Weapon Attack: +6 to hit, reach 5 ft. or range 20/60 ft., one target. Hit: 11 (2d6 + 4) piercing damage. If the target is a Huge or smaller creature, it must succeed on a Strength contest against the merrow or be pulled up to 20 feet toward the merrow.', '', 'None'),
    

    ('Mimic', 'Medium', 'monstrosity', 'neutral', 12, 'natural', 58, 
            '9d8', '9d8+18', '15 ft.', 17, 12, 15, 5, 
            13, 8, 'Skill: Stealth', '', '', 
            'acid', 'Prone', '60 ft.', 11, '', 
            2, 2, 450, 'Shapechanger: The mimic can use its action to polymorph into an object or back into its true, amorphous form. Its statistics are the same in each form. Any equipment it is wearing or carrying isn ''t transformed. It reverts to its true form if it dies.; Adhesive (Object Form Only): The mimic adheres to anything that touches it. A Huge or smaller creature adhered to the mimic is also grappled by it (escape DC 13). Ability checks made to escape this grapple have disadvantage.; False Appearance (Object Form Only): While the mimic remains motionless, it is indistinguishable from an ordinary object.; Grappler: The mimic has advantage on attack rolls against any creature grappled by it.', 'Pseudopod: Melee Weapon Attack: +5 to hit, reach 5 ft., one target. Hit: 7 (1d8 + 3) bludgeoning damage. If the mimic is in object form, the target is subjected to its Adhesive trait.; Bite: Melee Weapon Attack: +5 to hit, reach 5 ft., one target. Hit: 7 (1d8 + 3) piercing damage plus 4 (1d8) acid damage.', '', '/api/2014/images/monsters/mimic.png'),
    

    ('Minotaur', 'Large', 'monstrosity', 'chaotic evil', 14, 'natural', 76, 
            '9d10', '9d10+27', '40 ft.', 18, 11, 16, 6, 
            16, 9, 'Skill: Perception', '', '', 
            '', '', '60 ft.', 17, 'Abyssal', 
            3, 2, 700, 'Charge: If the minotaur moves at least 10 ft. straight toward a target and then hits it with a gore attack on the same turn, the target takes an extra 9 (2d8) piercing damage. If the target is a creature, it must succeed on a DC 14 Strength saving throw or be pushed up to 10 ft. away and knocked prone.; Labyrinthine Recall: The minotaur can perfectly recall any path it has traveled.; Reckless: At the start of its turn, the minotaur can gain advantage on all melee weapon attack rolls it makes during that turn, but attack rolls against it have advantage until the start of its next turn.', 'Greataxe: Melee Weapon Attack: +6 to hit, reach 5 ft., one target. Hit: 17 (2d12 + 4) slashing damage.; Gore: Melee Weapon Attack: +6 to hit, reach 5 ft., one target. Hit: 13 (2d8 + 4) piercing damage.', '', 'None'),
    

    ('Minotaur Skeleton', 'Large', 'undead', 'lawful evil', 12, 'natural', 67, 
            '9d10', '9d10+18', '40 ft.', 18, 11, 15, 6, 
            8, 5, '', 'bludgeoning', '', 
            'poison', 'Exhaustion, Poisoned', '60 ft.', 9, 'understands Abyssal but can''t speak', 
            2, 2, 450, 'Charge: If the skeleton moves at least 10 feet straight toward a target and then hits it with a gore attack on the same turn, the target takes an extra 9 (2d8) piercing damage. If the target is a creature, it must succeed on a DC 14 Strength saving throw or be pushed up to 10 feet away and knocked prone.', 'Greataxe: Melee Weapon Attack: +6 to hit, reach 5 ft., one target. Hit: 17 (2d12 + 4) slashing damage.; Gore: Melee Weapon Attack: +6 to hit, reach 5 ft., one target. Hit: 13 (2d8 + 4) piercing damage.', '', 'None'),
    

    ('Mule', 'Medium', 'beast', 'unaligned', 10, 'dex', 11, 
            '2d8', '2d8+2', '40 ft.', 14, 10, 13, 2, 
            10, 5, '', '', '', 
            '', '', 'None', 10, '', 
            0.125, 2, 25, 'Beast of Burden: The mule is considered to be a Large animal for the purpose of determining its carrying capacity.; Sure-Footed: The mule has advantage on Strength and Dexterity saving throws made against effects that would knock it prone.', 'Hooves: Melee Weapon Attack: +2 to hit, reach 5 ft., one target. Hit: 4 (1d4 + 2) bludgeoning damage.', '', 'None'),
    

    ('Mummy', 'Medium', 'undead', 'lawful evil', 11, 'natural', 58, 
            '9d8', '9d8+18', '20 ft.', 16, 8, 15, 6, 
            10, 12, 'Saving Throw: WIS', 'fire', 'bludgeoning, piercing, and slashing from nonmagical weapons', 
            'necrotic, poison', 'Charmed, Exhaustion, Frightened, Paralyzed, Poisoned', '60 ft.', 10, 'the languages it knew in life', 
            3, 2, 700, '', 'Multiattack: The mummy can use its Dreadful Glare and makes one attack with its rotting fist.; Rotting Fist: Melee Weapon Attack: +5 to hit, reach 5 ft., one target. Hit: 10 (2d6 + 3) bludgeoning damage plus 10 (3d6) necrotic damage. If the target is a creature, it must succeed on a DC 12 Constitution saving throw or be cursed with mummy rot. The cursed target can''t regain hit points, and its hit point maximum decreases by 10 (3d6) for every 24 hours that elapse. If the curse reduces the target''s hit point maximum to 0, the target dies, and its body turns to dust. The curse lasts until removed by the remove curse spell or other magic.; Dreadful Glare: The mummy targets one creature it can see within 60 ft. of it. If the target can see the mummy, it must succeed on a DC 11 Wisdom saving throw against this magic or become frightened until the end of the mummy''s next turn. If the target fails the saving throw by 5 or more, it is also paralyzed for the same duration. A target that succeeds on the saving throw is immune to the Dreadful Glare of all mummies (but not mummy lords) for the next 24 hours.', '', 'None'),
    

    ('Mummy Lord', 'Medium', 'undead', 'lawful evil', 17, 'natural', 97, 
            '13d8', '13d8+39', '20 ft.', 18, 10, 17, 11, 
            18, 16, 'Saving Throw: CON, Saving Throw: INT, Saving Throw: WIS, Saving Throw: CHA, Skill: History, Skill: Religion', 'fire', '', 
            'necrotic, poison, bludgeoning, piercing, and slashing from nonmagical weapons', 'Charmed, Exhaustion, Frightened, Paralyzed, Poisoned', '60 ft.', 14, 'the languages it knew in life', 
            15, 5, 13000, 'Magic Resistance: The mummy lord has advantage on saving throws against spells and other magical effects.; Rejuvenation: A destroyed mummy lord gains a new body in 24 hours if its heart is intact, regaining all its hit points and becoming active again. The new body appears within 5 feet of the mummy lord''s heart.; Spellcasting: The mummy lord is a 10th-level spellcaster. Its spellcasting ability is Wisdom (spell save DC 17, +9 to hit with spell attacks). The mummy lord has the following cleric spells prepared:

- Cantrips (at will): sacred flame, thaumaturgy
- 1st level (4 slots): command, guiding bolt, shield of faith
- 2nd level (3 slots): hold person, silence, spiritual weapon
- 3rd level (3 slots): animate dead, dispel magic
- 4th level (3 slots): divination, guardian of faith
- 5th level (2 slots): contagion, insect plague
- 6th level (1 slot): harm', 'Multiattack: The mummy can use its Dreadful Glare and makes one attack with its rotting fist.; Rotting Fist: Melee Weapon Attack: +9 to hit, reach 5 ft., one target. Hit: 14 (3d6 + 4) bludgeoning damage plus 21 (6d6) necrotic damage. If the target is a creature, it must succeed on a DC 16 Constitution saving throw or be cursed with mummy rot. The cursed target can''t regain hit points, and its hit point maximum decreases by 10 (3d6) for every 24 hours that elapse. If the curse reduces the target''s hit point maximum to 0, the target dies, and its body turns to dust. The curse lasts until removed by the remove curse spell or other magic.; Dreadful Glare: The mummy lord targets one creature it can see within 60 feet of it. If the target can see the mummy lord, it must succeed on a DC 16 Wisdom saving throw against this magic or become frightened until the end of the mummy''s next turn. If the target fails the saving throw by 5 or more, it is also paralyzed for the same duration. A target that succeeds on the saving throw is immune to the Dreadful Glare of all mummies and mummy lords for the next 24 hours.', 'Attack: The mummy lord makes one attack with its rotting fist or uses its Dreadful Glare.; Blinding Dust: Blinding dust and sand swirls magically around the mummy lord. Each creature within 5 feet of the mummy lord must succeed on a DC 16 Constitution saving throw or be blinded until the end of the creature''s next turn.; Blasphemous Word (Costs 2 Actions): The mummy lord utters a blasphemous word. Each non-undead creature within 10 feet of the mummy lord that can hear the magical utterance must succeed on a DC 16 Constitution saving throw or be stunned until the end of the mummy lord''s next turn.; Channel Negative Energy (Costs 2 Actions): The mummy lord magically unleashes negative energy. Creatures within 60 feet of the mummy lord, including ones behind barriers and around corners, can''t regain hit points until the end of the mummy lord''s next turn.; Whirlwind of Sand (Costs 2 Actions): The mummy lord magically transforms into a whirlwind of sand, moves up to 60 feet, and reverts to its normal form. While in whirlwind form, the mummy lord is immune to all damage, and it can''t be grappled, petrified, knocked prone, restrained, or stunned. Equipment worn or carried by the mummy lord remain in its possession.', 'None'),
    

    ('Nalfeshnee', 'Large', 'fiend', 'chaotic evil', 18, 'natural', 184, 
            '16d10', '16d10+96', '20 ft.', 21, 10, 22, 19, 
            12, 15, 'Saving Throw: CON, Saving Throw: INT, Saving Throw: WIS, Saving Throw: CHA', '', 'cold, fire, lightning, bludgeoning, piercing, and slashing from nonmagical weapons', 
            'poison', 'Poisoned', 'None', 11, 'Abyssal, telepathy 120 ft.', 
            13, 5, 10000, 'Magic Resistance: The nalfeshnee has advantage on saving throws against spells and other magical effects.', 'Multiattack: The nalfeshnee uses Horror Nimbus if it can. It then makes three attacks: one with its bite and two with its claws.; Bite: Melee Weapon Attack: +10 to hit, reach 5 ft., one target. Hit: 32 (5d10 + 5) piercing damage.; Claw: Melee Weapon Attack: +10 to hit, reach 10 ft., one target. Hit: 15 (3d6 + 5) slashing damage.; Horror Nimbus: The nalfeshnee magically emits scintillating, multicolored light. Each creature within 15 feet of the nalfeshnee that can see the light must succeed on a DC 15 Wisdom saving throw or be frightened for 1 minute. A creature can repeat the saving throw at the end of each of its turns, ending the effect on itself on a success. If a creature''s saving throw is successful or the effect ends for it, the creature is immune to the nalfeshnee''s Horror Nimbus for the next 24 hours.; Teleport: The nalfeshnee magically teleports, along with any equipment it is wearing or carrying, up to 120 feet to an unoccupied space it can see.', '', 'None'),
    

    ('Night Hag', 'Medium', 'fiend', 'neutral evil', 17, 'natural', 112, 
            '15d8', '15d8+45', '30 ft.', 18, 15, 16, 16, 
            14, 16, 'Skill: Deception, Skill: Insight, Skill: Perception, Skill: Stealth', '', 'cold, fire, bludgeoning, piercing, and slashing from nonmagical weapons that aren''t silvered', 
            '', 'Charmed', '120 ft.', 16, 'Abyssal, Common, Infernal, Primordial', 
            5, 3, 1800, 'Innate Spellcasting: The hag''s innate spellcasting ability is Charisma (spell save DC 14, +6 to hit with spell attacks). She can innately cast the following spells, requiring no material components:

At will: detect magic, magic missile
2/day each: plane shift (self only), ray of enfeeblement, sleep; Magic Resistance: The hag has advantage on saving throws against spells and other magical effects.; Night Hag Items: A night hag carries two very rare magic items that she must craft for herself If either object is lost, the night hag will go to great lengths to retrieve it, as creating a new tool takes time and effort.
Heartstone: This lustrous black gem allows a night hag to become ethereal while it is in her possession. The touch of a heartstone also cures any disease. Crafting a heartstone takes 30 days.
Soul Bag: When an evil humanoid dies as a result of a night hag''s Nightmare Haunting, the hag catches the soul in this black sack made of stitched flesh. A soul bag can hold only one evil soul at a time, and only the night hag who crafted the bag can catch a soul with it. Crafting a soul bag takes 7 days and a humanoid sacrifice (whose flesh is used to make the bag).', 'Claws (Hag Form Only): Melee Weapon Attack: +7 to hit, reach 5 ft., one target. Hit: 13 (2d8 + 4) slashing damage.; Change Shape: The hag magically polymorphs into a Small or Medium female humanoid, or back into her true form. Her statistics are the same in each form. Any equipment she is wearing or carrying isn''t transformed. She reverts to her true form if she dies.; Etherealness: The hag magically enters the Ethereal Plane from the Material Plane, or vice versa. To do so, the hag must have a heartstone in her possession.; Nightmare Haunting: While on the Ethereal Plane, the hag magically touches a sleeping humanoid on the Material Plane. A protection from evil and good spell cast on the target prevents this contact, as does a magic circle. As long as the contact persists, the target has dreadful visions. If these visions last for at least 1 hour, the target gains no benefit from its rest, and its hit point maximum is reduced by 5 (1d10). If this effect reduces the target''s hit point maximum to 0, the target dies, and if the target was evil, its soul is trapped in the hag''s soul bag. The reduction to the target''s hit point maximum lasts until removed by the greater restoration spell or similar magic.', '', 'None'),
    

    ('Nightmare', 'Large', 'fiend', 'neutral evil', 13, 'natural', 68, 
            '8d10', '8d10+24', '60 ft.', 18, 15, 16, 10, 
            13, 15, '', '', '', 
            'fire', '', 'None', 11, 'understands Abyssal, Common, and Infernal but can''t speak', 
            3, 2, 700, 'Confer Fire Resistance: The nightmare can grant resistance to fire damage to anyone riding it.; Illumination: The nightmare sheds bright light in a 10-foot radius and dim light for an additional 10 feet.', 'Hooves: Melee Weapon Attack: +6 to hit, reach 5 ft., one target. Hit: 13 (2d8 + 4) bludgeoning damage plus 7 (2d6) fire damage.; Ethereal Stride: The nightmare and up to three willing creatures within 5 feet of it magically enter the Ethereal Plane from the Material Plane, or vice versa.', '', 'None'),
    

    ('Noble', 'Medium', 'humanoid', 'any alignment', 15, 'armor', 9, 
            '2d8', '2d8', '30 ft.', 11, 12, 11, 12, 
            14, 16, 'Skill: Deception, Skill: Insight, Skill: Persuasion', '', '', 
            '', '', 'None', 12, 'any two languages', 
            0.125, 2, 25, '', 'Rapier: Melee Weapon Attack: +3 to hit, reach 5 ft., one target. Hit: 5 (1d8 + 1) piercing damage.', '', 'None'),
    

    ('Ochre Jelly', 'Large', 'ooze', 'unaligned', 8, 'dex', 45, 
            '6d10', '6d10+12', '10 ft.', 15, 6, 14, 2, 
            6, 1, '', '', 'acid', 
            'lightning, slashing', 'Blinded, Charmed, Blinded, Exhaustion, Frightened, Prone', 'None', 8, '', 
            2, 2, 450, 'Amorphous: The jelly can move through a space as narrow as 1 inch wide without squeezing.; Spider Climb: The jelly can climb difficult surfaces, including upside down on ceilings, without needing to make an ability check.', 'Pseudopod: Melee Weapon Attack: +4 to hit, reach 5 ft., one target. Hit: 9 (2d6 + 2) bludgeoning damage plus 3 (1d6) acid damage.', '', 'None'),
    

    ('Octopus', 'Small', 'beast', 'unaligned', 12, 'dex', 3, 
            '1d6', '1d6', '5 ft.', 4, 15, 11, 3, 
            10, 4, 'Skill: Perception, Skill: Stealth', '', '', 
            '', '', '30 ft.', 12, '', 
            0, 2, 10, 'Hold Breath: While out of water, the octopus can hold its breath for 30 minutes.; Underwater Camouflage: The octopus has advantage on Dexterity (Stealth) checks made while underwater.; Water Breathing: The octopus can breathe only underwater.', 'Tentacles: Melee Weapon Attack: +4 to hit, reach 5 ft., one target. Hit: 1 bludgeoning damage, and the target is grappled (escape DC 10). Until this grapple ends, the octopus can''t use its tentacles on another target.; Ink Cloud: A 5-foot-radius cloud of ink extends all around the octopus if it is underwater. The area is heavily obscured for 1 minute, although a significant current can disperse the ink. After releasing the ink, the octopus can use the Dash action as a bonus action.', '', 'None'),
    

    ('Ogre', 'Large', 'giant', 'chaotic evil', 11, 'armor', 59, 
            '7d10', '7d10+21', '40 ft.', 19, 8, 16, 5, 
            7, 7, '', '', '', 
            '', '', '60 ft.', 8, 'Common, Giant', 
            2, 2, 450, '', 'Greatclub: Melee Weapon Attack: +6 to hit, reach 5 ft., one target. Hit: 13 (2d8 + 4) bludgeoning damage.; Javelin: Melee or Ranged Weapon Attack: +6 to hit, reach 5 ft. or range 30/120 ft., one target. Hit: 11 (2d6 + 4) piercing damage.', '', 'None'),
    

    ('Ogre Zombie', 'Large', 'undead', 'neutral evil', 8, 'dex', 85, 
            '9d10', '9d10+36', '30 ft.', 19, 6, 18, 3, 
            6, 5, 'Saving Throw: WIS', '', '', 
            'poison', 'Poisoned', '60 ft.', 8, 'understands Common and Giant but can''t speak', 
            2, 2, 450, 'Undead Fortitude: If damage reduces the zombie to 0 hit points, it must make a Constitution saving throw with a DC of 5+the damage taken, unless the damage is radiant or from a critical hit. On a success, the zombie drops to 1 hit point instead.', 'Morningstar: Melee Weapon Attack: +6 to hit, reach 5 ft., one target. Hit: 13 (2d8 + 4) bludgeoning damage.', '', 'None'),
    

    ('Oni', 'Large', 'giant', 'lawful evil', 16, 'armor', 110, 
            '13d10', '13d10+39', '30 ft.', 19, 11, 16, 14, 
            12, 15, 'Saving Throw: DEX, Saving Throw: CON, Saving Throw: WIS, Saving Throw: CHA, Skill: Arcana, Skill: Deception, Skill: Perception', '', '', 
            '', '', '60 ft.', 14, 'Common, Giant', 
            7, 3, 2900, 'Innate Spellcasting: The oni''s innate spellcasting ability is Charisma (spell save DC 13). The oni can innately cast the following spells, requiring no material components:

At will: darkness, invisibility
1/day each: charm person, cone of cold, gaseous form, sleep; Magic Weapons: The oni''s weapon attacks are magical.; Regeneration: The oni regains 10 hit points at the start of its turn if it has at least 1 hit point.', 'Multiattack: The oni makes two attacks, either with its claws or its glaive.; Claw (Oni Form Only): Melee Weapon Attack: +7 to hit, reach 5 ft., one target. Hit: 8 (1d8 + 4) slashing damage.; Glaive: Melee Weapon Attack: +7 to hit, reach 10 ft., one target. Hit: 15 (2d10 + 4) slashing damage, or 9 (1d10 + 4) slashing damage in Small or Medium form.; Change Shape: The oni magically polymorphs into a Small or Medium humanoid, into a Large giant, or back into its true form. Other than its size, its statistics are the same in each form. The only equipment that is transformed is its glaive, which shrinks so that it can be wielded in humanoid form. If the oni dies, it reverts to its true form, and its glaive reverts to its normal size.', '', 'None'),
    

    ('Orc', 'Medium', 'humanoid', 'chaotic evil', 13, 'armor', 15, 
            '2d8', '2d8+6', '30 ft.', 16, 12, 16, 7, 
            11, 10, 'Skill: Intimidation', '', '', 
            '', '', '60 ft.', 10, 'Common, Orc', 
            0.5, 2, 100, 'Aggressive: As a bonus action, the orc can move up to its speed toward a hostile creature that it can see.', 'Greataxe: Melee Weapon Attack: +5 to hit, reach 5 ft., one target. Hit: 9 (1d12 + 3) slashing damage.; Javelin: Melee or Ranged Weapon Attack: +5 to hit, reach 5 ft. or range 30/120 ft., one target. Hit: 6 (1d6 + 3) piercing damage.', '', 'None'),
    

    ('Otyugh', 'Large', 'aberration', 'neutral', 14, 'natural', 114, 
            '12d10', '12d10+48', '30 ft.', 16, 11, 19, 6, 
            13, 6, 'Saving Throw: CON', '', '', 
            '', '', '120 ft.', 11, 'Otyugh', 
            5, 3, 1800, 'Limited Telepathy: The otyugh can magically transmit simple messages and images to any creature within 120 ft. of it that can understand a language. This form of telepathy doesn''t allow the receiving creature to telepathically respond.', 'Multiattack: The otyugh makes three attacks: one with its bite and two with its tentacles.; Bite: Melee Weapon Attack: +6 to hit, reach 5 ft., one target. Hit: 12 (2d8 + 3) piercing damage. If the target is a creature, it must succeed on a DC 15 Constitution saving throw against disease or become poisoned until the disease is cured. Every 24 hours that elapse, the target must repeat the saving throw, reducing its hit point maximum by 5 (1d10) on a failure. The disease is cured on a success. The target dies if the disease reduces its hit point maximum to 0. This reduction to the target''s hit point maximum lasts until the disease is cured.; Tentacle: Melee Weapon Attack: +6 to hit, reach 10 ft., one target. Hit: 7 (1d8 + 3) bludgeoning damage plus 4 (1d8) piercing damage. If the target is Medium or smaller, it is grappled (escape DC 13) and restrained until the grapple ends. The otyugh has two tentacles, each of which can grapple one target.; Tentacle Slam: The otyugh slams creatures grappled by it into each other or a solid surface. Each creature must succeed on a DC 14 Constitution saving throw or take 10 (2d6 + 3) bludgeoning damage and be stunned until the end of the otyugh''s next turn. On a successful save, the target takes half the bludgeoning damage and isn''t stunned.', '', 'None'),
    

    ('Owl', 'Tiny', 'beast', 'unaligned', 11, 'dex', 1, 
            '1d4', '1d4-1', '5 ft.', 3, 13, 8, 2, 
            12, 7, 'Skill: Perception, Skill: Stealth', '', '', 
            '', '', '120 ft.', 13, '', 
            0, 2, 10, 'Flyby: The owl doesn''t provoke opportunity attacks when it flies out of an enemy''s reach.; Keen Hearing and Sight: The owl has advantage on Wisdom (Perception) checks that rely on hearing or sight.', 'Talons: Melee Weapon Attack: +3 to hit, reach 5 ft., one target. Hit: 1 slashing damage.', '', 'None'),
    

    ('Owlbear', 'Large', 'monstrosity', 'unaligned', 13, 'natural', 59, 
            '7d10', '7d10+21', '40 ft.', 20, 12, 17, 3, 
            12, 7, 'Skill: Perception', '', '', 
            '', '', '60 ft.', 13, '', 
            3, 2, 700, 'Keen Sight and Smell: The owlbear has advantage on Wisdom (Perception) checks that rely on sight or smell.', 'Multiattack: The owlbear makes two attacks: one with its beak and one with its claws.; Beak: Melee Weapon Attack: +7 to hit, reach 5 ft., one creature. Hit: 10 (1d10 + 5) piercing damage.; Claws: Melee Weapon Attack: +7 to hit, reach 5 ft., one target. Hit: 14 (2d8 + 5) slashing damage.', '', 'None'),
    

    ('Panther', 'Medium', 'beast', 'unaligned', 12, 'dex', 13, 
            '3d8', '3d8', '50 ft.', 14, 15, 10, 3, 
            14, 7, 'Skill: Perception, Skill: Stealth', '', '', 
            '', '', 'None', 14, '', 
            0.25, 2, 50, 'Keen Smell: The panther has advantage on Wisdom (Perception) checks that rely on smell.; Pounce: If the panther moves at least 20 ft. straight toward a creature and then hits it with a claw attack on the same turn, that target must succeed on a DC 12 Strength saving throw or be knocked prone. If the target is prone, the panther can make one bite attack against it as a bonus action.', 'Bite: Melee Weapon Attack: +4 to hit, reach 5 ft., one target. Hit: 5 (1d6 + 2) piercing damage.; Claw: Melee Weapon Attack: +4 to hit, reach 5 ft., one target. Hit: 4 (1d4 + 2) slashing damage.', '', 'None'),
    

    ('Pegasus', 'Large', 'celestial', 'chaotic good', 12, 'dex', 59, 
            '7d10', '7d10+21', '60 ft.', 18, 15, 16, 10, 
            15, 13, 'Saving Throw: DEX, Saving Throw: WIS, Saving Throw: CHA, Skill: Perception', '', '', 
            '', '', 'None', 16, 'understands Celestial, Common, Elvish, and Sylvan but can''t speak', 
            2, 2, 450, '', 'Hooves: Melee Weapon Attack: +6 to hit, reach 5 ft., one target. Hit: 11 (2d6 + 4) bludgeoning damage.', '', 'None'),
    

    ('Phase Spider', 'Large', 'monstrosity', 'unaligned', 13, 'natural', 32, 
            '5d10', '5d10+5', '30 ft.', 15, 15, 12, 6, 
            10, 6, 'Skill: Stealth', '', '', 
            '', '', '60 ft.', 10, '', 
            3, 2, 700, 'Ethereal Jaunt: As a bonus action, the spider can magically shift from the Material Plane to the Ethereal Plane, or vice versa.; Spider Climb: The spider can climb difficult surfaces, including upside down on ceilings, without needing to make an ability check.; Web Walker: The spider ignores movement restrictions caused by webbing.', 'Bite: Melee Weapon Attack: +4 to hit, reach 5 ft., one creature. Hit: 7 (1d10 + 2) piercing damage, and the target must make a DC 11 Constitution saving throw, taking 18 (4d8) poison damage on a failed save, or half as much damage on a successful one. If the poison damage reduces the target to 0 hit points, the target is stable but poisoned for 1 hour, even after regaining hit points, and is paralyzed while poisoned in this way.', '', 'None'),
    

    ('Pit Fiend', 'Large', 'fiend', 'lawful evil', 19, 'natural', 300, 
            '24d10', '24d10+168', '30 ft.', 26, 14, 24, 22, 
            18, 24, 'Saving Throw: DEX, Saving Throw: CON, Saving Throw: WIS', '', 'cold, bludgeoning, piercing, and slashing from nonmagical weapons that aren''t silvered', 
            'fire, poison', 'Poisoned', 'None', 14, 'Infernal, telepathy 120 ft.', 
            20, 6, 25000, 'Fear Aura: Any creature hostile to the pit fiend that starts its turn within 20 feet of the pit fiend must make a DC 21 Wisdom saving throw, unless the pit fiend is incapacitated. On a failed save, the creature is frightened until the start of its next turn. If a creature''s saving throw is successful, the creature is immune to the pit fiend''s Fear Aura for the next 24 hours.; Magic Resistance: The pit fiend has advantage on saving throws against spells and other magical effects.; Magic Weapons: The pit fiend''s weapon attacks are magical.; Innate Spellcasting: The pit fiend''s spellcasting ability is Charisma (spell save DC 21). The pit fiend can innately cast the following spells, requiring no material components:
At will: detect magic, fireball
3/day each: hold monster, wall of fire', 'Multiattack: The pit fiend makes four attacks: one with its bite, one with its claw, one with its mace, and one with its tail.; Bite: Melee Weapon Attack: +14 to hit, reach 5 ft., one target. Hit: 22 (4d6 + 8) piercing damage. The target must succeed on a DC 21 Constitution saving throw or become poisoned. While poisoned in this way, the target can''t regain hit points, and it takes 21 (6d6) poison damage at the start of each of its turns. The poisoned target can repeat the saving throw at the end of each of its turns, ending the effect on itself on a success.; Claw: Melee Weapon Attack: +14 to hit, reach 10 ft. , one target. Hit: 17 (2d8 + 8) slashing damage.; Mace: Melee Weapon Attack: +14 to hit, reach 10ft., one target. Hit: 15 (2d6 + 8) bludgeoning damage plus 21 (6d6) fire damage.; Tail: Melee Weapon Attack: +14 to hit, reach 10ft., one target. Hit: 24 (3d10 + 8) bludgeoning damage.', '', 'None'),
    

    ('Planetar', 'Large', 'celestial', 'lawful good', 19, 'natural', 200, 
            '16d10', '16d10+112', '40 ft.', 24, 20, 24, 19, 
            22, 25, 'Saving Throw: CON, Saving Throw: WIS, Saving Throw: CHA, Skill: Perception', '', 'radiant, bludgeoning, piercing, and slashing from nonmagical weapons', 
            '', 'Charmed, Exhaustion, Frightened', 'None', 21, 'all, telepathy 120 ft.', 
            16, 5, 15000, 'Angelic Weapons: The planetar''s weapon attacks are magical. When the planetar hits with any weapon, the weapon deals an extra 5d8 radiant damage (included in the attack).; Divine Awareness: The planetar knows if it hears a lie.; Innate Spellcasting: The planetar''s spellcasting ability is Charisma (spell save DC 20). The planetar can innately cast the following spells, requiring no material components:
At will: detect evil and good, invisibility (self only)
3/day each: blade barrier, dispel evil and good, flame strike, raise dead
1/day each: commune, control weather, insect plague; Magic Resistance: The planetar has advantage on saving throws against spells and other magical effects.', 'Multiattack: The planetar makes two melee attacks.; Greatsword: Melee Weapon Attack: +12 to hit, reach 5 ft., one target. Hit: 21 (4d6 + 7) slashing damage plus 22 (5d8) radiant damage.; Healing Touch: The planetar touches another creature. The target magically regains 30 (6d8 + 3) hit points and is freed from any curse, disease, poison, blindness, or deafness.', '', 'None'),
    

    ('Plesiosaurus', 'Large', 'beast', 'unaligned', 13, 'natural', 68, 
            '8d10', '8d10+24', '20 ft.', 18, 15, 16, 2, 
            12, 5, 'Skill: Perception, Skill: Stealth', '', '', 
            '', '', 'None', 13, '', 
            2, 2, 450, 'Hold Breath: The plesiosaurus can hold its breath for 1 hour.', 'Bite: Melee Weapon Attack: +6 to hit, reach 10 ft., one target. Hit: 14 (3d6 + 4) piercing damage.', '', 'None'),
    

    ('Poisonous Snake', 'Tiny', 'beast', 'unaligned', 13, 'dex', 2, 
            '1d4', '1d4', '30 ft.', 2, 16, 11, 1, 
            10, 3, '', '', '', 
            '', '', 'None', 10, '', 
            0.125, 2, 25, '', 'Bite: Melee Weapon Attack: +5 to hit, reach 5 ft., one target. Hit: 1 piercing damage, and the target must make a DC 10 Constitution saving throw, taking 5 (2d4) poison damage on a failed save, or half as much damage on a successful one.', '', 'None'),
    

    ('Polar Bear', 'Large', 'beast', 'unaligned', 12, 'natural', 42, 
            '5d10', '5d10+15', '40 ft.', 20, 10, 16, 2, 
            13, 7, 'Skill: Perception', '', '', 
            '', '', 'None', 13, '', 
            2, 2, 450, 'Keen Smell: The bear has advantage on Wisdom (Perception) checks that rely on smell.', 'Multiattack: The bear makes two attacks: one with its bite and one with its claws.; Bite: Melee Weapon Attack: +7 to hit, reach 5 ft., one target. Hit: 9 (1d8 + 5) piercing damage.; Claws: Melee Weapon Attack: +7 to hit, reach 5 ft., one target. Hit: 12 (2d6 + 5) slashing damage.', '', 'None'),
    

    ('Pony', 'Medium', 'beast', 'unaligned', 10, 'dex', 11, 
            '2d8', '2d8+2', '40 ft.', 15, 10, 13, 2, 
            11, 7, '', '', '', 
            '', '', 'None', 10, '', 
            0.125, 2, 25, '', 'Hooves: Melee Weapon Attack: +4 to hit, reach 5 ft., one target. Hit: 7 (2d4 + 2) bludgeoning damage.', '', 'None'),
    

    ('Priest', 'Medium', 'humanoid', 'any alignment', 13, 'armor', 27, 
            '5d8', '5d8+5', '25 ft.', 10, 10, 12, 13, 
            16, 13, 'Skill: Medicine, Skill: Persuasion, Skill: Religion', '', '', 
            '', '', 'None', 13, 'any two languages', 
            2, 2, 450, 'Divine Eminence: As a bonus action, the priest can expend a spell slot to cause its melee weapon attacks to magically deal an extra 10 (3d6) radiant damage to a target on a hit. This benefit lasts until the end of the turn. If the priest expends a spell slot of 2nd level or higher, the extra damage increases by 1d6 for each level above 1st.; Spellcasting: The priest is a 5th-level spellcaster. Its spellcasting ability is Wisdom (spell save DC 13, +5 to hit with spell attacks). The priest has the following cleric spells prepared:

- Cantrips (at will): light, sacred flame, thaumaturgy
- 1st level (4 slots): cure wounds, guiding bolt, sanctuary
- 2nd level (3 slots): lesser restoration, spiritual weapon
- 3rd level (2 slots): dispel magic, spirit guardians', 'Mace: Melee Weapon Attack: +2 to hit, reach 5 ft., one target. Hit: 3 (1d6) bludgeoning damage.', '', 'None'),
    

    ('Pseudodragon', 'Tiny', 'dragon', 'neutral good', 13, 'natural', 7, 
            '2d4', '2d4+2', '15 ft.', 6, 15, 13, 10, 
            12, 10, 'Skill: Perception, Skill: Stealth', '', '', 
            '', '', '60 ft.', 13, 'understands Common and Draconic but can''t speak', 
            0.25, 2, 50, 'Keen Senses: The pseudodragon has advantage on Wisdom (Perception) checks that rely on sight, hearing, or smell.; Magic Resistance: The pseudodragon has advantage on saving throws against spells and other magical effects.; Limited Telepathy: The pseudodragon can magically communicate simple ideas, emotions, and images telepathically with any creature within 100 ft. of it that can understand a language.', 'Bite: Melee Weapon Attack: +4 to hit, reach 5 ft., one target. Hit: 4 (1d4 + 2) piercing damage.; Sting: Melee Weapon Attack: +4 to hit, reach 5 ft., one creature. Hit: 4 (1d4 + 2) piercing damage, and the target must succeed on a DC 11 Constitution saving throw or become poisoned for 1 hour. If the saving throw fails by 5 or more, the target falls unconscious for the same duration, or until it takes damage or another creature uses an action to shake it awake.', '', 'None'),
    

    ('Purple Worm', 'Gargantuan', 'monstrosity', 'unaligned', 18, 'natural', 247, 
            '15d20', '15d20+90', '50 ft.', 28, 7, 22, 1, 
            8, 4, 'Saving Throw: CON, Saving Throw: WIS', '', '', 
            '', '', 'None', 9, '', 
            15, 5, 13000, 'Tunneler: The worm can burrow through solid rock at half its burrow speed and leaves a 10-foot-diameter tunnel in its wake.', 'Multiattack: The worm makes two attacks: one with its bite and one with its stinger.; Bite: Melee Weapon Attack: +9 to hit, reach 10 ft., one target. Hit: 22 (3d8 + 9) piercing damage. If the target is a Large or smaller creature, it must succeed on a DC 19 Dexterity saving throw or be swallowed by the worm. A swallowed creature is blinded and restrained, it has total cover against attacks and other effects outside the worm, and it takes 21 (6d6) acid damage at the start of each of the worm''s turns.
If the worm takes 30 damage or more on a single turn from a creature inside it, the worm must succeed on a DC 21 Constitution saving throw at the end of that turn or regurgitate all swallowed creatures, which fall prone in a space within 10 feet of the worm. If the worm dies, a swallowed creature is no longer restrained by it and can escape from the corpse by using 20 feet of movement, exiting prone.; Tail Stinger: Melee Weapon Attack: +9 to hit, reach 10 ft., one creature. Hit: 19 (3d6 + 9) piercing damage, and the target must make a DC 19 Constitution saving throw, taking 42 (12d6) poison damage on a failed save, or half as much damage on a successful one.', '', 'None'),
    

    ('Quasit', 'Tiny', 'fiend', 'chaotic evil', 13, 'dex', 7, 
            '3d4', '3d4', '40 ft.', 5, 17, 10, 7, 
            10, 10, 'Skill: Stealth', '', 'cold, fire, lightning, bludgeoning, piercing, and slashing from nonmagical weapons', 
            'poison', 'Poisoned', '120 ft.', 10, 'Abyssal, Common', 
            1, 2, 200, 'Shapechanger: The quasit can use its action to polymorph into a beast form that resembles a bat (speed 10 ft. fly 40 ft.), a centipede (40 ft., climb 40 ft.), or a toad (40 ft., swim 40 ft.), or back into its true form . Its statistics are the same in each form, except for the speed changes noted. Any equipment it is wearing or carrying isn''t transformed . It reverts to its true form if it dies.; Magic Resistance: The quasit has advantage on saving throws against spells and other magical effects.', 'Claw (Bite in Beast Form): Melee Weapon Attack: +4 to hit, reach 5 ft., one target. Hit: 5 (1d4 + 3) piercing damage, and the target must succeed on a DC 10 Constitution saving throw or take 5 (2d4) poison damage and become poisoned for 1 minute. The target can repeat the saving throw at the end of each of its turns, ending the effect on itself on a success.; Scare: One creature of the quasit''s choice within 20 ft. of it must succeed on a DC 10 Wisdom saving throw or be frightened for 1 minute. The target can repeat the saving throw at the end of each of its turns, with disadvantage if the quasit is within line of sight, ending the effect on itself on a success.; Invisibility: The quasit magically turns invisible until it attacks or uses Scare, or until its concentration ends (as if concentrating on a spell). Any equipment the quasit wears or carries is invisible with it.', '', 'None'),
    

    ('Quipper', 'Tiny', 'beast', 'unaligned', 13, 'dex', 1, 
            '1d4', '1d4-1', '0 ft.', 2, 16, 9, 1, 
            7, 2, '', '', '', 
            '', '', '60 ft.', 8, '', 
            0, 2, 10, 'Blood Frenzy: The quipper has advantage on melee attack rolls against any creature that doesn''t have all its hit points.; Water Breathing: The quipper can breathe only underwater.', 'Bite: Melee Weapon Attack: +5 to hit, reach 5 ft., one target. Hit: 1 piercing damage.', '', 'None'),
    

    ('Rakshasa', 'Medium', 'fiend', 'lawful evil', 16, 'natural', 110, 
            '13d8', '13d8+52', '40 ft.', 14, 17, 18, 13, 
            16, 20, 'Skill: Deception, Skill: Insight', 'piercing from magic weapons wielded by good creatures', '', 
            'bludgeoning, piercing, and slashing from nonmagical weapons', '', '60 ft.', 13, 'Common, Infernal', 
            13, 5, 10000, 'Limited Magic Immunity: The rakshasa can''t be affected or detected by spells of 6th level or lower unless it wishes to be. It has advantage on saving throws against all other spells and magical effects.; Innate Spellcasting: The rakshasa''s innate spellcasting ability is Charisma (spell save DC 18, +10 to hit with spell attacks). The rakshasa can innately cast the following spells, requiring no material components:

At will: detect thoughts, disguise self, mage hand, minor illusion
3/day each: charm person, detect magic, invisibility, major image, suggestion
1/day each: dominate person, fly, plane shift, true seeing', 'Multiattack: The rakshasa makes two claw attacks; Claw: Melee Weapon Attack: +7 to hit, reach 5 ft., one target. Hit: 9 (2d6 + 2) slashing damage, and the target is cursed if it is a creature. The magical curse takes effect whenever the target takes a short or long rest, filling the target''s thoughts with horrible images and dreams. The cursed target gains no benefit from finishing a short or long rest. The curse lasts until it is lifted by a remove curse spell or similar magic.', '', 'None'),
    

    ('Rat', 'Tiny', 'beast', 'unaligned', 10, 'dex', 1, 
            '1d4', '1d4-1', '20 ft.', 2, 11, 9, 2, 
            10, 4, '', '', '', 
            '', '', '30 ft.', 10, '', 
            0, 2, 10, 'Keen Smell: The rat has advantage on Wisdom (Perception) checks that rely on smell.', 'Bite: Melee Weapon Attack: +0 to hit, reach 5 ft., one target. Hit: 1 piercing damage.', '', 'None'),
    

    ('Raven', 'Tiny', 'beast', 'unaligned', 12, 'dex', 1, 
            '1d4', '1d4-1', '10 ft.', 2, 14, 8, 2, 
            12, 6, 'Skill: Perception', '', '', 
            '', '', 'None', 13, '', 
            0, 2, 10, 'Mimicry: The raven can mimic simple sounds it has heard, such as a person whispering, a baby crying, or an animal chittering. A creature that hears the sounds can tell they are imitations with a successful DC 10 Wisdom (Insight) check.', 'Beak: Melee Weapon Attack: +4 to hit, reach 5 ft., one target. Hit: 1 piercing damage.', '', 'None'),
    

    ('Red Dragon Wyrmling', 'Medium', 'dragon', 'chaotic evil', 17, 'natural', 75, 
            '10d8', '10d8+30', '30 ft.', 19, 10, 17, 12, 
            11, 15, 'Saving Throw: DEX, Saving Throw: CON, Saving Throw: WIS, Saving Throw: CHA, Skill: Perception, Skill: Stealth', '', '', 
            'fire', '', '60 ft.', 14, 'Draconic', 
            4, 2, 1100, '', 'Bite: Melee Weapon Attack: +6 to hit, reach 5 ft., one target. Hit: 9 (1d10 + 4) piercing damage plus 3 (1d6) fire damage.; Fire Breath: The dragon exhales fire in a 15-foot cone. Each creature in that area must make a DC l3 Dexterity saving throw, taking 24 (7d6) fire damage on a failed save, or half as much damage on a successful one.', '', 'None'),
    

    ('Reef Shark', 'Medium', 'beast', 'unaligned', 12, 'natural', 22, 
            '4d8', '4d8+4', '0 ft.', 14, 13, 13, 1, 
            10, 4, 'Skill: Perception', '', '', 
            '', '', 'None', 12, '', 
            0.5, 2, 100, 'Pack Tactics: The shark has advantage on an attack roll against a creature if at least one of the shark''s allies is within 5 ft. of the creature and the ally isn''t incapacitated.; Water Breathing: The shark can breathe only underwater.', 'Bite: Melee Weapon Attack: +4 to hit, reach 5 ft., one target. Hit: 6 (1d8 + 2) piercing damage.', '', 'None'),
    

    ('Remorhaz', 'Huge', 'monstrosity', 'unaligned', 17, 'natural', 195, 
            '17d12', '17d12+85', '30 ft.', 24, 13, 21, 4, 
            10, 5, '', '', '', 
            'cold, fire', '', '60 ft.', 10, '', 
            11, 4, 7200, 'Heated Body: A creature that touches the remorhaz or hits it with a melee attack while within 5 feet of it takes 10 (3d6) fire damage.', 'Bite: Melee Weapon Attack: +11 to hit, reach 10 ft., one target. Hit: 40 (6d10 + 7) piercing damage plus 10 (3d6) fire damage. If the target is a creature, it is grappled (escape DC 17). Until this grapple ends, the target is restrained, and the remorhaz can''t bite another target.; Swallow: The remorhaz makes one bite attack against a Medium or smaller creature it is grappling. If the attack hits, that creature takes the bite''s damage and is swallowed, and the grapple ends. While swallowed, the creature is blinded and restrained, it has total cover against attacks and other effects outside the remorhaz, and it takes 21 (6d6) acid damage at the start of each of the remorhaz''s turns.
If the remorhaz takes 30 damage or more on a single turn from a creature inside it, the remorhaz must succeed on a DC 15 Constitution saving throw at the end of that turn or regurgitate all swallowed creatures, which fall prone in a space within 10 feet of the remorhaz. If the remorhaz dies, a swallowed creature is no longer restrained by it and can escape from the corpse using 15 feet of movement, exiting prone.', '', 'None'),
    

    ('Rhinoceros', 'Large', 'beast', 'unaligned', 11, 'natural', 45, 
            '6d10', '6d10+12', '40 ft.', 21, 8, 15, 2, 
            12, 6, '', '', '', 
            '', '', 'None', 11, '', 
            2, 2, 450, 'Charge: If the rhinoceros moves at least 20 ft. straight toward a target and then hits it with a gore attack on the same turn, the target takes an extra 9 (2d8) bludgeoning damage. If the target is a creature, it must succeed on a DC 15 Strength saving throw or be knocked prone.', 'Gore: Melee Weapon Attack: +7 to hit, reach 5 ft., one target. Hit: 14 (2d8 + 5) bludgeoning damage.', '', 'None'),
    

    ('Riding Horse', 'Large', 'beast', 'unaligned', 10, 'dex', 13, 
            '2d10', '2d10+2', '60 ft.', 16, 10, 12, 2, 
            11, 7, '', '', '', 
            '', '', 'None', 10, '', 
            0.25, 2, 25, '', 'Hooves: Melee Weapon Attack: +5 to hit, reach 5 ft., one target. Hit: 8 (2d4 + 3) bludgeoning damage.', '', 'None'),
    

    ('Roc', 'Gargantuan', 'monstrosity', 'unaligned', 15, 'natural', 248, 
            '16d20', '16d20+80', '20 ft.', 28, 10, 20, 3, 
            10, 9, 'Saving Throw: DEX, Saving Throw: CON, Saving Throw: WIS, Saving Throw: CHA, Skill: Perception', '', '', 
            '', '', 'None', 14, '', 
            11, 4, 7200, 'Keen Sight: The roc has advantage on Wisdom (Perception) checks that rely on sight.', 'Multiattack: The roc makes two attacks: one with its beak and one with its talons.; Beak: Melee Weapon Attack: +13 to hit, reach 10 ft., one target. Hit: 27 (4d8 + 9) piercing damage.; Talons: Melee Weapon Attack: +13 to hit, reach 5 ft., one target. Hit: 23 (4d6 + 9) slashing damage, and the target is grappled (escape DC 19). Until this grapple ends, the target is restrained, and the roc can''t use its talons on another target.', '', 'None'),
    

    ('Roper', 'Large', 'monstrosity', 'neutral evil', 20, 'natural', 93, 
            '11d10', '11d10+33', '10 ft.', 18, 8, 17, 7, 
            16, 6, 'Skill: Perception, Skill: Stealth', '', '', 
            '', '', '60 ft.', 16, '', 
            5, 3, 1800, 'False Appearance: While the roper remains motionless, it is indistinguishable from a normal cave formation, such as a stalagmite.; Grasping Tendrils: The roper can have up to six tendrils at a time. Each tendril can be attacked (AC 20; 10 hit points; immunity to poison and psychic damage). Destroying a tendril deals no damage to the roper, which can extrude a replacement tendril on its next turn. A tendril can also be broken if a creature takes an action and succeeds on a DC 15 Strength check against it.; Spider Climb: The roper can climb difficult surfaces, including upside down on ceilings, without needing to make an ability check.', 'Multiattack: The roper makes four attacks with its tendrils, uses Reel, and makes one attack with its bite.; Bite: Melee Weapon Attack: +7 to hit, reach 5 ft., one target. Hit: 22 (4d8 + 4) piercing damage.; Tendril: Melee Weapon Attack: +7 to hit, reach 50 ft., one creature. Hit: The target is grappled (escape DC 15). Until the grapple ends, the target is restrained and has disadvantage on Strength checks and Strength saving throws, and the roper can''t use the same tendril on another target.; Reel: The roper pulls each creature grappled by it up to 25 ft. straight toward it.', '', 'None'),
    

    ('Rug of Smothering', 'Large', 'construct', 'unaligned', 12, 'dex', 33, 
            '6d10', '6d10', '10 ft.', 17, 14, 10, 1, 
            3, 1, '', '', '', 
            'poison, psychic', 'Blinded, Charmed, Blinded, Frightened, Paralyzed, Petrified, Poisoned', 'None', 6, '', 
            2, 2, 450, 'Antimagic Susceptibility: The rug is incapacitated while in the area of an antimagic field. If targeted by dispel magic, the rug must succeed on a Constitution saving throw against the caster''s spell save DC or fall unconscious for 1 minute.; Damage Transfer: While it is grappling a creature, the rug takes only half the damage dealt to it, and the creature grappled by the rug takes the other half.; False Appearance: While the rug remains motionless, it is indistinguishable from a normal rug.', 'Smother: Melee Weapon Attack: +5 to hit, reach 5 ft., one Medium or smaller creature. Hit: The creature is grappled (escape DC 13). Until this grapple ends, the target is restrained, blinded, and at risk of suffocating, and the rug can''t smother another target. In addition, at the start of each of the target''s turns, the target takes 10 (2d6 + 3) bludgeoning damage.', '', 'None'),
    

    ('Rust Monster', 'Medium', 'monstrosity', 'unaligned', 14, 'natural', 27, 
            '5d8', '5d8+5', '40 ft.', 13, 12, 13, 2, 
            13, 6, '', '', '', 
            '', '', '60 ft.', 11, '', 
            0.5, 2, 100, 'Iron Scent: The rust monster can pinpoint, by scent, the location of ferrous metal within 30 feet of it.; Rust Metal: Any nonmagical weapon made of metal that hits the rust monster corrodes. After dealing damage, the weapon takes a permanent and cumulative -1 penalty to damage rolls. If its penalty drops to -5, the weapon is destroyed. Nonmagical ammunition made of metal that hits the rust monster is destroyed after dealing damage.', 'Bite: Melee Weapon Attack: +3 to hit, reach 5 ft., one target. Hit: 5 (1d8 + 1) piercing damage.; Antennae: The rust monster corrodes a nonmagical ferrous metal object it can see within 5 feet of it. If the object isn''t being worn or carried, the touch destroys a 1-foot cube of it. If the object is being worn or carried by a creature, the creature can make a DC 11 Dexterity saving throw to avoid the rust monster''s touch.
If the object touched is either metal armor or a metal shield being worn or carried, its takes a permanent and cumulative -1 penalty to the AC it offers. Armor reduced to an AC of 10 or a shield that drops to a +0 bonus is destroyed. If the object touched is a held metal weapon, it rusts as described in the Rust Metal trait.', '', 'None'),
    

    ('Saber-Toothed Tiger', 'Large', 'beast', 'unaligned', 12, 'dex', 52, 
            '7d10', '7d10+14', '40 ft.', 18, 14, 15, 3, 
            12, 8, 'Skill: Perception, Skill: Stealth', '', '', 
            '', '', 'None', 13, '', 
            2, 2, 450, 'Keen Smell: The tiger has advantage on Wisdom (Perception) checks that rely on smell.; Pounce: If the tiger moves at least 20 ft. straight toward a creature and then hits it with a claw attack on the same turn, that target must succeed on a DC 14 Strength saving throw or be knocked prone. If the target is prone, the tiger can make one bite attack against it as a bonus action.', 'Bite: Melee Weapon Attack: +6 to hit, reach 5 ft., one target. Hit: 10 (1d10 + 5) piercing damage.; Claw: Melee Weapon Attack: +6 to hit, reach 5 ft., one target. Hit: 12 (2d6 + 5) slashing damage.', '', 'None'),
    

    ('Sahuagin', 'Medium', 'humanoid', 'lawful evil', 12, 'natural', 22, 
            '4d8', '4d8+4', '30 ft.', 13, 11, 12, 12, 
            13, 9, 'Skill: Perception', '', '', 
            '', '', '120 ft.', 15, 'Sahuagin', 
            0.5, 2, 100, 'Blood Frenzy: The sahuagin has advantage on melee attack rolls against any creature that doesn''t have all its hit points.; Limited Amphibiousness: The sahuagin can breathe air and water, but it needs to be submerged at least once every 4 hours to avoid suffocating.; Shark Telepathy: The sahuagin can magically command any shark within 120 feet of it, using a limited telepathy.', 'Multiattack: The sahuagin makes two melee attacks: one with its bite and one with its claws or spear.; Bite: Melee Weapon Attack: +3 to hit, reach 5 ft., one target. Hit: 3 (1d4 + 1) piercing damage.; Claws: Melee Weapon Attack: +3 to hit, reach 5 ft., one target. Hit: 3 (1d4 + 1) slashing damage.; Spear: Melee or Ranged Weapon Attack: +3 to hit, reach 5 ft. or range 20/60 ft., one target. Hit: 4 (1d6 + 1) piercing damage, or 5 (1d8 + 1) piercing damage if used with two hands to make a melee attack.', '', 'None'),
    

    ('Salamander', 'Large', 'elemental', 'neutral evil', 15, 'natural', 90, 
            '12d10', '12d10+24', '30 ft.', 18, 14, 15, 11, 
            10, 12, '', 'cold', 'bludgeoning, piercing, and slashing from nonmagical weapons', 
            'fire', '', '60 ft.', 10, 'Ignan', 
            5, 3, 1800, 'Heated Body: A creature that touches the salamander or hits it with a melee attack while within 5 ft. of it takes 7 (2d6) fire damage.; Heated Weapons: Any metal melee weapon the salamander wields deals an extra 3 (1d6) fire damage on a hit (included in the attack).', 'Multiattack: The salamander makes two attacks: one with its spear and one with its tail.; Spear: Melee or Ranged Weapon Attack: +7 to hit, reach 5 ft. or range 20 ft./60 ft., one target. Hit: 11 (2d6 + 4) piercing damage, or 13 (2d8 + 4) piercing damage if used with two hands to make a melee attack, plus 3 (1d6) fire damage.; Tail: Melee Weapon Attack: +7 to hit, reach 10 ft., one target. Hit: 11 (2d6 + 4) bludgeoning damage plus 7 (2d6) fire damage, and the target is grappled (escape DC 14). Until this grapple ends, the target is restrained, the salamander can automatically hit the target with its tail, and the salamander can''t make tail attacks against other targets.', '', 'None'),
    

    ('Satyr', 'Medium', 'fey', 'chaotic neutral', 14, 'armor', 31, 
            '7d8', '7d8', '40 ft.', 12, 16, 11, 12, 
            10, 14, 'Skill: Perception, Skill: Performance, Skill: Stealth', '', '', 
            '', '', 'None', 12, 'Common, Elvish, Sylvan', 
            0.5, 2, 100, 'Magic Resistance: The satyr has advantage on saving throws against spells and other magical effects.', 'Ram: Melee Weapon Attack: +3 to hit, reach 5 ft., one target. Hit: 6 (2d4 + 1) bludgeoning damage.; Shortsword: Melee Weapon Attack: +5 to hit, reach 5 ft., one target. Hit: 6 (1 d6 + 3) piercing damage.; Shortbow: Ranged Weapon Attack: +5 to hit, range 80/320 ft., one target. Hit: 6 (1d6 + 3) piercing damage.', '', 'None'),
    

    ('Scorpion', 'Tiny', 'beast', 'unaligned', 11, 'natural', 1, 
            '1d4', '1d4-1', '10 ft.', 2, 11, 8, 1, 
            8, 2, '', '', '', 
            '', '', 'None', 9, '', 
            0, 2, 10, '', 'Sting: Melee Weapon Attack: +2 to hit, reach 5 ft., one creature. Hit: 1 piercing damage, and the target must make a DC 9 Constitution saving throw, taking 4 (1d8) poison damage on a failed save, or half as much damage on a successful one.', '', 'None'),
    

    ('Scout', 'Medium', 'humanoid', 'any alignment', 13, 'armor', 16, 
            '3d8', '3d8+3', '30 ft.', 11, 14, 12, 11, 
            13, 11, 'Skill: Nature, Skill: Perception, Skill: Stealth, Skill: Survival', '', '', 
            '', '', 'None', 15, 'any one language (usually Common)', 
            0.5, 2, 100, 'Keen Hearing and Sight: The scout has advantage on Wisdom (Perception) checks that rely on hearing or sight.', 'Multiattack: The scout makes two melee attacks or two ranged attacks.; Shortsword: Melee Weapon Attack: +4 to hit, reach 5 ft., one target. Hit: 5 (1d6 + 2) piercing damage.; Longbow: Ranged Weapon Attack: +4 to hit, ranged 150/600 ft., one target. Hit: 6 (1d8 + 2) piercing damage.', '', 'None'),
    

    ('Sea Hag', 'Medium', 'fey', 'chaotic evil', 14, 'natural', 52, 
            '7d8', '7d8+21', '30 ft.', 16, 13, 16, 12, 
            12, 13, '', '', '', 
            '', '', '60 ft.', 11, 'Aquan, Common, Giant', 
            2, 2, 450, 'Amphibious: The hag can breathe air and water.; Horrific Appearance: Any humanoid that starts its turn within 30 feet of the hag and can see the hag''s true form must make a DC 11 Wisdom saving throw. On a failed save, the creature is frightened for 1 minute. A creature can repeat the saving throw at the end of each of its turns, with disadvantage if the hag is within line of sight, ending the effect on itself on a success. If a creature''s saving throw is successful or the effect ends for it, the creature is immune to the hag''s Horrific Appearance for the next 24 hours.
Unless the target is surprised or the revelation of the hag''s true form is sudden, the target can avert its eyes and avoid making the initial saving throw. Until the start of its next turn, a creature that averts its eyes has disadvantage on attack rolls against the hag.', 'Claws: Melee Weapon Attack: +5 to hit, reach 5 ft., one target. Hit: 10 (2d6 + 3) slashing damage.; Death Glare: The hag targets one frightened creature she can see within 30 ft. of her. If the target can see the hag, it must succeed on a DC 11 Wisdom saving throw against this magic or drop to 0 hit points.; Illusory Appearance: The hag covers herself and anything she is wearing or carrying with a magical illusion that makes her look like an ugly creature of her general size and humanoid shape. The effect ends if the hag takes a bonus action to end it or if she dies.
The changes wrought by this effect fail to hold up to physical inspection. For example, the hag could appear to have no claws, but someone touching her hand might feel the claws. Otherwise, a creature must take an action to visually inspect the illusion and succeed on a DC 16 Intelligence (Investigation) check to discern that the hag is disguised.', '', 'None'),
    

    ('Sea Horse', 'Tiny', 'beast', 'unaligned', 11, 'dex', 1, 
            '1d4', '1d4-1', '0 ft.', 1, 12, 8, 1, 
            10, 2, '', '', '', 
            '', '', 'None', 10, '', 
            0, 2, 0, 'Water Breathing: The sea horse can breathe only underwater.', '', '', 'None'),
    

    ('Shadow', 'Medium', 'undead', 'chaotic evil', 12, 'dex', 16, 
            '3d8', '3d8+3', '40 ft.', 6, 14, 13, 6, 
            10, 8, 'Skill: Stealth', 'radiant', 'acid, cold, fire, lightning, thunder, bludgeoning, piercing, and slashing from nonmagical weapons', 
            'necrotic, poison', 'Exhaustion, Frightened, Grappled, Paralyzed, Petrified, Poisoned, Prone, Restrained', '60 ft.', 10, '', 
            0.5, 2, 100, 'Amorphous: The shadow can move through a space as narrow as 1 inch wide without squeezing.; Shadow Stealth: While in dim light or darkness, the shadow can take the Hide action as a bonus action. Its stealth bonus is also improved to +6.; Sunlight Weakness: While in sunlight, the shadow has disadvantage on attack rolls, ability checks, and saving throws.', 'Strength Drain: Melee Weapon Attack: +4 to hit, reach 5 ft., one creature. Hit: 9 (2d6 + 2) necrotic damage, and the target''s Strength score is reduced by 1d4. The target dies if this reduces its Strength to 0. Otherwise, the reduction lasts until the target finishes a short or long rest.
If a non-evil humanoid dies from this attack, a new shadow rises from the corpse 1d4 hours later.', '', 'None'),
    

    ('Shambling Mound', 'Large', 'plant', 'unaligned', 15, 'natural', 136, 
            '16d10', '16d10+48', '20 ft.', 18, 8, 16, 5, 
            10, 5, 'Skill: Stealth', '', 'cold, fire', 
            'lightning', 'Blinded, Blinded, Exhaustion', 'None', 10, '', 
            5, 3, 1800, 'Lightning Absorption: Whenever the shambling mound is subjected to lightning damage, it takes no damage and regains a number of hit points equal to the lightning damage dealt.', 'Multiattack: The shambling mound makes two slam attacks. If both attacks hit a Medium or smaller target, the target is grappled (escape DC 14), and the shambling mound uses its Engulf on it.; Slam: Melee Weapon Attack: +7 to hit, reach 5 ft., one target. Hit: 13 (2d8 + 4) bludgeoning damage.; Engulf: The shambling mound engulfs a Medium or smaller creature grappled by it. The engulfed target is blinded, restrained, and unable to breathe, and it must succeed on a DC 14 Constitution saving throw at the start of each of the mound''s turns or take 13 (2d8 + 4) bludgeoning damage. If the mound moves, the engulfed target moves with it. The mound can have only one creature engulfed at a time.', '', 'None'),
    

    ('Shield Guardian', 'Large', 'construct', 'unaligned', 17, 'natural', 142, 
            '15d10', '15d10+60', '30 ft.', 18, 8, 18, 7, 
            10, 3, '', '', '', 
            'poison', 'Charmed, Exhaustion, Frightened, Paralyzed, Poisoned', '60 ft.', 10, 'understands commands given in any language but can''t speak', 
            7, 3, 2900, 'Bound: The shield guardian is magically bound to an amulet. As long as the guardian and its amulet are on the same plane of existence, the amulet''s wearer can telepathically call the guardian to travel to it, and the guardian knows the distance and direction to the amulet. If the guardian is within 60 feet of the amulet''s wearer, half of any damage the wearer takes (rounded up) is transferred to the guardian.; Regeneration: The shield guardian regains 10 hit points at the start of its turn if it has at least 1 hit. point.; Spell Storing: A spellcaster who wears the shield guardian''s amulet can cause the guardian to store one spell of 4th level or lower. To do so, the wearer must cast the spell on the guardian. The spell has no effect but is stored within the guardian. When commanded to do so by the wearer or when a situation arises that was predefined by the spellcaster, the guardian casts the stored spell with any parameters set by the original caster, requiring no components. When the spell is cast or a new spell is stored, any previously stored spell is lost.', 'Multiattack: The guardian makes two fist attacks.; Fist: Melee Weapon Attack: +7 to hit, reach 5 ft., one target. Hit: 11 (2d6 + 4) bludgeoning damage.', '', 'None'),
    

    ('Shrieker', 'Medium', 'plant', 'unaligned', 5, 'dex', 13, 
            '3d8', '3d8', '0 ft.', 1, 1, 10, 1, 
            3, 1, '', '', '', 
            '', 'Blinded, Blinded, Frightened', 'None', 6, '', 
            0, 2, 10, 'False Appearance: While the shrieker remains motionless, it is indistinguishable from an ordinary fungus.', '', '', 'None'),
    

    ('Silver Dragon Wyrmling', 'Medium', 'dragon', 'lawful good', 17, 'natural', 45, 
            '6d8', '6d8+18', '30 ft.', 19, 10, 17, 12, 
            11, 15, 'Saving Throw: DEX, Saving Throw: CON, Saving Throw: WIS, Saving Throw: CHA, Skill: Perception, Skill: Stealth', '', '', 
            'cold', '', '60 ft.', 14, 'Draconic', 
            2, 2, 450, '', 'Bite: Melee Weapon Attack: +6 to hit, reach 5 ft., one target. Hit: 9 (1d10 + 4) piercing damage.; Breath Weapons: The dragon uses one of the following breath weapons.
Cold Breath. The dragon exhales an icy blast in a 15-foot cone. Each creature in that area must make a DC 13 Constitution saving throw, taking 18 (4d8) cold damage on a failed save, or half as much damage on a successful one.
Paralyzing Breath. The dragon exhales paralyzing gas in a 15-foot cone. Each creature in that area must succeed on a DC 13 Constitution saving throw or be paralyzed for 1 minute. A creature can repeat the saving throw at the end of each of its turns, ending the effect on itself on a success.', '', 'None'),
    

    ('Skeleton', 'Medium', 'undead', 'lawful evil', 13, 'armor', 13, 
            '2d8', '2d8+4', '30 ft.', 10, 14, 15, 6, 
            8, 5, '', 'bludgeoning', '', 
            'poison', 'Poisoned, Exhaustion', '60 ft.', 9, 'understands all languages it spoke in life but can''t speak', 
            0.25, 2, 50, '', 'Shortsword: Melee Weapon Attack: +4 to hit, reach 5 ft., one target. Hit: 5 (1d6 + 2) piercing damage.; Shortbow: Ranged Weapon Attack: +4 to hit, range 80/320 ft., one target. Hit: 5 (1d6 + 2) piercing damage.', '', 'None'),
    

    ('Solar', 'Large', 'celestial', 'lawful good', 21, 'natural', 243, 
            '18d10', '18d10+144', '50 ft.', 26, 22, 26, 25, 
            25, 30, 'Saving Throw: INT, Saving Throw: WIS, Saving Throw: CHA, Skill: Perception', '', 'radiant, bludgeoning, piercing, and slashing from nonmagical weapons', 
            'necrotic, poison', 'Charmed, Exhaustion, Frightened, Poisoned', 'None', 24, 'all, telepathy 120 ft.', 
            21, 7, 33000, 'Angelic Weapons: The solar''s weapon attacks are magical. When the solar hits with any weapon, the weapon deals an extra 6d8 radiant damage (included in the attack).; Divine Awareness: The solar knows if it hears a lie.; Innate Spellcasting: The solar''s spell casting ability is Charisma (spell save DC 25). It can innately cast the following spells, requiring no material components:
At will: detect evil and good, invisibility (self only)
3/day each: blade barrier, dispel evil and good, resurrection
1/day each: commune, control weather; Magic Resistance: The solar has advantage on saving throws against spells and other magical effects.', 'Multiattack: The solar makes two greatsword attacks.; Greatsword: Melee Weapon Attack: +15 to hit, reach 5 ft., one target. Hit: 22 (4d6 + 8) slashing damage plus 27 (6d8) radiant damage.; Slaying Longbow: Ranged Weapon Attack: +13 to hit, range 150/600 ft., one target. Hit: 15 (2d8 + 6) piercing damage plus 27 (6d8) radiant damage. If the target is a creature that has 190 hit points or fewer, it must succeed on a DC 15 Constitution saving throw or die.; Flying Sword: The solar releases its greatsword to hover magically in an unoccupied space within 5 ft. of it. If the solar can see the sword, the solar can mentally command it as a bonus action to fly up to 50 ft. and either make one attack against a target or return to the solar''s hands. If the hovering sword is targeted by any effect, the solar is considered to be holding it. The hovering sword falls if the solar dies.; Healing Touch: The solar touches another creature. The target magically regains 40 (8d8 + 4) hit points and is freed from any curse, disease, poison, blindness, or deafness.', 'Teleport: The solar magically teleports, along with any equipment it is wearing or carrying, up to 120 ft. to an unoccupied space it can see.; Searing Burst (Costs 2 Actions): The solar emits magical, divine energy. Each creature of its choice in a 10 -foot radius must make a DC 23 Dexterity saving throw, taking 14 (4d6) fire damage plus 14 (4d6) radiant damage on a failed save, or half as much damage on a successful one.; Blinding Gaze (Costs 3 Actions): The solar targets one creature it can see within 30 ft. of it. If the target can see it, the target must succeed on a DC 15 Constitution saving throw or be blinded until magic such as the lesser restoration spell removes the blindness.', 'None'),
    

    ('Specter', 'Medium', 'undead', 'chaotic evil', 12, 'dex', 22, 
            '5d8', '5d8', '0 ft.', 1, 14, 11, 10, 
            10, 11, '', '', 'acid, cold, fire, lightning, thunder, bludgeoning, piercing, and slashing from nonmagical weapons', 
            'necrotic, poison', 'Charmed, Exhaustion, Grappled, Paralyzed, Petrified, Poisoned, Prone, Restrained, Unconscious', '60 ft.', 10, 'understands all languages it knew in life but can''t speak', 
            1, 2, 200, 'Incorporeal Movement: The specter can move through other creatures and objects as if they were difficult terrain. It takes 5 (1d10) force damage if it ends its turn inside an object.; Sunlight Sensitivity: While in sunlight, the specter has disadvantage on attack rolls, as well as on Wisdom (Perception) checks that rely on sight.', 'Life Drain: Melee Spell Attack: +4 to hit, reach 5 ft., one creature. Hit: 10 (3d6) necrotic damage. The target must succeed on a DC 10 Constitution saving throw or its hit point maximum is reduced by an amount equal to the damage taken. This reduction lasts until the creature finishes a long rest. The target dies if this effect reduces its hit point maximum to 0.', '', 'None'),
    

    ('Spider', 'Tiny', 'beast', 'unaligned', 12, 'dex', 1, 
            '1d4', '1d4-1', '20 ft.', 2, 14, 8, 1, 
            10, 2, 'Skill: Stealth', '', '', 
            '', '', '30 ft.', 12, '', 
            0, 2, 10, 'Spider Climb: The spider can climb difficult surfaces, including upside down on ceilings, without needing to make an ability check.; Web Sense: While in contact with a web, the spider knows the exact location of any other creature in contact with the same web.; Web Walker: The spider ignores movement restrictions caused by webbing.', 'Bite: Melee Weapon Attack: +4 to hit, reach 5 ft., one creature. Hit: 1 piercing damage, and the target must succeed on a DC 9 Constitution saving throw or take 2 (1d4) poison damage.', '', 'None'),
    

    ('Spirit Naga', 'Large', 'monstrosity', 'chaotic evil', 15, 'natural', 75, 
            '10d10', '10d10+20', '40 ft.', 18, 17, 14, 16, 
            15, 16, 'Saving Throw: DEX, Saving Throw: CON, Saving Throw: WIS, Saving Throw: CHA', '', '', 
            'poison', 'Charmed, Poisoned', '60 ft.', 12, 'Abyssal, Common', 
            8, 3, 3900, 'Rejuvenation: If it dies, the naga returns to life in 1d6 days and regains all its hit points. Only a wish spell can prevent this trait from functioning.; Spellcasting: The naga is a 10th-level spellcaster. Its spellcasting ability is Intelligence (spell save DC 14, +6 to hit with spell attacks), and it needs only verbal components to cast its spells. It has the following wizard spells prepared:

- Cantrips (at will): mage hand, minor illusion, ray of frost
- 1st level (4 slots): charm person, detect magic, sleep
- 2nd level (3 slots): detect thoughts, hold person
- 3rd level (3 slots): lightning bolt, water breathing
- 4th level (3 slots): blight, dimension door
- 5th level (2 slots): dominate person', 'Bite: Melee Weapon Attack: +7 to hit, reach 10 ft., one creature. Hit: 7 (1d6 + 4) piercing damage, and the target must make a DC 13 Constitution saving throw, taking 31 (7d8) poison damage on a failed save, or half as much damage on a successful one.', '', 'None'),
    

    ('Sprite', 'Tiny', 'fey', 'neutral good', 15, 'armor', 2, 
            '1d4', '1d4', '10 ft.', 3, 18, 10, 14, 
            13, 11, 'Skill: Perception, Skill: Stealth', '', '', 
            '', '', 'None', 13, 'Common, Elvish, Sylvan', 
            0.25, 2, 50, '', 'Longsword: Melee Weapon Attack: +2 to hit, reach 5 ft., one target. Hit: 1 slashing damage.; Shortbow: Ranged Weapon Attack: +6 to hit, range 40/160 ft., one target. Hit: 1 piercing damage, and the target must succeed on a DC 10 Constitution saving throw or become poisoned for 1 minute. If its saving throw result is 5 or lower, the poisoned target falls unconscious for the same duration, or until it takes damage or another creature takes an action to shake it awake.; Heart Sight: The sprite touches a creature and magically knows the creature''s current emotional state. If the target fails a DC 10 Charisma saving throw, the sprite also knows the creature''s alignment. Celestials, fiends, and undead automatically fail the saving throw.; Invisibility: The sprite magically turns invisible until it attacks or casts a spell, or until its concentration ends (as if concentrating on a spell). Any equipment the sprite wears or carries is invisible with it.', '', 'None'),
    

    ('Spy', 'Medium', 'humanoid', 'any alignment', 12, 'dex', 27, 
            '6d8', '6d8', '30 ft.', 10, 15, 10, 12, 
            14, 16, 'Skill: Deception, Skill: Insight, Skill: Investigation, Skill: Perception, Skill: Persuasion, Skill: Stealth', '', '', 
            '', '', 'None', 16, 'any two languages', 
            1, 2, 200, 'Cunning Action: On each of its turns, the spy can use a bonus action to take the Dash, Disengage, or Hide action.; Sneak Attack (1/Turn): The spy deals an extra 7 (2d6) damage when it hits a target with a weapon attack and has advantage on the attack roll, or when the target is within 5 ft. of an ally of the spy that isn''t incapacitated and the spy doesn''t have disadvantage on the attack roll.', 'Multiattack: The spy makes two melee attacks.; Shortsword: Melee Weapon Attack: +4 to hit, reach 5 ft., one target. Hit: 5 (1d6 + 2) piercing damage.; Hand Crossbow: Ranged Weapon Attack: +4 to hit, range 30/120 ft., one target. Hit: 5 (1d6 + 2) piercing damage.', '', 'None'),
    

    ('Steam Mephit', 'Small', 'elemental', 'neutral evil', 10, 'dex', 21, 
            '6d6', '6d6', '30 ft.', 5, 11, 10, 11, 
            10, 12, '', '', '', 
            'fire, poison', 'Poisoned', '60 ft.', 10, 'Aquan, Ignan', 
            0.25, 2, 50, 'Death Burst: When the mephit dies, it explodes in a cloud of steam. Each creature within 5 ft. of the mephit must succeed on a DC 10 Dexterity saving throw or take 4 (1d8) fire damage.; Innate Spellcasting: The mephit can innately cast blur, requiring no material components. Its innate spellcasting ability is Charisma.', 'Claws: Melee Weapon Attack: +2 to hit, reach 5 ft., one creature. Hit: 2 (1d4) slashing damage plus 2 (1d4) fire damage.; Steam Breath: The mephit exhales a 15-foot cone of scalding steam. Each creature in that area must succeed on a DC 10 Dexterity saving throw, taking 4 (1d8) fire damage on a failed save, or half as much damage on a successful one.', '', 'None'),
    

    ('Stirge', 'Tiny', 'beast', 'unaligned', 14, 'natural', 2, 
            '1d4', '1d4', '10 ft.', 4, 16, 11, 2, 
            8, 6, '', '', '', 
            '', '', '60 ft.', 9, '', 
            0.125, 2, 25, '', 'Blood Drain: Melee Weapon Attack: +5 to hit, reach 5 ft., one creature. Hit: 5 (1d4 + 3) piercing damage, and the stirge attaches to the target. While attached, the stirge doesn''t attack. Instead, at the start of each of the stirge''s turns, the target loses 5 (1d4 + 3) hit points due to blood loss.
The stirge can detach itself by spending 5 feet of its movement. It does so after it drains 10 hit points of blood from the target or the target dies. A creature, including the target, can use its action to detach the stirge.', '', 'None'),
    

    ('Stone Giant', 'Huge', 'giant', 'neutral', 17, 'natural', 126, 
            '11d12', '11d12+55', '40 ft.', 23, 15, 20, 10, 
            12, 9, 'Saving Throw: DEX, Saving Throw: CON, Saving Throw: WIS, Skill: Athletics, Skill: Perception', '', '', 
            '', '', '60 ft.', 14, 'Giant', 
            7, 3, 2900, 'Stone Camouflage: The giant has advantage on Dexterity (Stealth) checks made to hide in rocky terrain.', 'Multiattack: The giant makes two greatclub attacks.; Greatclub: Melee Weapon Attack: +9 to hit, reach 15 ft., one target. Hit: 19 (3d8 + 6) bludgeoning damage.; Rock: Ranged Weapon Attack: +9 to hit, range 60/240 ft., one target. Hit: 28 (4d10 + 6) bludgeoning damage. If the target is a creature, it must succeed on a DC 17 Strength saving throw or be knocked prone.', '', 'None'),
    

    ('Stone Golem', 'Large', 'construct', 'unaligned', 17, 'natural', 178, 
            '17d10', '17d10+85', '30 ft.', 22, 9, 20, 3, 
            11, 1, '', '', '', 
            'poison, psychic, bludgeoning, piercing, and slashing from nonmagical weapons that aren''t adamantine', 'Charmed, Exhaustion, Frightened, Paralyzed, Petrified, Poisoned', '120 ft.', 10, 'understands the languages of its creator but can''t speak', 
            10, 4, 5900, 'Immutable Form: The golem is immune to any spell or effect that would alter its form.; Magic Resistance: The golem has advantage on saving throws against spells and other magical effects.; Magic Weapons: The golem''s weapon attacks are magical.', 'Multiattack: The golem makes two slam attacks.; Slam: Melee Weapon Attack: +10 to hit, reach 5 ft., one target. Hit: 19 (3d8 + 6) bludgeoning damage.; Slow: The golem targets one or more creatures it can see within 10 ft. of it. Each target must make a DC 17 Wisdom saving throw against this magic. On a failed save, a target can''t use reactions, its speed is halved, and it can''t make more than one attack on its turn. In addition, the target can take either an action or a bonus action on its turn, not both. These effects last for 1 minute. A target can repeat the saving throw at the end of each of its turns, ending the effect on itself on a success.', '', 'None'),
    

    ('Storm Giant', 'Huge', 'giant', 'chaotic good', 16, 'armor', 230, 
            '20d12', '20d12+100', '50 ft.', 29, 14, 20, 16, 
            18, 18, 'Saving Throw: STR, Saving Throw: CON, Saving Throw: WIS, Saving Throw: CHA, Skill: Arcana, Skill: Athletics, Skill: History, Skill: Perception', '', 'cold', 
            'lightning, thunder', '', 'None', 19, 'Common, Giant', 
            13, 5, 10000, 'Amphibious: The giant can breathe air and water.; Innate Spellcasting: The giant''s innate spellcasting ability is Charisma (spell save DC 17). It can innately cast the following spells, requiring no material components:

At will: detect magic, feather fall, levitate, light
3/day each: control weather, water breathing', 'Multiattack: The giant makes two greatsword attacks.; Greatsword: Melee Weapon Attack: +14 to hit, reach 10 ft., one target. Hit: 30 (6d6 + 9) slashing damage.; Rock: Ranged Weapon Attack: +14 to hit, range 60/240 ft., one target. Hit: 35 (4d12 + 9) bludgeoning damage.; Lightning Strike: The giant hurls a magical lightning bolt at a point it can see within 500 feet of it. Each creature within 10 feet of that point must make a DC 17 Dexterity saving throw, taking 54 (12d8) lightning damage on a failed save, or half as much damage on a successful one.', '', 'None'),
    

    ('Succubus/Incubus', 'Medium', 'fiend', 'neutral evil', 15, 'natural', 66, 
            '12d8', '12d8+12', '30 ft.', 8, 17, 13, 15, 
            12, 20, 'Skill: Deception, Skill: Insight, Skill: Perception, Skill: Persuasion, Skill: Stealth', '', 'cold, fire, lightning, poison, bludgeoning, piercing, and slashing from nonmagical weapons', 
            '', '', '60 ft.', 15, 'Abyssal, Common, Infernal, telepathy 60 ft.', 
            4, 2, 1100, 'Telepathic Bond: The fiend ignores the range restriction on its telepathy when communicating with a creature it has charmed. The two don''t even need to be on the same plane of existence.; Shapechanger: The fiend can use its action to polymorph into a Small or Medium humanoid, or back into its true form. Without wings, the fiend loses its flying speed. Other than its size and speed, its statistics are the same in each form. Any equipment it is wearing or carrying isn''t transformed. It reverts to its true form if it dies.', 'Claw (Fiend Form Only): Melee Weapon Attack: +5 to hit, reach 5 ft., one target. Hit: 6 (1d6 + 3) slashing damage.; Charm: One humanoid the fiend can see within 30 feet of it must succeed on a DC 15 Wisdom saving throw or be magically charmed for 1 day. The charmed target obeys the fiend''s verbal or telepathic commands. If the target suffers any harm or receives a suicidal command, it can repeat the saving throw, ending the effect on a success. If the target successfully saves against the effect, or if the effect on it ends, the target is immune to this fiend''s Charm for the next 24 hours.
The fiend can have only one target charmed at a time. If it charms another, the effect on the previous target ends.; Draining Kiss: The fiend kisses a creature charmed by it or a willing creature. The target must make a DC 15 Constitution saving throw against this magic, taking 32 (5d10 + 5) psychic damage on a failed save, or half as much damage on a successful one. The target''s hit point maximum is reduced by an amount equal to the damage taken. This reduction lasts until the target finishes a long rest. The target dies if this effect reduces its hit point maximum to 0.; Etherealness: The fiend magically enters the Ethereal Plane from the Material Plane, or vice versa.', '', 'None'),
    

    ('Swarm of Bats', 'Medium', 'swarm of Tiny beasts', 'unaligned', 12, 'dex', 22, 
            '5d8', '5d8', '0 ft.', 5, 15, 10, 2, 
            12, 4, '', '', 'bludgeoning, piercing, slashing', 
            '', 'Charmed, Frightened, Grappled, Paralyzed, Petrified, Prone, Restrained, Stunned', 'None', 11, '', 
            0.25, 2, 50, 'Echolocation: The swarm can''t use its blindsight while deafened.; Keen Hearing: The swarm has advantage on Wisdom (Perception) checks that rely on hearing.; Swarm: The swarm can occupy another creature''s space and vice versa, and the swarm can move through any opening large enough for a Tiny bat. The swarm can''t regain hit points or gain temporary hit points.', 'Bites: Melee Weapon Attack: +4 to hit, reach 0 ft., one creature in the swarm''s space. Hit: 5 (2d4) piercing damage, or 2 (1d4) piercing damage if the swarm has half of its hit points or fewer.', '', 'None'),
    

    ('Swarm of Beetles', 'Medium', 'swarm of Tiny beasts', 'unaligned', 12, 'natural', 22, 
            '5d8', '5d8', '20 ft.', 3, 13, 10, 1, 
            7, 1, '', '', 'bludgeoning, piercing, slashing', 
            '', 'Charmed, Frightened, Grappled, Paralyzed, Petrified, Prone, Restrained, Stunned', 'None', 8, '', 
            0.5, 2, 100, 'Swarm: The swarm can occupy another creature''s space and vice versa, and the swarm can move through any opening large enough for a Tiny insect. The swarm can''t regain hit points or gain temporary hit points.', 'Bites: Melee Weapon Attack: +3 to hit, reach 0 ft., one target in the swarm''s space. Hit: 10 (4d4) piercing damage, or 5 (2d4) piercing damage if the swarm has half of its hit points or fewer.', '', 'None'),
    

    ('Swarm of Centipedes', 'Medium', 'swarm of Tiny beasts', 'unaligned', 12, 'natural', 22, 
            '5d8', '5d8', '20 ft.', 3, 13, 10, 1, 
            7, 1, '', '', 'bludgeoning, piercing, slashing', 
            '', 'Charmed, Frightened, Grappled, Paralyzed, Petrified, Prone, Restrained, Stunned', 'None', 8, '', 
            0.5, 2, 100, 'Swarm: The swarm can occupy another creature''s space and vice versa, and the swarm can move through any opening large enough for a Tiny insect. The swarm can''t regain hit points or gain temporary hit points.', 'Bites: Melee Weapon Attack: +3 to hit, reach 0 ft., one target in the swarm''s space. Hit: 10 (4d4) piercing damage, or 5 (2d4) piercing damage if the swarm has half of its hit points or fewer.
A creature reduced to 0 hit points by a swarm of centipedes is stable but poisoned for 1 hour, even after regaining hit points, and paralyzed while poisoned in this way.', '', 'None'),
    

    ('Swarm of Insects', 'Medium', 'swarm of Tiny beasts', 'unaligned', 12, 'natural', 22, 
            '5d8', '5d8', '20 ft.', 3, 13, 10, 1, 
            7, 1, '', '', 'bludgeoning, piercing, slashing', 
            '', 'Charmed, Frightened, Grappled, Paralyzed, Petrified, Prone, Restrained, Stunned', 'None', 8, '', 
            0.5, 2, 100, 'Swarm: The swarm can occupy another creature''s space and vice versa, and the swarm can move through any opening large enough for a Tiny insect. The swarm can''t regain hit points or gain temporary hit points.', 'Bites: Melee Weapon Attack: +3 to hit, reach 0 ft., one target in the swarm''s space. Hit: 10 (4d4) piercing damage, or 5 (2d4) piercing damage if the swarm has half of its hit points or fewer.', '', 'None'),
    

    ('Swarm of Poisonous Snakes', 'Medium', 'swarm of Tiny beasts', 'unaligned', 14, 'dex', 36, 
            '8d8', '8d8', '30 ft.', 8, 18, 11, 1, 
            10, 3, '', '', 'bludgeoning, piercing, slashing', 
            '', 'Charmed, Frightened, Grappled, Paralyzed, Petrified, Prone, Restrained, Stunned', 'None', 10, '', 
            2, 2, 450, 'Swarm: The swarm can occupy another creature''s space and vice versa, and the swarm can move through any opening large enough for a Tiny snake. The swarm can''t regain hit points or gain temporary hit points.', 'Bites: Melee Weapon Attack: +6 to hit, reach 0 ft., one creature in the swarm''s space. Hit: 7 (2d6) piercing damage, or 3 (1d6) piercing damage if the swarm has half of its hit points or fewer. The target must make a DC 10 Constitution saving throw, taking 14 (4d6) poison damage on a failed save, or half as much damage on a successful one.', '', 'None'),
    

    ('Swarm of Quippers', 'Medium', 'swarm of Tiny beasts', 'unaligned', 13, 'dex', 28, 
            '8d8', '8d8-8', '0 ft.', 13, 16, 9, 1, 
            7, 2, '', '', 'bludgeoning, piercing, slashing', 
            '', 'Charmed, Frightened, Grappled, Paralyzed, Petrified, Prone, Restrained, Stunned', '60 ft.', 8, '', 
            1, 2, 200, 'Blood Frenzy: The swarm has advantage on melee attack rolls against any creature that doesn''t have all its hit points.; Swarm: The swarm can occupy another creature''s space and vice versa, and the swarm can move through any opening large enough for a Tiny quipper. The swarm can''t regain hit points or gain temporary hit points.; Water Breathing: The swarm can breathe only underwater.', 'Bites: Melee Weapon Attack: +5 to hit, reach 0 ft., one creature in the swarm''s space. Hit: 14 (4d6) piercing damage, or 7 (2d6) piercing damage if the swarm has half of its hit points or fewer.', '', 'None'),
    

    ('Swarm of Rats', 'Medium', 'swarm of Tiny beasts', 'unaligned', 10, 'dex', 24, 
            '7d8', '7d8-7', '30 ft.', 9, 11, 9, 2, 
            10, 3, '', '', 'bludgeoning, piercing, slashing', 
            '', 'Charmed, Frightened, Grappled, Paralyzed, Petrified, Prone, Restrained, Stunned', '30 ft.', 10, '', 
            0.25, 2, 50, 'Keen Smell: The swarm has advantage on Wisdom (Perception) checks that rely on smell.; Swarm: The swarm can occupy another creature''s space and vice versa, and the swarm can move through any opening large enough for a Tiny rat. The swarm can''t regain hit points or gain temporary hit points.', 'Bites: Melee Weapon Attack: +2 to hit, reach 0 ft., one target in the swarm''s space. Hit: 7 (2d6) piercing damage, or 3 (1d6) piercing damage if the swarm has half of its hit points or fewer.', '', 'None'),
    

    ('Swarm of Ravens', 'Medium', 'swarm of Tiny beasts', 'unaligned', 12, 'dex', 24, 
            '7d8', '7d8-7', '10 ft.', 6, 14, 8, 3, 
            12, 6, '', '', 'bludgeoning, piercing, slashing', 
            '', 'Charmed, Frightened, Grappled, Paralyzed, Petrified, Prone, Restrained, Stunned', 'None', 15, '', 
            0.25, 2, 50, 'Swarm: The swarm can occupy another creature''s space and vice versa, and the swarm can move through any opening large enough for a Tiny raven. The swarm can''t regain hit points or gain temporary hit points.', 'Beaks: Melee Weapon Attack: +4 to hit, reach 5 ft., one target in the swarm''s space. Hit: 7 (2d6) piercing damage, or 3 (1d6) piercing damage if the swarm has half of its hit points or fewer.', '', 'None'),
    

    ('Swarm of Spiders', 'Medium', 'swarm of Tiny beasts', 'unaligned', 12, 'natural', 22, 
            '5d8', '5d8', '20 ft.', 3, 13, 10, 1, 
            7, 1, '', '', 'bludgeoning, piercing, slashing', 
            '', 'Charmed, Frightened, Paralyzed, Petrified, Prone, Restrained, Stunned', 'None', 8, '', 
            0.5, 2, 100, 'Swarm: The swarm can occupy another creature''s space and vice versa, and the swarm can move through any opening large enough for a Tiny insect. The swarm can''t regain hit points or gain temporary hit points.; Spider Climb: The swarm can climb difficult surfaces, including upside down on ceilings, without needing to make an ability check.; Web Sense: While in contact with a web, the swarm knows the exact location of any other creature in contact with the same web.; Web Walker: The swarm ignores movement restrictions caused by webbing.', 'Bites: Melee Weapon Attack: +3 to hit, reach 0 ft., one target in the swarm''s space. Hit: 10 (4d4) piercing damage, or 5 (2d4) piercing damage if the swarm has half of its hit points or fewer.', '', 'None'),
    

    ('Swarm of Wasps', 'Medium', 'swarm of Tiny beasts', 'unaligned', 12, 'natural', 22, 
            '5d8', '5d8', '5 ft.', 3, 13, 10, 1, 
            7, 1, '', '', 'bludgeoning, piercing, slashing', 
            '', 'Charmed, Frightened, Grappled, Paralyzed, Petrified, Prone, Restrained, Stunned', 'None', 8, '', 
            0.5, 2, 100, 'Swarm: The swarm can occupy another creature''s space and vice versa, and the swarm can move through any opening large enough for a Tiny insect. The swarm can''t regain hit points or gain temporary hit points.', 'Bites: Melee Weapon Attack: +3 to hit, reach 0 ft., one target in the swarm''s space. Hit: 10 (4d4) piercing damage, or 5 (2d4) piercing damage if the swarm has half of its hit points or fewer.', '', 'None'),
    

    ('Tarrasque', 'Gargantuan', 'monstrosity', 'unaligned', 25, 'natural', 676, 
            '33d20', '33d20+330', '40 ft.', 30, 11, 30, 3, 
            11, 11, 'Saving Throw: INT, Saving Throw: WIS, Saving Throw: CHA', '', '', 
            'fire, poison, bludgeoning, piercing, and slashing from nonmagical weapons', 'Charmed, Frightened, Paralyzed, Poisoned', 'None', 10, '', 
            30, 9, 155000, 'Legendary Resistance: If the tarrasque fails a saving throw, it can choose to succeed instead.; Magic Resistance: The tarrasque has advantage on saving throws against spells and other magical effects.; Reflective Carapace: Any time the tarrasque is targeted by a magic missile spell, a line spell, or a spell that requires a ranged attack roll, roll a d6. On a 1 to 5, the tarrasque is unaffected. On a 6, the tarrasque is unaffected, and the effect is reflected back at the caster as though it originated from the tarrasque, turning the caster into the target.; Siege Monster: The tarrasque deals double damage to objects and structures.', 'Multiattack: The tarrasque can use its Frightful Presence. It then makes five attacks: one with its bite, two with its claws, one with its horns, and one with its tail. It can use its Swallow instead of its bite.; Bite: Melee Weapon Attack: +19 to hit, reach 10 ft., one target. Hit: 36 (4d12 + 10) piercing damage. If the target is a creature, it is grappled (escape DC 20). Until this grapple ends, the target is restrained, and the tarrasque can''t bite another target.; Claw: Melee Weapon Attack: +19 to hit, reach 15 ft., one target. Hit: 28 (4d8 + 10) slashing damage.; Horns: Melee Weapon Attack: +19 to hit, reach 10 ft., one target. Hit: 32 (4d10 + 10) piercing damage.; Tail: Melee Weapon Attack: +19 to hit, reach 20 ft., one target. Hit: 24 (4d6 + 10) bludgeoning damage. If the target is a creature, it must succeed on a DC 20 Strength saving throw or be knocked prone.; Frightful Presence: Each creature of the tarrasque''s choice within 120 feet of it and aware of it must succeed on a DC 17 Wisdom saving throw or become frightened for 1 minute. A creature can repeat the saving throw at the end of each of its turns, with disadvantage if the tarrasque is within line of sight, ending the effect on itself on a success. If a creature''s saving throw is successful or the effect ends for it, the creature is immune to the tarrasque''s Frightful Presence for the next 24 hours.; Swallow: The tarrasque makes one bite attack against a Large or smaller creature it is grappling. If the attack hits, the target takes the bite''s damage, the target is swallowed, and the grapple ends. While swallowed, the creature is blinded and restrained, it has total cover against attacks and other effects outside the tarrasque, and it takes 56 (16d6) acid damage at the start of each of the tarrasque''s turns.
If the tarrasque takes 60 damage or more on a single turn from a creature inside it, the tarrasque must succeed on a DC 20 Constitution saving throw at the end of that turn or regurgitate all swallowed creatures, which fall prone in a space within 10 feet of the tarrasque. If the tarrasque dies, a swallowed creature is no longer restrained by it and can escape from the corpse by using 30 feet of movement, exiting prone.', 'Attack: The tarrasque makes one claw attack or tail attack.; Move: The tarrasque moves up to half its speed.; Chomp (Costs 2 Actions): The tarrasque makes one bite attack or uses its Swallow.', 'None'),
    

    ('Thug', 'Medium', 'humanoid', 'any non-good alignment', 11, 'armor', 32, 
            '5d8', '5d8+10', '30 ft.', 15, 11, 14, 10, 
            10, 11, 'Skill: Intimidation', '', '', 
            '', '', 'None', 10, 'any one language (usually Common)', 
            0.5, 2, 100, 'Pack Tactics: The thug has advantage on an attack roll against a creature if at least one of the thug''s allies is within 5 ft. of the creature and the ally isn''t incapacitated.', 'Multiattack: The thug makes two melee attacks.; Mace: Melee Weapon Attack: +4 to hit, reach 5 ft., one creature. Hit: 5 (1d6 + 2) bludgeoning damage.; Heavy Crossbow: Ranged Weapon Attack: +2 to hit, range 100/400 ft., one target. Hit: 5 (1d10) piercing damage.', '', 'None'),
    

    ('Tiger', 'Large', 'beast', 'unaligned', 12, 'dex', 37, 
            '5d10', '5d10+10', '40 ft.', 17, 15, 14, 3, 
            12, 8, 'Skill: Perception, Skill: Stealth', '', '', 
            '', '', '60 ft.', 13, '', 
            1, 2, 200, 'Keen Smell: The tiger has advantage on Wisdom (Perception) checks that rely on smell.; Pounce: If the tiger moves at least 20 ft. straight toward a creature and then hits it with a claw attack on the same turn, that target must succeed on a DC 13 Strength saving throw or be knocked prone. If the target is prone, the tiger can make one bite attack against it as a bonus action.', 'Bite: Melee Weapon Attack: +5 to hit, reach 5 ft., one target. Hit: 8 (1d10 + 3) piercing damage.; Claw: Melee Weapon Attack: +5 to hit, reach 5 ft., one target. Hit: 7 (1d8 + 3) slashing damage.', '', 'None'),
    

    ('Treant', 'Huge', 'plant', 'chaotic good', 16, 'natural', 138, 
            '12d12', '12d12+60', '30 ft.', 23, 8, 21, 12, 
            16, 12, '', 'fire', 'bludgeoning, piercing', 
            '', '', 'None', 13, 'Common, Druidic, Elvish, Sylvan', 
            9, 4, 5000, 'False Appearance: While the treant remains motionless, it is indistinguishable from a normal tree.; Siege Monster: The treant deals double damage to objects and structures.', 'Multiattack: The treant makes two slam attacks.; Slam: Melee Weapon Attack: +10 to hit, reach 5 ft., one target. Hit: 16 (3d6 + 6) bludgeoning damage.; Rock: Ranged Weapon Attack: +10 to hit, range 60/180 ft., one target. Hit: 28 (4d10 + 6) bludgeoning damage.; Animate Trees: The treant magically animates one or two trees it can see within 60 feet of it. These trees have the same statistics as a treant, except they have Intelligence and Charisma scores of 1, they can''t speak, and they have only the Slam action option. An animated tree acts as an ally of the treant. The tree remains animate for 1 day or until it dies; until the treant dies or is more than 120 feet from the tree; or until the treant takes a bonus action to turn it back into an inanimate tree. The tree then takes root if possible.', '', 'None'),
    

    ('Tribal Warrior', 'Medium', 'humanoid', 'any alignment', 12, 'armor', 11, 
            '2d8', '2d8+2', '30 ft.', 13, 11, 12, 8, 
            11, 8, '', '', '', 
            '', '', 'None', 10, 'any one language', 
            0.125, 2, 25, 'Pack Tactics: The warrior has advantage on an attack roll against a creature if at least one of the warrior''s allies is within 5 ft. of the creature and the ally isn''t incapacitated.', 'Spear: Melee or Ranged Weapon Attack: +3 to hit, reach 5 ft. or range 20/60 ft., one target. Hit: 4 (1d6 + 1) piercing damage, or 5 (1d8 + 1) piercing damage if used with two hands to make a melee attack.', '', 'None'),
    

    ('Triceratops', 'Huge', 'beast', 'unaligned', 13, 'natural', 95, 
            '10d12', '10d12+30', '50 ft.', 22, 9, 17, 2, 
            11, 5, '', '', '', 
            '', '', 'None', 10, '', 
            5, 3, 1800, 'Trampling Charge: If the triceratops moves at least 20 ft. straight toward a creature and then hits it with a gore attack on the same turn, that target must succeed on a DC 13 Strength saving throw or be knocked prone. If the target is prone, the triceratops can make one stomp attack against it as a bonus action.', 'Gore: Melee Weapon Attack: +9 to hit, reach 5 ft., one target. Hit: 24 (4d8 + 6) piercing damage.; Stomp: Melee Weapon Attack: +9 to hit, reach 5 ft., one prone creature. Hit: 22 (3d10 + 6) bludgeoning damage', '', 'None'),
    

    ('Troll', 'Large', 'giant', 'chaotic evil', 15, 'natural', 84, 
            '8d10', '8d10+40', '30 ft.', 18, 13, 20, 7, 
            9, 7, 'Skill: Perception', '', '', 
            '', '', '60 ft.', 12, 'Giant', 
            5, 3, 1800, 'Keen Smell: The troll has advantage on Wisdom (Perception) checks that rely on smell.; Regeneration: The troll regains 10 hit points at the start of its turn. If the troll takes acid or fire damage, this trait doesn''t function at the start of the troll''s next turn. The troll dies only if it starts its turn with 0 hit points and doesn''t regenerate.', 'Multiattack: The troll makes three attacks: one with its bite and two with its claws.; Bite: Melee Weapon Attack: +7 to hit, reach 5 ft., one target. Hit: 7 (1d6 + 4) piercing damage.; Claw: Melee Weapon Attack: +7 to hit, reach 5 ft., one target. Hit: 11 (2d6 + 4) slashing damage.', '', 'None'),
    

    ('Tyrannosaurus Rex', 'Huge', 'beast', 'unaligned', 13, 'natural', 136, 
            '13d12', '13d12+52', '50 ft.', 25, 10, 19, 2, 
            12, 9, 'Skill: Perception', '', '', 
            '', '', 'None', 14, '', 
            8, 3, 3900, '', 'Multiattack: The tyrannosaurus makes two attacks: one with its bite and one with its tail. It can''t make both attacks against the same target.; Bite: Melee Weapon Attack: +10 to hit, reach 10 ft., one target. Hit: 33 (4d12 + 7) piercing damage. If the target is a Medium or smaller creature, it is grappled (escape DC 17). Until this grapple ends, the target is restrained, and the tyrannosaurus can''t bite another target.; Tail: Melee Weapon Attack: +10 to hit, reach 10 ft., one target. Hit: 20 (3d8 + 7) bludgeoning damage.', '', 'None'),
    

    ('Unicorn', 'Large', 'celestial', 'lawful good', 12, 'dex', 67, 
            '9d10', '9d10+18', '50 ft.', 18, 14, 15, 11, 
            17, 16, '', '', '', 
            'poison', 'Charmed, Paralyzed, Poisoned', '60 ft.', 13, 'Celestial, Elvish, Sylvan, telepathy 60 ft.', 
            5, 3, 1800, 'Charge: If the unicorn moves at least 20 ft. straight toward a target and then hits it with a horn attack on the same turn, the target takes an extra 9 (2d8) piercing damage. If the target is a creature, it must succeed on a DC 15 Strength saving throw or be knocked prone.; Innate Spellcasting: The unicorn''s innate spellcasting ability is Charisma (spell save DC 14). The unicorn can innately cast the following spells, requiring no components:

At will: detect evil and good, druidcraft, pass without trace
1/day each: calm emotions, dispel evil and good, entangle; Magic Resistance: The unicorn has advantage on saving throws against spells and other magical effects.; Magic Weapons: The unicorn''s weapon attacks are magical.', 'Multiattack: The unicorn makes two attacks: one with its hooves and one with its horn.; Hooves: Melee Weapon Attack: +7 to hit, reach 5 ft., one target. Hit: 11 (2d6 + 4) bludgeoning damage.; Horn: Melee Weapon Attack: +7 to hit, reach 5 ft., one target. Hit: 8 (1d8 + 4) piercing damage.; Healing Touch: The unicorn touches another creature with its horn. The target magically regains 11 (2d8 + 2) hit points. In addition, the touch removes all diseases and neutralizes all poisons afflicting the target.; Teleport: The unicorn magically teleports itself and up to three willing creatures it can see within 5 ft. of it, along with any equipment they are wearing or carrying, to a location the unicorn is familiar with, up to 1 mile away.', 'Hooves: The unicorn makes one attack with its hooves.; Shimmering Shield (Costs 2 Actions): The unicorn creates a shimmering, magical field around itself or another creature it can see within 60 ft. of it. The target gains a +2 bonus to AC until the end of the unicorn''s next turn.; Heal Self (Costs 3 Actions): The unicorn magically regains 11 (2d8 + 2) hit points.', 'None'),
    

    ('Vampire, Bat Form', 'Medium', 'undead', 'lawful evil', 16, 'natural', 144, 
            '17d8', '17d8+68', '5 ft.', 18, 18, 18, 17, 
            15, 18, 'Saving Throw: DEX, Saving Throw: WIS, Saving Throw: CHA, Skill: Perception, Skill: Stealth', '', 'necrotic, bludgeoning, piercing, and slashing from nonmagical weapons', 
            '', '', '120 ft.', 17, 'the languages it knew in life', 
            13, 5, 10000, 'Shapechanger: If the vampire isn''t in sun light or running water, it can use its action to polymorph into a Tiny bat or a Medium cloud of mist, or back into its true form.
While in bat form, the vampire can''t speak, its walking speed is 5 feet, and it has a flying speed of 30 feet. Its statistics, other than its size and speed, are unchanged. Anything it is wearing transforms with it, but nothing it is carrying does. It reverts to its true form if it dies.
While in mist form, the vampire can''t take any actions, speak, or manipulate objects. It is weightless, has a flying speed of 20 feet, can hover, and can enter a hostile creature''s space and stop there. In addition, if air can pass through a space, the mist can do so without squeezing, and it can''t pass through water. It has advantage on Strength, Dexterity, and Constitution saving throws, and it is immune to all nonmagical damage, except the damage it takes from sunlight.; Legendary Resistance: If the vampire fails a saving throw, it can choose to succeed instead.; Misty Escape: When it drops to 0 hit points outside its resting place, the vampire transforms into a cloud of mist (as in the Shapechanger trait) instead of falling unconscious, provided that it isn''t in sunlight or running water. If it can''t transform, it is destroyed.
While it has 0 hit points in mist form, it can''t revert to its vampire form, and it must reach its resting place within 2 hours or be destroyed. Once in its resting place, it reverts to its vampire form. It is then paralyzed until it regains at least 1 hit point. After spending 1 hour in its resting place with 0 hit points, it regains 1 hit point.; Regeneration: The vampire regains 20 hit points at the start of its turn if it has at least 1 hit point and isn''t in sunlight or running water. If the vampire takes radiant damage or damage from holy water, this trait doesn''t function at the start of the vampire''s next turn.; Spider Climb: The vampire can climb difficult surfaces, including upside down on ceilings, without needing to make an ability check.; Vampire Weaknesses: The vampire has the following flaws:
Forbiddance. The vampire can''t enter a residence without an invitation from one of the occupants.
Harmed by Running Water. The vampire takes 20 acid damage if it ends its turn in running water.
Stake to the Heart. If a piercing weapon made of wood is driven into the vampire''s heart while the vampire is incapacitated in its resting place, the vampire is paralyzed until the stake is removed.
Sunlight Hypersensitivity. The vampire takes 20 radiant damage when it starts its turn in sunlight. While in sunlight, it has disadvantage on attack rolls and ability checks.', 'Bite: Melee Weapon Attack: +9 to hit, reach 5 ft., one willing creature, or a creature that is grappled by the vampire, incapacitated, or restrained. Hit: 7 (1d6 + 4) piercing damage plus 10 (3d6) necrotic damage. The target''s hit point maximum is reduced by an amount equal to the necrotic damage taken, and the vampire regains hit points equal to that amount. The reduction lasts until the target finishes a long rest. The target dies if this effect reduces its hit point maximum to 0. A humanoid slain in this way and then buried in the ground rises the following night as a vampire spawn under the vampire''s control.; Charm: The vampire targets one humanoid it can see within 30 ft. of it. If the target can see the vampire, the target must succeed on a DC 17 Wisdom saving throw against this magic or be charmed by the vampire. The charmed target regards the vampire as a trusted friend to be heeded and protected. Although the target isn''t under the vampire''s control, it takes the vampire''s requests or actions in the most favorable way it can, and it is a willing target for the vampire''s bit attack.
Each time the vampire or the vampire''s companions do anything harmful to the target, it can repeat the saving throw, ending the effect on itself on a success. Otherwise, the effect lasts 24 hours or until the vampire is destroyed, is on a different plane of existence than the target, or takes a bonus action to end the effect.; Children of the Night: The vampire magically calls 2d4 swarms of bats or rats, provided that the sun isn''t up. While outdoors, the vampire can call 3d6 wolves instead. The called creatures arrive in 1d4 rounds, acting as allies of the vampire and obeying its spoken commands. The beasts remain for 1 hour, until the vampire dies, or until the vampire dismisses them as a bonus action.', 'Move: The vampire moves up to its speed without provoking opportunity attacks.; Unarmed Strike: The vampire makes one unarmed strike.; Bite (Costs 2 Actions): The vampire makes one bite attack.', 'None'),
    

    ('Vampire, Mist Form', 'Medium', 'undead', 'lawful evil', 16, 'natural', 144, 
            '17d8', '17d8+68', '0 ft.', 18, 18, 18, 17, 
            15, 18, 'Saving Throw: DEX, Saving Throw: WIS, Saving Throw: CHA, Skill: Perception, Skill: Stealth', '', 'necrotic, bludgeoning, piercing, and slashing from nonmagical weapons', 
            '', '', '120 ft.', 17, 'the languages it knew in life', 
            13, 5, 10000, 'Shapechanger: If the vampire isn''t in sun light or running water, it can use its action to polymorph into a Tiny bat or a Medium cloud of mist, or back into its true form.
While in bat form, the vampire can''t speak, its walking speed is 5 feet, and it has a flying speed of 30 feet. Its statistics, other than its size and speed, are unchanged. Anything it is wearing transforms with it, but nothing it is carrying does. It reverts to its true form if it dies.
While in mist form, the vampire can''t take any actions, speak, or manipulate objects. It is weightless, has a flying speed of 20 feet, can hover, and can enter a hostile creature''s space and stop there. In addition, if air can pass through a space, the mist can do so without squeezing, and it can''t pass through water. It has advantage on Strength, Dexterity, and Constitution saving throws, and it is immune to all nonmagical damage, except the damage it takes from sunlight.; Legendary Resistance: If the vampire fails a saving throw, it can choose to succeed instead.; Misty Escape: When it drops to 0 hit points outside its resting place, the vampire transforms into a cloud of mist (as in the Shapechanger trait) instead of falling unconscious, provided that it isn''t in sunlight or running water. If it can''t transform, it is destroyed.
While it has 0 hit points in mist form, it can''t revert to its vampire form, and it must reach its resting place within 2 hours or be destroyed. Once in its resting place, it reverts to its vampire form. It is then paralyzed until it regains at least 1 hit point. After spending 1 hour in its resting place with 0 hit points, it regains 1 hit point.; Regeneration: The vampire regains 20 hit points at the start of its turn if it has at least 1 hit point and isn''t in sunlight or running water. If the vampire takes radiant damage or damage from holy water, this trait doesn''t function at the start of the vampire''s next turn.; Spider Climb: The vampire can climb difficult surfaces, including upside down on ceilings, without needing to make an ability check.; Vampire Weaknesses: The vampire has the following flaws:
Forbiddance. The vampire can''t enter a residence without an invitation from one of the occupants.
Harmed by Running Water. The vampire takes 20 acid damage if it ends its turn in running water.
Stake to the Heart. If a piercing weapon made of wood is driven into the vampire''s heart while the vampire is incapacitated in its resting place, the vampire is paralyzed until the stake is removed.
Sunlight Hypersensitivity. The vampire takes 20 radiant damage when it starts its turn in sunlight. While in sunlight, it has disadvantage on attack rolls and ability checks.', '', 'Move: The vampire moves up to its speed without provoking opportunity attacks.; Unarmed Strike: The vampire makes one unarmed strike.; Bite (Costs 2 Actions): The vampire makes one bite attack.', 'None'),
    

    ('Vampire Spawn', 'Medium', 'undead', 'neutral evil', 15, 'natural', 82, 
            '11d8', '11d8+33', '30 ft.', 16, 16, 16, 11, 
            10, 12, 'Saving Throw: DEX, Saving Throw: WIS, Skill: Perception, Skill: Stealth', '', 'necrotic, bludgeoning, piercing, and slashing from nonmagical weapons', 
            '', '', '60 ft.', 13, 'the languages it knew in life', 
            5, 3, 1800, 'Regeneration: The vampire regains 10 hit points at the start of its turn if it has at least 1 hit point and isn''t in sunlight or running water. If the vampire takes radiant damage or damage from holy water, this trait doesn''t function at the start of the vampire''s next turn.; Spider Climb: The vampire can climb difficult surfaces, including upside down on ceilings, without needing to make an ability check.; Vampire Weaknesses: The vampire has the following flaws:
Forbiddance. The vampire can''t enter a residence without an invitation from one of the occupants.
Harmed by Running Water. The vampire takes 20 acid damage when it ends its turn in running water.
Stake to the Heart. The vampire is destroyed if a piercing weapon made of wood is driven into its heart while it is incapacitated in its resting place.
Sunlight Hypersensitivity. The vampire takes 20 radiant damage when it starts its turn in sunlight. While in sunlight, it has disadvantage on attack rolls and ability checks.', 'Multiattack: The vampire makes two attacks, only one of which can be a bite attack.; Bite: Melee Weapon Attack: +6 to hit, reach 5 ft., one willing creature, or a creature that is grappled by the vampire, incapacitated, or restrained. Hit: 6 (1d6 + 3) piercing damage plus 7 (2d6) necrotic damage. The target''s hit point maximum is reduced by an amount equal to the necrotic damage taken, and the vampire regains hit points equal to that amount. The reduction lasts until the target finishes a long rest. The target dies if this effect reduces its hit point maximum to 0.; Claws: Melee Weapon Attack: +6 to hit, reach 5 ft., one creature. Hit: 8 (2d4 + 3) slashing damage. Instead of dealing damage, the vampire can grapple the target (escape DC 13).', '', 'None'),
    

    ('Vampire, Vampire Form', 'Medium', 'undead', 'lawful evil', 16, 'natural', 144, 
            '17d8', '17d8+68', '30 ft.', 18, 18, 18, 17, 
            15, 18, 'Saving Throw: DEX, Saving Throw: WIS, Saving Throw: CHA, Skill: Perception, Skill: Stealth', '', 'necrotic, bludgeoning, piercing, and slashing from nonmagical weapons', 
            '', '', '120 ft.', 17, 'the languages it knew in life', 
            13, 5, 10000, 'Shapechanger: If the vampire isn''t in sun light or running water, it can use its action to polymorph into a Tiny bat or a Medium cloud of mist, or back into its true form.
While in bat form, the vampire can''t speak, its walking speed is 5 feet, and it has a flying speed of 30 feet. Its statistics, other than its size and speed, are unchanged. Anything it is wearing transforms with it, but nothing it is carrying does. It reverts to its true form if it dies.
While in mist form, the vampire can''t take any actions, speak, or manipulate objects. It is weightless, has a flying speed of 20 feet, can hover, and can enter a hostile creature''s space and stop there. In addition, if air can pass through a space, the mist can do so without squeezing, and it can''t pass through water. It has advantage on Strength, Dexterity, and Constitution saving throws, and it is immune to all nonmagical damage, except the damage it takes from sunlight.; Legendary Resistance: If the vampire fails a saving throw, it can choose to succeed instead.; Misty Escape: When it drops to 0 hit points outside its resting place, the vampire transforms into a cloud of mist (as in the Shapechanger trait) instead of falling unconscious, provided that it isn''t in sunlight or running water. If it can''t transform, it is destroyed.
While it has 0 hit points in mist form, it can''t revert to its vampire form, and it must reach its resting place within 2 hours or be destroyed. Once in its resting place, it reverts to its vampire form. It is then paralyzed until it regains at least 1 hit point. After spending 1 hour in its resting place with 0 hit points, it regains 1 hit point.; Regeneration: The vampire regains 20 hit points at the start of its turn if it has at least 1 hit point and isn''t in sunlight or running water. If the vampire takes radiant damage or damage from holy water, this trait doesn''t function at the start of the vampire''s next turn.; Spider Climb: The vampire can climb difficult surfaces, including upside down on ceilings, without needing to make an ability check.; Vampire Weaknesses: The vampire has the following flaws:
Forbiddance. The vampire can''t enter a residence without an invitation from one of the occupants.
Harmed by Running Water. The vampire takes 20 acid damage if it ends its turn in running water.
Stake to the Heart. If a piercing weapon made of wood is driven into the vampire''s heart while the vampire is incapacitated in its resting place, the vampire is paralyzed until the stake is removed.
Sunlight Hypersensitivity. The vampire takes 20 radiant damage when it starts its turn in sunlight. While in sunlight, it has disadvantage on attack rolls and ability checks.', 'Multiattack: The vampire makes two attacks, only one of which can be a bite attack.; Unarmed Strike: Melee Weapon Attack: +9 to hit, reach 5 ft., one creature. Hit: 8 (1d8 + 4) bludgeoning damage. Instead of dealing damage, the vampire can grapple the target (escape DC 18).; Bite: Melee Weapon Attack: +9 to hit, reach 5 ft., one willing creature, or a creature that is grappled by the vampire, incapacitated, or restrained. Hit: 7 (1d6 + 4) piercing damage plus 10 (3d6) necrotic damage. The target''s hit point maximum is reduced by an amount equal to the necrotic damage taken, and the vampire regains hit points equal to that amount. The reduction lasts until the target finishes a long rest. The target dies if this effect reduces its hit point maximum to 0. A humanoid slain in this way and then buried in the ground rises the following night as a vampire spawn under the vampire''s control.; Charm: The vampire targets one humanoid it can see within 30 ft. of it. If the target can see the vampire, the target must succeed on a DC 17 Wisdom saving throw against this magic or be charmed by the vampire. The charmed target regards the vampire as a trusted friend to be heeded and protected. Although the target isn''t under the vampire''s control, it takes the vampire''s requests or actions in the most favorable way it can, and it is a willing target for the vampire''s bit attack.
Each time the vampire or the vampire''s companions do anything harmful to the target, it can repeat the saving throw, ending the effect on itself on a success. Otherwise, the effect lasts 24 hours or until the vampire is destroyed, is on a different plane of existence than the target, or takes a bonus action to end the effect.; Children of the Night: The vampire magically calls 2d4 swarms of bats or rats, provided that the sun isn''t up. While outdoors, the vampire can call 3d6 wolves instead. The called creatures arrive in 1d4 rounds, acting as allies of the vampire and obeying its spoken commands. The beasts remain for 1 hour, until the vampire dies, or until the vampire dismisses them as a bonus action.', 'Move: The vampire moves up to its speed without provoking opportunity attacks.; Unarmed Strike: The vampire makes one unarmed strike.; Bite (Costs 2 Actions): The vampire makes one bite attack.', 'None'),
    

    ('Veteran', 'Medium', 'humanoid', 'any alignment', 17, 'armor', 58, 
            '9d8', '9d8+18', '30 ft.', 16, 13, 14, 10, 
            11, 10, 'Skill: Athletics, Skill: Perception', '', '', 
            '', '', 'None', 12, 'any one language (usually Common)', 
            3, 2, 700, '', 'Multiattack: The veteran makes two longsword attacks. If it has a shortsword drawn, it can also make a shortsword attack.; Longsword: Melee Weapon Attack: +5 to hit, reach 5 ft., one target. Hit: 7 (1d8 + 3) slashing damage, or 8 (1d10 + 3) slashing damage if used with two hands.; Shortsword: Melee Weapon Attack: +5 to hit, reach 5 ft., one target. Hit: 6 (1d6 + 3) piercing damage.; Heavy Crossbow: Ranged Weapon Attack: +3 to hit, range 100/400 ft., one target. Hit: 6 (1d10 + 1) piercing damage.', '', 'None'),
    

    ('Violet Fungus', 'Medium', 'plant', 'unaligned', 5, 'dex', 18, 
            '4d8', '4d8', '5 ft.', 3, 1, 10, 1, 
            3, 1, '', '', '', 
            '', 'Blinded, Blinded, Frightened', 'None', 6, '', 
            0.25, 2, 50, 'False Appearance: While the violet fungus remains motionless, it is indistinguishable from an ordinary fungus.', 'Multiattack: The fungus makes 1d4 Rotting Touch attacks.; Rotting Touch: Melee Weapon Attack: +2 to hit, reach 10 ft., one creature. Hit: 4 (1d8) necrotic damage.', '', 'None'),
    

    ('Vrock', 'Large', 'fiend', 'chaotic evil', 15, 'natural', 104, 
            '11d10', '11d10+44', '40 ft.', 17, 15, 18, 8, 
            13, 8, 'Saving Throw: DEX, Saving Throw: WIS, Saving Throw: CHA', '', 'cold, fire, lightning, bludgeoning, piercing, and slashing from nonmagical weapons', 
            'poison', 'Poisoned', '120 ft.', 11, 'Abyssal, telepathy 120 ft.', 
            6, 3, 2300, 'Magic Resistance: The vrock has advantage on saving throws against spells and other magical effects.', 'Multiattack: The vrock makes two attacks: one with its beak and one with its talons.; Beak: Melee Weapon Attack: +6 to hit, reach 5 ft., one target. Hit: 10 (2d6 + 3) piercing damage.; Talons: Melee Weapon Attack: +6 to hit, reach 5 ft., one target. Hit: 14 (2d10 + 3) slashing damage.; Spores: A 15-foot-radius cloud of toxic spores extends out from the vrock. The spores spread around corners. Each creature in that area must succeed on a DC 14 Constitution saving throw or become poisoned. While poisoned in this way, a target takes 5 (1d10) poison damage at the start of each of its turns. A target can repeat the saving throw at the end of each of its turns, ending the effect on itself on a success. Emptying a vial of holy water on the target also ends the effect on it.; Stunning Screech: The vrock emits a horrific screech. Each creature within 20 feet of it that can hear it and that isn''t a demon must succeed on a DC 14 Constitution saving throw or be stunned until the end of the vrock''s next turn .', '', 'None'),
    

    ('Vulture', 'Medium', 'beast', 'unaligned', 10, 'dex', 5, 
            '1d8', '1d8+1', '10 ft.', 7, 10, 13, 2, 
            12, 4, 'Skill: Perception', '', '', 
            '', '', 'None', 13, '', 
            0, 2, 10, 'Keen Sight and Smell: The vulture has advantage on Wisdom (Perception) checks that rely on sight or smell.; Pack Tactics: The vulture has advantage on an attack roll against a creature if at least one of the vulture''s allies is within 5 ft. of the creature and the ally isn''t incapacitated.', 'Beak: Melee Weapon Attack: +2 to hit, reach 5 ft., one target. Hit: 2 (1d4) piercing damage.', '', 'None'),
    

    ('Warhorse', 'Large', 'beast', 'unaligned', 11, 'dex', 19, 
            '3d10', '3d10+3', '60 ft.', 18, 12, 13, 2, 
            12, 7, '', '', '', 
            '', '', 'None', 11, '', 
            0.5, 2, 100, 'Trampling Charge: If the horse moves at least 20 ft. straight toward a creature and then hits it with a hooves attack on the same turn, that target must succeed on a DC 14 Strength saving throw or be knocked prone. If the target is prone, the horse can make another attack with its hooves against it as a bonus action.', 'Hooves: Melee Weapon Attack: +6 to hit, reach 5 ft., one target. Hit: 11 (2d6 + 4) bludgeoning damage.', '', '/api/2014/images/monsters/warhorse.png'),
    

    ('Warhorse Skeleton', 'Large', 'undead', 'lawful evil', 13, 'armor', 22, 
            '3d10', '3d10+6', '60 ft.', 18, 12, 15, 2, 
            8, 5, '', 'bludgeoning', '', 
            'poison', 'Exhaustion, Poisoned', '60 ft.', 9, '', 
            0.5, 2, 100, '', 'Hooves: Melee Weapon Attack: +6 to hit, reach 5 ft., one target. Hit: 11 (2d6 + 4) bludgeoning damage.', '', 'None'),
    

    ('Water Elemental', 'Large', 'elemental', 'neutral', 14, 'natural', 114, 
            '12d10', '12d10+48', '30 ft.', 18, 14, 18, 5, 
            10, 8, '', '', 'acid, bludgeoning, piercing, and slashing from nonmagical weapons', 
            'poison', 'Exhaustion, Grappled, Paralyzed, Petrified, Poisoned, Prone, Restrained, Unconscious', '60 ft.', 10, 'Aquan', 
            5, 3, 1800, 'Water Form: The elemental can enter a hostile creature''s space and stop there. It can move through a space as narrow as 1 inch wide without squeezing.; Freeze: If the elemental takes cold damage, it partially freezes; its speed is reduced by 20 ft. until the end of its next turn.', 'Multiattack: The elemental makes two slam attacks.; Slam: Melee Weapon Attack: +7 to hit, reach 5 ft., one target. Hit: 13 (2d8 + 4) bludgeoning damage.; Whelm: Each creature in the elemental''s space must make a DC 15 Strength saving throw. On a failure, a target takes 13 (2d8 + 4) bludgeoning damage. If it is Large or smaller, it is also grappled (escape DC 14). Until this grapple ends, the target is restrained and unable to breathe unless it can breathe water. If the saving throw is successful, the target is pushed out of the elemental''s space.
The elemental can grapple one Large creature or up to two Medium or smaller creatures at one time. At the start of each of the elemental''s turns, each target grappled by it takes 13 (2d8 + 4) bludgeoning damage. A creature within 5 feet of the elemental can pull a creature or object out of it by taking an action to make a DC 14 Strength and succeeding.', '', '/api/2014/images/monsters/water-elemental.png'),
    

    ('Weasel', 'Tiny', 'beast', 'unaligned', 13, 'dex', 1, 
            '1d4', '1d4-1', '30 ft.', 3, 16, 8, 2, 
            12, 3, 'Skill: Perception, Skill: Stealth', '', '', 
            '', '', 'None', 13, '', 
            0, 2, 10, 'Keen Hearing and Smell: The weasel has advantage on Wisdom (Perception) checks that rely on hearing or smell.', 'Bite: Melee Weapon Attack: +5 to hit, reach 5 ft., one creature. Hit: 1 piercing damage.', '', '/api/2014/images/monsters/weasel.png'),
    

    ('Werebear, Bear Form', 'Medium', 'humanoid', 'neutral good', 11, 'natural', 135, 
            '18d8', '18d8+54', '40 ft.', 19, 10, 17, 11, 
            12, 12, 'Skill: Perception', '', '', 
            'bludgeoning, piercing, and slashing from nonmagical weapons that aren''t silvered', '', 'None', 17, '', 
            5, 3, 1800, 'Shapechanger: The werebear can use its action to polymorph into a Large bear-humanoid hybrid or into a Large bear, or back into its true form, which is humanoid. Its statistics, other than its size and AC, are the same in each form. Any equipment it is wearing or carrying isn''t transformed. It reverts to its true form if it dies.; Keen Smell: The werebear has advantage on Wisdom (Perception) checks that rely on smell.', 'Multiattack: In bear form, the werebear makes two claw attacks. In humanoid form, it makes two greataxe attacks. In hybrid form, it can attack like a bear or a humanoid.; Bite: Melee Weapon Attack: +7 to hit, reach 5 ft., one target. Hit: 15 (2d10 + 4) piercing damage. If the target is a humanoid, it must succeed on a DC 14 Constitution saving throw or be cursed with werebear lycanthropy.; Claw: Melee Weapon Attack: +7 to hit, reach 5 ft., one target. Hit: 13 (2d8 + 4) slashing damage.', '', 'None'),
    

    ('Werebear, Human Form', 'Medium', 'humanoid', 'neutral good', 10, 'dex', 135, 
            '18d8', '18d8+54', '30 ft.', 19, 10, 17, 11, 
            12, 12, 'Skill: Perception', '', '', 
            'bludgeoning, piercing, and slashing from nonmagical weapons that aren''t silvered', '', 'None', 17, 'Common', 
            5, 3, 1800, 'Shapechanger: The werebear can use its action to polymorph into a Large bear-humanoid hybrid or into a Large bear, or back into its true form, which is humanoid. Its statistics, other than its size and AC, are the same in each form. Any equipment it is wearing or carrying isn''t transformed. It reverts to its true form if it dies.; Keen Smell: The werebear has advantage on Wisdom (Perception) checks that rely on smell.', 'Multiattack: In bear form, the werebear makes two claw attacks. In humanoid form, it makes two greataxe attacks. In hybrid form, it can attack like a bear or a humanoid.; Greataxe: Melee Weapon Attack: +7 to hit, reach 5 ft., one target. Hit: 10 (1d12 + 4) slashing damage.', '', 'None'),
    

    ('Werebear, Hybrid Form', 'Medium', 'humanoid', 'neutral good', 11, 'natural', 135, 
            '18d8', '18d8+54', '40 ft.', 19, 10, 17, 11, 
            12, 12, 'Skill: Perception', '', '', 
            'bludgeoning, piercing, and slashing from nonmagical weapons that aren''t silvered', '', 'None', 17, 'Common', 
            5, 3, 1800, 'Shapechanger: The werebear can use its action to polymorph into a Large bear-humanoid hybrid or into a Large bear, or back into its true form, which is humanoid. Its statistics, other than its size and AC, are the same in each form. Any equipment it is wearing or carrying isn''t transformed. It reverts to its true form if it dies.; Keen Smell: The werebear has advantage on Wisdom (Perception) checks that rely on smell.', 'Multiattack: In bear form, the werebear makes two claw attacks. In humanoid form, it makes two greataxe attacks. In hybrid form, it can attack like a bear or a humanoid.; Bite: Melee Weapon Attack: +7 to hit, reach 5 ft., one target. Hit: 15 (2d10 + 4) piercing damage. If the target is a humanoid, it must succeed on a DC 14 Constitution saving throw or be cursed with werebear lycanthropy.; Claw: Melee Weapon Attack: +7 to hit, reach 5 ft., one target. Hit: 13 (2d8 + 4) slashing damage.; Greataxe: Melee Weapon Attack: +7 to hit, reach 5 ft., one target. Hit: 10 (1d12 + 4) slashing damage.', '', 'None'),
    

    ('Wereboar, Boar Form', 'Medium', 'humanoid', 'neutral evil', 11, 'natural', 78, 
            '12d8', '12d8+24', '40 ft.', 17, 10, 15, 10, 
            11, 8, 'Skill: Perception', '', '', 
            'bludgeoning, piercing, and slashing from nonmagical weapons that aren''t silvered', '', 'None', 12, '', 
            4, 2, 1100, 'Shapechanger: The wereboar can use its action to polymorph into a boar-humanoid hybrid or into a boar, or back into its true form, which is humanoid. Its statistics, other than its AC, are the same in each form. Any equipment it is wearing or carrying isn''t transformed. It reverts to its true form if it dies.; Charge (Boar or Hybrid Form Only): If the wereboar moves at least 15 feet straight toward a target and then hits it with its tusks on the same turn, the target takes an extra 7 (2d6) slashing damage. If the target is a creature, it must succeed on a DC 13 Strength saving throw or be knocked prone.; Relentless: If the wereboar takes 14 damage or less that would reduce it to 0 hit points, it is reduced to 1 hit point instead.', 'Tusks: Melee Weapon Attack: +5 to hit, reach 5 ft., one target. Hit: 10 (2d6 + 3) slashing damage. If the target is a humanoid, it must succeed on a DC 12 Constitution saving throw or be cursed with wereboar lycanthropy.', '', 'None'),
    

    ('Wereboar, Human Form', 'Medium', 'humanoid', 'neutral evil', 10, 'dex', 78, 
            '12d8', '12d8+24', '30 ft.', 17, 10, 15, 10, 
            11, 8, 'Skill: Perception', '', '', 
            'bludgeoning, piercing, and slashing from nonmagical weapons that aren''t silvered', '', 'None', 12, 'Common (can''t speak in boar form)', 
            4, 2, 1100, 'Shapechanger: The wereboar can use its action to polymorph into a boar-humanoid hybrid or into a boar, or back into its true form, which is humanoid. Its statistics, other than its AC, are the same in each form. Any equipment it is wearing or carrying isn''t transformed. It reverts to its true form if it dies.; Relentless: If the wereboar takes 14 damage or less that would reduce it to 0 hit points, it is reduced to 1 hit point instead.', 'Multiattack: The wereboar makes two attacks, only one of which can be with its tusks.; Maul: Melee Weapon Attack: +5 to hit, reach 5 ft., one target. Hit: 10 (2d6 + 3) bludgeoning damage.', '', 'None'),
    

    ('Wereboar, Hybrid Form', 'Medium', 'humanoid', 'neutral evil', 11, 'natural', 78, 
            '12d8', '12d8+24', '30 ft.', 17, 10, 15, 10, 
            11, 8, 'Skill: Perception', '', '', 
            'bludgeoning, piercing, and slashing from nonmagical weapons that aren''t silvered', '', 'None', 12, 'Common', 
            4, 2, 1100, 'Shapechanger: The wereboar can use its action to polymorph into a boar-humanoid hybrid or into a boar, or back into its true form, which is humanoid. Its statistics, other than its AC, are the same in each form. Any equipment it is wearing or carrying isn''t transformed. It reverts to its true form if it dies.; Charge (Boar or Hybrid Form Only): If the wereboar moves at least 15 feet straight toward a target and then hits it with its tusks on the same turn, the target takes an extra 7 (2d6) slashing damage. If the target is a creature, it must succeed on a DC 13 Strength saving throw or be knocked prone.; Relentless: If the wereboar takes 14 damage or less that would reduce it to 0 hit points, it is reduced to 1 hit point instead.', 'Multiattack: The wereboar makes two attacks, only one of which can be with its tusks.; Maul: Melee Weapon Attack: +5 to hit, reach 5 ft., one target. Hit: 10 (2d6 + 3) bludgeoning damage.; Tusks: Melee Weapon Attack: +5 to hit, reach 5 ft., one target. Hit: 10 (2d6 + 3) slashing damage. If the target is a humanoid, it must succeed on a DC 12 Constitution saving throw or be cursed with wereboar lycanthropy.', '', 'None'),
    

    ('Wererat, Human Form', 'Medium', 'humanoid', 'lawful evil', 12, 'dex', 33, 
            '6d8', '6d8+6', '30 ft.', 10, 15, 12, 11, 
            10, 8, 'Skill: Perception, Skill: Stealth', '', '', 
            'bludgeoning, piercing, and slashing from nonmagical weapons that aren''t silvered', '', 'None', 12, 'Common', 
            2, 2, 450, 'Shapechanger: The wererat can use its action to polymorph into a rat-humanoid hybrid or into a giant rat, or back into its true form, which is humanoid. Its statistics, other than its size, are the same in each form. Any equipment it is wearing or carrying isn''t transformed. It reverts to its true form if it dies.; Keen Smell: The wererat has advantage on Wisdom (Perception) checks that rely on smell.', 'Multiattack: The wererat makes two attacks, only one of which can be a bite.; Shortsword: Melee Weapon Attack: +4 to hit, reach 5 ft., one target. Hit: 5 (1d6 + 2) piercing damage.; Hand Crossbow: Ranged Weapon Attack: +4 to hit, range 30/120 ft., one target. Hit: 5 (1d6 + 2) piercing damage.', '', 'None'),
    

    ('Wererat, Hybrid Form', 'Medium', 'humanoid', 'lawful evil', 12, 'natural', 33, 
            '6d8', '6d8+6', '30 ft.', 10, 15, 12, 11, 
            10, 8, 'Skill: Perception, Skill: Stealth', '', '', 
            'bludgeoning, piercing, and slashing from nonmagical weapons that aren''t silvered', '', 'None', 12, 'Common', 
            2, 2, 450, 'Shapechanger: The wererat can use its action to polymorph into a rat-humanoid hybrid or into a giant rat, or back into its true form, which is humanoid. Its statistics, other than its size, are the same in each form. Any equipment it is wearing or carrying isn''t transformed. It reverts to its true form if it dies.; Keen Smell: The wererat has advantage on Wisdom (Perception) checks that rely on smell.', 'Multiattack: The wererat makes two attacks, only one of which can be a bite.; Bite: Melee Weapon Attack: +4 to hit, reach 5 ft., one target. Hit: 4 (1d4 + 2) piercing damage. If the target is a humanoid, it must succeed on a DC 11 Constitution saving throw or be cursed with wererat lycanthropy.; Shortsword: Melee Weapon Attack: +4 to hit, reach 5 ft., one target. Hit: 5 (1d6 + 2) piercing damage.; Hand Crossbow: Ranged Weapon Attack: +4 to hit, range 30/120 ft., one target. Hit: 5 (1d6 + 2) piercing damage.', '', 'None'),
    

    ('Wererat, Rat Form', 'Medium', 'humanoid', 'lawful evil', 12, 'natural', 33, 
            '6d8', '6d8+6', '30 ft.', 10, 15, 12, 11, 
            10, 8, 'Skill: Perception, Skill: Stealth', '', '', 
            'bludgeoning, piercing, and slashing from nonmagical weapons that aren''t silvered', '', '60 ft.', 12, '', 
            2, 2, 450, 'Shapechanger: The wererat can use its action to polymorph into a rat-humanoid hybrid or into a giant rat, or back into its true form, which is humanoid. Its statistics, other than its size, are the same in each form. Any equipment it is wearing or carrying isn''t transformed. It reverts to its true form if it dies.; Keen Smell: The wererat has advantage on Wisdom (Perception) checks that rely on smell.', 'Bite: Melee Weapon Attack: +4 to hit, reach 5 ft., one target. Hit: 4 (1d4 + 2) piercing damage. If the target is a humanoid, it must succeed on a DC 11 Constitution saving throw or be cursed with wererat lycanthropy.', '', 'None'),
    

    ('Weretiger, Human Form', 'Medium', 'humanoid', 'neutral', 12, 'dex', 120, 
            '16d8', '16d8+48', '30 ft.', 17, 15, 16, 10, 
            13, 11, 'Skill: Perception, Skill: Stealth', '', '', 
            'bludgeoning, piercing, and slashing from nonmagical weapons that aren''t silvered', '', '60 ft.', 15, 'Common', 
            4, 2, 1100, 'Shapechanger: The weretiger can use its action to polymorph into a tiger-humanoid hybrid or into a tiger, or back into its true form, which is humanoid. Its statistics, other than its size, are the same in each form. Any equipment it is wearing or carrying isn''t transformed. It reverts to its true form if it dies.; Keen Hearing and Smell: The weretiger has advantage on Wisdom (Perception) checks that rely on hearing or smell.', 'Multiattack: In humanoid form, the weretiger makes two scimitar attacks or two longbow attacks. In hybrid form, it can attack like a humanoid or make two claw attacks.; Scimitar: Melee Weapon Attack: +5 to hit, reach 5 ft., one target. Hit: 6 (1d6 + 3) slashing damage.; Longbow: Ranged Weapon Attack: +4 to hit, range 150/600 ft., one target. Hit: 6 (1d8 + 2) piercing damage.', '', 'None'),
    

    ('Weretiger, Hybrid Form', 'Medium', 'humanoid', 'neutral', 12, 'dex', 120, 
            '16d8', '16d8+48', '30 ft.', 17, 15, 16, 10, 
            13, 11, 'Skill: Perception, Skill: Stealth', '', '', 
            'bludgeoning, piercing, and slashing from nonmagical weapons that aren''t silvered', '', '60 ft.', 15, 'Common', 
            4, 2, 1100, 'Shapechanger: The weretiger can use its action to polymorph into a tiger-humanoid hybrid or into a tiger, or back into its true form, which is humanoid. Its statistics, other than its size, are the same in each form. Any equipment it is wearing or carrying isn''t transformed. It reverts to its true form if it dies.; Keen Hearing and Smell: The weretiger has advantage on Wisdom (Perception) checks that rely on hearing or smell.; Pounce: If the weretiger moves at least 15 feet straight toward a creature and then hits it with a claw attack on the same turn, that target must succeed on a DC 14 Strength saving throw or be knocked prone. If the target is prone, the weretiger can make one bite attack against it as a bonus action.', 'Multiattack: In humanoid form, the weretiger makes two scimitar attacks or two longbow attacks. In hybrid form, it can attack like a humanoid or make two claw attacks.; Bite: Melee Weapon Attack: +5 to hit, reach 5 ft., one target. Hit: 8 (1d10 + 3) piercing damage. If the target is a humanoid, it must succeed on a DC 13 Constitution saving throw or be cursed with weretiger lycanthropy.; Claw: Melee Weapon Attack: +5 to hit, reach 5 ft., one target. Hit: 7 (1d8 + 3) slashing damage.; Scimitar: Melee Weapon Attack: +5 to hit, reach 5 ft., one target. Hit: 6 (1d6 + 3) slashing damage.; Longbow: Ranged Weapon Attack: +4 to hit, range 150/600 ft., one target. Hit: 6 (1d8 + 2) piercing damage.', '', 'None'),
    

    ('Weretiger, Tiger Form', 'Medium', 'humanoid', 'neutral', 12, 'natural', 120, 
            '16d8', '16d8+48', '40 ft.', 17, 15, 16, 10, 
            13, 11, 'Skill: Perception, Skill: Stealth', '', '', 
            'bludgeoning, piercing, and slashing from nonmagical weapons that aren''t silvered', '', '60 ft.', 15, '', 
            4, 2, 1100, 'Shapechanger: The weretiger can use its action to polymorph into a tiger-humanoid hybrid or into a tiger, or back into its true form, which is humanoid. Its statistics, other than its size, are the same in each form. Any equipment it is wearing or carrying isn''t transformed. It reverts to its true form if it dies.; Keen Hearing and Smell: The weretiger has advantage on Wisdom (Perception) checks that rely on hearing or smell.; Pounce: If the weretiger moves at least 15 feet straight toward a creature and then hits it with a claw attack on the same turn, that target must succeed on a DC 14 Strength saving throw or be knocked prone. If the target is prone, the weretiger can make one bite attack against it as a bonus action.', 'Bite: Melee Weapon Attack: +5 to hit, reach 5 ft., one target. Hit: 8 (1d10 + 3) piercing damage. If the target is a humanoid, it must succeed on a DC 13 Constitution saving throw or be cursed with weretiger lycanthropy.; Claw: Melee Weapon Attack: +5 to hit, reach 5 ft., one target. Hit: 7 (1d8 + 3) slashing damage.', '', 'None'),
    

    ('Werewolf, Human Form', 'Medium', 'humanoid', 'chaotic evil', 11, 'dex', 58, 
            '9d8', '9d8+18', '30 ft.', 15, 13, 14, 10, 
            11, 10, 'Skill: Perception', '', '', 
            'bludgeoning, piercing, and slashing from nonmagical weapons that aren''t silvered', '', 'None', 14, 'Common', 
            3, 2, 700, 'Shapechanger: The werewolf can use its action to polymorph into a wolf-humanoid hybrid or into a wolf, or back into its true form, which is humanoid. Its statistics, other than its AC, are the same in each form. Any equipment it is wearing or carrying isn''t transformed. It reverts to its true form if it dies.; Keen Hearing and Smell: The werewolf has advantage on Wisdom (Perception) checks that rely on hearing or smell.', 'Multiattack: The werewolf makes two attacks: two with its spear (humanoid form) or one with its bite and one with its claws (hybrid form).; Spear: Melee or Ranged Weapon Attack: +4 to hit, reach 5 ft. or range 20/60 ft., one creature. Hit: 5 (1d6 + 2) piercing damage, or 6 (1d8 + 2) piercing damage if used with two hands to make a melee attack.', '', 'None'),
    

    ('Werewolf, Hybrid Form', 'Medium', 'humanoid', 'chaotic evil', 12, 'natural', 58, 
            '9d8', '9d8+18', '30 ft.', 15, 13, 14, 10, 
            11, 10, 'Skill: Perception', '', '', 
            'bludgeoning, piercing, and slashing from nonmagical weapons that aren''t silvered', '', 'None', 14, 'Common', 
            3, 2, 700, 'Shapechanger: The werewolf can use its action to polymorph into a wolf-humanoid hybrid or into a wolf, or back into its true form, which is humanoid. Its statistics, other than its AC, are the same in each form. Any equipment it is wearing or carrying isn''t transformed. It reverts to its true form if it dies.; Keen Hearing and Smell: The werewolf has advantage on Wisdom (Perception) checks that rely on hearing or smell.', 'Multiattack: The werewolf makes two attacks: two with its spear (humanoid form) or one with its bite and one with its claws (hybrid form).; Bite: Melee Weapon Attack: +4 to hit, reach 5 ft., one target. Hit: 6 (1d8 + 2) piercing damage. If the target is a humanoid, it must succeed on a DC 12 Constitution saving throw or be cursed with werewolf lycanthropy.; Claws: Melee Weapon Attack: +4 to hit, reach 5 ft., one creature. Hit: 7 (2d4 + 2) slashing damage.', '', 'None'),
    

    ('Werewolf, Wolf Form', 'Medium', 'humanoid', 'chaotic evil', 12, 'natural', 58, 
            '9d8', '9d8+18', '40 ft.', 15, 13, 14, 10, 
            11, 10, 'Skill: Perception', '', '', 
            'bludgeoning, piercing, and slashing from nonmagical weapons that aren''t silvered', '', 'None', 14, '', 
            3, 2, 700, 'Shapechanger: The werewolf can use its action to polymorph into a wolf-humanoid hybrid or into a wolf, or back into its true form, which is humanoid. Its statistics, other than its AC, are the same in each form. Any equipment it is wearing or carrying isn''t transformed. It reverts to its true form if it dies.; Keen Hearing and Smell: The werewolf has advantage on Wisdom (Perception) checks that rely on hearing or smell.', 'Bite: Melee Weapon Attack: +4 to hit, reach 5 ft., one target. Hit: 6 (1d8 + 2) piercing damage. If the target is a humanoid, it must succeed on a DC 12 Constitution saving throw or be cursed with werewolf lycanthropy.', '', 'None'),
    

    ('White Dragon Wyrmling', 'Medium', 'dragon', 'chaotic evil', 16, 'natural', 32, 
            '5d8', '5d8+10', '30 ft.', 14, 10, 14, 5, 
            10, 11, 'Saving Throw: DEX, Saving Throw: CON, Saving Throw: WIS, Saving Throw: CHA, Skill: Perception, Skill: Stealth', '', '', 
            'cold', '', '60 ft.', 14, 'Draconic', 
            2, 2, 450, '', 'Bite: Melee Weapon Attack: +4 to hit, reach 5 ft., one target. Hit: 7 (1d10 + 2) piercing damage plus 2 (1d4) cold damage.; Cold Breath: The dragon exhales an icy blast of hail in a 15-foot cone. Each creature in that area must make a DC 12 Constitution saving throw, taking 22 (5d8) cold damage on a failed save, or half as much damage on a successful one.', '', 'None'),
    

    ('Wight', 'Medium', 'undead', 'neutral evil', 14, 'armor', 45, 
            '6d8', '6d8+18', '30 ft.', 15, 14, 16, 10, 
            13, 15, 'Skill: Perception, Skill: Stealth', '', 'necrotic, bludgeoning, piercing, and slashing from nonmagical weapons that aren''t silvered', 
            'poison', 'Exhaustion, Poisoned', '60 ft.', 13, 'the languages it knew in life', 
            3, 2, 700, 'Sunlight Sensitivity: While in sunlight, the wight has disadvantage on attack rolls, as well as on Wisdom (Perception) checks that rely on sight.', 'Multiattack: The wight makes two longsword attacks or two longbow attacks. It can use its Life Drain in place of one longsword attack.; Life Drain: Melee Weapon Attack: +4 to hit, reach 5 ft., one creature. Hit: 5 (1d6 + 2) necrotic damage. The target must succeed on a DC 13 Constitution saving throw or its hit point maximum is reduced by an amount equal to the damage taken. This reduction lasts until the target finishes a long rest. The target dies if this effect reduces its hit point maximum to 0.
A humanoid slain by this attack rises 24 hours later as a zombie under the wight''s control, unless the humanoid is restored to life or its body is destroyed. The wight can have no more than twelve zombies under its control at one time.; Longsword: Melee Weapon Attack: +4 to hit, reach 5 ft., one target. Hit: 6 (1d8 + 2) slashing damage, or 7 (1d10 + 2) slashing damage if used with two hands.; Longbow: Ranged Weapon Attack: +4 to hit, range 150/600 ft., one target. Hit: 6 (1d8 + 2) piercing damage.', '', '/api/2014/images/monsters/wight.png'),
    

    ('Will-o''-Wisp', 'Tiny', 'undead', 'chaotic evil', 19, 'dex', 22, 
            '9d4', '9d4', '0 ft.', 1, 28, 10, 13, 
            14, 11, '', '', 'acid, cold, fire, necrotic, thunder, bludgeoning, piercing, and slashing from nonmagical weapons', 
            'lightning, poison', 'Exhaustion, Grappled, Paralyzed, Poisoned, Prone, Restrained, Unconscious', '120 ft.', 12, 'the languages it knew in life', 
            2, 2, 450, 'Consume Life: As a bonus action, the will-o''-wisp can target one creature it can see within 5 ft. of it that has 0 hit points and is still alive. The target must succeed on a DC 10 Constitution saving throw against this magic or die. If the target dies, the will-o''-wisp regains 10 (3d6) hit points.; Ephemeral: The will-o''-wisp can''t wear or carry anything.; Incorporeal Movement: The will-o''-wisp can move through other creatures and objects as if they were difficult terrain. It takes 5 (1d10) force damage if it ends its turn inside an object.; Variable Illumination: The will-o''-wisp sheds bright light in a 5- to 20-foot radius and dim light for an additional number of ft. equal to the chosen radius. The will-o''-wisp can alter the radius as a bonus action.', 'Shock: Melee Spell Attack: +4 to hit, reach 5 ft., one creature. Hit: 9 (2d8) lightning damage.; Invisibility: The will-o''-wisp and its light magically become invisible until it attacks or uses its Consume Life, or until its concentration ends (as if concentrating on a spell).', '', '/api/2014/images/monsters/will-o-wisp.png'),
    

    ('Winter Wolf', 'Large', 'monstrosity', 'neutral evil', 13, 'natural', 75, 
            '10d10', '10d10+20', '50 ft.', 18, 13, 14, 7, 
            12, 8, 'Skill: Perception, Skill: Stealth', '', '', 
            'cold', '', 'None', 15, 'Common, Giant, Winter Wolf', 
            3, 2, 700, 'Keen Hearing and Smell: The wolf has advantage on Wisdom (Perception) checks that rely on hearing or smell.; Pack Tactics: The wolf has advantage on an attack roll against a creature if at least one of the wolf''s allies is within 5 ft. of the creature and the ally isn''t incapacitated.; Snow Camouflage: The wolf has advantage on Dexterity (Stealth) checks made to hide in snowy terrain.', 'Bite: Melee Weapon Attack: +6 to hit, reach 5 ft., one target. Hit: 11 (2d6 + 4) piercing damage. If the target is a creature, it must succeed on a DC 14 Strength saving throw or be knocked prone.; Cold Breath: The wolf exhales a blast of freezing wind in a 15-foot cone. Each creature in that area must make a DC 12 Dexterity saving throw, taking 18 (4d8) cold damage on a failed save, or half as much damage on a successful one.', '', '/api/2014/images/monsters/winter-wolf.png'),
    

    ('Wolf', 'Medium', 'beast', 'unaligned', 13, 'natural', 11, 
            '2d8', '2d8+2', '40 ft.', 12, 15, 12, 3, 
            12, 6, 'Skill: Perception, Skill: Stealth', '', '', 
            '', '', 'None', 13, '', 
            0.25, 2, 50, 'Keen Hearing and Smell: The wolf has advantage on Wisdom (Perception) checks that rely on hearing or smell.; Pack Tactics: The wolf has advantage on an attack roll against a creature if at least one of the wolf''s allies is within 5 ft. of the creature and the ally isn''t incapacitated.', 'Bite: Melee Weapon Attack: +4 to hit, reach 5 ft., one target. Hit: 7 (2d4 + 2) piercing damage. If the target is a creature, it must succeed on a DC 11 Strength saving throw or be knocked prone.', '', '/api/2014/images/monsters/wolf.png'),
    

    ('Worg', 'Large', 'monstrosity', 'neutral evil', 13, 'natural', 26, 
            '4d10', '4d10+4', '50 ft.', 16, 13, 13, 7, 
            11, 8, 'Skill: Perception', '', '', 
            '', '', '60 ft.', 14, 'Goblin, Worg', 
            0.5, 2, 100, 'Keen Hearing and Smell: The worg has advantage on Wisdom (Perception) checks that rely on hearing or smell.', 'Bite: Melee Weapon Attack: +5 to hit, reach 5 ft., one target. Hit: 10 (2d6 + 3) piercing damage. If the target is a creature, it must succeed on a DC 13 Strength saving throw or be knocked prone.', '', '/api/2014/images/monsters/worg.png'),
    

    ('Wraith', 'Medium', 'undead', 'neutral evil', 13, 'dex', 67, 
            '9d8', '9d8+27', '0 ft.', 6, 16, 16, 12, 
            14, 15, '', '', 'acid, cold, fire, lightning, thunder, bludgeoning, piercing, and slashing from nonmagical weapons that aren''t silvered', 
            'necrotic, poison', 'Charmed, Exhaustion, Grappled, Paralyzed, Petrified, Poisoned, Prone, Restrained', '60 ft.', 12, 'the languages it knew in life', 
            5, 3, 1800, 'Incorporeal Movement: The wraith can move through other creatures and objects as if they were difficult terrain. It takes 5 (1d10) force damage if it ends its turn inside an object.; Sunlight Sensitivity: While in sunlight, the wraith has disadvantage on attack rolls, as well as on Wisdom (Perception) checks that rely on sight.', 'Life Drain: Melee Weapon Attack: +6 to hit, reach 5 ft., one creature. Hit: 21 (4d8 + 3) necrotic damage. The target must succeed on a DC 14 Constitution saving throw or its hit point maximum is reduced by an amount equal to the damage taken. This reduction lasts until the target finishes a long rest. The target dies if this effect reduces its hit point maximum to 0.; Create Specter: The wraith targets a humanoid within 10 feet of it that has been dead for no longer than 1 minute and died violently. The target''s spirit rises as a specter in the space of its corpse or in the nearest unoccupied space. The specter is under the wraith''s control. The wraith can have no more than seven specters under its control at one time.', '', '/api/2014/images/monsters/wraith.png'),
    

    ('Wyvern', 'Large', 'dragon', 'unaligned', 13, 'natural', 110, 
            '13d10', '13d10+39', '20 ft.', 19, 10, 16, 5, 
            12, 6, 'Skill: Perception', '', '', 
            '', '', '60 ft.', 14, '', 
            6, 3, 2300, '', 'Multiattack: The wyvern makes two attacks: one with its bite and one with its stinger. While flying, it can use its claws in place of one other attack.; Bite: Melee Weapon Attack: +7 to hit, reach 10 ft., one creature. Hit: 11 (2d6 + 4) piercing damage.; Claws: Melee Weapon Attack: +7 to hit, reach 5 ft., one target. Hit: 13 (2d8 + 4) slashing damage.; Stinger: Melee Weapon Attack: +7 to hit, reach 10 ft., one creature. Hit: 11 (2d6 + 4) piercing damage. The target must make a DC 15 Constitution saving throw, taking 24 (7d6) poison damage on a failed save, or half as much damage on a successful one.', '', 'None'),
    

    ('Xorn', 'Medium', 'elemental', 'neutral', 19, 'natural', 73, 
            '7d8', '7d8+42', '20 ft.', 17, 10, 22, 11, 
            10, 11, 'Skill: Perception, Skill: Stealth', '', 'piercing and slashing from nonmagical weapons that aren''t adamantine', 
            '', '', '60 ft.', 16, 'Terran', 
            5, 3, 1800, 'Earth Glide: The xorn can burrow through nonmagical, unworked earth and stone. While doing so, the xorn doesn''t disturb the material it moves through.; Stone Camouflage: The xorn has advantage on Dexterity (Stealth) checks made to hide in rocky terrain.; Treasure Sense: The xorn can pinpoint, by scent, the location of precious metals and stones, such as coins and gems, within 60 ft. of it.', 'Multiattack: The xorn makes three claw attacks and one bite attack.; Bite: Melee Weapon Attack: +6 to hit, reach 5 ft., one target. Hit: 13 (3d6 + 3) piercing damage.; Claw: Melee Weapon Attack: +6 to hit, reach 5 ft., one target. Hit: 6 (1d6 + 3) slashing damage.', '', '/api/2014/images/monsters/xorn.png'),
    

    ('Young Black Dragon', 'Large', 'dragon', 'chaotic evil', 18, 'natural', 127, 
            '15d10', '15d10+45', '40 ft.', 19, 14, 17, 12, 
            11, 15, 'Saving Throw: DEX, Saving Throw: CON, Saving Throw: WIS, Saving Throw: CHA, Skill: Perception, Skill: Stealth', '', '', 
            'acid', '', '120 ft.', 16, 'Common, Draconic', 
            7, 3, 2900, 'Amphibious: The dragon can breathe air and water.', 'Multiattack: The dragon makes three attacks: one with its bite and two with its claws.; Bite: Melee Weapon Attack: +7 to hit, reach 10 ft., one target. Hit: 15 (2d10 + 4) piercing damage plus 4 (1d8) acid damage.; Claw: Melee Weapon Attack: +7 to hit, reach 5 ft., one target. Hit: 11 (2d6 + 4) slashing damage.; Acid Breath: The dragon exhales acid in a 30-foot line that is 5 feet wide. Each creature in that line must make a DC 14 Dexterity saving throw, taking 49 (11d8) acid damage on a failed save, or half as much damage on a successful one.', '', '/api/2014/images/monsters/young-black-dragon.png'),
    

    ('Young Blue Dragon', 'Large', 'dragon', 'lawful evil', 18, 'natural', 152, 
            '16d10', '16d10+64', '40 ft.', 21, 10, 19, 14, 
            13, 17, 'Saving Throw: DEX, Saving Throw: CON, Saving Throw: WIS, Saving Throw: CHA, Skill: Perception, Skill: Stealth', '', '', 
            'lightning', '', '120 ft.', 19, 'Common, Draconic', 
            9, 4, 5000, '', 'Multiattack: The dragon makes three attacks: one with its bite and two with its claws.; Bite: Melee Weapon Attack: +9 to hit, reach 10 ft., one target. Hit: 16 (2d10 + 5) piercing damage plus 5 (1d10) lightning damage.; Claw: Melee Weapon Attack: +9 to hit, reach 5 ft., one target. Hit: 12 (2d6 + 5) slashing damage.; Lightning Breath: The dragon exhales lightning in an 60-foot line that is 5 feet wide. Each creature in that line must make a DC 16 Dexterity saving throw, taking 55 (10d10) lightning damage on a failed save, or half as much damage on a successful one.', '', '/api/2014/images/monsters/young-blue-dragon.png'),
    

    ('Young Brass Dragon', 'Large', 'dragon', 'chaotic good', 17, 'natural', 110, 
            '13d10', '13d10+39', '40 ft.', 19, 10, 17, 12, 
            11, 15, 'Saving Throw: DEX, Saving Throw: CON, Saving Throw: WIS, Saving Throw: CHA, Skill: Perception, Skill: Persuasion, Skill: Stealth', '', '', 
            'fire', '', '120 ft.', 16, 'Common, Draconic', 
            6, 3, 2300, '', 'Multiattack: The dragon makes three attacks: one with its bite and two with its claws.; Bite: Melee Weapon Attack: +7 to hit, reach 10 ft., one target. Hit: 15 (2d10 + 4) piercing damage.; Claw: Melee Weapon Attack: +7 to hit, reach 5 ft., one target. Hit: 11 (2d6 + 4) slashing damage.; Breath Weapons: The dragon uses one of the following breath weapons.
Fire Breath. The dragon exhales fire in a 40-foot line that is 5 feet wide. Each creature in that line must make a DC 14 Dexterity saving throw, taking 42 (12d6) fire damage on a failed save, or half as much damage on a successful one.
Sleep Breath. The dragon exhales sleep gas in a 30-foot cone. Each creature in that area must succeed on a DC 14 Constitution saving throw or fall unconscious for 5 minutes. This effect ends for a creature if the creature takes damage or someone uses an action to wake it.', '', '/api/2014/images/monsters/young-brass-dragon.png'),
    

    ('Young Bronze Dragon', 'Large', 'dragon', 'lawful good', 18, 'natural', 142, 
            '15d10', '15d10+60', '40 ft.', 21, 10, 19, 14, 
            13, 17, 'Saving Throw: DEX, Saving Throw: CON, Saving Throw: WIS, Saving Throw: CHA, Skill: Insight, Skill: Perception, Skill: Stealth', '', '', 
            'lightning', '', '120 ft.', 17, 'Common, Draconic', 
            8, 3, 3900, 'Amphibious: The dragon can breathe air and water.', 'Multiattack: The dragon makes three attacks: one with its bite and two with its claws.; Bite: Melee Weapon Attack: +8 to hit, reach 10 ft., one target. Hit: 16 (2d10 + 5) piercing damage.; Claw: Melee Weapon Attack: +8 to hit, reach 5 ft., one target. Hit: 12 (2d6 + 5) slashing damage.; Breath Weapons: The dragon uses one of the following breath weapons.
Lightning Breath. The dragon exhales lightning in a 60-foot line that is 5 feet wide. Each creature in that line must make a DC 15 Dexterity saving throw, taking 55 (10d10) lightning damage on a failed save, or half as much damage on a successful one.
Repulsion Breath. The dragon exhales repulsion energy in a 30-foot cone. Each creature in that area must succeed on a DC 15 Strength saving throw. On a failed save, the creature is pushed 40 feet away from the dragon.', '', '/api/2014/images/monsters/young-bronze-dragon.png'),
    

    ('Young Copper Dragon', 'Large', 'dragon', 'chaotic good', 17, 'natural', 119, 
            '14d10', '14d10+42', '40 ft.', 19, 12, 17, 16, 
            13, 15, 'Saving Throw: DEX, Saving Throw: CON, Saving Throw: WIS, Saving Throw: CHA, Skill: Deception, Skill: Perception, Skill: Stealth', '', '', 
            'acid', '', '120 ft.', 17, 'Common, Draconic', 
            7, 3, 2900, '', 'Multiattack: The dragon makes three attacks: one with its bite and two with its claws.; Bite: Melee Weapon Attack: +7 to hit, reach 10 ft., one target. Hit: 15 (2d10 + 4) piercing damage.; Claw: Melee Weapon Attack: +7 to hit, reach 5 ft., one target. Hit: 11 (2d6 + 4) slashing damage.; Breath Weapons: The dragon uses one of the following breath weapons.
Acid Breath. The dragon exhales acid in an 40-foot line that is 5 feet wide. Each creature in that line must make a DC 14 Dexterity saving throw, taking 40 (9d8) acid damage on a failed save, or half as much damage on a successful one.
Slowing Breath. The dragon exhales gas in a 30-foot cone. Each creature in that area must succeed on a DC 14 Constitution saving throw. On a failed save, the creature can''t use reactions, its speed is halved, and it can''t make more than one attack on its turn. In addition, the creature can use either an action or a bonus action on its turn, but not both. These effects last for 1 minute. The creature can repeat the saving throw at the end of each of its turns, ending the effect on itself with a successful save.', '', '/api/2014/images/monsters/young-copper-dragon.png'),
    

    ('Young Gold Dragon', 'Large', 'dragon', 'lawful good', 18, 'natural', 178, 
            '17d10', '17d10+85', '40 ft.', 23, 14, 21, 16, 
            13, 20, 'Saving Throw: DEX, Saving Throw: CON, Saving Throw: WIS, Saving Throw: CHA, Skill: Insight, Skill: Perception, Skill: Persuasion, Skill: Stealth', '', '', 
            'fire', '', '120 ft.', 19, 'Common, Draconic', 
            10, 4, 5900, 'Amphibious: The dragon can breathe air and water.', 'Multiattack: The dragon makes three attacks: one with its bite and two with its claws.; Bite: Melee Weapon Attack: +10 to hit, reach 10 ft., one target. Hit: 17 (2d10 + 6) piercing damage.; Claw: Melee Weapon Attack: +10 to hit, reach 5 ft., one target. Hit: 13 (2d6 + 6) slashing damage.; Breath Weapons: The dragon uses one of the following breath weapons.
Fire Breath. The dragon exhales fire in a 30-foot cone. Each creature in that area must make a DC 17 Dexterity saving throw, taking 55 (10d10) fire damage on a failed save, or half as much damage on a successful one.
Weakening Breath. The dragon exhales gas in a 30-foot cone. Each creature in that area must succeed on a DC 17 Strength saving throw or have disadvantage on Strength-based attack rolls, Strength checks, and Strength saving throws for 1 minute. A creature can repeat the saving throw at the end of each of its turns, ending the effect on itself on a success.', '', '/api/2014/images/monsters/young-gold-dragon.png'),
    

    ('Young Green Dragon', 'Large', 'dragon', 'lawful evil', 18, 'natural', 136, 
            '16d10', '16d10+48', '40 ft.', 19, 12, 17, 16, 
            13, 15, 'Saving Throw: DEX, Saving Throw: CON, Saving Throw: WIS, Saving Throw: CHA, Skill: Deception, Skill: Perception, Skill: Stealth', '', '', 
            'poison', 'Poisoned', '120 ft.', 17, 'Common, Draconic', 
            8, 3, 3900, 'Amphibious: The dragon can breathe air and water.', 'Multiattack: The dragon makes three attacks: one with its bite and two with its claws.; Bite: Melee Weapon Attack: +7 to hit, reach 10 ft., one target. Hit: 15 (2d10 + 4) piercing damage plus 7 (2d6) poison damage.; Claw: Melee Weapon Attack: +7 to hit, reach 5 ft., one target. Hit: 11 (2d6 + 4) slashing damage.; Poison Breath: The dragon exhales poisonous gas in a 30-foot cone. Each creature in that area must make a DC 14 Constitution saving throw, taking 42 (12d6) poison damage on a failed save, or half as much damage on a successful one.', '', '/api/2014/images/monsters/young-green-dragon.png'),
    

    ('Young Red Dragon', 'Large', 'dragon', 'chaotic evil', 18, 'natural', 178, 
            '17d10', '17d10+85', '40 ft.', 23, 10, 21, 14, 
            11, 19, 'Saving Throw: DEX, Saving Throw: CON, Saving Throw: WIS, Saving Throw: CHA, Skill: Perception, Skill: Stealth', '', '', 
            'fire', '', '120 ft.', 18, 'Common, Draconic', 
            10, 4, 5900, '', 'Multiattack: The dragon makes three attacks: one with its bite and two with its claws.; Bite: Melee Weapon Attack: +10 to hit, reach 10 ft., one target. Hit: 17 (2d10 + 6) piercing damage plus 3 (1d6) fire damage.; Claw: Melee Weapon Attack: +10 to hit, reach 5 ft., one target. Hit: 13 (2d6 + 6) slashing damage.; Fire Breath: The dragon exhales fire in a 30-foot cone. Each creature in that area must make a DC 17 Dexterity saving throw, taking 56 (16d6) fire damage on a failed save, or half as much damage on a successful one.', '', '/api/2014/images/monsters/young-red-dragon.png'),
    

    ('Young Silver Dragon', 'Large', 'dragon', 'lawful good', 18, 'natural', 168, 
            '16d10', '16d10+80', '40 ft.', 23, 10, 21, 14, 
            11, 19, 'Saving Throw: DEX, Saving Throw: CON, Saving Throw: WIS, Saving Throw: CHA, Skill: Arcana, Skill: History, Skill: Perception, Skill: Stealth', '', '', 
            'cold', '', '120 ft.', 18, 'Common, Draconic', 
            9, 4, 5000, '', 'Multiattack: The dragon makes three attacks: one with its bite and two with its claws.; Bite: Melee Weapon Attack: +10 to hit, reach 10 ft., one target. Hit: 17 (2d10 + 6) piercing damage.; Claw: Melee Weapon Attack: +10 to hit, reach 5 ft., one target. Hit: 13 (2d6 + 6) slashing damage.; Breath Weapons: The dragon uses one of the following breath weapons.
Cold Breath. The dragon exhales an icy blast in a 30-foot cone. Each creature in that area must make a DC 17 Constitution saving throw, taking 54 (12d8) cold damage on a failed save, or half as much damage on a successful one.
Paralyzing Breath. The dragon exhales paralyzing gas in a 30-foot cone. Each creature in that area must succeed on a DC 17 Constitution saving throw or be paralyzed for 1 minute. A creature can repeat the saving throw at the end of each of its turns, ending the effect on itself on a success.', '', '/api/2014/images/monsters/young-silver-dragon.png'),
    

    ('Young White Dragon', 'Large', 'dragon', 'chaotic evil', 17, 'natural', 133, 
            '14d10', '14d10+56', '40 ft.', 18, 10, 18, 6, 
            11, 12, 'Saving Throw: DEX, Saving Throw: CON, Saving Throw: WIS, Saving Throw: CHA, Skill: Perception, Skill: Stealth', '', '', 
            'cold', '', '120 ft.', 16, 'Common, Draconic', 
            6, 3, 2300, 'Ice Walk: The dragon can move across and climb icy surfaces without needing to make an ability check. Additionally, difficult terrain composed of ice or snow doesn''t cost it extra moment.', 'Multiattack: The dragon makes three attacks: one with its bite and two with its claws.; Bite: Melee Weapon Attack: +7 to hit, reach 10 ft., one target. Hit: 15 (2d10 + 4) piercing damage plus 4 (1d8) cold damage.; Claw: Melee Weapon Attack: +7 to hit, reach 5 ft., one target. Hit: 11 (2d6 + 4) slashing damage.; Cold Breath: The dragon exhales an icy blast in a 30-foot cone. Each creature in that area must make a DC 15 Constitution saving throw, taking 45 (10d8) cold damage on a failed save, or half as much damage on a successful one.', '', '/api/2014/images/monsters/young-white-dragon.png'),
    

    ('Zombie', 'Medium', 'undead', 'neutral evil', 8, 'dex', 22, 
            '3d8', '3d8+9', '20 ft.', 13, 6, 16, 3, 
            6, 5, 'Saving Throw: WIS', '', '', 
            'poison', 'Poisoned', '60 ft.', 8, 'understands all languages it spoke in life but can''t speak', 
            0.25, 2, 50, 'Undead Fortitude: If damage reduces the zombie to 0 hit points, it must make a Constitution saving throw with a DC of 5+the damage taken, unless the damage is radiant or from a critical hit. On a success, the zombie drops to 1 hit point instead.', 'Slam: Melee Weapon Attack: +3 to hit, reach 5 ft., one target. Hit: 4 (1d6 + 1) bludgeoning damage.', '', '/api/2014/images/monsters/zombie.png');

                          
INSERT INTO spells (name, level, school, casting_time, `range`, duration, description, components, concentration, ritual, attack_type, damage, higher_level, classes, subclasses)
    VALUES
		('Acid Arrow', 2, 'Evocation', '1 action', '90 feet', 'Instantaneous', 'A shimmering green arrow streaks toward a target within range and bursts in a spray of acid. Make a ranged spell attack against the target. On a hit, the target takes 4d4 acid damage immediately and 2d4 acid damage at the end of its next turn. On a miss, the arrow splashes the target with acid for half as much of the initial damage and no damage at the end of its next turn.', 'V, S, M', False, False, 'ranged', 'Acid', 'When you cast this spell using a spell slot of 3rd level or higher, the damage (both initial and later) increases by 1d4 for each slot level above 2nd.', 'Wizard', 'Lore, Land'),
    

    ('Acid Splash', 0, 'Conjuration', '1 action', '60 feet', 'Instantaneous', 'You hurl a bubble of acid. Choose one creature within range, or choose two creatures within range that are within 5 feet of each other. A target must succeed on a dexterity saving throw or take 1d6 acid damage.', 'V, S', False, False, 'None', 'Acid', '', 'Sorcerer, Wizard', 'Lore'),
    

    ('Aid', 2, 'Abjuration', '1 action', '30 feet', '8 hours', 'Your spell bolsters your allies with toughness and resolve. Choose up to three creatures within range. Each target''s hit point maximum and current hit points increase by 5 for the duration.', 'V, S, M', False, False, 'None', 'None', 'When you cast this spell using a spell slot of 3rd level or higher, a target''s hit points increase by an additional 5 for each slot level above 2nd.', 'Cleric, Paladin', 'Lore'),
    

    ('Alarm', 1, 'Abjuration', '1 minute', '30 feet', '8 hours', 'You set an alarm against unwanted intrusion. Choose a door, a window, or an area within range that is no larger than a 20-foot cube. Until the spell ends, an alarm alerts you whenever a Tiny or larger creature touches or enters the warded area. When you cast the spell, you can designate creatures that won''t set off the alarm. You also choose whether the alarm is mental or audible.', 'V, S, M', False, True, 'None', 'None', '', 'Ranger, Wizard', 'Lore'),
    

    ('Alter Self', 2, 'Transmutation', '1 action', 'Self', 'Up to 1 hour', 'You assume a different form. When you cast the spell, choose one of the following options, the effects of which last for the duration of the spell. While the spell lasts, you can end one option as an action to gain the benefits of a different one.', 'V, S', True, False, 'None', 'None', '', 'Sorcerer, Wizard', 'Lore'),
    

    ('Animal Friendship', 1, 'Enchantment', '1 action', '30 feet', '24 hours', 'This spell lets you convince a beast that you mean it no harm. Choose a beast that you can see within range. It must see and hear you. If the beast''s Intelligence is 4 or higher, the spell fails. Otherwise, the beast must succeed on a wisdom saving throw or be charmed by you for the spell''s duration. If you or one of your companions harms the target, the spells ends.', 'V, S, M', False, False, 'None', 'None', '', 'Bard, Druid, Ranger', ''),
    

    ('Animal Messenger', 2, 'Enchantment', '1 action', '30 feet', '24 hours', 'By means of this spell, you use an animal to deliver a message. Choose a Tiny beast you can see within range, such as a squirrel, a blue jay, or a bat. You specify a location, which you must have visited, and a recipient who matches a general description, such as "a man or woman dressed in the uniform of the town guard" or "a red-haired dwarf wearing a pointed hat." You also speak a message of up to twenty-five words. The target beast travels for the duration of the spell toward the specified location, covering about 50 miles per 24 hours for a flying messenger, or 25 miles for other animals.', 'V, S, M', False, True, 'None', 'None', 'If you cast this spell using a spell slot of 3nd level or higher, the duration of the spell increases by 48 hours for each slot level above 2nd.', 'Bard, Druid, Ranger', 'Lore'),
    

    ('Animal Shapes', 8, 'Transmutation', '1 action', '30 feet', 'Up to 24 hours', 'Your magic turns others into beasts. Choose any number of willing creatures that you can see within range. You transform each target into the form of a Large or smaller beast with a challenge rating of 4 or lower. On subsequent turns, you can use your action to transform affected creatures into new forms.', 'V, S', True, False, 'None', 'None', '', 'Druid', ''),
    

    ('Animate Dead', 3, 'Necromancy', '1 minute', '10 feet', 'Instantaneous', 'This spell creates an undead servant. Choose a pile of bones or a corpse of a Medium or Small humanoid within range. Your spell imbues the target with a foul mimicry of life, raising it as an undead creature. The target becomes a skeleton if you chose bones or a zombie if you chose a corpse (the GM has the creature''s game statistics).', 'V, S, M', False, False, 'None', 'None', 'When you cast this spell using a spell slot of 4th level or higher, you animate or reassert control over two additional undead creatures for each slot level above 3rd. Each of the creatures must come from a different corpse or pile of bones.', 'Cleric, Wizard', 'Lore'),
    

    ('Animate Objects', 5, 'Transmutation', '1 action', '120 feet', 'Up to 1 minute', 'Objects come to life at your command. Choose up to ten nonmagical objects within range that are not being worn or carried. Medium targets count as two objects, Large targets count as four objects, Huge targets count as eight objects. You can''t animate any object larger than Huge. Each target animates and becomes a creature under your control until the spell ends or until reduced to 0 hit points.', 'V, S', True, False, 'None', 'None', 'If you cast this spell using a spell slot of 6th level or higher, you can animate two additional objects for each slot level above 5th.', 'Bard, Sorcerer, Wizard', ''),
    

    ('Antilife Shell', 5, 'Abjuration', '1 action', 'Self', 'Up to 1 hour', 'A shimmering barrier extends out from you in a 10-foot radius and moves with you, remaining centered on you and hedging out creatures other than undead and constructs. The barrier lasts for the duration.', 'V, S', True, False, 'None', 'None', '', 'Druid', ''),
    

    ('Antimagic Field', 8, 'Abjuration', '1 action', 'Self', 'Up to 1 hour', 'A 10-foot-radius invisible sphere of antimagic surrounds you. This area is divorced from the magical energy that suffuses the multiverse. Within the sphere, spells can''t be cast, summoned creatures disappear, and even magic items become mundane. Until the spell ends, the sphere moves with you, centered on you.', 'V, S, M', True, False, 'None', 'None', '', 'Cleric, Wizard', ''),
    

    ('Antipathy/Sympathy', 8, 'Enchantment', '1 hour', '60 feet', '10 days', 'This spell attracts or repels creatures of your choice. You target something within range, either a Huge or smaller object or creature or an area that is no larger than a 200-foot cube. Then specify a kind of intelligent creature, such as red dragons, goblins, or vampires. You invest the target with an aura that either attracts or repels the specified creatures for the duration. Choose antipathy or sympathy as the aura''s effect.', 'V, S, M', False, False, 'None', 'None', '', 'Druid, Wizard', ''),
    

    ('Arcane Eye', 4, 'Divination', '1 action', '30 feet', 'Up to 1 hour', 'You create an invisible, magical eye within range that hovers in the air for the duration.', 'V, S, M', True, False, 'None', 'None', '', 'Cleric, Wizard', ''),
    

    ('Arcane Hand', 5, 'Evocation', '1 action', '120 feet', 'Up to 1 minute', 'You create a Large hand of shimmering, translucent force in an unoccupied space that you can see within range. The hand lasts for the spell''s duration, and it moves at your command, mimicking the movements of your own hand.', 'V, S, M', True, False, 'None', 'None', 'When you cast this spell using a spell slot of 6th level or higher, the damage from the clenched fist option increases by 2d8 and the damage from the grasping hand increases by 2d6 for each slot level above 5th.', 'Wizard', ''),
    

    ('Arcane Lock', 2, 'Abjuration', '1 action', 'Touch', 'Until dispelled', 'You touch a closed door, window, gate, chest, or other entryway, and it becomes locked for the duration. You and the creatures you designate when you cast this spell can open the object normally. You can also set a password that, when spoken within 5 feet of the object, suppresses this spell for 1 minute. Otherwise, it is impassable until it is broken or the spell is dispelled or suppressed. Casting knock on the object suppresses arcane lock for 10 minutes.', 'V, S, M', False, False, 'None', 'None', '', 'Wizard', 'Lore'),
    

    ('Arcane Sword', 7, 'Evocation', '1 action', '60 feet', 'Up to 1 minute', 'You create a sword-shaped plane of force that hovers within range. It lasts for the duration.', 'V, S, M', True, False, 'melee', 'Force', '', 'Bard, Wizard', ''),
    

    ('Arcanist''s Magic Aura', 2, 'Illusion', '1 action', 'Touch', '24 hours', 'You place an illusion on a creature or an object you touch so that divination spells reveal false information about it. The target can be a willing creature or an object that isn''t being carried or worn by another creature.', 'V, S, M', False, False, 'None', 'None', '', 'Wizard', 'Lore'),
    

    ('Astral Projection', 9, 'Necromancy', '1 hour', '10 feet', 'Special', 'You and up to eight willing creatures within range project your astral bodies into the Astral Plane (the spell fails and the casting is wasted if you are already on that plane). The material body you leave behind is unconscious and in a state of suspended animation; it doesn''t need food or air and doesn''t age.', 'V, S, M', False, False, 'None', 'None', '', 'Cleric, Warlock, Wizard', ''),
    

    ('Augury', 2, 'Divination', '1 minute', 'Self', 'Instantaneous', 'By casting gem-inlaid sticks, rolling dragon bones, laying out ornate cards, or employing some other divining tool, you receive an omen from an otherworldly entity about the results of a specific course of action that you plan to take within the next 30 minutes. The GM chooses from the following possible omens:', 'V, S, M', False, True, 'None', 'None', '', 'Cleric', 'Lore'),
    

    ('Awaken', 5, 'Transmutation', '8 hours', 'Touch', 'Instantaneous', 'After spending the casting time tracing magical pathways within a precious gemstone, you touch a Huge or smaller beast or plant. The target must have either no Intelligence score or an Intelligence of 3 or less. The target gains an Intelligence of 10. The target also gains the ability to speak one language you know. If the target is a plant, it gains the ability to move its limbs, roots, vines, creepers, and so forth, and it gains senses similar to a human''s. Your GM chooses statistics appropriate for the awakened plant, such as the statistics for the awakened shrub or the awakened tree.', 'V, S, M', False, False, 'None', 'None', '', 'Bard, Druid', ''),
    

    ('Bane', 1, 'Enchantment', '1 action', '30 feet', 'Up to 1 minute', 'Up to three creatures of your choice that you can see within range must make charisma saving throws. Whenever a target that fails this saving throw makes an attack roll or a saving throw before the spell ends, the target must roll a d4 and subtract the number rolled from the attack roll or saving throw.', 'V, S, M', True, False, 'None', 'None', 'When you cast this spell using a spell slot of 2nd level or higher, you can target one additional creature for each slot level above 1st.', 'Bard, Cleric', 'Lore'),
    

    ('Banishment', 4, 'Abjuration', '1 action', '60 feet', 'Up to 1 minute', 'You attempt to send one creature that you can see within range to another plane of existence. The target must succeed on a charisma saving throw or be banished.', 'V, S, M', True, False, 'None', 'None', 'When you cast this spell using a spell slot of 5th level or higher, you can target one additional creature for each slot level above 4th.', 'Cleric, Paladin, Sorcerer, Warlock, Wizard', ''),
    

    ('Barkskin', 2, 'Transmutation', '1 action', 'Touch', 'Up to 1 hour', 'You touch a willing creature. Until the spell ends, the target''s skin has a rough, bark-like appearance, and the target''s AC can''t be less than 16, regardless of what kind of armor it is wearing.', 'V, S, M', True, False, 'None', 'None', '', 'Druid, Ranger', 'Lore, Land'),
    

    ('Beacon of Hope', 3, 'Abjuration', '1 action', '30 feet', 'Up to 1 minute', 'This spell bestows hope and vitality. Choose any number of creatures within range. For the duration, each target has advantage on wisdom saving throws and death saving throws, and regains the maximum number of hit points possible from any healing.', 'V, S', True, False, 'None', 'None', '', 'Cleric', 'Lore, Life, Devotion'),
    

    ('Bestow Curse', 3, 'Necromancy', '1 action', 'Touch', 'Up to 1 minute', 'You touch a creature, and that creature must succeed on a wisdom saving throw or become cursed for the duration of the spell. When you cast this spell, choose the nature of the curse from the following options:', 'V, S', True, False, 'None', 'None', 'If you cast this spell using a spell slot of 4th level or higher, the duration is concentration, up to 10 minutes. If you use a spell slot of 5th level or higher, the duration is 8 hours. If you use a spell slot of 7th level or higher, the duration is 24 hours. If you use a 9th level spell slot, the spell lasts until it is dispelled. Using a spell slot of 5th level or higher grants a duration that doesn''t require concentration.', 'Bard, Cleric, Wizard', 'Lore'),
    

    ('Black Tentacles', 4, 'Conjuration', '1 action', '90 feet', 'Up to 1 minute', 'Squirming, ebony tentacles fill a 20-foot square on ground that you can see within range. For the duration, these tentacles turn the ground in the area into difficult terrain.', 'V, S, M', True, False, 'None', 'Bludgeoning', '', 'Wizard', ''),
    

    ('Blade Barrier', 6, 'Evocation', '1 action', '90 feet', 'Up to 10 minutes', 'You create a vertical wall of whirling, razor-sharp blades made of magical energy. The wall appears within range and lasts for the duration. You can make a straight wall up to 100 feet long, 20 feet high, and 5 feet thick, or a ringed wall up to 60 feet in diameter, 20 feet high, and 5 feet thick. The wall provides three-quarters cover to creatures behind it, and its space is difficult terrain.', 'V, S', True, False, 'None', 'Slashing', '', 'Cleric', ''),
    

    ('Bless', 1, 'Enchantment', '1 action', '30 feet', 'Up to 1 minute', 'You bless up to three creatures of your choice within range. Whenever a target makes an attack roll or a saving throw before the spell ends, the target can roll a d4 and add the number rolled to the attack roll or saving throw.', 'V, S, M', True, False, 'None', 'None', 'When you cast this spell using a spell slot of 2nd level or higher, you can target one additional creature for each slot level above 1st.', 'Cleric, Paladin', 'Lore, Life'),
    

    ('Blight', 4, 'Necromancy', '1 action', '30 feet', 'Instantaneous', 'Necromantic energy washes over a creature of your choice that you can see within range, draining moisture and vitality from it. The target must make a constitution saving throw. The target takes 8d8 necrotic damage on a failed save, or half as much damage on a successful one. The spell has no effect on undead or constructs.', 'V, S', False, False, 'None', 'Necrotic', 'When you cast this spell using a spell slot of 5th level of higher, the damage increases by 1d8 for each slot level above 4th.', 'Druid, Sorcerer, Warlock, Wizard', 'Land'),
    

    ('Blindness/Deafness', 2, 'Necromancy', '1 action', '30 feet', '1 minute', 'You can blind or deafen a foe. Choose one creature that you can see within range to make a constitution saving throw. If it fails, the target is either blinded or deafened (your choice) for the duration. At the end of each of its turns, the target can make a constitution saving throw. On a success, the spell ends.', 'V', False, False, 'None', 'None', 'When you cast this spell using a spell slot of 3rd level or higher, you can target one additional creature for each slot level above 2nd.', 'Bard, Cleric, Sorcerer, Wizard', 'Lore, Fiend'),
    

    ('Blink', 3, 'Transmutation', '1 action', 'Self', '1 minute', 'Roll a d20 at the end of each of your turns for the duration of the spell. On a roll of 11 or higher, you vanish from your current plane of existence and appear in the Ethereal Plane (the spell fails and the casting is wasted if you were already on that plane). At the start of your next turn, and when the spell ends if you are on the Ethereal Plane, you return to an unoccupied space of your choice that you can see within 10 feet of the space you vanished from. If no unoccupied space is available within that range, you appear in the nearest unoccupied space (chosen at random if more than one space is equally near). You can dismiss this spell as an action.', 'V, S', False, False, 'None', 'None', '', 'Sorcerer, Wizard', 'Lore'),
    

    ('Blur', 2, 'Illusion', '1 action', 'Self', 'Up to 1 minute', 'Your body becomes blurred, shifting and wavering to all who can see you. For the duration, any creature has disadvantage on attack rolls against you. An attacker is immune to this effect if it doesn''t rely on sight, as with blindsight, or can see through illusions, as with truesight.', 'V', True, False, 'None', 'None', '', 'Sorcerer, Wizard', 'Lore, Land'),
    

    ('Branding Smite', 2, 'Evocation', '1 bonus action', 'Self', 'Up to 1 minute', 'The next time you hit a creature with a weapon attack before this spell ends, the weapon gleams with astral radiance as you strike. The attack deals an extra 2d6 radiant damage to the target, which becomes visible if it''s invisible, and the target sheds dim light in a 5-foot radius and can''t become invisible until the spell ends.', 'V', True, False, 'None', 'Radiant', 'When you cast this spell using a spell slot of 3rd level or higher, the extra damage increases by 1d6 for each slot level above 2nd.', 'Paladin', ''),
    

    ('Burning Hands', 1, 'Evocation', '1 action', 'Self', 'Instantaneous', 'As you hold your hands with thumbs touching and fingers spread, a thin sheet of flames shoots forth from your outstretched fingertips. Each creature in a 15-foot cone must make a dexterity saving throw. A creature takes 3d6 fire damage on a failed save, or half as much damage on a successful one.', 'V, S', False, False, 'None', 'Fire', 'When you cast this spell using a spell slot of 2nd level or higher, the damage increases by 1d6 for each slot level above 1st.', 'Sorcerer, Wizard', 'Lore, Fiend'),
    

    ('Call Lightning', 3, 'Conjuration', '1 action', '120 feet', 'Up to 10 minutes', 'A storm cloud appears in the shape of a cylinder that is 10 feet tall with a 60-foot radius, centered on a point you can see 100 feet directly above you. The spell fails if you can''t see a point in the air where the storm cloud could appear (for example, if you are in a room that can''t accommodate the cloud).', 'V, S', True, False, 'None', 'Lightning', 'When you cast this spell using a spell slot of 4th or higher level, the damage increases by 1d10 for each slot level above 3rd.', 'Druid', 'Lore, Land'),
    

    ('Calm Emotions', 2, 'Enchantment', '1 action', '60 feet', 'Up to 1 minute', 'You attempt to suppress strong emotions in a group of people. Each humanoid in a 20-foot-radius sphere centered on a point you choose within range must make a charisma saving throw; a creature can choose to fail this saving throw if it wishes. If a creature fails its saving throw, choose one of the following two effects. You can suppress any effect causing a target to be charmed or frightened. When this spell ends, any suppressed effect resumes, provided that its duration has not expired in the meantime.', 'V, S', True, False, 'None', 'None', '', 'Bard, Cleric', 'Lore'),
    

    ('Chain Lightning', 6, 'Evocation', '1 action', '150 feet', 'Instantaneous', 'You create a bolt of lightning that arcs toward a target of your choice that you can see within range. Three bolts then leap from that target to as many as three other targets, each of which must be within 30 feet of the first target. A target can be a creature or an object and can be targeted by only one of the bolts.', 'V, S, M', False, False, 'None', 'Lightning', 'When you cast this spell using a spell slot of 7th level or higher, one additional bolt leaps from the first target to another target for each slot level above 6th.', 'Sorcerer, Wizard', ''),
    

    ('Charm Person', 1, 'Enchantment', '1 action', '30 feet', '1 hour', 'You attempt to charm a humanoid you can see within range. It must make a wisdom saving throw, and does so with advantage if you or your companions are fighting it. If it fails the saving throw, it is charmed by you until the spell ends or until you or your companions do anything harmful to it. The charmed creature regards you as a friendly acquaintance. When the spell ends, the creature knows it was charmed by you.', 'V, S', False, False, 'None', 'None', 'When you cast this spell using a spell slot of 2nd level or higher, you can target one additional creature for each slot level above 1st. The creatures must be within 30 feet of each other when you target them.', 'Bard, Druid, Sorcerer, Warlock, Wizard', 'Lore'),
    

    ('Chill Touch', 0, 'Necromancy', '1 action', '120 feet', '1 round', 'You create a ghostly, skeletal hand in the space of a creature within range. Make a ranged spell attack against the creature to assail it with the chill of the grave. On a hit, the target takes 1d8 necrotic damage, and it can''t regain hit points until the start of your next turn. Until then, the hand clings to the target.', 'V, S', False, False, 'ranged', 'Necrotic', '', 'Sorcerer, Warlock, Wizard', 'Lore'),
    

    ('Circle of Death', 6, 'Necromancy', '1 action', '150 feet', 'Instantaneous', 'A sphere of negative energy ripples out in a 60-foot radius sphere from a point within range. Each creature in that area must make a constitution saving throw. A target takes 8d6 necrotic damage on a failed save, or half as much damage on a successful one.', 'V, S, M', False, False, 'None', 'Necrotic', 'When you cast this spell using a spell slot of 7th level or higher, the damage increases by 2d6 for each slot level above 6th.', 'Sorcerer, Warlock, Wizard', ''),
    

    ('Clairvoyance', 3, 'Divination', '10 minutes', '1 mile', 'Up to 10 minutes', 'You create an invisible sensor within range in a location familiar to you (a place you have visited or seen before) or in an obvious location that is unfamiliar to you (such as behind a door, around a corner, or in a grove of trees). The sensor remains in place for the duration, and it can''t be attacked or otherwise interacted with.', 'V, S, M', True, False, 'None', 'None', '', 'Bard, Cleric, Sorcerer, Wizard', 'Lore'),
    

    ('Clone', 8, 'Necromancy', '1 hour', 'Touch', 'Instantaneous', 'This spell grows an inert duplicate of a living creature as a safeguard against death. This clone forms inside a sealed vessel and grows to full size and maturity after 120 days; you can also choose to have the clone be a younger version of the same creature. It remains inert and endures indefinitely, as long as its vessel remains undisturbed.', 'V, S, M', False, False, 'None', 'None', '', 'Wizard', ''),
    

    ('Cloudkill', 5, 'Conjuration', '1 action', '120 feet', 'Up to 10 minutes', 'You create a 20-foot-radius sphere of poisonous, yellow-green fog centered on a point you choose within range. The fog spreads around corners. It lasts for the duration or until strong wind disperses the fog, ending the spell. Its area is heavily obscured.', 'V, S', True, False, 'None', 'Poison', 'When you cast this spell using a spell slot of 6th level or higher, the damage increases by 1d8 for each slot level above 5th.', 'Sorcerer, Wizard', 'Land'),
    

    ('Color Spray', 1, 'Illusion', '1 action', 'Self', '1 round', 'A dazzling array of flashing, colored light springs from your hand. Roll 6d10; the total is how many hit points of creatures this spell can effect. Creatures in a 15-foot cone originating from you are affected in ascending order of their current hit points (ignoring unconscious creatures and creatures that can''t see).', 'V, S, M', False, False, 'None', 'None', 'When you cast this spell using a spell slot of 2nd level or higher, roll an additional 2d10 for each slot level above 1st.', 'Sorcerer, Wizard', 'Lore'),
    

    ('Command', 1, 'Enchantment', '1 action', '60 feet', '1 round', 'You speak a one-word command to a creature you can see within range. The target must succeed on a wisdom saving throw or follow the command on its next turn. The spell has no effect if the target is undead, if it doesn''t understand your language, or if your command is directly harmful to it.', 'V', False, False, 'None', 'None', 'When you cast this spell using a spell slot of 2nd level or higher, you can affect one additional creature for each slot level above 1st. The creatures must be within 30 feet of each other when you target them.', 'Cleric, Paladin', 'Lore, Fiend'),
    

    ('Commune', 5, 'Divination', '1 minute', 'Self', '1 minute', 'You contact your deity or a divine proxy and ask up to three questions that can be answered with a yes or no. You must ask your questions before the spell ends. You receive a correct answer for each question.', 'V, S, M', False, True, 'None', 'None', '', 'Cleric', 'Devotion'),
    

    ('Commune With Nature', 5, 'Divination', '1 minute', 'Self', 'Instantaneous', 'You briefly become one with nature and gain knowledge of the surrounding territory. In the outdoors, the spell gives you knowledge of the land within 3 miles of you. In caves and other natural underground settings, the radius is limited to 300 feet. The spell doesn''t function where nature has been replaced by construction, such as in dungeons and towns.', 'V, S', False, True, 'None', 'None', '', 'Druid, Ranger', 'Land'),
    

    ('Comprehend Languages', 1, 'Divination', '1 action', 'Self', '1 hour', 'For the duration, you understand the literal meaning of any spoken language that you hear. You also understand any written language that you see, but you must be touching the surface on which the words are written. It takes about 1 minute to read one page of text.', 'V, S, M', False, True, 'None', 'None', '', 'Bard, Sorcerer, Warlock, Wizard', 'Lore'),
    

    ('Compulsion', 4, 'Enchantment', '1 action', '30 feet', 'Up to 1 minute', 'Creatures of your choice that you can see within range and that can hear you must make a wisdom saving throw. A target automatically succeeds on this saving throw if it can''t be charmed. On a failed save, a target is affected by this spell. Until the spell ends, you can use a bonus action on each of your turns to designate a direction that is horizontal to you. Each affected target must use as much of its movement as possible to move in that direction on its next turn. It can take any action before it moves. After moving in this way, it can make another Wisdom save to try to end the effect.', 'V, S', True, False, 'None', 'None', '', 'Bard', ''),
    

    ('Cone of Cold', 5, 'Evocation', '1 action', 'Self', 'Instantaneous', 'A blast of cold air erupts from your hands. Each creature in a 60-foot cone must make a constitution saving throw. A creature takes 8d8 cold damage on a failed save, or half as much damage on a successful one.', 'V, S, M', False, False, 'None', 'Cold', 'When you cast this spell using a spell slot of 6th level or higher, the damage increases by 1d8 for each slot level above 5th.', 'Sorcerer, Wizard', 'Land'),
    

    ('Confusion', 4, 'Enchantment', '1 action', '90 feet', 'Up to 1 minute', 'This spell assaults and twists creatures'' minds, spawning delusions and provoking uncontrolled action. Each creature in a 10-foot-radius sphere centered on a point you choose within range must succeed on a Wisdom saving throw when you cast this spell or be affected by it.', 'V, S, M', True, False, 'None', 'None', 'When you cast this spell using a spell slot of 5th level or higher, the radius of the sphere increases by 5 feet for each slot level above 4th.', 'Bard, Druid, Sorcerer, Wizard', ''),
    

    ('Conjure Animals', 3, 'Conjuration', '1 action', '60 feet', 'Up to 1 hour', 'You summon fey spirits that take the form of beasts and appear in unoccupied spaces that you can see within range. Choose one of the following options for what appears:', 'V, S', True, False, 'None', 'None', 'When you cast this spell using certain higher-level spell slots, you choose one of the summoning options above, and more creatures appear: twice as many with a 5th-level slot, three times as many with a 7th-level.', 'Druid, Ranger', 'Lore'),
    

    ('Conjure Celestial', 7, 'Conjuration', '1 minute', '90 feet', 'Up to 1 hour', 'You summon a celestial of challenge rating 4 or lower, which appears in an unoccupied space that you can see within range. The celestial disappears when it drops to 0 hit points or when the spell ends.', 'V, S', True, False, 'None', 'None', 'When you cast this spell using a 9th-level spell slot, you summon a celestial of challenge rating 5 or lower.', 'Cleric', ''),
    

    ('Conjure Elemental', 5, 'Conjuration', '1 minute', '90 feet', 'Up to 1 hour', 'You call forth an elemental servant. Choose an area of air, earth, fire, or water that fills a 10-foot cube within range. An elemental of challenge rating 5 or lower appropriate to the area you chose appears in an unoccupied space within 10 feet of it. For example, a fire elemental emerges from a bonfire, and an earth elemental rises up from the ground. The elemental disappears when it drops to 0 hit points or when the spell ends.', 'V, S, M', True, False, 'None', 'None', 'When you cast this spell using a spell slot of 6th level or higher, the challenge rating increases by 1 for each slot level above 5th.', 'Druid, Wizard', 'Land'),
    

    ('Conjure Fey', 6, 'Conjuration', '1 minute', '90 feet', 'Up to 1 hour', 'You summon a fey creature of challenge rating 6 or lower, or a fey spirit that takes the form of a beast of challenge rating 6 or lower. It appears in an unoccupied space that you can see within range. The fey creature disappears when it drops to 0 hit points or when the spell ends.', 'V, S', True, False, 'None', 'None', 'When you cast this spell using a spell slot of 7th level or higher, the challenge rating increases by 1 for each slot level above 6th.', 'Druid, Warlock', ''),
    

    ('Conjure Minor Elementals', 4, 'Conjuration', '1 minute', '90 feet', 'Up to 1 hour', 'You summon elementals that appear in unoccupied spaces that you can see within range. You choose one the following options for what appears:', 'V, S', True, False, 'None', 'None', 'When you cast this spell using certain higher-level spell slots, you choose one of the summoning options above, and more creatures appear: twice as many with a 6th-level slot and three times as many with an 8th-level slot.', 'Druid, Wizard', ''),
    

    ('Conjure Woodland Beings', 4, 'Conjuration', '1 action', '60 feet', 'Up to 1 hour', 'You summon fey creatures that appear in unoccupied spaces that you can see within range. Choose one of the following options for what appears:', 'V, S, M', True, False, 'None', 'None', 'When you cast this spell using certain higher-level spell slots, you choose one of the summoning options above, and more creatures appear: twice as many with a 6th-level slot and three times as many with an 8th-level slot.', 'Druid, Ranger', ''),
    

    ('Contact Other Plane', 5, 'Divination', '1 minute', 'Self', '1 minute', 'You mentally contact a demigod, the spirit of a long-dead sage, or some other mysterious entity from another plane. Contacting this extraplanar intelligence can strain or even break your mind. When you cast this spell, make a DC 15 intelligence saving throw. On a failure, you take 6d6 psychic damage and are insane until you finish a long rest. While insane, you can''t take actions, can''t understand what other creatures say, can''t read, and speak only in gibberish. A greater restoration spell cast on you ends this effect.', 'V', False, True, 'None', 'None', '', 'Warlock, Wizard', ''),
    

    ('Contagion', 5, 'Necromancy', '1 action', 'Touch', '7 days', 'Your touch inflicts disease. Make a melee spell attack against a creature within your reach. On a hit, you afflict the creature with a disease of your choice from any of the ones described below.', 'V, S', False, False, 'melee', 'None', '', 'Cleric, Druid', ''),
    

    ('Contingency', 6, 'Evocation', '10 minutes', 'Self', '10 days', 'Choose a spell of 5th level or lower that you can cast, that has a casting time of 1 action, and that can target you. You cast that spell--called the contingent spell--as part of casting contingency, expending spell slots for both, but the contingent spell doesn''t come into effect. Instead, it takes effect when a certain circumstance occurs. You describe that circumstance when you cast the two spells. For example, a contingency cast with water breathing might stipulate that water breathing comes into effect when you are engulfed in water or a similar liquid.', 'V, S, M', False, False, 'None', 'None', '', 'Wizard', ''),
    

    ('Continual Flame', 2, 'Evocation', '1 action', 'Touch', 'Until dispelled', 'A flame, equivalent in brightness to a torch, springs forth from an object that you touch. The effect looks like a regular flame, but it creates no heat and doesn''t use oxygen. A continual flame can be covered or hidden but not smothered or quenched.', 'V, S, M', False, False, 'None', 'None', '', 'Cleric, Wizard', 'Lore'),
    

    ('Control Water', 4, 'Transmutation', '1 action', '300 feet', 'Up to 10 minutes', 'Until the spell ends, you control any freestanding water inside an area you choose that is a cube up to 100 feet on a side. You can choose from any of the following effects when you cast this spell. As an action on your turn, you can repeat the same effect or choose a different one.', 'V, S, M', True, False, 'None', 'Bludgeoning', '', 'Cleric, Druid, Wizard', ''),
    

    ('Control Weather', 8, 'Transmutation', '10 minutes', 'Self', 'Up to 8 hours', 'You take control of the weather within 5 miles of you for the duration. You must be outdoors to cast this spell. Moving to a place where you don''t have a clear path to the sky ends the spell early.', 'V, S, M', True, False, 'None', 'None', '', 'Cleric, Druid, Wizard', 'Land'),
    

    ('Counterspell', 3, 'Abjuration', '1 reaction', '60 feet', 'Instantaneous', 'You attempt to interrupt a creature in the process of casting a spell. If the creature is casting a spell of 3rd level or lower, its spell fails and has no effect. If it is casting a spell of 4th level or higher, make an ability check using your spellcasting ability. The DC equals 10 + the spell''s level. On a success, the creature''s spell fails and has no effect.', 'S', False, False, 'None', 'None', 'When you cast this spell using a spell slot of 4th level or higher, the interrupted spell has no effect if its level is less than or equal to the level of the spell slot you used.', 'Sorcerer, Warlock, Wizard', ''),
    

    ('Create Food and Water', 3, 'Conjuration', '1 action', '30 feet', 'Instantaneous', 'You create 45 pounds of food and 30 gallons of water on the ground or in containers within range, enough to sustain up to fifteen humanoids or five steeds for 24 hours. The food is bland but nourishing, and spoils if uneaten after 24 hours. The water is clean and doesn''t go bad.', 'V, S', False, False, 'None', 'None', '', 'Cleric, Druid, Paladin', 'Lore, Land'),
    

    ('Create or Destroy Water', 1, 'Transmutation', '1 action', '30 feet', 'Instantaneous', 'You either create or destroy water.', 'V, S, M', False, False, 'None', 'None', 'When you cast this spell using a spell slot of 2nd level or higher, you create or destroy 10 additional gallons of water, or the size of the cube increases by 5 feet, for each slot level above 1st.', 'Cleric, Druid', 'Lore'),
    

    ('Create Undead', 6, 'Necromancy', '1 minute', '10 feet', 'Instantaneous', 'You can cast this spell only at night. Choose up to three corpses of Medium or Small humanoids within range. Each corpse becomes a ghoul under your control. (The GM has game statistics for these creatures.)', 'V, S, M', False, False, 'None', 'None', 'When you cast this spell using a 7th-level spell slot, you can animate or reassert control over four ghouls. When you cast this spell using an 8th-level spell slot, you can animate or reassert control over five ghouls or two ghasts or wights. When you cast this spell using a 9th-level spell slot, you can animate or reassert control over six ghouls, three ghasts or wights, or two mummies.', 'Cleric, Warlock, Wizard', ''),
    

    ('Creation', 5, 'Illusion', '1 minute', '30 feet', 'Special', 'You pull wisps of shadow material from the Shadowfell to create a nonliving object of vegetable matter within range: soft goods, rope, wood, or something similar. You can also use this spell to create mineral objects such as stone, crystal, or metal. The object created must be no larger than a 5-foot cube, and the object must be of a form and material that you have seen before.', 'V, S, M', False, False, 'None', 'None', 'When you cast this spell using a spell slot of 6th level or higher, the cube increases by 5 feet for each slot level above 5th.', 'Sorcerer, Wizard', ''),
    

    ('Cure Wounds', 1, 'Evocation', '1 action', 'Touch', 'Instantaneous', 'A creature you touch regains a number of hit points equal to 1d8 + your spellcasting ability modifier. This spell has no effect on undead or constructs.', 'V, S', False, False, 'None', 'None', 'When you cast this spell using a spell slot of 2nd level or higher, the healing increases by 1d8 for each slot level above 1st.', 'Bard, Cleric, Druid, Paladin, Ranger', 'Lore, Life'),
    

    ('Dancing Lights', 0, 'Evocation', '1 action', '120 feet', 'Up to 1 minute', 'You create up to four torch-sized lights within range, making them appear as torches, lanterns, or glowing orbs that hover in the air for the duration. You can also combine the four lights into one glowing vaguely humanoid form of Medium size. Whichever form you choose, each light sheds dim light in a 10-foot radius.', 'V, S, M', True, False, 'None', 'None', '', 'Bard, Sorcerer, Wizard', 'Lore'),
    

    ('Darkness', 2, 'Evocation', '1 action', '60 feet', 'Up to 10 minutes', 'Magical darkness spreads from a point you choose within range to fill a 15-foot-radius sphere for the duration. The darkness spreads around corners. A creature with darkvision can''t see through this darkness, and nonmagical light can''t illuminate it.', 'V, M', True, False, 'None', 'None', '', 'Sorcerer, Warlock, Wizard', 'Lore, Land'),
    

    ('Darkvision', 2, 'Transmutation', '1 action', 'Touch', '8 hours', 'You touch a willing creature to grant it the ability to see in the dark. For the duration, that creature has darkvision out to a range of 60 feet.', 'V, S, M', False, False, 'None', 'None', '', 'Druid, Ranger, Sorcerer, Wizard', 'Lore'),
    

    ('Daylight', 3, 'Evocation', '1 action', '60 feet', '1 hour', 'A 60-foot-radius sphere of light spreads out from a point you choose within range. The sphere is bright light and sheds dim light for an additional 60 feet.', 'V, S', False, False, 'None', 'None', '', 'Cleric, Druid, Paladin, Ranger, Sorcerer', 'Lore, Land'),
    

    ('Death Ward', 4, 'Abjuration', '1 action', 'Touch', '8 hours', 'You touch a creature and grant it a measure of protection from death.', 'V, S', False, False, 'None', 'None', '', 'Cleric, Paladin', 'Life'),
    

    ('Delayed Blast Fireball', 7, 'Evocation', '1 action', '150 feet', 'Up to 1 minute', 'A beam of yellow light flashes from your pointing finger, then condenses to linger at a chosen point within range as a glowing bead for the duration. When the spell ends, either because your concentration is broken or because you decide to end it, the bead blossoms with a low roar into an explosion of flame that spreads around corners. Each creature in a 20-foot-radius sphere centered on that point must make a dexterity saving throw. A creature takes fire damage equal to the total accumulated damage on a failed save, or half as much damage on a successful one.', 'V, S, M', True, False, 'None', 'Fire', 'When you cast this spell using a spell slot of 8th level or higher, the base damage increases by 1d6 for each slot level above 7th.', 'Sorcerer, Wizard', ''),
    

    ('Demiplane', 8, 'Conjuration', '1 action', '60 feet', '1 hour', 'You create a shadowy door on a flat solid surface that you can see within range. The door is large enough to allow Medium creatures to pass through unhindered. When opened, the door leads to a demiplane that appears to be an empty room 30 feet in each dimension, made of wood or stone. When the spell ends, the door disappears, and any creatures or objects inside the demiplane remain trapped there, as the door also disappears from the other side.', 'S', False, False, 'None', 'None', '', 'Warlock, Wizard', ''),
    

    ('Detect Evil and Good', 1, 'Divination', '1 action', 'Self', 'Up to 10 minutes', 'For the duration, you know if there is an aberration, celestial, elemental, fey, fiend, or undead within 30 feet of you, as well as where the creature is located. Similarly, you know if there is a place or object within 30 feet of you that has been magically consecrated or desecrated.', 'V, S', True, False, 'None', 'None', '', 'Cleric, Paladin', 'Lore'),
    

    ('Detect Magic', 1, 'Divination', '1 action', 'Self', 'Up to 10 minutes', 'For the duration, you sense the presence of magic within 30 feet of you. If you sense magic in this way, you can use your action to see a faint aura around any visible creature or object in the area that bears magic, and you learn its school of magic, if any.', 'V, S', True, True, 'None', 'None', '', 'Bard, Cleric, Druid, Paladin, Ranger, Sorcerer, Wizard', 'Lore'),
    

    ('Detect Poison and Disease', 1, 'Divination', '1 action', 'Self', 'Up to 10 minutes', 'For the duration, you can sense the presence and location of poisons, poisonous creatures, and diseases within 30 feet of you. You also identify the kind of poison, poisonous creature, or disease in each case.', 'V, S, M', True, True, 'None', 'None', '', 'Cleric, Druid, Paladin, Ranger', 'Lore'),
    

    ('Detect Thoughts', 2, 'Divination', '1 action', 'Self', 'Up to 1 minute', 'For the duration, you can read the thoughts of certain creatures. When you cast the spell and as your action on each turn until the spell ends, you can focus your mind on any one creature that you can see within 30 feet of you. If the creature you choose has an Intelligence of 3 or lower or doesn''t speak any language, the creature is unaffected.', 'V, S, M', True, False, 'None', 'None', '', 'Bard, Sorcerer, Wizard', 'Lore'),
    

    ('Dimension Door', 4, 'Conjuration', '1 action', '500 feet', 'Instantaneous', 'You teleport yourself from your current location to any other spot within range. You arrive at exactly the spot desired. It can be a place you can see, one you can visualize, or one you can describe by stating distance and direction, such as "200 feet straight downward" or "upward to the northwest at a 45-degree angle, 300 feet."', 'V', False, False, 'None', 'Force', '', 'Bard, Sorcerer, Warlock, Wizard', ''),
    

    ('Disguise Self', 1, 'Illusion', '1 action', 'Self', '1 hour', 'You make yourself--including your clothing, armor, weapons, and other belongings on your person--look different until the spell ends or until you use your action to dismiss it. You can seem 1 foot shorter or taller and can appear thin, fat, or in between. You can''t change your body type, so you must adopt a form that has the same basic arrangement of limbs. Otherwise, the extent of the illusion is up to you.', 'V, S', False, False, 'None', 'None', '', 'Bard, Sorcerer, Wizard', 'Lore'),
    

    ('Disintegrate', 6, 'Transmutation', '1 action', '60 feet', 'Instantaneous', 'A thin green ray springs from your pointing finger to a target that you can see within range. The target can be a creature, an object, or a creation of magical force, such as the wall created by wall of force.', 'V, S, M', False, False, 'None', 'Force', 'When you cast this spell using a spell slot of 7th level or higher, the damage increases by 3d6 for each slot level above 6th.', 'Sorcerer, Wizard', ''),
    

    ('Dispel Evil and Good', 5, 'Abjuration', '1 action', 'Self', 'Up to 1 minute', 'Shimmering energy surrounds and protects you from fey, undead, and creatures originating from beyond the Material Plane. For the duration, celestials, elementals, fey, fiends, and undead have disadvantage on attack rolls against you.', 'V, S, M', True, False, 'None', 'None', '', 'Cleric, Paladin', ''),
    

    ('Dispel Magic', 3, 'Abjuration', '1 action', '120 feet', 'Instantaneous', 'Choose one creature, object, or magical effect within range. Any spell of 3rd level or lower on the target ends. For each spell of 4th level or higher on the target, make an ability check using your spellcasting ability. The DC equals 10 + the spell''s level. On a successful check, the spell ends.', 'V, S', False, False, 'None', 'None', 'When you cast this spell using a spell slot of 4th level or higher, you automatically end the effects of a spell on the target if the spell''s level is equal to or less than the level of the spell slot you used.', 'Bard, Cleric, Druid, Paladin, Sorcerer, Warlock, Wizard', 'Lore, Devotion'),
    

    ('Divination', 4, 'Divination', '1 action', 'Self', 'Instantaneous', 'Your magic and an offering put you in contact with a god or a god''s servants. You ask a single question concerning a specific goal, event, or activity to occur within 7 days. The GM offers a truthful reply. The reply might be a short phrase, a cryptic rhyme, or an omen.', 'V, S, M', False, True, 'None', 'None', '', 'Druid', 'Land'),
    

    ('Divine Favor', 1, 'Evocation', '1 bonus action', 'Self', 'Up to 1 minute', 'Your prayer empowers you with divine radiance. Until the spell ends, your weapon attacks deal an extra 1d4 radiant damage on a hit.', 'V, S', True, False, 'None', 'Radiant', '', 'Paladin', 'Lore'),
    

    ('Divine Word', 7, 'Evocation', '1 bonus action', '30 feet', 'Instantaneous', 'You utter a divine word, imbued with the power that shaped the world at the dawn of creation. Choose any number of creatures you can see within range. Each creature that can hear you must make a Charisma saving throw. On a failed save, a creature suffers an effect based on its current hit points:', 'V', False, False, 'None', 'None', '', 'Cleric', ''),
    

    ('Dominate Beast', 4, 'Enchantment', '1 action', '60 feet', 'Up to 1 minute', 'You attempt to beguile a creature that you can see within range. It must succeed on a wisdom saving throw or be charmed by you for the duration. If you or creatures that are friendly to you are fighting it, it has advantage on the saving throw.', 'V, S', True, False, 'None', 'None', 'When you cast this spell with a 9th level spell slot, the duration is concentration, up to 8 hours.', 'Druid, Sorcerer', ''),
    

    ('Dominate Monster', 8, 'Enchantment', '1 action', '60 feet', 'Up to 1 hour', 'You attempt to beguile a creature that you can see within range. It must succeed on a wisdom saving throw or be charmed by you for the duration. If you or creatures that are friendly to you are fighting it, it has advantage on the saving throw.', 'V, S', True, False, 'None', 'None', 'When you cast this spell with a 9th-level spell slot, the duration is concentration, up to 8 hours.', 'Bard, Sorcerer, Warlock, Wizard', ''),
    

    ('Dominate Person', 5, 'Enchantment', '1 action', '60 feet', 'Up to 1 minute', 'You attempt to beguile a humanoid that you can see within range. It must succeed on a wisdom saving throw or be charmed by you for the duration. If you or creatures that are friendly to you are fighting it, it has advantage on the saving throw.', 'V, S', True, False, 'None', 'None', 'When you cast this spell using a 6th-level spell slot, the duration is concentration, up to 10 minutes. When you use a 7th-level spell slot, the duration is concentration, up to 1 hour. When you use a spell slot of 8th level or higher, the duration is concentration, up to 8 hours.', 'Bard, Sorcerer, Wizard', ''),
    

    ('Dream', 5, 'Illusion', '1 minute', 'Special', '8 hours', 'This spell shapes a creature''s dreams. Choose a creature known to you as the target of this spell. The target must be on the same plane of existence as you. Creatures that don''t sleep, such as elves, can''t be contacted by this spell. You, or a willing creature you touch, enters a trance state, acting as a messenger.', 'V, S, M', False, False, 'None', 'Psychic', '', 'Bard, Warlock, Wizard', 'Land'),
    

    ('Druidcraft', 0, 'Transmutation', '1 action', '30 feet', 'Instantaneous', 'Whispering to the spirits of nature, you create one of the following effects within ''range'':', 'V, S', False, False, 'None', 'None', '', 'Druid', ''),
    

    ('Earthquake', 8, 'Evocation', '1 action', '500 feet', 'Up to 1 minute', 'You create a seismic disturbance at a point on the ground that you can see within range. For the duration, an intense tremor rips through the ground in a 100-foot-radius circle centered on that point and shakes creatures and structures in contact with the ground in that area.', 'V, S, M', True, False, 'None', 'None', '', 'Cleric, Druid, Sorcerer', ''),
    

    ('Eldritch Blast', 0, 'Evocation', '1 action', '120 feet', 'Instantaneous', 'A beam of crackling energy streaks toward a creature within range. Make a ranged spell attack against the target. On a hit, the target takes 1d10 force damage. The spell creates more than one beam when you reach higher levels: two beams at 5th level, three beams at 11th level, and four beams at 17th level. You can direct the beams at the same target or at different ones. Make a separate attack roll for each beam.', 'V, S', False, False, 'ranged', 'Force', '', 'Warlock', 'Lore'),
    

    ('Enhance Ability', 2, 'Transmutation', '1 action', 'Touch', 'Up to 1 hour', 'You touch a creature and bestow upon it a magical enhancement. Choose one of the following effects; the target gains that effect until the spell ends.', 'V, S, M', True, False, 'None', 'None', 'When you cast this spell using a spell slot of 3rd level or higher, you can target one additional creature for each slot level above 2nd.', 'Bard, Cleric, Druid, Sorcerer', 'Lore'),
    

    ('Enlarge/Reduce', 2, 'Transmutation', '1 action', '30 feet', 'Up to 1 minute', 'You cause a creature or an object you can see within range to grow larger or smaller for the duration. Choose either a creature or an object that is neither worn nor carried. If the target is unwilling, it can make a Constitution saving throw. On a success, the spell has no effect.', 'V, S, M', True, False, 'None', 'None', '', 'Sorcerer, Wizard', 'Lore'),
    

    ('Entangle', 1, 'Conjuration', '1 action', '90 feet', 'Up to 1 minute', 'Grasping weeds and vines sprout from the ground in a 20-foot square starting form a point within range. For the duration, these plants turn the ground in the area into difficult terrain.', 'V, S', True, False, 'None', 'None', '', 'Druid', 'Lore'),
    

    ('Enthrall', 2, 'Enchantment', '1 action', '60 feet', '1 minute', 'You weave a distracting string of words, causing creatures of your choice that you can see within range and that can hear you to make a wisdom saving throw. Any creature that can''t be charmed succeeds on this saving throw automatically, and if you or your companions are fighting a creature, it has advantage on the save. On a failed save, the target has disadvantage on Wisdom (Perception) checks made to perceive any creature other than you until the spell ends or until the target can no longer hear you. The spell ends if you are incapacitated or can no longer speak.', 'V, S', False, False, 'None', 'None', '', 'Bard, Warlock', 'Lore'),
    

    ('Etherealness', 7, 'Transmutation', '1 action', 'Self', '8 hours', 'You step into the border regions of the Ethereal Plane, in the area where it overlaps with your current plane. You remain in the Border Ethereal for the duration or until you use your action to dismiss the spell. During this time, you can move in any direction. If you move up or down, every foot of movement costs an extra foot. You can see and hear the plane you originated from, but everything there looks gray, and you can''t see anything more than 60 feet away.', 'V, S', False, False, 'None', 'None', 'When you cast this spell using a spell slot of 8th level or higher, you can target up to three willing creatures (including you) for each slot level above 7th. The creatures must be within 10 feet of you when you cast the spell.', 'Bard, Cleric, Sorcerer, Warlock, Wizard', ''),
    

    ('Expeditious Retreat', 1, 'Transmutation', '1 bonus action', 'Self', 'Up to 10 minutes', 'This spell allows you to move at an incredible pace. When you cast this spell, and then as a bonus action on each of your turns until the spell ends, you can take the Dash action.', 'V, S', True, False, 'None', 'None', '', 'Sorcerer, Warlock, Wizard', 'Lore'),
    

    ('Eyebite', 6, 'Necromancy', '1 action', 'Self', 'Up to 1 minute', 'For the spell''s duration, your eyes become an inky void imbued with dread power. One creature of your choice within 60 feet of you that you can see must succeed on a wisdom saving throw or be affected by one of the following effects of your choice for the duration. On each of your turns until the spell ends, you can use your action to target another creature but can''t target a creature again if it has succeeded on a saving throw against this casting of eyebite.', 'V, S', True, False, 'None', 'None', '', 'Bard, Sorcerer, Warlock, Wizard', ''),
    

    ('Fabricate', 4, 'Transmutation', '10 minutes', '120 feet', 'Instantaneous', 'You convert raw materials into products of the same material. For example, you can fabricate a wooden bridge from a clump of trees, a rope from a patch of hemp, and clothes from flax or wool.', 'V, S', False, False, 'None', 'None', '', 'Wizard', ''),
    

    ('Faerie Fire', 1, 'Evocation', '1 action', '60 feet', 'Up to 1 minute', 'Each object in a 20-foot cube within range is outlined in blue, green, or violet light (your choice). Any creature in the area when the spell is cast is also outlined in light if it fails a dexterity saving throw. For the duration, objects and affected creatures shed dim light in a 10-foot radius.', 'V', True, False, 'None', 'None', '', 'Druid', 'Lore'),
    

    ('Faithful Hound', 4, 'Conjuration', '1 action', '30 feet', '8 hours', 'You conjure a phantom watchdog in an unoccupied space that you can see within range, where it remains for the duration, until you dismiss it as an action, or until you move more than 100 feet away from it.', 'V, S, M', False, False, 'melee', 'Piercing', '', 'Wizard', ''),
    

    ('False Life', 1, 'Necromancy', '1 action', 'Self', '1 hour', 'Bolstering yourself with a necromantic facsimile of life, you gain 1d4 + 4 temporary hit points for the duration.', 'V, S, M', False, False, 'None', 'None', 'When you cast this spell using a spell slot of 2nd level or higher, you gain 5 additional temporary hit points for each slot level above 1st.', 'Sorcerer, Wizard', 'Lore'),
    

    ('Fear', 3, 'Illusion', '1 action', 'Self', 'Up to 1 minute', 'You project a phantasmal image of a creature''s worst fears. Each creature in a 30-foot cone must succeed on a wisdom saving throw or drop whatever it is holding and become frightened for the duration.', 'V, S, M', True, False, 'None', 'None', '', 'Bard, Sorcerer, Warlock, Wizard', 'Lore'),
    

    ('Feather Fall', 1, 'Transmutation', '1 reaction', '60 feet', '1 minute', 'Choose up to five falling creatures within range. A falling creature''s rate of descent slows to 60 feet per round until the spell ends. If the creature lands before the spell ends, it takes no falling damage and can land on its feet, and the spell ends for that creature.', 'V, M', False, False, 'None', 'None', '', 'Bard, Sorcerer, Wizard', 'Lore'),
    

    ('Feeblemind', 8, 'Enchantment', '1 action', '150 feet', 'Instantaneous', 'You blast the mind of a creature that you can see within range, attempting to shatter its intellect and personality. The target takes 4d6 psychic damage and must make an intelligence saving throw.', 'V, S, M', False, False, 'None', 'Psychic', '', 'Bard, Druid, Warlock, Wizard', ''),
    

    ('Find Familiar', 1, 'Conjuration', '1 hour', '10 feet', 'Instantaneous', 'You gain the service of a familiar, a spirit that takes an animal form you choose: bat, cat, crab, frog (toad), hawk, lizard, octopus, owl, poisonous snake, fish (quipper), rat, raven, sea horse, spider, or weasel. Appearing in an unoccupied space within range, the familiar has the statistics of the chosen form, though it is a celestial, fey, or fiend (your choice) instead of a beast.', 'V, S, M', False, True, 'None', 'None', '', 'Wizard', ''),
    

    ('Find Steed', 2, 'Conjuration', '10 minutes', '30 feet', 'Instantaneous', 'You summon a spirit that assumes the form of an unusually intelligent, strong, and loyal steed, creating a long-lasting bond with it. Appearing in an unoccupied space within range, the steed takes on a form that you choose, such as a warhorse, a pony, a camel, an elk, or a mastiff. (Your GM might allow other animals to be summoned as steeds.) The steed has the statistics of the chosen form, though it is a celestial, fey, or fiend (your choice) instead of its normal type. Additionally, if your steed has an Intelligence of 5 or less, its Intelligence becomes 6, and it gains the ability to understand one language of your choice that you speak.', 'V, S', False, False, 'None', 'None', '', 'Paladin', 'Lore'),
    

    ('Find the Path', 6, 'Divination', '1 minute', 'Self', 'Up to 24 hours', 'This spell allows you to find the shortest, most direct physical route to a specific fixed location that you are familiar with on the same plane of existence. If you name a destination on another plane of existence, a destination that moves (such as a mobile fortress), or a destination that isn''t specific (such as "a green dragon''s lair"), the spell fails.', 'V, S, M', True, False, 'None', 'None', '', 'Bard, Cleric, Druid', ''),
    

    ('Find Traps', 2, 'Divination', '1 action', '120 feet', 'Instantaneous', 'You sense the presence of any trap within range that is within line of sight. A trap, for the purpose of this spell, includes anything that would inflict a sudden or unexpected effect you consider harmful or undesirable, which was specifically intended as such by its creator. Thus, the spell would sense an area affected by the alarm spell, a glyph of warding, or a mechanical pit trap, but it would not reveal a natural weakness in the floor, an unstable ceiling, or a hidden sinkhole.', 'V, S', False, False, 'None', 'None', '', 'Cleric, Druid, Ranger', 'Lore'),
    

    ('Finger of Death', 7, 'Necromancy', '1 action', '60 feet', 'Instantaneous', 'You send negative energy coursing through a creature that you can see within range, causing it searing pain. The target must make a constitution saving throw. It takes 7d8 + 30 necrotic damage on a failed save, or half as much damage on a successful one.', 'V, S', False, False, 'None', 'Necrotic', '', 'Sorcerer, Warlock, Wizard', ''),
    

    ('Fire Bolt', 0, 'Evocation', '1 action', '120 feet', 'Instantaneous', 'You hurl a mote of fire at a creature or object within range. Make a ranged spell attack against the target. On a hit, the target takes 1d10 fire damage. A flammable object hit by this spell ignites if it isn''t being worn or carried.', 'V, S', False, False, 'ranged', 'Fire', '', 'Sorcerer, Wizard', ''),
    

    ('Fire Shield', 4, 'Evocation', '1 action', 'Self', '10 minutes', 'Thin and vaporous flame surround your body for the duration of the spell, radiating a bright light bright light in a 10-foot radius and dim light for an additional 10 feet. You can end the spell using an action to make it disappear.', 'V, S, M', False, False, 'None', 'Fire', '', 'Wizard', 'Fiend'),
    

    ('Fire Storm', 7, 'Evocation', '1 action', '150 feet', 'Instantaneous', 'A storm made up of sheets of roaring flame appears in a location you choose within range. The area of the storm consists of up to ten 10-foot cubes, which you can arrange as you wish. Each cube must have at least one face adjacent to the face of another cube. Each creature in the area must make a dexterity saving throw. It takes 7d10 fire damage on a failed save, or half as much damage on a successful one.', 'V, S', False, False, 'None', 'Fire', '', 'Cleric, Druid, Sorcerer', ''),
    

    ('Fireball', 3, 'Evocation', '1 action', '150 feet', 'Instantaneous', 'A bright streak flashes from your pointing finger to a point you choose within range and then blossoms with a low roar into an explosion of flame. Each creature in a 20-foot-radius sphere centered on that point must make a dexterity saving throw. A target takes 8d6 fire damage on a failed save, or half as much damage on a successful one.', 'V, S, M', False, False, 'None', 'Fire', 'When you cast this spell using a spell slot of 4th level or higher, the damage increases by 1d6 for each slot level above 3rd.', 'Sorcerer, Wizard', 'Lore, Fiend'),
    

    ('Flame Blade', 2, 'Evocation', '1 bonus action', 'Self', 'Up to 10 minutes', 'You evoke a fiery blade in your free hand. The blade is similar in size and shape to a scimitar, and it lasts for the duration. If you let go of the blade, it disappears, but you can evoke the blade again as a bonus action.', 'V, S, M', True, False, 'None', 'Fire', 'When you cast this spell using a spell slot of 4th level or higher, the damage increases by 1d6 for every two slot levels above 2nd.', 'Druid', 'Lore'),
    

    ('Flame Strike', 5, 'Evocation', '1 action', '60 feet', 'Instantaneous', 'A vertical column of divine fire roars down from the heavens in a location you specify. Each creature in a 10-foot-radius, 40-foot-high cylinder centered on a point within range must make a dexterity saving throw. A creature takes 4d6 fire damage and 4d6 radiant damage on a failed save, or half as much damage on a successful one.', 'V, S, M', False, False, 'None', 'Fire', 'When you cast this spell using a spell slot of 6th level or higher, the fire damage or the radiant damage (your choice) increases by 1d6 for each slot level above 5th.', 'Cleric', 'Devotion, Fiend'),
    

    ('Flaming Sphere', 2, 'Conjuration', '1 action', '60 feet', 'Up to 1 minute', 'A 5-foot-diameter sphere of fire appears in an unoccupied space of your choice within range and lasts for the duration. Any creature that ends its turn within 5 feet of the sphere must make a dexterity saving throw. The creature takes 2d6 fire damage on a failed save, or half as much damage on a successful one.', 'V, S, M', True, False, 'None', 'Fire', 'When you cast this spell using a spell slot of 3rd level or higher, the damage increases by 1d6 for each slot level above 2nd.', 'Druid, Wizard', 'Lore'),
    

    ('Flesh to Stone', 6, 'Transmutation', '1 action', '60 feet', 'Up to 1 minute', 'You attempt to turn one creature that you can see within range into stone. If the target''s body is made of flesh, the creature must make a constitution saving throw. On a failed save, it is restrained as its flesh begins to harden. On a successful save, the creature isn''t affected.', 'V, S, M', True, False, 'None', 'None', '', 'Warlock, Wizard', ''),
    

    ('Floating Disk', 1, 'Conjuration', '1 action', '30 feet', '1 hour', 'This spell creates a circular, horizontal plane of force, 3 feet in diameter and 1 inch thick, that floats 3 feet above the ground in an unoccupied space of your choice that you can see within range. The disk remains for the duration, and can hold up to 500 pounds. If more weight is placed on it, the spell ends, and everything on the disk falls to the ground.', 'V, S, M', False, True, 'None', 'None', '', 'Wizard', 'Lore'),
    

    ('Fly', 3, 'Transmutation', '1 action', 'Touch', 'Up to 10 minutes', 'You touch a willing creature. The target gains a flying speed of 60 feet for the duration. When the spell ends, the target falls if it is still aloft, unless it can stop the fall.', 'V, S, M', True, False, 'None', 'None', 'When you cast this spell using a spell slot of 4th level or higher, you can target one additional creature for each slot level above 3rd.', 'Sorcerer, Warlock, Wizard', 'Lore'),
    

    ('Fog Cloud', 1, 'Conjuration', '1 action', '120 feet', 'Up to 1 hour', 'You create a 20-foot-radius sphere of fog centered on a point within range. The sphere spreads around corners, and its area is heavily obscured. It lasts for the duration or until a wind of moderate or greater speed (at least 10 miles per hour) disperses it.', 'V, S', True, False, 'None', 'None', 'When you cast this spell using a spell slot of 2nd level or higher, the radius of the fog increases by 20 feet for each slot level above 1st.', 'Druid, Ranger, Sorcerer, Wizard', 'Lore'),
    

    ('Forbiddance', 6, 'Abjuration', '10 minutes', 'Touch', '24 hours', 'You create a ward against magical travel that protects up to 40,000 square feet of floor space to a height of 30 feet above the floor. For the duration, creatures can''t teleport into the area or use portals, such as those created by the gate spell, to enter the area. The spell proofs the area against planar travel, and therefore prevents creatures from accessing the area by way of the Astral Plane, Ethereal Plane, Feywild, Shadowfell, or the plane shift spell.', 'V, S, M', False, True, 'None', 'None', '', 'Cleric', ''),
    

    ('Forcecage', 7, 'Evocation', '1 action', '100 feet', '1 hour', 'An immobile, invisible, cube-shaped prison composed of magical force springs into existence around an area you choose within range. The prison can be a cage or a solid box, as you choose.', 'V, S, M', False, False, 'None', 'None', '', 'Bard, Warlock, Wizard', ''),
    

    ('Foresight', 9, 'Divination', '1 minute', 'Touch', '8 hours', 'You touch a willing creature and bestow a limited ability to see into the immediate future. For the duration, the target can''t be surprised and has advantage on attack rolls, ability checks, and saving throws. Additionally, other creatures have disadvantage on attack rolls against the target for the duration.', 'V, S, M', False, False, 'None', 'None', '', 'Bard, Druid, Warlock, Wizard', ''),
    

    ('Freedom of Movement', 4, 'Abjuration', '1 action', 'Touch', '1 hour', 'You touch a willing creature. For the duration, the target''s movement is unaffected by difficult terrain, and spells and other magical effects can neither reduce the target''s speed nor cause the target to be paralyzed or restrained.', 'V, S, M', False, False, 'None', 'None', '', 'Bard, Cleric, Druid, Ranger', 'Land, Devotion'),
    

    ('Freezing Sphere', 6, 'Evocation', '1 action', '300 feet', 'Instantaneous', 'A frigid globe of cold energy streaks from your fingertips to a point of your choice within range, where it explodes in a 60-foot-radius sphere. Each creature within the area must make a constitution saving throw. On a failed save, a creature takes 10d6 cold damage. On a successful save, it takes half as much damage.', 'V, S, M', False, False, 'None', 'Cold', 'When you cast this spell using a spell slot of 7th level or higher, the damage increases by 1d6 for each slot level above 6th.', 'Wizard', ''),
    

    ('Gaseous Form', 3, 'Transmutation', '1 action', 'Touch', 'Up to 1 hour', 'You transform a willing creature you touch, along with everything it''s wearing and carrying, into a misty cloud for the duration. The spell ends if the creature drops to 0 hit points. An incorporeal creature isn''t affected.', 'V, S, M', True, False, 'None', 'None', '', 'Sorcerer, Warlock, Wizard', 'Lore, Land'),
    

    ('Gate', 9, 'Conjuration', '1 action', '60 feet', 'Up to 1 minute', 'You conjure a portal linking an unoccupied space you can see within range to a precise location on a different plane of existence. The portal is a circular opening, which you can make 5 to 20 feet in diameter. You can orient the portal in any direction you choose. The portal lasts for the duration.', 'V, S, M', True, False, 'None', 'None', '', 'Cleric, Sorcerer, Wizard', ''),
    

    ('Geas', 5, 'Enchantment', '1 minute', '60 feet', '30 days', 'You place a magical command on a creature that you can see within range, forcing it to carry out some service or refrain from some action or course of activity as you decide. If the creature can understand you, it must succeed on a wisdom saving throw or become charmed by you for the duration. While the creature is charmed by you, it takes 5d10 psychic damage each time it acts in a manner directly counter to your instructions, but no more than once each day. A creature that can''t understand you is unaffected by the spell.', 'V', False, False, 'None', 'None', 'When you cast this spell using a spell slot of 7th or 8th level, the duration is 1 year. When you cast this spell using a spell slot of 9th level, the spell lasts until it is ended by one of the spells mentioned above.', 'Bard, Cleric, Druid, Paladin, Wizard', ''),
    

    ('Gentle Repose', 2, 'Necromancy', '1 action', 'Touch', '10 days', 'You touch a corpse or other remains. For the duration, the target is protected from decay and can''t become undead.', 'V, S, M', False, True, 'None', 'None', '', 'Cleric, Wizard', 'Lore'),
    

    ('Giant Insect', 4, 'Transmutation', '1 action', '30 feet', 'Up to 10 minutes', 'You transform up to ten centipedes, three spiders, five wasps, or one scorpion within range into giant versions of their natural forms for the duration. A centipede becomes a giant centipede, a spider becomes a giant spider, a wasp becomes a giant wasp, and a scorpion becomes a giant scorpion.', 'V, S', True, False, 'None', 'None', '', 'Druid', ''),
    

    ('Glibness', 8, 'Transmutation', '1 action', 'Self', '1 hour', 'Until the spell ends, when you make a Charisma check, you can replace the number you roll with a 15. Additionally, no matter what you say, magic that would determine if you are telling the truth indicates that you are being truthful.', 'V', False, False, 'None', 'None', '', 'Bard, Warlock', ''),
    

    ('Globe of Invulnerability', 6, 'Abjuration', '1 action', 'Self', 'Up to 1 minute', 'An immobile, faintly shimmering barrier springs into existence in a 10-foot radius around you and remains for the duration.', 'V, S, M', True, False, 'None', 'None', 'When you cast this spell using a spell slot of 7th level or higher, the barrier blocks spells of one level higher for each slot level above 6th.', 'Sorcerer, Wizard', ''),
    

    ('Glyph of Warding', 3, 'Abjuration', '1 hour', 'Touch', 'Until dispelled', 'When you cast this spell, you inscribe a glyph that harms other creatures, either upon a surface (such as a table or a section of floor or wall) or within an object that can be closed (such as a book, a scroll, or a treasure chest) to conceal the glyph. If you choose a surface, the glyph can cover an area of the surface no larger than 10 feet in diameter. If you choose an object, that object must remain in its place; if the object is moved more than 10 feet from where you cast this spell, the glyph is broken, and the spell ends without being triggered.', 'V, S, M', False, False, 'None', 'None', 'When you cast this spell using a spell slot of 4th level or higher, the damage of an explosive runes glyph increases by 1d8 for each slot level above 3rd. If you create a spell glyph, you can store any spell of up to the same level as the slot you use for the glyph of warding.', 'Bard, Cleric, Wizard', 'Lore'),
    

    ('Goodberry', 1, 'Transmutation', '1 action', 'Touch', 'Instantaneous', 'Up to ten berries appear in your hand and are infused with magic for the duration. A creature can use its action to eat one berry. Eating a berry restores 1 hit point, and the berry provides enough nourishment to sustain a creature for a day.', 'V, S, M', False, False, 'None', 'None', '', 'Druid, Ranger', ''),
    

    ('Grease', 1, 'Conjuration', '1 action', '60 feet', '1 minute', 'Slick grease covers the ground in a 10-foot square centered on a point within range and turns it into difficult terrain for the duration.', 'V, S, M', False, False, 'None', 'None', '', 'Wizard', 'Lore'),
    

    ('Greater Invisibility', 4, 'Illusion', '1 action', 'Touch', 'Up to 1 minute', 'You or a creature you touch becomes invisible until the spell ends. Anything the target is wearing or carrying is invisible as long as it is on the target''s person.', 'V, S', True, False, 'None', 'None', '', 'Bard, Sorcerer, Wizard', 'Land'),
    

    ('Greater Restoration', 5, 'Abjuration', '1 action', 'Touch', 'Instantaneous', 'You imbue a creature you touch with positive energy to undo a debilitating effect. You can reduce the target''s exhaustion level by one, or end one of the following effects on the target:', 'V, S, M', False, False, 'None', 'None', '', 'Bard, Cleric, Druid', ''),
    

    ('Guardian of Faith', 4, 'Conjuration', '1 action', '30 feet', '8 hours', 'A Large spectral guardian appears and hovers for the duration in an unoccupied space of your choice that you can see within range. The guardian occupies that space and is indistinct except for a gleaming sword and shield emblazoned with the symbol of your deity.', 'V', False, False, 'None', 'Radiant', '', 'Cleric', ''),
    

    ('Guards and Wards', 6, 'Abjuration', '10 minutes', 'Touch', '24 hours', 'You create a ward that protects up to 2,500 square feet of floor space (an area 50 feet square, or one hundred 5-foot squares or twenty-five 10-foot squares). The warded area can be up to 20 feet tall, and shaped as you desire. You can ward several stories of a stronghold by dividing the area among them, as long as you can walk into each contiguous area while you are casting the spell.', 'V, S, M', False, False, 'None', 'None', '', 'Bard, Wizard', ''),
    

    ('Guidance', 0, 'Divination', '1 action', 'Touch', 'Up to 1 minute', 'You touch one willing creature. Once before the spell ends, the target can roll a d4 and add the number rolled to one ability check of its choice. It can roll the die before or after making the ability check. The spell then ends.', 'V, S', True, False, 'None', 'None', '', 'Cleric, Druid', 'Lore'),
    

    ('Guiding Bolt', 1, 'Evocation', '1 action', '120 feet', '1 round', 'A flash of light streaks toward a creature of your choice within range. Make a ranged spell attack against the target. On a hit, the target takes 4d6 radiant damage, and the next attack roll made against this target before the end of your next turn has advantage, thanks to the mystical dim light glittering on the target until then.', 'V, S', False, False, 'ranged', 'Radiant', 'When you cast this spell using a spell slot of 2nd level or higher, the damage increases by 1d6 for each slot level above 1st.', 'Cleric', 'Lore'),
    

    ('Gust of Wind', 2, 'Evocation', '1 action', 'Self', 'Up to 1 minute', 'A line of strong wind 60 feet long and 10 feet wide blasts from you in a direction you choose for the spell''s duration. Each creature that starts its turn in the line must succeed on a strength saving throw or be pushed 15 feet away from you in a direction following the line.', 'V, S, M', True, False, 'None', 'None', '', 'Druid, Sorcerer, Wizard', 'Lore'),
    

    ('Hallow', 5, 'Evocation', '24 hours', 'Touch', 'Until dispelled', 'You touch a point and infuse an area around it with holy (or unholy) power. The area can have a radius up to 60 feet, and the spell fails if the radius includes an area already under the effect a hallow spell. The affected area is subject to the following effects.', 'V, S, M', False, False, 'None', 'None', '', 'Cleric', 'Fiend'),
    

    ('Hallucinatory Terrain', 4, 'Illusion', '10 minutes', '300 feet', '24 hours', 'You make natural terrain in a 150-foot cube in range look, sound, and smell like some other sort of natural terrain. Thus, open fields or a road can be made to resemble a swamp, hill, crevasse, or some other difficult or impassable terrain. A pond can be made to seem like a grassy meadow, a precipice like a gentle slope, or a rock-strewn gully like a wide and smooth road. Manufactured structures, equipment, and creatures within the area aren''t changed in appearance.', 'V, S, M', False, False, 'None', 'None', '', 'Bard, Druid, Warlock, Wizard', 'Land'),
    

    ('Harm', 6, 'Necromancy', '1 action', '60 feet', 'Instantaneous', 'You unleash a virulent disease on a creature that you can see within range. The target must make a constitution saving throw. On a failed save, it takes 14d6 necrotic damage, or half as much damage on a successful save. The damage can''t reduce the target''s hit points below 1. If the target fails the saving throw, its hit point maximum is reduced for 1 hour by an amount equal to the necrotic damage it took. Any effect that removes a disease allows a creature''s hit point maximum to return to normal before that time passes.', 'V, S', False, False, 'None', 'Necrotic', '', 'Cleric', ''),
    

    ('Haste', 3, 'Transmutation', '1 action', '30 feet', 'Up to 1 minute', 'Choose a willing creature that you can see within range. Until the spell ends, the target''s speed is doubled, it gains a +2 bonus to AC, it has advantage on dexterity saving throws, and it gains an additional action on each of its turns. That action can be used only to take the Attack (one weapon attack only), Dash, Disengage, Hide, or Use an Object action.', 'V, S, M', True, False, 'None', 'None', '', 'Sorcerer, Wizard', 'Lore, Land'),
    

    ('Heal', 6, 'Evocation', '1 action', '60 feet', 'Instantaneous', 'Choose a creature that you can see within range. A surge of positive energy washes through the creature, causing it to regain 70 hit points. This spell also ends blindness, deafness, and any diseases affecting the target. This spell has no effect on constructs or undead.', 'V, S', False, False, 'None', 'None', 'When you cast this spell using a spell slot of 7th level or higher, the amount of healing increases by 10 for each slot level above 6th.', 'Cleric, Druid', ''),
    

    ('Healing Word', 1, 'Evocation', '1 bonus action', '60 feet', 'Instantaneous', 'A creature of your choice that you can see within range regains hit points equal to 1d4 + your spellcasting ability modifier. This spell has no effect on undead or constructs.', 'V', False, False, 'None', 'None', 'When you cast this spell using a spell slot of 2nd level or higher, the healing increases by 1d4 for each slot level above 1st.', 'Bard, Cleric, Druid', 'Lore'),
    

    ('Heat Metal', 2, 'Transmutation', '1 action', '60 feet', 'Up to 1 minute', 'Choose a manufactured metal object, such as a metal weapon or a suit of heavy or medium metal armor, that you can see within range. You cause the object to glow red-hot. Any creature in physical contact with the object takes 2d8 fire damage when you cast the spell. Until the spell ends, you can use a bonus action on each of your subsequent turns to cause this damage again.', 'V, S, M', True, False, 'None', 'Fire', 'When you cast this spell using a spell slot of 3rd level or higher, the damage increases by 1d8 for each slot level above 2nd.', 'Bard, Druid', 'Lore'),
    

    ('Hellish Rebuke', 1, 'Evocation', '1 reaction', '60 feet', 'Instantaneous', 'You point your finger, and the creature that damaged you is momentarily surrounded by hellish flames. The creature must make a dexterity saving throw. It takes 2d10 fire damage on a failed save, or half as much damage on a successful one.', 'V, S', False, False, 'None', 'Fire', 'When you cast this spell using a spell slot of 2nd level or higher, the damage increases by 1d10 for each slot level above 1st.', 'Warlock', ''),
    

    ('Heroes'' Feast', 6, 'Conjuration', '10 minutes', '30 feet', 'Instantaneous', 'You bring forth a great feast, including magnificent food and drink. The feast takes 1 hour to consume and disappears at the end of that time, and the beneficial effects don''t set in until this hour is over. Up to twelve other creatures can partake of the feast.', 'V, S, M', False, False, 'None', 'None', '', 'Cleric, Druid', ''),
    

    ('Heroism', 1, 'Enchantment', '1 action', 'Touch', 'Up to 1 minute', 'A willing creature you touch is imbued with bravery. Until the spell ends, the creature is immune to being frightened and gains temporary hit points equal to your spellcasting ability modifier at the start of each of its turns. When the spell ends, the target loses any remaining temporary hit points from this spell.', 'V, S', True, False, 'None', 'None', '', 'Bard, Paladin', 'Lore'),
    

    ('Hideous Laughter', 1, 'Enchantment', '1 action', '30 feet', 'Up to 1 minute', 'A creature of your choice that you can see within range perceives everything as hilariously funny and falls into fits of laughter if this spell affects it. The target must succeed on a wisdom saving throw or fall prone, becoming incapacitated and unable to stand up for the duration. A creature with an Intelligence score of 4 or less isn''t affected.', 'V, S, M', True, False, 'None', 'None', '', 'Bard, Wizard', 'Lore'),
    

    ('Hold Monster', 5, 'Enchantment', '1 action', '90 feet', 'Up to 1 minute', 'Choose a creature you can see and reach. The target must make a saving throw of Wisdom or be paralyzed for the duration of the spell. This spell has no effect against the undead. At the end of each round, the target can make a new saving throw of Wisdom. If successful, the spell ends for the creature.', 'V, S, M', True, False, 'None', 'None', 'When you cast this spell using a level 6 or higher location, you can target an additional creature for each level of location beyond the fifth. The creatures must be within 30 feet o f each other when you target them.', 'Bard, Sorcerer, Warlock, Wizard', ''),
    

    ('Hold Person', 2, 'Enchantment', '1 action', '60 feet', 'Up to 1 minute', 'Choose a humanoid that you can see within range. The target must succeed on a wisdom saving throw or be paralyzed for the duration. At the end of each of its turns, the target can make another wisdom saving throw. On a success, the spell ends on the target.', 'V, S, M', True, False, 'None', 'None', 'When you cast this spell using a spell slot of 3rd level or higher, you can target one additional humanoid for each slot level above 2nd. The humanoids must be within 30 feet of each other when you target them.', 'Bard, Cleric, Druid, Sorcerer, Warlock, Wizard', 'Lore, Land'),
    

    ('Holy Aura', 8, 'Abjuration', '1 action', 'Self', 'Up to 1 minute', 'Divine light washes out from you and coalesces in a soft radiance in a 30-foot radius around you. Creatures of your choice in that radius when you cast this spell shed dim light in a 5-foot radius and have advantage on all saving throws, and other creatures have disadvantage on attack rolls against them until the spell ends. In addition, when a fiend or an undead hits an affected creature with a melee attack, the aura flashes with brilliant light. The attacker must succeed on a constitution saving throw or be blinded until the spell ends.', 'V, S, M', True, False, 'None', 'None', '', 'Cleric', ''),
    

    ('Hunter''s Mark', 1, 'Divination', '1 bonus action', '90 feet', 'Up to 1 hour', 'You choose a creature you can see within range and mystically mark it as your quarry. Until the spell ends, you deal an extra 1d6 damage to the target whenever you hit it with a weapon attack, and you have advantage on any Wisdom (Perception) or Wisdom (Survival) check you make to find it. If the target drops to 0 hit points before this spell ends, you can use a bonus action on a subsequent turn of yours to mark a new creature.', 'V', True, False, 'None', 'None', 'When you cast this spell using a spell slot of 3rd or 4th level, you can maintain your concentration on the spell for up to 8 hours. When you use a spell slot of 5th level or higher, you can maintain your concentration on the spell for up to 24 hours.', 'Ranger', ''),
    

    ('Hypnotic Pattern', 3, 'Illusion', '1 action', '120 feet', 'Up to 1 minute', 'You create a twisting pattern of colors that weaves through the air inside a 30-foot cube within range. The pattern appears for a moment and vanishes. Each creature in the area who sees the pattern must make a wisdom saving throw. On a failed save, the creature becomes charmed for the duration. While charmed by this spell, the creature is incapacitated and has a speed of 0.', 'S, M', True, False, 'None', 'None', '', 'Bard, Sorcerer, Warlock, Wizard', 'Lore'),
    

    ('Ice Storm', 4, 'Evocation', '1 action', '300 feet', 'Instantaneous', 'A hail of rock-hard ice pounds to the ground in a 20-foot-radius, 40-foot-high cylinder centered on a point within range. Each creature in the cylinder must make a dexterity saving throw. A creature takes 2d8 bludgeoning damage and 4d6 cold damage on a failed save, or half as much damage on a successful one.', 'V, S, M', False, False, 'None', 'Bludgeoning', 'When you cast this spell using a spell slot of 5th level or higher, the bludgeoning damage increases by 1d8 for each slot level above 4th.', 'Druid, Sorcerer, Wizard', 'Land'),
    

    ('Identify', 1, 'Divination', '1 minute', 'Touch', 'Instantaneous', 'You choose one object that you must touch throughout the casting of the spell. If it is a magic item or some other magic-imbued object, you learn its properties and how to use them, whether it requires attunement to use, and how many charges it has, if any. You learn whether any spells are affecting the item and what they are. If the item was created by a spell, you learn which spell created it.', 'V, S, M', False, True, 'None', 'None', '', 'Bard, Wizard', 'Lore'),
    

    ('Illusory Script', 1, 'Illusion', '1 minute', 'Touch', '10 days', 'You write on parchment, paper, or some other suitable writing material and imbue it with a potent illusion that lasts for the duration.', 'S, M', False, True, 'None', 'None', '', 'Bard, Warlock, Wizard', 'Lore'),
    

    ('Imprisonment', 9, 'Abjuration', '1 minute', '30 feet', 'Until dispelled', 'You create a magical restraint to hold a creature that you can see within range. The target must succeed on a wisdom saving throw or be bound by the spell; if it succeeds, it is immune to this spell if you cast it again. While affected by this spell, the creature doesn''t need to breathe, eat, or drink, and it doesn''t age. Divination spells can''t locate or perceive the target.', 'V, S, M', False, False, 'None', 'None', '', 'Warlock, Wizard', ''),
    

    ('Incendiary Cloud', 8, 'Conjuration', '1 action', '150 feet', 'Up to 1 minute', 'A swirling cloud of smoke shot through with white-hot embers appears in a 20-foot-radius sphere centered on a point within range. The cloud spreads around corners and is heavily obscured. It lasts for the duration or until a wind of moderate or greater speed (at least 10 miles per hour) disperses it.', 'V, S', True, False, 'None', 'Fire', '', 'Sorcerer, Wizard', ''),
    

    ('Inflict Wounds', 1, 'Necromancy', '1 action', 'Touch', 'Instantaneous', 'Make a melee spell attack against a creature you can reach. On a hit, the target takes 3d10 necrotic damage.', 'V, S', False, False, 'melee', 'Necrotic', 'When you cast this spell using a spell slot of 2nd level or higher, the damage increases by 1d10 for each slot level above 1st.', 'Cleric', 'Lore'),
    

    ('Insect Plague', 5, 'Conjuration', '1 action', '300 feet', 'Up to 10 minutes', 'Swarming, biting locusts fill a 20-foot-radius sphere centered on a point you choose within range. The sphere spreads around corners. The sphere remains for the duration, and its area is lightly obscured. The sphere''s area is difficult terrain.', 'V, S, M', True, False, 'None', 'Piercing', 'When you cast this spell using a spell slot of 6th level or higher, the damage increases by 1d10 for each slot level above 5th.', 'Cleric, Druid, Sorcerer', 'Land'),
    

    ('Instant Summons', 6, 'Conjuration', '1 minute', 'Touch', 'Until dispelled', 'You touch an object weighing 10 pounds or less whose longest dimension is 6 feet or less. The spell leaves an invisible mark on its surface and invisibly inscribes the name of the item on the sapphire you use as the material component. Each time you cast this spell, you must use a different sapphire.', 'V, S, M', False, True, 'None', 'None', '', 'Wizard', ''),
    

    ('Invisibility', 2, 'Illusion', '1 action', 'Touch', 'Up to 1 hour', 'A creature you touch becomes invisible until the spell ends. Anything the target is wearing or carrying is invisible as long as it is on the target''s person. The spell ends for a target that attacks or casts a spell.', 'V, S, M', True, False, 'None', 'None', 'When you cast this spell using a spell slot of 3rd level or higher, you can target one additional creature for each slot level above 2nd.', 'Bard, Sorcerer, Warlock, Wizard', 'Lore, Land'),
    

    ('Irresistible Dance', 6, 'Enchantment', '1 action', '30 feet', 'Up to 1 minute', 'Choose one creature that you can see within range. The target begins a comic dance in place: shuffling, tapping its feet, and capering for the duration. Creatures that can''t be charmed are immune to this spell.', 'V', True, False, 'None', 'None', '', 'Bard, Wizard', ''),
    

    ('Jump', 1, 'Transmutation', '1 action', 'Touch', '1 minute', 'You touch a creature. The creature''s jump distance is tripled until the spell ends.', 'V, S, M', False, False, 'None', 'None', '', 'Druid, Ranger, Sorcerer, Wizard', 'Lore'),
    

    ('Knock', 2, 'Transmutation', '1 action', '60 feet', 'Instantaneous', 'Choose an object that you can see within range. The object can be a door, a box, a chest, a set of manacles, a padlock, or another object that contains a mundane or magical means that prevents access.', 'V', False, False, 'None', 'None', '', 'Bard, Sorcerer, Wizard', 'Lore'),
    

    ('Legend Lore', 5, 'Divination', '10 minutes', 'Self', 'Instantaneous', 'Name or describe a person, place, or object. The spell brings to your mind a brief summary of the significant lore about the thing you named. The lore might consist of current tales, forgotten stories, or even secret lore that has never been widely known. If the thing you named isn''t of legendary importance, you gain no information. The more information you already have about the thing, the more precise and detailed the information you receive is.', 'V, S, M', False, False, 'None', 'None', '', 'Bard, Cleric, Wizard', ''),
    

    ('Lesser Restoration', 2, 'Abjuration', '1 action', 'Touch', 'Instantaneous', 'You touch a creature and can end either one disease or one condition afflicting it. The condition can be blinded, deafened, paralyzed, or poisoned.', 'V, S', False, False, 'None', 'None', '', 'Bard, Cleric, Druid, Paladin, Ranger', 'Lore, Life, Devotion'),
    

    ('Levitate', 2, 'Transmutation', '1 action', '60 feet', 'Up to 10 minutes', 'One creature or object of your choice that you can see within range rises vertically, up to 20 feet, and remains suspended there for the duration. The spell can levitate a target that weighs up to 500 pounds. An unwilling creature that succeeds on a constitution saving throw is unaffected.', 'V, S, M', True, False, 'None', 'None', '', 'Sorcerer, Wizard', 'Lore'),
    

    ('Light', 0, 'Evocation', '1 action', 'Touch', '1 hour', 'You touch one object that is no larger than 10 feet in any dimension. Until the spell ends, the object sheds bright light in a 20-foot radius and dim light for an additional 20 feet. The light can be colored as you like. Completely covering the object with something opaque blocks the light. The spell ends if you cast it again or dismiss it as an action.', 'V, M', False, False, 'None', 'None', '', 'Bard, Cleric, Sorcerer, Wizard', 'Lore'),
    

    ('Lightning Bolt', 3, 'Evocation', '1 action', 'Self', 'Instantaneous', 'A stroke of lightning forming a line 100 feet long and 5 feet wide blasts out from you in a direction you choose. Each creature in the line must make a dexterity saving throw. A creature takes 8d6 lightning damage on a failed save, or half as much damage on a successful one.', 'V, S, M', False, False, 'None', 'Lightning', 'When you cast this spell using a spell slot of 4th level or higher, the damage increases by 1d6 for each slot level above 3rd.', 'Sorcerer, Wizard', 'Lore, Land'),
    

    ('Locate Animals or Plants', 2, 'Divination', '1 action', 'Self', 'Instantaneous', 'Describe or name a specific kind of beast or plant. Concentrating on the voice of nature in your surroundings, you learn the direction and distance to the closest creature or plant of that kind within 5 miles, if any are present.', 'V, S, M', False, True, 'None', 'None', '', 'Bard, Druid, Ranger', 'Lore'),
    

    ('Locate Creature', 4, 'Divination', '1 action', 'Self', 'Up to 1 hour', 'Describe or name a creature that is familiar to you. You sense the direction to the creature''s location, as long as that creature is within 1,000 feet of you. If the creature is moving, you know the direction of its movement.', 'V, S, M', True, False, 'None', 'None', '', 'Bard, Cleric, Druid, Paladin, Ranger, Wizard', 'Land'),
    

    ('Locate Object', 2, 'Divination', '1 action', 'Self', 'Up to 10 minutes', 'Describe or name an object that is familiar to you. You sense the direction to the object''s location, as long as that object is within 1,000 feet of you. If the object is in motion, you know the direction of its movement.', 'V, S, M', True, False, 'None', 'None', '', 'Bard, Cleric, Druid, Paladin, Ranger, Wizard', 'Lore'),
    

    ('Longstrider', 1, 'Transmutation', '1 action', 'Touch', '1 hour', 'You touch a creature. The target''s speed increases by 10 feet until the spell ends.', 'V, S, M', False, False, 'None', 'None', 'When you cast this spell using a spell slot of 2nd level or higher, you can target one additional creature for each spell slot above 1st.', 'Bard, Druid, Ranger, Wizard', 'Lore'),
    

    ('Mage Armor', 1, 'Abjuration', '1 action', 'Touch', '8 hours', 'You touch a willing creature who isn''t wearing armor, and a protective magical force surrounds it until the spell ends. The target''s base AC becomes 13 + its Dexterity modifier. The spell ends if the target dons armor or if you dismiss the spell as an action.', 'V, S, M', False, False, 'None', 'None', '', 'Sorcerer, Wizard', 'Lore'),
    

    ('Mage Hand', 0, 'Conjuration', '1 action', '30 feet', '1 minute', 'A spectral, floating hand appears at a point you choose within range. The hand lasts for the duration or until you dismiss it as an action. The hand vanishes if it is ever more than 30 feet away from you or if you cast this spell again.', 'V, S', False, False, 'None', 'None', '', 'Bard, Sorcerer, Warlock, Wizard', 'Lore'),
    

    ('Magic Circle', 3, 'Abjuration', '1 minute', '10 feet', '1 hour', 'You create a 10-foot radius, 20-foot-tall cylinder of magical energy centered on a point on the ground that you can see within range. Glowing runes appear whenever the cylinder intersects with the floor or other surface.', 'V, S, M', False, False, 'None', 'None', 'When you cast this spell using a spell slot of 4th level or higher, the duration increases by 1 hour for each slot level above 3rd.', 'Cleric, Paladin, Warlock, Wizard', 'Lore'),
    

    ('Magic Jar', 6, 'Necromancy', '1 minute', 'Self', 'Until dispelled', 'Your body falls into a catatonic state as your soul leaves it and enters the container you used for the spell''s material component. While your soul inhabits the container, you are aware of your surroundings as if you were in the container''s space. You can''t move or use reactions. The only action you can take is to project your soul up to 100 feet out of the container, either returning to your living body (and ending the spell) or attempting to possess a humanoids body.', 'V, S, M', False, False, 'None', 'None', '', 'Wizard', ''),
    

    ('Magic Missile', 1, 'Evocation', '1 action', '120 feet', 'Instantaneous', 'You create three glowing darts of magical force. Each dart hits a creature of your choice that you can see within range. A dart deals 1d4 + 1 force damage to its target. The darts all strike simultaneously, and you can direct them to hit one creature or several.', 'V, S', False, False, 'None', 'Force', 'When you cast this spell using a spell slot of 2nd level or higher, the spell creates one more dart for each slot level above 1st.', 'Sorcerer, Wizard', 'Lore'),
    

    ('Magic Mouth', 2, 'Illusion', '1 minute', '30 feet', 'Until dispelled', 'You plant a message to an object in the range of the spell. The message is verbalized when the trigger conditions are met. Choose an object that you see, and that is not worn or carried by another creature. Then say the message, which should not exceed 25 words but listening can take up to 10 minutes. Finally, establish the circumstances that trigger the spell to deliver your message.', 'V, S, M', False, True, 'None', 'None', '', 'Bard, Wizard', 'Lore'),
    

    ('Magic Weapon', 2, 'Transmutation', '1 bonus action', 'Touch', 'Up to 1 hour', 'You touch a nonmagical weapon. Until the spell ends, that weapon becomes a magic weapon with a +1 bonus to attack rolls and damage rolls.', 'V, S', True, False, 'None', 'None', 'When you cast this spell using a spell slot of 4th level or higher, the bonus increases to +2. When you use a spell slot of 6th level or higher, the bonus increases to +3.', 'Paladin, Wizard', 'Lore'),
    

    ('Magnificent Mansion', 7, 'Conjuration', '1 minute', '300 feet', '24 hours', 'You conjure an extradimensional dwelling in range that lasts for the duration. You choose where its one entrance is located. The entrance shimmers faintly and is 5 feet wide and 10 feet tall. You and any creature you designate when you cast the spell can enter the extradimensional dwelling as long as the portal remains open. You can open or close the portal if you are within 30 feet of it. While closed, the portal is invisible.', 'V, S, M', False, False, 'None', 'None', '', 'Bard, Wizard', ''),
    

    ('Major Image', 3, 'Illusion', '1 action', '120 feet', 'Up to 10 minutes', 'You create the image of an object, a creature, or some other visible phenomenon that is no larger than a 20-foot cube. The image appears at a spot that you can see within range and lasts for the duration. It seems completely real, including sounds, smells, and temperature appropriate to the thing depicted. You can''t create sufficient heat or cold to cause damage, a sound loud enough to deal thunder damage or deafen a creature, or a smell that might sicken a creature (like a troglodyte''s stench).', 'V, S, M', True, False, 'None', 'None', 'When you cast this spell using a spell slot of 6th level or higher, the spell lasts until dispelled, without requiring your concentration.', 'Bard, Sorcerer, Warlock, Wizard', 'Lore'),
    

    ('Mass Cure Wounds', 5, 'Conjuration', '1 action', '60 feet', 'Instantaneous', 'A wave of healing energy washes out from a point of your choice within range. Choose up to six creatures in a 30-foot-radius sphere centered on that point. Each target regains hit points equal to 3d8 + your spellcasting ability modifier. This spell has no effect on undead or constructs.', 'V, S', False, False, 'None', 'None', 'When you cast this spell using a spell slot of 6th level or higher, the healing increases by 1d8 for each slot level above 5th.', 'Bard, Cleric, Druid', 'Life'),
    

    ('Mass Heal', 9, 'Conjuration', '1 action', '60 feet', 'Instantaneous', 'A flood of healing energy flows from you into injured creatures around you. You restore up to 700 hit points, divided as you choose among any number of creatures that you can see within range. Creatures healed by this spell are also cured of all diseases and any effect making them blinded or deafened. This spell has no effect on undead or constructs.', 'V, S', False, False, 'None', 'None', '', 'Cleric', ''),
    

    ('Mass Healing Word', 3, 'Evocation', '1 bonus action', '60 feet', 'Instantaneous', 'As you call out words of restoration, up to six creatures of your choice that you can see within range regain hit points equal to 1d4 + your spellcasting ability modifier. This spell has no effect on undead or constructs.', 'V', False, False, 'None', 'None', 'When you cast this spell using a spell slot of 4th level or higher, the healing increases by 1d4 for each slot level above 3rd.', 'Cleric', 'Lore'),
    

    ('Mass Suggestion', 6, 'Enchantment', '1 action', '60 feet', '24 hours', 'You suggest a course of activity (limited to a sentence or two) and magically influence up to twelve creatures of your choice that you can see within range and that can hear and understand you. Creatures that can''t be charmed are immune to this effect. The suggestion must be worded in such a manner as to make the course of action sound reasonable. Asking the creature to stab itself, throw itself onto a spear, immolate itself, or do some other obviously harmful act automatically negates the effect of the spell.', 'V, M', False, False, 'None', 'None', 'When you cast this spell using a 7th-level spell slot, the duration is 10 days. When you use an 8th-level spell slot, the duration is 30 days. When you use a 9th-level spell slot, the duration is a year and a day.', 'Bard, Sorcerer, Warlock, Wizard', ''),
    

    ('Maze', 8, 'Conjuration', '1 action', '60 feet', 'Up to 10 minutes', 'You banish a creature that you can see within range into a labyrinthine demiplane. The target remains there for the duration or until it escapes the maze.', 'V, S', True, False, 'None', 'None', '', 'Wizard', ''),
    

    ('Meld Into Stone', 3, 'Transmutation', '1 action', 'Touch', '8 hours', 'You step into a stone object or surface large enough to fully contain your body, melding yourself and all the equipment you carry with the stone for the duration. Using your movement, you step into the stone at a point you can touch. Nothing of your presence remains visible or otherwise detectable by nonmagical senses.', 'V, S', False, True, 'None', 'None', '', 'Cleric', 'Lore, Land'),
    

    ('Mending', 0, 'Transmutation', '1 minute', 'Touch', 'Instantaneous', 'This spell repairs a single break or tear in an object you touch, such as a broken key, a torn cloak, or a leaking wineskin. As long as the break or tear is no longer than 1 foot in any dimension, you mend it, leaving no trace of the former damage.', 'V, S, M', False, False, 'None', 'None', '', 'Cleric, Bard, Druid, Sorcerer, Wizard', 'Lore'),
    

    ('Message', 0, 'Transmutation', '1 action', '120 feet', '1 round', 'You point your finger toward a creature within range and whisper a message. The target (and only the target) hears the message and can reply in a whisper that only you can hear.', 'V, S, M', False, False, 'None', 'None', '', 'Bard, Sorcerer, Wizard', 'Lore'),
    

    ('Meteor Swarm', 9, 'Evocation', '1 action', '1 mile', 'Instantaneous', 'Blazing orbs of fire plummet to the ground at four different points you can see within range. Each creature in a 40-foot-radius sphere centered on each point you choose must make a dexterity saving throw. The sphere spreads around corners. A creature takes 20d6 fire damage and 20d6 bludgeoning damage on a failed save, or half as much damage on a successful one. A creature in the area of more than one fiery burst is affected only once.', 'V, S', False, False, 'None', 'Fire', '', 'Sorcerer, Wizard', ''),
    

    ('Mind Blank', 8, 'Abjuration', '1 action', 'Touch', '24 hours', 'Until the spell ends, one willing creature you touch is immune to psychic damage, any effect that would sense its emotions or read its thoughts, divination spells, and the charmed condition. The spell even foils wish spells and spells or effects of similar power used to affect the target''s mind or to gain information about the target.', 'V, S', False, False, 'None', 'None', '', 'Bard, Wizard', ''),
    

    ('Minor Illusion', 0, 'Illusion', '1 action', '30 feet', '1 minute', 'You create a sound or an image of an object within range that lasts for the duration. The illusion also ends if you dismiss it as an action or cast this spell again.', 'S, M', False, False, 'None', 'None', '', 'Bard, Sorcerer, Warlock, Wizard', 'Lore'),
    

    ('Mirage Arcane', 7, 'Illusion', '10 minutes', 'Sight', '10 days', 'You make terrain in an area up to 1 mile square look, sound, smell, and even feel like some other sort of terrain. The terrain''s general shape remains the same, however. Open fields or a road could be made to resemble a swamp, hill, crevasse, or some other difficult or impassable terrain. A pond can be made to seem like a grassy meadow, a precipice like a gentle slope, or a rock-strewn gully like a wide and smooth road.', 'V, S', False, False, 'None', 'None', '', 'Bard, Druid, Wizard', ''),
    

    ('Mirror Image', 2, 'Illusion', '1 action', 'Self', '1 minute', 'Three illusory duplicates of yourself appear in your space. Until the spell ends, the duplicates move with you and mimic your actions, shifting position so it''s impossible to track which image is real. You can use your action to dismiss the illusory duplicates.', 'V, S', False, False, 'None', 'None', '', 'Sorcerer, Warlock, Wizard', 'Lore, Land'),
    

    ('Mislead', 5, 'Illusion', '1 action', 'Self', 'Up to 1 hour', 'You become invisible at the same time that an illusory double of you appears where you are standing. The double lasts for the duration, but the invisibility ends if you attack or cast a spell.', 'S', True, False, 'None', 'None', '', 'Bard, Wizard', ''),
    

    ('Misty Step', 2, 'Conjuration', '1 bonus action', 'Self', 'Instantaneous', 'Briefly surrounded by silvery mist, you teleport up to 30 feet to an unoccupied space that you can see.', 'V', False, False, 'None', 'None', '', 'Sorcerer, Warlock, Wizard', 'Lore, Land'),
    

    ('Modify Memory', 5, 'Enchantment', '1 action', '30 feet', 'Up to 1 minute', 'You attempt to reshape another creature''s memories. One creature that you can see must make a wisdom saving throw. If you are fighting the creature, it has advantage on the saving throw. On a failed save, the target becomes charmed by you for the duration. The charmed target is incapacitated and unaware of its surroundings, though it can still hear you. If it takes any damage or is targeted by another spell, this spell ends, and none of the target''s memories are modified.', 'V, S', True, False, 'None', 'None', 'If you cast this spell using a spell slot of 6th level or higher, you can alter the target''s memories of an event that took place up to 7 days ago (6th level), 30 days ago (7th level), 1 year ago (8th level), or any time in the creature''s past (9th level).', 'Bard, Wizard', ''),
    

    ('Moonbeam', 2, 'Evocation', '1 action', '120 feet', 'Up to 1 minute', 'A silvery beam of pale light shines down in a 5-foot radius, 40-foot-high cylinder centered on a point within range. Until the spell ends, dim light fills the cylinder.', 'V, S, M', True, False, 'None', 'Radiant', 'When you cast this spell using a spell slot of 3rd level or higher, the damage increases by 1dl0 for each slot level above 2nd.', 'Druid', 'Lore'),
    

    ('Move Earth', 6, 'Transmutation', '1 action', '120 feet', 'Up to 2 hours', 'Choose an area of terrain no larger than 40 feet on a side within range. You can reshape dirt, sand, or clay in the area in any manner you choose for the duration. You can raise or lower the area''s elevation, create or fill in a trench, erect or flatten a wall, or form a pillar. The extent of any such changes can''t exceed half the area''s largest dimension. So, if you affect a 40-foot square, you can create a pillar up to 20 feet high, raise or lower the square''s elevation by up to 20 feet, dig a trench up to 20 feet deep, and so on. It takes 10 minutes for these changes to complete.', 'V, S, M', True, False, 'None', 'None', '', 'Druid, Sorcerer, Wizard', ''),
    

    ('Nondetection', 3, 'Abjuration', '1 action', 'Touch', '8 hours', 'For the duration, you hide a target that you touch from divination magic. The target can be a willing creature or a place or an object no larger than 10 feet in any dimension. The target can''t be targeted by any divination magic or perceived through magical scrying sensors.', 'V, S, M', False, False, 'None', 'None', '', 'Bard, Ranger, Wizard', 'Lore'),
    

    ('Pass Without Trace', 2, 'Abjuration', '1 action', 'Self', 'Up to 1 hour', 'A veil of shadows and silence radiates from you, masking you and your companions from detection. For the duration, each creature you choose within 30 feet of you (including you) has a +10 bonus to Dexterity (Stealth) checks and can''t be tracked except by magical means. A creature that receives this bonus leaves behind no tracks or other traces of its passage.', 'V, S, M', True, False, 'None', 'None', '', 'Druid, Ranger', 'Lore, Land'),
    

    ('Passwall', 5, 'Transmutation', '1 action', '30 feet', '1 hour', 'A passage appears at a point of your choice that you can see on a wooden, plaster, or stone surface (such as a wall, a ceiling, or a floor) within range, and lasts for the duration. You choose the opening''s dimensions: up to 5 feet wide, 8 feet tall, and 20 feet deep. The passage creates no instability in a structure surrounding it.', 'V, S, M', False, False, 'None', 'None', '', 'Wizard', 'Land'),
    

    ('Phantasmal Killer', 4, 'Illusion', '1 action', '120 feet', 'Up to 1 minute', 'You tap into the nightmares of a creature you can see within range and create an illusory manifestation of its deepest fears, visible only to that creature. The target must make a wisdom saving throw. On a failed save, the target becomes frightened for the duration. At the start of each of the target''s turns before the spell ends, the target must succeed on a wisdom saving throw or take 4d10 psychic damage. On a successful save, the spell ends.', 'V, S', True, False, 'None', 'Psychic', 'When you cast this spell using a spell slot of 5th level or higher, the damage increases by 1d10 for each slot level above 4th.', 'Wizard', ''),
    

    ('Phantom Steed', 3, 'Illusion', '1 minute', '30 feet', '1 hour', 'A Large quasi-real, horselike creature appears on the ground in an unoccupied space of your choice within range. You decide the creature''s appearance, but it is equipped with a saddle, bit, and bridle. Any of the equipment created by the spell vanishes in a puff of smoke if it is carried more than 10 feet away from the steed.', 'V, S', False, True, 'None', 'None', '', 'Wizard', 'Lore'),
    

    ('Planar Ally', 6, 'Conjuration', '10 minutes', '60 feet', 'Instantaneous', 'You beseech an otherworldly entity for aid. The being must be known to you: a god, a primordial, a demon prince, or some other being of cosmic power. That entity sends a celestial, an elemental, or a fiend loyal to it to aid you, making the creature appear in an unoccupied space within range. If you know a specific creature''s name, you can speak that name when you cast this spell to request that creature, though you might get a different creature anyway (GM''s choice).', 'V, S', False, False, 'None', 'None', '', 'Cleric', ''),
    

    ('Planar Binding', 5, 'Abjuration', '1 hour', '60 feet', '24 hours', 'With this spell, you attempt to bind a celestial, an elemental, a fey, or a fiend to your service. The creature must be within range for the entire casting of the spell. (Typically, the creature is first summoned into the center of an inverted magic circle in order to keep it trapped while this spell is cast.) At the completion of the casting, the target must make a charisma saving throw. On a failed save, it is bound to serve you for the duration. If the creature was summoned or created by another spell, that spell''s duration is extended to match the duration of this spell.', 'V, S, M', False, False, 'None', 'None', 'When you cast this spell using a spell slot of a higher level, the duration increases to 10 days with a 6th-level slot, to 30 days with a 7th-level slot, to 180 days with an 8th-level slot, and to a year and a day with a 9th-level spell slot.', 'Bard, Cleric, Druid, Wizard', ''),
    

    ('Plane Shift', 7, 'Conjuration', '1 action', 'Touch', 'Instantaneous', 'You and up to eight willing creatures who link hands in a circle are transported to a different plane of existence. You can specify a target destination in general terms, such as the City of Brass on the Elemental Plane of Fire or the palace of Dispater on the second level of the Nine Hells, and you appear in or near that destination. If you are trying to reach the City of Brass, for example, you might arrive in its Street of Steel, before its Gate of Ashes, or looking at the city from across the Sea of Fire, at the GM''s discretion.', 'V, S, M', False, False, 'melee', 'None', '', 'Cleric, Druid, Sorcerer, Warlock, Wizard', ''),
    

    ('Plant Growth', 3, 'Transmutation', '1 action', '150 feet', 'Instantaneous', 'This spell channels vitality into plants within a specific area. There are two possible uses for the spell, granting either immediate or long-term benefits.', 'V, S', False, False, 'None', 'None', '', 'Bard, Druid, Ranger', 'Lore, Land'),
    

    ('Poison Spray', 0, 'Conjuration', '1 action', '10 feet', 'Instantaneous', 'You extend your hand toward a creature you can see within range and project a puff of noxious gas from your palm. The creature must succeed on a constitution saving throw or take 1d12 poison damage.', 'V, S', False, False, 'None', 'Poison', '', 'Sorcerer, Warlock, Wizard, Druid', ''),
    

    ('Polymorph', 4, 'Transmutation', '1 action', '60 feet', 'Up to 1 hour', 'This spell transforms a creature that you can see within range into a new form. An unwilling creature must make a wisdom saving throw to avoid the effect. A shapechanger automatically succeeds on this saving throw.', 'V, S, M', True, False, 'None', 'None', '', 'Bard, Druid, Sorcerer, Wizard', ''),
    

    ('Power Word Kill', 9, 'Enchantment', '1 action', '60 feet', 'Instantaneous', 'You utter a word of power that can compel one creature you can see within range to die instantly. If the creature you choose has 100 hit points or fewer, it dies. Otherwise, the spell has no effect.', 'V', False, False, 'None', 'None', '', 'Bard, Sorcerer, Warlock, Wizard', ''),
    

    ('Power Word Stun', 8, 'Enchantment', '1 action', '60 feet', 'Instantaneous', 'You speak a word of power that can overwhelm the mind of one creature you can see within range, leaving it dumbfounded. If the target has 150 hit points or fewer, it is stunned. Otherwise, the spell has no effect.', 'V', False, False, 'None', 'None', '', 'Bard, Sorcerer, Warlock, Wizard', ''),
    

    ('Prayer of Healing', 2, 'Evocation', '10 minutes', '30 feet', 'Instantaneous', 'Up to six creatures of your choice that you can see within range each regain hit points equal to 2d8 + your spellcasting ability modifier. This spell has no effect on undead or constructs.', 'V', False, False, 'None', 'None', 'When you cast this spell using a spell slot of 3rd level or higher, the healing increases by 1d8 for each slot level above 2nd.', 'Cleric', 'Lore'),
    

    ('Prestidigitation', 0, 'Transmutation', '1 action', '10 feet', '1 hour', 'This spell is a minor magical trick that novice spellcasters use for practice. You create one of the following magical effects within ''range'':', 'V, S', False, False, 'None', 'None', '', 'Bard, Sorcerer, Warlock, Wizard', 'Lore'),
    

    ('Prismatic Spray', 7, 'Evocation', '1 action', 'Self', 'Instantaneous', 'Eight multicolored rays of light flash from your hand. Each ray is a different color and has a different power and purpose. Each creature in a 60-foot cone must make a dexterity saving throw. For each target, roll a d8 to determine which color ray affects it.', 'V, S', False, False, 'None', 'None', '', 'Sorcerer, Wizard', ''),
    

    ('Prismatic Wall', 9, 'Abjuration', '1 action', '60 feet', '10 minutes', 'A shimmering, multicolored plane of light forms a vertical opaque wall--up to 90 feet long, 30 feet high, and 1 inch thick--centered on a point you can see within range. Alternatively, you can shape the wall into a sphere up to 30 feet in diameter centered on a point you choose within range. The wall remains in place for the duration. If you position the wall so that it passes through a space occupied by a creature, the spell fails, and your action and the spell slot are wasted.', 'V, S', False, False, 'None', 'None', '', 'Wizard', ''),
    

    ('Private Sanctum', 4, 'Abjuration', '10 minutes', '120 feet', '24 hours', 'You make an area within range magically secure. The area is a cube that can be as small as 5 feet to as large as 100 feet on each side. The spell lasts for the duration or until you use an action to dismiss it.', 'V, S, M', False, False, 'None', 'None', 'When you cast this spell using a spell slot of 5th level or higher, you can increase the size of the cube by 100 feet for each slot level beyond 4th. Thus you could protect a cube that can be up to 200 feet on one side by using a spell slot of 5th level.', 'Wizard', ''),
    

    ('Produce Flame', 0, 'Conjuration', '1 action', 'Self', '10 minutes', 'A flickering flame appears in your hand. The flame remains there for the duration and harms neither you nor your equipment. The flame sheds bright light in a 10-foot radius and dim light for an additional 10 feet. The spell ends if you dismiss it as an action or if you cast it again.', 'V, S', False, False, 'ranged', 'Fire', '', 'Druid', 'Lore'),
    

    ('Programmed Illusion', 6, 'Illusion', '1 action', '120 feet', 'Until dispelled', 'You create an illusion of an object, a creature, or some other visible phenomenon within range that activates when a specific condition occurs. The illusion is imperceptible until then. It must be no larger than a 30-foot cube, and you decide when you cast the spell how the illusion behaves and what sounds it makes. This scripted performance can last up to 5 minutes.', 'V, S, M', False, False, 'None', 'None', '', 'Bard, Wizard', ''),
    

    ('Project Image', 7, 'Illusion', '1 action', '500 miles', 'Up to 24 hours', 'You create an illusory copy of yourself that lasts for the duration. The copy can appear at any location within range that you have seen before, regardless of intervening obstacles. The illusion looks and sounds like you but is intangible. If the illusion takes any damage, it disappears, and the spell ends.', 'V, S, M', True, False, 'None', 'None', '', 'Bard, Wizard', ''),
    

    ('Protection From Energy', 3, 'Abjuration', '1 action', 'Touch', 'Up to 1 hour', 'For the duration, the willing creature you touch has resistance to one damage type of your choice: acid, cold, fire, lightning, or thunder.', 'V, S', True, False, 'None', 'None', '', 'Cleric, Druid, Ranger, Sorcerer, Wizard', 'Lore, Land'),
    

    ('Protection from Evil and Good', 1, 'Abjuration', '1 action', 'Touch', 'Up to 10 minutes', 'Until the spell ends, one willing creature you touch is protected against certain types of creatures: aberrations, celestials, elementals, fey, fiends, and undead.', 'V, S, M', True, False, 'None', 'None', '', 'Cleric, Paladin, Warlock, Wizard', 'Lore, Devotion'),
    

    ('Protection from Poison', 2, 'Abjuration', '1 action', 'Touch', '1 hour', 'You touch a creature. If it is poisoned, you neutralize the poison. If more than one poison afflicts the target, you neutralize one poison that you know is present, or you neutralize one at random.', 'V, S', False, False, 'None', 'None', '', 'Cleric, Druid, Paladin, Ranger', 'Lore'),
    

    ('Purify Food and Drink', 1, 'Transmutation', '1 action', '10 feet', 'Instantaneous', 'All nonmagical food and drink within a 5-foot radius sphere centered on a point of your choice within range is purified and rendered free of poison and disease.', 'V, S', False, True, 'None', 'None', '', 'Cleric, Druid, Paladin', 'Lore'),
    

    ('Raise Dead', 5, 'Necromancy', '1 hour', 'Touch', 'Instantaneous', 'You return a dead creature you touch to life, provided that it has been dead no longer than 10 days. If the creature''s soul is both willing and at liberty to rejoin the body, the creature returns to life with 1 hit point.', 'V, S, M', False, False, 'None', 'None', '', 'Bard, Cleric, Paladin', 'Life'),
    

    ('Ray of Enfeeblement', 2, 'Necromancy', '1 action', '60 feet', 'Up to 1 minute', 'A black beam of enervating energy springs from your finger toward a creature within range. Make a ranged spell attack against the target. On a hit, the target deals only half damage with weapon attacks that use Strength until the spell ends.', 'V, S', True, False, 'ranged', 'None', '', 'Warlock, Wizard', 'Lore'),
    

    ('Ray of Frost', 0, 'Evocation', '1 action', '60 feet', 'Instantaneous', 'A frigid beam of blue-white light streaks toward a creature within range. Make a ranged spell attack against the target. On a hit, it takes 1d8 cold damage, and its speed is reduced by 10 feet until the start of your next turn.', 'V, S', False, False, 'ranged', 'Cold', '', 'Sorcerer, Wizard', 'Lore'),
    

    ('Regenerate', 7, 'Transmutation', '1 minute', 'Touch', '1 hour', 'You touch a creature and stimulate its natural healing ability. The target regains 4d8 + 15 hit points. For the duration of the spell, the target regains 1 hit point at the start of each of its turns (10 hit points each minute).', 'V, S, M', False, False, 'None', 'None', '', 'Bard, Cleric, Druid', ''),
    

    ('Reincarnate', 5, 'Transmutation', '1 hour', 'Touch', 'Instantaneous', 'You touch a dead humanoid or a piece of a dead humanoid. Provided that the creature has been dead no longer than 10 days, the spell forms a new adult body for it and then calls the soul to enter that body. If the target''s soul isn''t free or willing to do so, the spell fails.', 'V, S, M', False, False, 'None', 'None', '', 'Druid', ''),
    

    ('Remove Curse', 3, 'Abjuration', '1 action', 'Touch', 'Instantaneous', 'At your touch, all curses affecting one creature or object end. If the object is a cursed magic item, its curse remains, but the spell breaks its owner''s attunement to the object so it can be removed or discarded.', 'V, S', False, False, 'None', 'None', '', 'Cleric, Paladin, Warlock, Wizard', 'Lore'),
    

    ('Resilient Sphere', 4, 'Evocation', '1 action', '30 feet', 'Up to 1 minute', 'A sphere of shimmering force encloses a creature or object of Large size or smaller within range. An unwilling creature must make a dexterity saving throw. On a failed save, the creature is enclosed for the duration.', 'V, S, M', True, False, 'None', 'None', '', 'Wizard', ''),
    

    ('Resistance', 0, 'Abjuration', '1 action', 'Touch', 'Up to 1 minute', 'You touch one willing creature. Once before the spell ends, the target can roll a d4 and add the number rolled to one saving throw of its choice. It can roll the die before or after making the saving throw. The spell then ends.', 'V, S, M', True, False, 'None', 'None', '', 'Cleric, Druid', 'Lore'),
    

    ('Resurrection', 7, 'Necromancy', '1 hour', 'Touch', 'Instantaneous', 'You touch a dead creature that has been dead for no more than a century, that didn''t die of old age, and that isn''t undead. If its soul is free and willing, the target returns to life with all its hit points.', 'V, S, M', False, False, 'None', 'None', '', 'Bard, Cleric', ''),
    

    ('Reverse Gravity', 7, 'Transmutation', '1 action', '100 feet', 'Up to 1 minute', 'This spell reverses gravity in a 50-foot-radius, 100-foot high cylinder centered on a point within range. All creatures and objects that aren''t somehow anchored to the ground in the area fall upward and reach the top of the area when you cast this spell. A creature can make a dexterity saving throw to grab onto a fixed object it can reach, thus avoiding the fall.', 'V, S, M', True, False, 'None', 'None', '', 'Druid, Sorcerer, Wizard', ''),
    

    ('Revivify', 3, 'Conjuration', '1 action', 'Touch', 'Instantaneous', 'You touch a creature that has died within the last minute. That creature returns to life with 1 hit point. This spell can''t return to life a creature that has died of old age, nor can it restore any missing body parts.', 'V, S, M', False, False, 'None', 'None', '', 'Cleric, Paladin', 'Lore, Life'),
    

    ('Rope Trick', 2, 'Transmutation', '1 action', 'Touch', '1 hour', 'You touch a length of rope that is up to 60 feet long. One end of the rope then rises into the air until the whole rope hangs perpendicular to the ground. At the upper end of the rope, an invisible entrance opens to an extradimensional space that lasts until the spell ends.', 'V, S, M', False, False, 'None', 'None', '', 'Wizard', 'Lore'),
    

    ('Sacred Flame', 0, 'Evocation', '1 action', '60 feet', 'Instantaneous', 'Flame-like radiance descends on a creature that you can see within range. The target must succeed on a dexterity saving throw or take 1d8 radiant damage. The target gains no benefit from cover for this saving throw.', 'V, S', False, False, 'None', 'Radiant', '', 'Cleric', 'Lore'),
    

    ('Sanctuary', 1, 'Abjuration', '1 bonus action', '30 feet', '1 minute', 'You ward a creature within range against attack. Until the spell ends, any creature who targets the warded creature with an attack or a harmful spell must first make a wisdom saving throw. On a failed save, the creature must choose a new target or lose the attack or spell. This spell doesn''t protect the warded creature from area effects, such as the explosion of a fireball.', 'V, S, M', False, False, 'None', 'None', '', 'Cleric', 'Lore, Devotion'),
    

    ('Scorching Ray', 2, 'Evocation', '1 action', '120 feet', 'Instantaneous', 'You create three rays of fire and hurl them at targets within range. You can hurl them at one target or several.', 'V, S', False, False, 'None', 'Fire', 'When you cast this spell using a spell slot of 3rd level or higher, you create one additional ray for each slot level above 2nd.', 'Sorcerer, Wizard', 'Lore, Fiend'),
    

    ('Scrying', 5, 'Divination', '10 minutes', 'Self', 'Up to 10 minutes', 'You can see and hear a particular creature you choose that is on the same plane of existence as you. The target must make a wisdom saving throw, which is modified by how well you know the target and the sort of physical connection you have to it. If a target knows you''re casting this spell, it can fail the saving throw voluntarily if it wants to be observed.', 'V, S, M', True, False, 'None', 'None', '', 'Bard, Cleric, Druid, Warlock, Wizard', 'Land'),
    

    ('Secret Chest', 4, 'Conjuration', '1 action', 'Touch', 'Instantaneous', 'You hide a chest, and all its contents, on the Ethereal Plane. You must touch the chest and the miniature replica that serves as a material component for the spell. The chest can contain up to 12 cubic feet of nonliving material (3 feet by 2 feet by 2 feet).', 'V, S, M', False, False, 'None', 'None', '', 'Wizard', ''),
    

    ('See Invisibility', 2, 'Divination', '1 action', 'Self', '1 hour', 'For the duration of the spell, you see invisible creatures and objects as if they were visible, and you can see through Ethereal. The ethereal objects and creatures appear ghostly translucent.', 'V, S, M', False, False, 'None', 'None', '', 'Bard, Sorcerer, Wizard', 'Lore'),
    

    ('Seeming', 5, 'Illusion', '1 action', '30 feet', '8 hours', 'This spell allows you to change the appearance of any number of creatures that you can see within range. You give each target you choose a new, illusory appearance. An unwilling target can make a charisma saving throw, and if it succeeds, it is unaffected by this spell.', 'V, S', False, False, 'None', 'None', '', 'Bard, Sorcerer, Wizard', ''),
    

    ('Sending', 3, 'Evocation', '1 action', 'Unlimited', '1 round', 'You send a short message of twenty-five words or less to a creature with which you are familiar. The creature hears the message in its mind, recognizes you as the sender if it knows you, and can answer in a like manner immediately. The spell enables creatures with Intelligence scores of at least 1 to understand the meaning of your message.', 'V, S, M', False, False, 'None', 'None', '', 'Bard, Cleric, Wizard', 'Lore'),
    

    ('Sequester', 7, 'Transmutation', '1 action', 'Touch', 'Until dispelled', 'By means of this spell, a willing creature or an object can be hidden away, safe from detection for the duration. When you cast the spell and touch the target, it becomes invisible and can''t be targeted by divination spells or perceived through scrying sensors created by divination spells.', 'V, S, M', False, False, 'None', 'None', '', 'Wizard', ''),
    

    ('Shapechange', 9, 'Transmutation', '1 action', 'Self', 'Up to 1 hour', 'You assume the form of a different creature for the duration. The new form can be of any creature with a challenge rating equal to your level or lower. The creature can''t be a construct or an undead, and you must have seen the sort of creature at least once. You transform into an average example of that creature, one without any class levels or the Spellcasting trait.', 'V, S, M', True, False, 'None', 'None', '', 'Druid, Wizard', ''),
    

    ('Shatter', 2, 'Evocation', '1 action', '60 feet', 'Instantaneous', 'A sudden loud ringing noise, painfully intense, erupts from a point of your choice within range. Each creature in a 10-foot-radius sphere centered on that point must make a Constitution saving throw. A creature takes 3d8 thunder damage on a failed save, or half as much damage on a successful one. A creature made of inorganic material such as stone, crystal, or metal has disadvantage on this saving throw.', 'V, S, M', False, False, 'None', 'Thunder', 'When you cast this spell using a 3 or higher level spell slot, the damage of the spell increases by 1d8 for each level of higher spell slot 2.', 'Bard, Sorcerer, Warlock, Wizard', 'Lore'),
    

    ('Shield', 1, 'Abjuration', '1 reaction', 'Self', '1 round', 'An invisible barrier of magical force appears and protects you. Until the start of your next turn, you have a +5 bonus to AC, including against the triggering attack, and you take no damage from magic missile.', 'V, S', False, False, 'None', 'None', '', 'Sorcerer, Wizard', 'Lore'),
    

    ('Shield of Faith', 1, 'Abjuration', '1 bonus action', '60 feet', 'Up to 10 minutes', 'A shimmering field appears and surrounds a creature of your choice within range, granting it a +2 bonus to AC for the duration.', 'V, S, M', True, False, 'None', 'None', '', 'Cleric, Paladin', 'Lore'),
    

    ('Shillelagh', 0, 'Transmutation', '1 bonus action', 'Touch', '1 minute', 'The wood of a club or a quarterstaff you are holding is imbued with nature''s power. For the duration, you can use your spellcasting ability instead of Strength for the attack and damage rolls of melee attacks using that weapon, and the weapon''s damage die becomes a d8. The weapon also becomes magical, if it isn''t already. The spell ends if you cast it again or if you let go of the weapon.', 'V, S, M', False, False, 'None', 'None', '', 'Druid', 'Lore'),
    

    ('Shocking Grasp', 0, 'Evocation', '1 action', 'Touch', 'Instantaneous', 'Lightning springs from your hand to deliver a shock to a creature you try to touch. Make a melee spell attack against the target. You have advantage on the attack roll if the target is wearing armor made of metal. On a hit, the target takes 1d8 lightning damage, and it can''t take reactions until the start of its next turn.', 'V, S', False, False, 'melee', 'Lightning', '', 'Sorcerer, Wizard', 'Lore'),
    

    ('Silence', 2, 'Illusion', '1 action', '120 feet', 'Up to 10 minutes', 'For the duration, no sound can be created within or pass through a 20-foot-radius sphere centered on a point you choose within range. Any creature or object entirely inside the sphere is immune to thunder damage, and creatures are deafened while entirely inside it.', 'V, S', True, True, 'None', 'None', '', 'Bard, Cleric, Ranger', 'Lore, Land'),
    

    ('Silent Image', 1, 'Illusion', '1 action', '60 feet', 'Up to 10 minutes', 'You create the image of an object, a creature, or some other visible phenomenon that is no larger than a 15-foot cube. The image appears at a spot within range and lasts for the duration. The image is purely visual; it isn''t accompanied by sound, smell, or other sensory effects.', 'V, S, M', True, False, 'None', 'None', '', 'Bard, Sorcerer, Wizard', 'Lore'),
    

    ('Simulacrum', 7, 'Illusion', '12 hours', 'Touch', 'Until dispelled', 'You shape an illusory duplicate of one beast or humanoid that is within range for the entire casting time of the spell. The duplicate is a creature, partially real and formed from ice or snow, and it can take actions and otherwise be affected as a normal creature. It appears to be the same as the original, but it has half the creature''s hit point maximum and is formed without any equipment. Otherwise, the illusion uses all the statistics of the creature it duplicates.', 'V, S, M', False, False, 'None', 'None', '', 'Wizard', ''),
    

    ('Sleep', 1, 'Enchantment', '1 action', '90 feet', '1 minute', 'This spell sends creatures into a magical slumber. Roll 5d8; the total is how many hit points of creatures this spell can affect. Creatures within 20 feet of a point you choose within range are affected in ascending order of their current hit points (ignoring unconscious creatures).', 'V, S, M', False, False, 'None', 'None', 'When you cast this spell using a spell slot of 2nd level or higher, roll an additional 2d8 for each slot level above 1st.', 'Bard, Sorcerer, Wizard', 'Lore'),
    

    ('Sleet Storm', 3, 'Conjuration', '1 action', '150 feet', 'Up to 1 minute', 'Until the spell ends, freezing rain and sleet fall in a 20-foot-tall cylinder with a 40-foot radius centered on a point you choose within range. The area is heavily obscured, and exposed flames in the area are doused.', 'V, S, M', True, False, 'None', 'None', '', 'Druid, Sorcerer, Wizard', 'Lore, Land'),
    

    ('Slow', 3, 'Transmutation', '1 action', '120 feet', 'Up to 1 minute', 'You alter time around up to six creatures of your choice in a 40-foot cube within range. Each target must succeed on a wisdom saving throw or be affected by this spell for the duration.', 'V, S, M', True, False, 'None', 'None', '', 'Sorcerer, Wizard', 'Lore, Land'),
    

    ('Spare the Dying', 0, 'Necromancy', '1 action', 'Touch', 'Instantaneous', 'You touch a living creature that has 0 hit points. The creature becomes stable. This spell has no effect on undead or constructs.', 'V, S', False, False, 'None', 'None', '', 'Cleric', ''),
    

    ('Speak with Animals', 1, 'Divination', '1 action', 'Self', '10 minutes', 'You gain the ability to comprehend and verbally communicate with beasts for the duration. The knowledge and awareness of many beasts is limited by their intelligence, but at a minimum, beasts can give you information about nearby locations and monsters, including whatever they can perceive or have perceived within the past day. You might be able to persuade a beast to perform a small favor for you, at the GM''s discretion.', 'V, S', False, True, 'None', 'None', '', 'Bard, Druid, Ranger', 'Lore'),
    

    ('Speak with Dead', 3, 'Necromancy', '1 action', '10 feet', '10 minutes', 'You grant the semblance of life and intelligence to a corpse of your choice within range, allowing it to answer the questions you pose. The corpse must still have a mouth and can''t be undead. The spell fails if the corpse was the target of this spell within the last 10 days.', 'V, S, M', False, False, 'None', 'None', '', 'Bard, Cleric', 'Lore'),
    

    ('Speak with Plants', 3, 'Transmutation', '1 action', 'Self', '10 minutes', 'You imbue plants within 30 feet of you with limited sentience and animation, giving them the ability to communicate with you and follow your simple commands. You can question plants about events in the spell''s area within the past day, gaining information about creatures that have passed, weather, and other circumstances.', 'V, S', False, False, 'None', 'None', '', 'Bard, Druid, Ranger', 'Lore'),
    

    ('Spider Climb', 2, 'Transmutation', '1 action', 'Touch', 'Up to 1 hour', 'Until the spell ends, one willing creature you touch gains the ability to move up, down, and across vertical surfaces and upside down along ceilings, while leaving its hands free. The target also gains a climbing speed equal to its walking speed.', 'V, S, M', True, False, 'None', 'None', '', 'Sorcerer, Warlock, Wizard', 'Lore, Land'),
    

    ('Spike Growth', 2, 'Transmutation', '1 action', '150 feet', 'Up to 10 minutes', 'The ground in a 20-foot radius centered on a point within range twists and sprouts hard spikes and thorns. The area becomes difficult terrain for the duration. When a creature moves into or within the area, it takes 2d4 piercing damage for every 5 feet it travels.', 'V, S, M', True, False, 'None', 'None', '', 'Druid, Ranger', 'Lore, Land'),
    

    ('Spirit Guardians', 3, 'Conjuration', '1 action', 'Self', 'Up to 10 minutes', 'You call forth spirits to protect you. They flit around you to a distance of 15 feet for the duration. If you are good or neutral, their spectral form appears angelic or fey (your choice). If you are evil, they appear fiendish.', 'V, S, M', True, False, 'None', 'None', 'When you cast this spell using a spell slot of 4th level or higher, the damage increases by 1d8 for each slot level above 3rd.', 'Cleric', 'Lore'),
    

    ('Spiritual Weapon', 2, 'Evocation', '1 bonus action', '60 feet', '1 minute', 'You create a floating, spectral weapon within range that lasts for the duration or until you cast this spell again. When you cast the spell, you can make a melee spell attack against a creature within 5 feet of the weapon. On a hit, the target takes force damage equal to 1d8 + your spellcasting ability modifier.', 'V, S', False, False, 'melee', 'Force', 'When you cast this spell using a spell slot of 3rd level or higher, the damage increases by 1d8 for every two slot levels above the 2nd.', 'Cleric', 'Lore, Life'),
    

    ('Stinking Cloud', 3, 'Conjuration', '1 action', '90 feet', 'Up to 1 minute', 'You create a 20-foot-radius sphere of yellow, nauseating gas centered on a point within range. The cloud spreads around corners, and its area is heavily obscured. The cloud lingers in the air for the duration.', 'V, S, M', True, False, 'None', 'None', '', 'Bard, Sorcerer, Wizard', 'Lore, Land, Fiend'),
    

    ('Stone Shape', 4, 'Transmutation', '1 action', 'Touch', 'Instantaneous', 'You touch a stone object of Medium size or smaller or a section of stone no more than 5 feet in any dimension and form it into any shape that suits your purpose. So, for example, you could shape a large rock into a weapon, idol, or coffer, or make a small passage through a wall, as long as the wall is less than 5 feet thick. You could also shape a stone door or its frame to seal the door shut. The object you create can have up to two hinges and a latch, but finer mechanical detail isn''t possible.', 'V, S, M', False, False, 'None', 'None', '', 'Cleric, Druid, Wizard', 'Land'),
    

    ('Stoneskin', 4, 'Abjuration', '1 action', 'Touch', 'Up to 1 hour', 'This spell turns the flesh of a willing creature you touch as hard as stone. Until the spell ends, the target has resistance to nonmagical bludgeoning, piercing, and slashing damage.', 'V, S, M', True, False, 'None', 'None', '', 'Druid, Ranger, Sorcerer, Wizard', 'Land'),
    

    ('Storm of Vengeance', 9, 'Conjuration', '1 action', 'Sight', 'Up to 1 minute', 'A churning storm cloud forms, centered on a point you can see and spreading to a radius of 360 feet. Lightning flashes in the area, thunder booms, and strong winds roar. Each creature under the cloud (no more than 5,000 feet beneath the cloud) when it appears must make a constitution saving throw. On a failed save, a creature takes 2d6 thunder damage and becomes deafened for 5 minutes.', 'V, S', True, False, 'None', 'Thunder', '', 'Druid', ''),
    

    ('Suggestion', 2, 'Enchantment', '1 action', '30 feet', 'Up to 8 hours', 'You suggest a course of activity (limited to a sentence or two) and magically influence a creature you can see within range that can hear and understand you. Creatures that can''t be charmed are immune to this effect. The suggestion must be worded in such a manner as to make the course of action sound reasonable. Asking the creature to stab itself, throw itself onto a spear, immolate itself, or do some other obviously harmful act ends the spell.', 'V, M', True, False, 'None', 'None', '', 'Bard, Sorcerer, Warlock, Wizard', 'Lore'),
    

    ('Sunbeam', 6, 'Evocation', '1 action', 'Self', 'Up to 1 minute', 'A beam of brilliant light flashes out from your hand in a 5-foot-wide, 60-foot-long line. Each creature in the line must make a constitution saving throw. On a failed save, a creature takes 6d8 radiant damage and is blinded until your next turn. On a successful save, it takes half as much damage and isn''t blinded by this spell. Undead and oozes have disadvantage on this saving throw.', 'V, S, M', True, False, 'None', 'Radiant', '', 'Druid, Sorcerer, Wizard', ''),
    

    ('Sunburst', 8, 'Evocation', '1 action', '150 feet', 'Instantaneous', 'Brilliant sunlight flashes in a 60-foot radius centered on a point you choose within range. Each creature in that light must make a constitution saving throw. On a failed save, a creature takes 12d6 radiant damage and is blinded for 1 minute. On a successful save, it takes half as much damage and isn''t blinded by this spell. Undead and oozes have disadvantage on this saving throw.', 'V, S, M', False, False, 'None', 'Radiant', '', 'Druid, Sorcerer, Wizard', ''),
    

    ('Symbol', 7, 'Abjuration', '1 minute', 'Touch', 'Until dispelled', 'When you cast this spell, you inscribe a harmful glyph either on a surface (such as a section of floor, a wall, or a table) or within an object that can be closed to conceal the glyph (such as a book, a scroll, or a treasure chest). If you choose a surface, the glyph can cover an area of the surface no larger than 10 feet in diameter. If you choose an object, that object must remain in its place; if the object is moved more than 10 feet from where you cast this spell, the glyph is broken, and the spell ends without being triggered.', 'V, S, M', False, False, 'None', 'None', '', 'Bard, Cleric, Wizard', ''),
    

    ('Telekinesis', 5, 'Transmutation', '1 action', '60 feet', 'Up to 10 minutes', 'You gain the ability to move or manipulate creatures or objects by thought. When you cast the spell, and as your action each round for the duration, you can exert your will on one creature or object that you can see within range, causing the appropriate effect below. You can affect the same target round after round, or choose a new one at any time. If you switch targets, the prior target is no longer affected by the spell.', 'V, S', True, False, 'None', 'None', '', 'Sorcerer, Wizard', ''),
    

    ('Telepathic Bond', 5, 'Divination', '1 action', '30 feet', '1 hour', 'You forge a telepathic link among up to eight willing creatures of your choice within range, psychically linking each creature to all the others for the duration. Creatures with Intelligence scores of 2 or less aren''t affected by this spell.', 'V, S, M', False, True, 'None', 'None', '', 'Wizard', ''),
    

    ('Teleport', 7, 'Conjuration', '1 action', '10 feet', 'Instantaneous', 'This spell instantly transports you and up to eight willing creatures of your choice that you can see within range, or a single object that you can see within range, to a destination you select. If you target an object, it must be able to fit entirely inside a 10-foot cube, and it can''t be held or carried by an unwilling creature.', 'V', False, False, 'None', 'None', '', 'Bard, Sorcerer, Wizard', ''),
    

    ('Teleportation Circle', 5, 'Conjuration', '1 minute', '10 feet', '1 round', 'As you cast the spell, you draw a 10-foot-diameter circle on the ground inscribed with sigils that link your location to a permanent teleportation circle of your choice whose sigil sequence you know and that is on the same plane of existence as you. A shimmering portal opens within the circle you drew and remains open until the end of your next turn. Any creature that enters the portal instantly appears within 5 feet of the destination circle or in the nearest unoccupied space if that space is occupied.', 'V, M', False, False, 'None', 'None', '', 'Bard, Sorcerer, Wizard', ''),
    

    ('Thaumaturgy', 0, 'Transmutation', '1 action', '30 feet', '1 minute', 'You manifest a minor wonder, a sign of supernatural power, within range. You create one of the following magical effects within range.', 'V', False, False, 'None', 'None', '', 'Cleric', 'Lore'),
    

    ('Thunderwave', 1, 'Evocation', '1 action', 'Self', 'Instantaneous', 'A wave of thunderous force sweeps out from you. Each creature in a 15-foot cube originating from you must make a constitution saving throw. On a failed save, a creature takes 2d8 thunder damage and is pushed 10 feet away from you. On a successful save, the creature takes half as much damage and isn''t pushed.', 'V, S', False, False, 'None', 'Thunder', 'When you cast this spell using a spell slot of 2nd level or higher, the damage increases by 1d8 for each slot level above 1st.', 'Bard, Druid, Sorcerer, Wizard', 'Lore'),
    

    ('Time Stop', 9, 'Transmutation', '1 action', 'Self', 'Instantaneous', 'You briefly stop the flow of time for everyone but yourself. No time passes for other creatures, while you take 1d4 + 1 turns in a row, during which you can use actions and move as normal.', 'V', False, False, 'None', 'None', '', 'Sorcerer, Wizard', ''),
    

    ('Tiny Hut', 3, 'Evocation', '1 minute', 'Self', '8 hours', 'A 10-foot-radius immobile dome of force springs into existence around and above you and remains stationary for the duration. The spell ends if you leave its area.', 'V, S, M', False, True, 'None', 'None', '', 'Bard, Wizard', 'Lore'),
    

    ('Tongues', 3, 'Divination', '1 action', 'Touch', '1 hour', 'This spell grants the creature you touch the ability to understand any spoken language it hears. Moreover, when the target speaks, any creature that knows at least one language and can hear the target understands what it says.', 'V, M', False, False, 'None', 'None', '', 'Bard, Cleric, Sorcerer, Warlock, Wizard', 'Lore'),
    

    ('Transport via Plants', 6, 'Conjuration', '1 action', '10 feet', '1 round', 'This spell creates a magical link between a Large or larger inanimate plant within range and another plant, at any distance, on the same plane of existence. You must have seen or touched the destination plant at least once before. For the duration, any creature can step into the target plant and exit from the destination plant by using 5 feet of movement.', 'V, S', False, False, 'None', 'None', '', 'Druid', ''),
    

    ('Tree Stride', 5, 'Conjuration', '1 action', 'Self', 'Up to 1 minute', 'You gain the ability to enter a tree and move from inside it to inside another tree of the same kind within 500 feet. Both trees must be living and at least the same size as you. You must use 5 feet of movement to enter a tree. You instantly know the location of all other trees of the same kind within 500 feet and, as part of the move used to enter the tree, can either pass into one of those trees or step out of the tree you''re in. You appear in a spot of your choice within 5 feet of the destination tree, using another 5 feet of movement. If you have no movement left, you appear within 5 feet of the tree you entered.', 'V, S', True, False, 'None', 'None', '', 'Druid, Ranger', 'Land'),
    

    ('True Polymorph', 9, 'Transmutation', '1 action', '30 feet', 'Up to 1 hour', 'Choose one creature or nonmagical object that you can see within range. You transform the creature into a different creature, the creature into an object, or the object into a creature (the object must be neither worn nor carried by another creature). The transformation lasts for the duration, or until the target drops to 0 hit points or dies. If you concentrate on this spell for the full duration, the transformation becomes permanent.', 'V, S, M', True, False, 'None', 'None', '', 'Bard, Warlock, Wizard', ''),
    

    ('True Resurrection', 9, 'Necromancy', '1 hour', 'Touch', 'Instantaneous', 'You touch a creature that has been dead for no longer than 200 years and that died for any reason except old age. If the creature''s soul is free and willing, the creature is restored to life with all its hit points.', 'V, S, M', False, False, 'None', 'None', '', 'Cleric, Druid', ''),
    

    ('True Seeing', 6, 'Divination', '1 action', 'Touch', '1 hour', 'This spell gives the willing creature you touch the ability to see things as they actually are. For the duration, the creature has truesight, notices secret doors hidden by magic, and can see into the Ethereal Plane, all out to a range of 120 feet.', 'V, S, M', False, False, 'None', 'None', '', 'Bard, Cleric, Sorcerer, Warlock, Wizard', ''),
    

    ('True Strike', 0, 'Divination', '1 action', '30 feet', 'Up to 1 round', 'You extend your hand and point a finger at a target in range. Your magic grants you a brief insight into the target''s defenses. On your next turn, you gain advantage on your first attack roll against the target, provided that this spell hasn''t ended.', 'S', True, False, 'None', 'None', '', 'Bard, Sorcerer, Warlock, Wizard', 'Lore'),
    

    ('Unseen Servant', 1, 'Conjuration', '1 action', '60 feet', '1 hour', 'This spell creates an invisible, mindless, shapeless force that performs simple tasks at your command until the spell ends. The servant springs into existence in an unoccupied space on the ground within range. It has AC 10, 1 hit point, and a Strength of 2, and it can''t attack. If it drops to 0 hit points, the spell ends.', 'V, S, M', False, True, 'None', 'None', '', 'Bard, Warlock, Wizard', 'Lore'),
    

    ('Vampiric Touch', 3, 'Necromancy', '1 action', 'Self', 'Up to 1 minute', 'The touch of your shadow-wreathed hand can siphon life force from others to heal your wounds. Make a melee spell attack against a creature within your reach. On a hit, the target takes 3d6 necrotic damage, and you regain hit points equal to half the amount of necrotic damage dealt. Until the spell ends, you can make the attack again on each of your turns as an action.', 'V, S', True, False, 'melee', 'Necrotic', 'When you cast this spell using a spell slot of 4th level or higher, the damage increases by 1d6 for each slot level above 3rd.', 'Warlock, Wizard', 'Lore'),
    

    ('Vicious Mockery', 0, 'Enchantment', '1 action', '60 feet', 'Instantaneous', 'You unleash a string of insults laced with subtle enchantments at a creature you can see within range. If the target can hear you (though it need not understand you), it must succeed on a wisdom saving throw or take 1d4 psychic damage and have disadvantage on the next attack roll it makes before the end of its next turn.', 'V', False, False, 'None', 'Psychic', '', 'Bard', ''),
    

    ('Wall of Fire', 4, 'Evocation', '1 action', '120 feet', 'Up to 1 minute', 'You create a wall of fire on a solid surface within range. You can make the wall up to 60 feet long, 20 feet high, and 1 foot thick, or a ringed wall up to 20 feet in diameter, 20 feet high, and 1 foot thick. The wall is opaque and lasts for the duration.', 'V, S, M', True, False, 'None', 'Fire', 'When you cast this spell using a spell slot of 5th level or higher, the damage increases by 1d8 for each slot level above 4th.', 'Druid, Sorcerer, Wizard', 'Fiend'),
    

    ('Wall of Force', 5, 'Evocation', '1 action', '120 feet', 'Up to 10 minutes', 'An invisible wall of force springs into existence at a point you choose within range. The wall appears in any orientation you choose, as a horizontal or vertical barrier or at an angle. It can be free floating or resting on a solid surface. You can form it into a hemispherical dome or a sphere with a radius of up to 10 feet, or you can shape a flat surface made up of ten 10-foot-by-10-foot panels. Each panel must be contiguous with another panel. In any form, the wall is 1/4 inch thick. It lasts for the duration. If the wall cuts through a creature''s space when it appears, the creature is pushed to one side of the wall (your choice which side).', 'V, S, M', True, False, 'None', 'None', '', 'Wizard', ''),
    

    ('Wall of Ice', 6, 'Evocation', '1 action', '120 feet', 'Up to 10 minutes', 'You create a wall of ice on a solid surface within range. You can form it into a hemispherical dome or a sphere with a radius of up to 10 feet, or you can shape a flat surface made up of ten 10-foot-square panels. Each panel must be contiguous with another panel. In any form, the wall is 1 foot thick and lasts for the duration.', 'V, S, M', True, False, 'None', 'Cold', 'When you cast this spell using a spell slot of 7th level or higher, the damage the wall deals when it appears increases by 2d6, and the damage from passing through the sheet of frigid air increases by 1d6, for each slot level above 6th.', 'Wizard', ''),
    

    ('Wall of Stone', 5, 'Evocation', '1 action', '120 feet', 'Up to 10 minutes', 'A nonmagical wall of solid stone springs into existence at a point you choose within range. The wall is 6 inches thick and is composed of ten 10-foot-by-10-foot panels. Each panel must be contiguous with at least one other panel. Alternatively, you can create 10-foot-by-20-foot panels that are only 3 inches thick.', 'V, S, M', True, False, 'None', 'None', '', 'Druid, Sorcerer, Wizard', 'Land'),
    

    ('Wall of Thorns', 6, 'Conjuration', '1 action', '120 feet', 'Up to 10 minutes', 'You create a wall of tough, pliable, tangled brush bristling with needle-sharp thorns. The wall appears within range on a solid surface and lasts for the duration. You choose to make the wall up to 60 feet long, 10 feet high, and 5 feet thick or a circle that has a 20-foot diameter and is up to 20 feet high and 5 feet thick. The wall blocks line of sight.', 'V, S, M', True, False, 'None', 'Piercing', 'When you cast this spell using a spell slot of 7th level or higher, both types of damage increase by 1d8 for each slot level above 6th.', 'Druid', ''),
    

    ('Warding Bond', 2, 'Abjuration', '1 action', 'Touch', '1 hour', 'This spell wards a willing creature you touch and creates a mystic connection between you and the target until the spell ends. While the target is within 60 feet of you, it gains a +1 bonus to AC and saving throws, and it has resistance to all damage. Also, each time it takes damage, you take the same amount of damage.', 'V, S, M', False, False, 'None', 'None', '', 'Cleric', 'Lore'),
    

    ('Water Breathing', 3, 'Transmutation', '1 action', '30 feet', '24 hours', 'This spell gives a maximum of ten willing creatures within range and you can see, the ability to breathe underwater until the end of its term. Affected creatures also retain their normal breathing pattern.', 'V, S, M', False, True, 'None', 'None', '', 'Druid, Ranger, Sorcerer, Wizard', 'Lore, Land'),
    

    ('Water Walk', 3, 'Transmutation', '1 action', '30 feet', '1 hour', 'This spell grants the ability to move across any liquid surface--such as water, acid, mud, snow, quicksand, or lava--as if it were harmless solid ground (creatures crossing molten lava can still take damage from the heat). Up to ten willing creatures you can see within range gain this ability for the duration.', 'V, S, M', False, True, 'None', 'None', '', 'Cleric, Druid, Ranger, Sorcerer', 'Lore, Land'),
    

    ('Web', 2, 'Conjuration', '1 action', '60 feet', 'Up to 1 hour', 'You conjure a mass of thick, sticky webbing at a point of your choice within range. The webs fill a 20-foot cube from that point for the duration. The webs are difficult terrain and lightly obscure their area.', 'V, S, M', True, False, 'None', 'None', '', 'Sorcerer, Wizard', 'Lore, Land'),
    

    ('Weird', 9, 'Illusion', '1 action', '120 feet', 'Up to 1 minute', 'Drawing on the deepest fears of a group of creatures, you create illusory creatures in their minds, visible only to them. Each creature in a 30-foot-radius sphere centered on a point of your choice within range must make a wisdom saving throw. On a failed save, a creature becomes frightened for the duration. The illusion calls on the creature''s deepest fears, manifesting its worst nightmares as an implacable threat. At the start of each of the frightened creature''s turns, it must succeed on a wisdom saving throw or take 4d10 psychic damage. On a successful save, the spell ends for that creature.', 'V, S', True, False, 'None', 'None', '', 'Wizard', ''),
    

    ('Wind Walk', 6, 'Transmutation', '1 minute', '30 feet', '8 hours', 'You and up to ten willing creatures you can see within range assume a gaseous form for the duration, appearing as wisps of cloud. While in this cloud form, a creature has a flying speed of 300 feet and has resistance to damage from nonmagical weapons. The only actions a creature can take in this form are the Dash action or to revert to its normal form. Reverting takes 1 minute, during which time a creature is incapacitated and can''t move. Until the spell ends, a creature can revert to cloud form, which also requires the 1-minute transformation.', 'V, S, M', False, False, 'None', 'None', '', 'Druid', ''),
    

    ('Wind Wall', 3, 'Evocation', '1 action', '120 feet', 'Up to 1 minute', 'A wall of strong wind rises from the ground at a point you choose within range. You can make the wall up to 50 feet long, 15 feet high, and 1 foot thick. You can shape the wall in any way you choose so long as it makes one continuous path along the ground. The wall lasts for the duration.', 'V, S, M', True, False, 'None', 'Bludgeoning', '', 'Druid, Ranger', 'Lore'),
    

    ('Wish', 9, 'Conjuration', '1 action', 'Self', 'Instantaneous', 'Wish is the mightiest spell a mortal creature can cast. By simply speaking aloud, you can alter the very foundations of reality in accord with your desires.', 'V', False, False, 'None', 'None', '', 'Sorcerer, Wizard', ''),
    

    ('Word of Recall', 6, 'Conjuration', '1 action', '5 feet', 'Instantaneous', 'You and up to five willing creatures within 5 feet of you instantly teleport to a previously designated sanctuary. You and any creatures that teleport with you appear in the nearest unoccupied space to the spot you designated when you prepared your sanctuary (see below). If you cast this spell without first preparing a sanctuary, the spell has no effect.', 'V', False, False, 'None', 'None', '', 'Cleric', ''),
    

    ('Zone of Truth', 2, 'Enchantment', '1 action', '60 feet', '10 minutes', 'You create a magical zone that guards against deception in a 15-foot-radius sphere centered on a point of your choice within range. Until the spell ends, a creature that enters the spell''s area for the first time on a turn or starts its turn there must make a Charisma saving throw. On a failed save, a creature can''t speak a deliberate lie while in the radius. You know whether each creature succeeds or fails on its saving throw.', 'V, S', False, False, 'None', 'None', '', 'Bard, Cleric, Paladin', 'Lore, Devotion');

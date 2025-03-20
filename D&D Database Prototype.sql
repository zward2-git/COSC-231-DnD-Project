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

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
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,  -- Monster name
    challenge_rating DECIMAL(3,1) NOT NULL,  -- CR for difficulty scaling
    hit_points INT NOT NULL,  -- HP of the creature
    armor_class INT NOT NULL,  -- AC value
    speed VARCHAR(50),  -- Movement speed (e.g., "30 ft, fly 60 ft")
    abilities TEXT,  -- Strength, Dexterity, etc.
    actions TEXT,  -- Special actions/attacks
    type VARCHAR(100) NOT NULL,  -- Creature type (e.g., Dragon, Undead)
    alignment VARCHAR(50) NOT NULL,  -- Lawful Good, Chaotic Evil, etc.
    size VARCHAR(50) NOT NULL,  -- Small, Medium, Large, etc.
    legendary BOOLEAN DEFAULT FALSE,  -- If it has legendary actions
    languages TEXT NULL  -- Languages the monster can speak
);

-- Spells table for magical abilities
CREATE TABLE spells (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,  -- Spell name
    level INT NOT NULL,  -- Spell level (0 for cantrips)
    school VARCHAR(100) NOT NULL,  -- Magic school (e.g., Evocation, Necromancy)
    casting_time VARCHAR(50),  -- Time required to cast (e.g., "1 Action")
    `range` VARCHAR(50),  -- Spell `range` (e.g., "60 ft")
    duration VARCHAR(50),  -- Duration (e.g., "Concentration, up to 1 minute")
    description TEXT,  -- Full spell description
    components VARCHAR(50),  -- V, S, M (Verbal, Somatic, Material)
    concentration BOOLEAN DEFAULT FALSE,  -- If the spell requires concentration
    ritual BOOLEAN DEFAULT FALSE  -- If the spell can be cast as a ritual
);

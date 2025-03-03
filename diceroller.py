# FIXME: Will eventually line it up with the database, but these variable names will work for now

import random
import re
import mysql.connector

def make_connection():
    connection = mysql.connector.connect(
        host="sample_host",
        user="your_user",
        password="your_password",
        database="dnd_database")
    return connection

def get_spell_damage(spell_name):
    connection = make_connection()
    cursor = connection.cursor(dictionary=True)
    query = "SELECT * FROM spells WHERE name = %s"
    cursor.execute(query, (spell_name,))
    spell_data = cursor.fetchone()
    cursor.close()
    connection.close()

    if spell_data:
        return spell_data['damage']
    else:
        return None

def roll_dice(dice_input):
    # extract dice info
    match = re.match(r'(\d+)d(\d+)\s*([+-]\s*\d+)?', dice_input)
    if not match:
        return "please use the format 'NdM [+- X]' (e.g., '2d20 + 3')."
    
    num_dice = int(match.group(1))
    num_sides = int(match.group(2))
    modifier = match.group(3)
    
    if num_dice < 1 or num_sides < 2:
        return "number of dice must be at least 1 and number of sides must be at least 2."
    
    # actually rolling the dice
    rolls = [random.randint(1, num_sides) for _ in range(num_dice)]
    total = sum(rolls)
    
    # modifier
    if modifier:
        modifier = int(modifier.replace(" ", ""))
        total += modifier
    
    return f"Rolls: {rolls}\nModifier: {modifier if modifier else 0}\nTotal: {total}"

def roll_spell_damage(spell_name):
    spell_damage = get_spell_damage(spell_name)

    if spell_damage:
        print(f"Rolling damage for {spell_name}: {spell_damage}")
        result = roll_dice(spell_damage)
        print(result)
    else:
        print(f"Spell {spell_name} not found in the database.")

# ill make this run on command line eventually
if __name__ == "__main__":
    spell_name = input("Enter the spell name: ")
    roll_spell_damage(spell_name)

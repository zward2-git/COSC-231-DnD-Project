import random
import re
import mysql.connector
import json
from connections import get_info_spells

def roll_dice(dice_input):
    match = re.match(r'(\d+)d(\d+)(\s*([+-]\s*\d+))?', dice_input)
    if not match:
        return {"error": f"Invalid dice format: {dice_input}"}

    num_dice = int(match.group(1))
    num_sides = int(match.group(2))
    modifier = match.group(3)

    if num_dice < 1 or num_sides < 2:
        return {"error": "Number of dice must be at least 1 and sides at least 2."}

    rolls = [random.randint(1, num_sides) for _ in range(num_dice)]
    total = sum(rolls)

    if modifier:
        modifier = int(modifier.replace(" ", ""))
        total += modifier
    else:
        modifier = 0

    return {
        "rolls": rolls,
        "modifier": modifier,
        "total": total
    }

def get_damage_formula_from_spell(spell_name):
    spell_data_json = get_info_spells()
    
    if not spell_data_json:
        return None

    try:
        spell_data = json.loads(spell_data_json)

        if isinstance(spell_data, (list, tuple)):
            damage = spell_data[DAMAGE_INDEX] if len(spell_data) > DAMAGE_INDEX else None
        elif isinstance(spell_data, dict):
            damage = spell_data.get('damage')
        else:
            damage = None

        return damage

    except json.JSONDecodeError:
        print("Failed to parse spell data")
        return None

def process_input_file(input_filename="rollinput.json", output_filename="rolloutput.json"):
    with open(input_filename, "r") as f:
        input_data = json.load(f)

    input_type = input_data.get("input_type")
    value = input_data.get("value")

    if input_type == "spell":
        dice_expression = get_damage_formula_from_spell(value)

        if dice_expression is None:
            output_data = {"error": f"Spell '{value}' not found in database."}
        else:
            result = roll_dice(dice_expression)
            output_data = {
                "input_type": "spell",
                "spell_name": value,
                "dice_expression": dice_expression,
                "roll_result": result
            }

    elif input_type == "manual":
        result = roll_dice(value)
        output_data = {
            "input_type": "manual",
            "dice_expression": value,
            "roll_result": result
        }
    else:
        output_data = {"error": "Invalid input type."}

    with open(output_filename, "w") as f:
        json.dump(output_data, f, indent=4)


if __name__ == "__main__":
    process_input_file()

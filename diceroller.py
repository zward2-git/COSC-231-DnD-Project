import random
import re

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
        modifier = int(modifier.replace(" ", "")
        total += modifier
    
    return f"Rolls: {rolls}\nModifier: {modifier if modifier else 0}\nTotal: {total}"

# ill make this run on command line eventually
if __name__ == "__main__":
    dice_input = input("Enter dice to roll (e.g., '2d20 + 3'): ")
    result = roll_dice(dice_input)
    print(result)

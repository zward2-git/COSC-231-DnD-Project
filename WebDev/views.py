from flask import Blueprint, render_template, redirect, url_for, jsonify, request

'''importing database connections functions to access in the java script will go under here'''
from connections import get_info_equipment, get_info_armor_shields, get_info_weapons, get_info_consumables, get_info_spells, get_info_magic_items
from diceroller import roll_dice


views = Blueprint(__name__, "views")

'''Routes to different pages here'''


'''home page'''
@views.route("/")
def home():
    return render_template("Home.html")

    '''spells page'''
@views.route("/spells")
def spells():
    return render_template("Spells.html")

    '''characters page
@views.route("/characters")
def characters():
    return render_template("Characters.html")
    '''

    '''inventory page'''
@views.route("/inventory")
def inventory():
    return render_template("Inventory.html")

    '''encounters page'''
@views.route("/encounters")
def encounters():
    return render_template("Encounters.html")

    '''dice roller page'''
@views.route("/diceroller")
def diceRoller():
    return render_template("DiceRoll.html")


'''putting the routes to the connection functions here to access in js files'''

@views.route("/api/equipmentdata" methods = ['GET'])
def equipment():
     data = request.get_json()
     equipment = data.get('equipmentInput')
     result = get_info_equipment()
     return jsonify({'result' : result})

@views.route("/api/armordata" methods = ['GET'])
def armor():
    data = request.get_json()
    armor = data.get('armorInput')
    result = get_info_armor_shields() 
    return jsonify({'result' : result})

@views.route("/api/weapondata" methods = ['GET'])
def weapon():
    data = request.get_json()
    weapon = data.get('weaponInput')
    result = get_info_weapons() 
    return jsonify({'result' : result})

@views.route("/api/consumabledata" methods = ['GET'])
def consumable():
    data = request.get_json()
    consumable = data.get('consumableInput')
    result = get_info_consumables()
    return jsonify({'result' : result})

@views.route("/api/spelldata" methods = ['GET'])
def spell():
    data = request.get_json()
    spell = data.get('spellInput')
    result = get_info_spells() 
    return jsonify({'result' : result})

@views.route("/api/magicdata" methods = ['GET'])
def spell():
    data = request.get_json()
    spell = data.get('toolsInput')
    result = get_info_magic_items() 
    return jsonify({'result' : result})


'''route to the diceroller function'''

@views.route("/api/rollingdice" methods = ['GET'])
def roll():
    data = request.get_json()
    dice = data.get('diceInput')
    num = data.get('amountDice')
    result = roll_dice(dice)
    return jsonify({'result' : result})
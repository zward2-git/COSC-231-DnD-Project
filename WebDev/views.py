from flask import Blueprint, render_template, redirect, url_for

'''importing database connections functions to access in the java script will go under here'''





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
     #result = [python function]
     #return jsonify({'result' : result})

@views.route("/api/armordata" methods = ['GET'])
def armor():
    data = request.get_json()
    armor = data.get('armorInput')
    #result = [python function] 
    #return jsonify({'result' : result})

@views.route("/api/weapondata" methods = ['GET'])
def weapon():
    data = request.get_json()
    weapon = data.get('weaponInput')
    #result = [python function] 
    #return jsonify({'result' : result})

@views.route("/api/consumabledata" methods = ['GET'])
def consumable():
    data = request.get_json()
    consumable = data.get('consumableInput')
    #result = [python function] 
    #return jsonify({'result' : result})

@views.route("/api/spelldata" methods = ['GET'])
def spell():
    data = request.get_json()
    spell = data.get('spellInput')
    #result = [python function] 
    #return jsonify({'result' : result})


'''route to the diceroller function'''

@views.route("/api/rollingdice" methods = ['GET'])
def roll():
    data = request.get_json()
    dice = data.get('diceInput')
    num = data.get('numDice')
    #result = [python function]
    #return jsonify({'result' : result})
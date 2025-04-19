from flask import Blueprint, render_template, redirect, url_for

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

    '''characters page'''
@views.route("/characters")
def characters():
    return render_template("Characters.html")
    
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
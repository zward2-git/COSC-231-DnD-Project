from flask import Blueprint, render_template, request, jsonify,  redirect, url_for

views = Blueprint(__name__, "views")


'''this is the initial page which I've simply been making into the login screen'''
@views.route("/")
def LoginHome():
    return render_template("LoginHome.html", user = "Guest")

'''
@views.route("/home/<user>")
def profile(user):
    return render_template(Home.html)

    
    this is for the user's home page which I am working on being able to redirect the user to from the login page.
'''
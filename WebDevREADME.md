
I am utilizing flask to route webpages and connect them using python, may need help with integrating python code for databases entry and connecting that info to the JavaScript implimentation of the html code. 

I am focusing in on the html and functionality of the pages and not working on the styles yet, my familiarity with css is very slim but I am using it as I go to organize pages visually for easy readability and to get a better idea of the layout.

Please let me know if any pages need to be added or if something should be added to the pages already included


Shhhhhh the problems in my redirecting function aren't real you're imagining them, to be so honest, I have no idea what the problem is the code works how it should and there is no error messages while running, however, I am looking into the stability of this as I don't want any bugs or glitches


FILE CONTENTS :

    > app.py - sets up flask systems

    > views.py - contains routes to pages

    > templates folder - contains html files to different pages

    > static folder - contains both the JavaScript and the CSS files (in an internal folder) for the html very much incomplete given that at the moment I am focusing on the html



STEPS TO DO :

    > Add full functionality in all pages

    > Integration of python, html, and javascript for proper user interaction

    > Spell page database search and insertion

    > Characters page content if we so decide

STEPS IN PROGRESS :

    > Encounters attack insertion functionality
    
    > Page styles

STEPS MOSTLY COMPLETED (not including style cuz its too early for all that) :

    > Redirecting buttons on home to each page option

    > Redirecting buttons on each page back to the home screen

    > Home page content

    > Drop down menus that allows appending to lists in inventory

    > Inventory page content

    > Dice Roll page content

    > Dice roll advantage functionality (won't do functionality of dice cuz someone was tasked to do that)

    > Spells page content

    > Spells list functionality similar to inventory page for spells

    > Encounters page content

    > Encounters partial functionality for info insertion and proper layout

    > Commented out Characters page for now 




To view in working dev webpage : 

    create python environment
        CTRL + Shift + P
        select, Python: Create Environment...
        match selection to files already here (.venv) 

    open your own terminal
        CTRL + Shift + `

    use the following commands
        python -m pip install flask
        python -m flask run

if this does not work just run app.py and views.py and you should be able to use the environment if flask is installed and refresh the page to reset the environment (I don't know why or when to use each of these seperate strategies but please try the one above first as you'll need some of these things open and running anyways)

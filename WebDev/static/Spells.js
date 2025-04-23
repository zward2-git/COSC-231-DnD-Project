
function redirectToPage(target){
    window.location.href = target;
}

//FUNCTION TO ADD NEW SPELL TO LIST WILL ONLY DO THIS BY SPELL NAME SO THAT WE
//CAN ADD SEARCH FROM AND DATABASE TO AUTO FILL OTHER INFO 

//WILL NEED TO COME BACK FOR INSERTION FUNCTIONALITY

const add = document.getElementById("addButton");

const spellInput = document.getElementById("spellInput");

const spells = document.getElementById("spells");
const levels = document.getElementById("levels");
const casts = document.getElementById("casts");
const durations = document.getElementById("durations");
const ranges = document.getElementById("ranges");
const saves = document.getElementById("saves");
const affects = document.getElementById("affects");



add.onclick = function() {
    let newSpell = spellInput.value;

    if (newSpell.trim() !== "") {
        let newEntry = document.createElement("li");

        //this will fetch the python function
       fetch('/api/spelldata')
            .then(response => response.json())
            .then(data => {
                let newSpellData = `Result:${data.result}`;
            })

        newEntry.textContent = newSpell;
        spells.append(newEntry);

        //this for now until we get data array working
        let noEntry = document.createElement("li");
        noEntry.textContent = "--";


        levels.append(noEntry.cloneNode(true));

        casts.append(noEntry.cloneNode(true));

        durations.append(noEntry.cloneNode(true));

        ranges.append(noEntry.cloneNode(true));

        saves.append(noEntry.cloneNode(true));

        affects.append(noEntry.cloneNode(true));

        spellInput.value = "";
        console.log("New spell added.");

    } else {
        alert("Enter valid spell.");
    }
}
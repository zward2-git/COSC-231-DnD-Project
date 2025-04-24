
function redirectToPage(target){
    window.location.href = target;
}

//FUNCTION TO ADD NEW SPELL TO LIST WILL ONLY DO THIS BY SPELL NAME 
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
        let newSpellEntry = document.createElement("li");

        //this will fetch the python function
       fetch('/api/spelldata')
            .then(response => response.json())
            .then(data => {
                let newSpellData = `Result:${data.result}`;
            })

            
        newSpellEntry.textContent = newSpellData[1]; //POSSIBLE FOR IF WE USE AN ARRAY FOR ONE 
        spells.append(newSpellEntry);

        
        let newLevelEntry = document.createElement("li");

        newLevelEntry.textContent = newSpellData[2];  
        levels.append(newLevelEntry);


        let newCastEntry = document.createElement("li");

        newCastEntry.textContent = newSpellData[4];  
        casts.append(newCastEntry);


        let newDurationEntry = document.createElement("li");

        newDurationEntry.textContent = newSpellData[6];  
        durations.append(newDurationEntry);


        let newRangeEntry = document.createElement("li");

        newRangeEntry.textContent = newSpellData[5];  
        ranges.append(newRangeEntry);


        let newSaveEntry = document.createElement("li");

        newSaveEntry.textContent = newSpellData[11];  
        saves.append(newSaveEntry);


        let newAffectEntry = document.createElement("li");

        newAffectEntry.textContent = newSpellData[12];  
        affects.append(newAffectEntry);
        

        newEntry.textContent = newSpell;
        spells.append(newEntry);
        
        /*
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
        */

    } else {
        alert("Enter valid spell.");
    }
}

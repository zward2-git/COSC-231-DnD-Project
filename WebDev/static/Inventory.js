/*
function redirectToHome(){
    window.location.href = "{{url_for('views.home')}}";
}
*/

function redirectToPage(target){
    window.location.href = target;
}

    //get input in armor and add to list
    //we can make this intoa sort of search input function with the database
const armorInput = document.getElementById("newArmor");
const armorButton = document.getElementById("armorButton");
const armorList = document.getElementById("armorList");


armorButton.onclick = function() {
    let newArmor = armorInput.value;

    if (newArmor.trim() !== "") {

        fetch('/api/armordata')
            .then(response => response.json())
            .then(data => {
            let newArmorData = `Result:${data.result}`;
        })

        /*MIGHT HAVE TO ADD SOMETHING FOR THE REST OF THE DATA 
        BUT MAINLY TRYING TO JUST GET THE RIGHT THINGS ON THE PAGE
        let newItem = document.createElement("li");
        newItem.textContent = newArmorData[#];
        */

//COMMENT OUT BELLOW WHEN FETCH STATEMENTS ARE DONE
        let newItem = document.createElement("li");
        newItem.textContent = newArmor;
//UP TO HERE ONLY 

        armorList.append(newItem);

        armorInput.value = "";

        console.log("New armor added.");
    } else {
        alert("Enter valid item.");
    }
}

    //function to input new weapons in list
const weaponInput = document.getElementById("newWeapon");
const weaponButton = document.getElementById("weaponButton");
const weaponList = document.getElementById("weaponList");


weaponButton.onclick = function() {
    let newWeapon = weaponInput.value;
    
    if (newWeapon.trim() !== "") {

        fetch('/api/weapondata')
            .then(response => response.json())
            .then(data => {
            let newWeaponData = `Result:${data.result}`;
        })

        /*
        let newItem = document.createElement("li");
        newItem.textContent = newWeaponData[#];
        */

//COMMENT OUT BELLOW WHEN FETCH STATEMENTS ARE DONE
        let newItem = document.createElement("li");
        newItem.textContent = newWeapon;
//UPTO HERE
        weaponList.append(newItem);

        weaponInput.value = "";

        console.log("New weapon added.");
    } else {
        alert("Enter valid item.");
    }
}


    //woah the same function, but for consumables? who'd of thought?
const consumableInput = document.getElementById("newConsumable");
const consumableButton = document.getElementById("consumableButton");
const consumableList = document.getElementById("consumableList");


consumableButton.onclick = function() {
    let newConsumable = consumableInput.value;
    
    if (newConsumable.trim() !== "") {

        fetch('/api/consumabledata')
            .then(response => response.json())
            .then(data => {
            let newConsumableData = `Result:${data.result}`;
        })

        /*
        let newItem = document.createElement("li");
        newItem.textContent = newConsumableData[#];
        */

//COMMENT OUT BELLOW WHEN FETCH STATEMENTS ARE DONE
        let newItem = document.createElement("li");
        newItem.textContent = newConsumable;
//UP TO HERE ONLY

        consumableList.append(newItem);

        consumableInput.value = "";

        console.log("New consumable added.");
    } else {
        alert("Enter valid item.");
    }
}


    //another of the same function... wow. Gotta hand it to me, I'm creative
    const gearInput = document.getElementById("newGear");
    const gearButton = document.getElementById("gearButton");
    const gearList = document.getElementById("gearList");
    
    
    gearButton.onclick = function() {
        let newGear = gearInput.value;
        
        if (newGear.trim() !== "") {
    
            fetch('/api/equipmentdata')
            .then(response => response.json())
            .then(data => {
            let newEquipmentData = `Result:${data.result}`;
        })

        /*
        let newItem = document.createElement("li");
        newItem.textContent = newEquipmentData[#];
        */

//COMMENT OUT BELLOW WHEN FETCH STATEMENTS ARE DONE
            let newItem = document.createElement("li");
            newItem.textContent = newGear;
//UP TO HERE ONLY
    
            gearList.append(newItem);
    
            gearInput.value = "";
    
            console.log("New gear added.");
        } else {
            alert("Enter valid item.");
        }
    }

    //functions to add currency
    let gold = 0;
    let silver = 0;
    let copper = 0;

    const wealthList = document.getElementById("wealthList");

    const goldInput = document.getElementById("newGold");
    const goldButton = document.getElementById("goldButton");
    
    const silverInput = document.getElementById("newSilver");
    const silverButton = document.getElementById("silverButton");

    const copperInput = document.getElementById("newCopper");
    const copperButton = document.getElementById("copperButton");

    goldButton.onclick = function() {
        let newGold = Number(goldInput.value);
        
        if (newGold !== 0) {
    
            gold += newGold;

            let goldhtml = document.getElementById("gold");
            goldhtml.textContent = `${gold} Gold pieces.`;

            goldInput.value = "";
    
            console.log("Gold changed.");
        } else {
            alert("Enter valid amount.");
        }
    }
    silverButton.onclick = function() {
        let newSilver = Number(silverInput.value);
        
        if (newSilver !== 0) {
    
            silver += newSilver;

            let silverhtml = document.getElementById("silver");
            silverhtml.textContent = `${silver} Silver pieces.`;

    
            silverInput.value = "";
    
            console.log("Silver changed.");
        } else {
            alert("Enter valid amount.");
        }
    }
    copperButton.onclick = function() {
        let newCopper = Number(copperInput.value);
        
        if (newCopper !== 0) {
    
            copper += newCopper;
            
            let copperhtml = document.getElementById("copper");
            copperhtml.textContent = `${copper} Copper pieces.`;

            copperInput.value = "";
    
            console.log("Copper changed.");
        } else {
            alert("Enter valid amount.");
        }
    }

    //MAGIC ITEMS function
        //I REPEAT THIS IS FOR MAGIC ITEMS CODE SAYS TOOLS BUT IT IS MAGIC ITEMS
    //ONE MORE FUCKING TIME! THIS IS MAGIC ITEMS
    const toolsInput = document.getElementById("newTools");
    const toolsButton = document.getElementById("toolsButton");
    const toolsList = document.getElementById("toolsList");
    
    
    toolsButton.onclick = function() {
        let newTools = toolsInput.value;
        
        if (newTools.trim() !== "") {
    
            fetch('/api/magicdata')
            .then(response => response.json())
            .then(data => {
            let newMagicData = `Result:${data.result}`;
        })

        /*
        let newItem = document.createElement("li");
        newItem.textContent = newMagicData[#];
        */

//COMMENT OUT BELLOW WHEN FETCH STATEMENTS ARE DONE
            let newItem = document.createElement("li");
            newItem.textContent = newTools;
//UP TO HERE ONLY

            toolsList.append(newItem);
    
            toolsInput.value = "";
    
            console.log("New tool added.");
        } else {
            alert("Enter valid item.");
        }
    }

    //misc function
//LEAVING AS IS FOR ITEMS WE DONT HAVE IN DATABASE
    //ANNOYINGLY TOO MUCH WORK TO DELETE AND IM LAZY
    const miscInput = document.getElementById("newMisc");
    const miscButton = document.getElementById("miscButton");
    const miscList = document.getElementById("miscList");
    
    
    miscButton.onclick = function() {
        let newMisc = miscInput.value;
        
        if (newMisc.trim() !== "") {
    
            let newItem = document.createElement("li");
            newItem.textContent = newMisc;
    
            miscList.append(newItem);
    
            miscInput.value = "";
    
            console.log("New misc added.");
        } else {
            alert("Enter valid item.");
        }
    }


function redirectToPage(target){
    window.location.href = target;
}


const add = document.getElementById("attackButton");

const newAttack = document.getElementById("newAttack");

const attack = document.getElementById("attack");
const bonus = document.getElementById("bonus");
const damage = document.getElementById("damage");

add.onclick = function() {
    let newA = newAttack.value;

    if (newA.trim() !== "") {
        let newEntry = document.createElement("li");

        newEntry.textContent = newA;
        attack.append(newEntry);

        let noEntry = document.createElement("li");
        noEntry.textContent = "--";

        bonus.append(noEntry.cloneNode(true));

        damage.append(noEntry.cloneNode(true));

        newAttack.value = "";
        console.log("New attack added.");

    } else {
        alert("Enter valid spell.");
    }
}
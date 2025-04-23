
function redirectToPage(target){
    window.location.href = target;
}

const advantageCheck = document.getElementById("check");
const amountDice = document.getElementById("numDice");
const diceNum = document.getElementById("diceNum");
const advantageNum = document.getElementById("advantageDice");

const d4 = document.getElementById("d4");
const d6 = document.getElementById("d6");
const d8 = document.getElementById("d8");
const d10 = document.getElementById("d10");
const d12 = document.getElementById("d12");
const d20 = document.getElementById("d20");
const d100 = document.getElementById("d100");

const roll = document.getElementById("rollButton");

let sides = 0;

//INSERTS AND REMOVES ADVANTAGE DICE
advantageCheck.onclick = function(){
    if (advantageCheck.checked){
        advantageNum.textContent = "0";

    } else {
        advantageNum.textContent = "";
    }
}

d4.onclick = function() {
    sides = 4;
}
d6.onclick = function() {
    sides = 6;
}
d8.onclick = function() {
    sides = 8;
}
d10.onclick = function() {
    sides = 10;
}
d12.onclick = function() {
    sides = 12;
}
d20.onclick = function() {
    sides = 20;
}
d100.onclick = function() {
    sides = 100;
}

roll.onclick = function() {
    
    fetch('/api/rollingdice')
        .then(response => response.json())
        .then(data => {
        let diceResult = `Result:${data.result}`;
    })
    diceNum.textContent = diceResult;

    
    if (advantageCheck.checked){
        fetch('/api/rollingdice')
            .then(response => response.json())
            .then(data => {
            let diceResult02 = `Result:${data.result}`;
        })
        advantageNum.textContent = diceResult02;
    }
}
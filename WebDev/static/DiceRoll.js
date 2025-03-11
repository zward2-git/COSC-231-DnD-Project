
function redirectToPage(target){
    window.location.href = target;
}

const advantageCheck = document.getElementById("check");
const diceNum = document.getElementById("diceNum");
const advantageNum = document.getElementById("advantageDice");

//INSERTS AND REMOVES ADVANTAGE DICE
advantageCheck.onclick = function(){
    if (advantageCheck.checked){
        advantageNum.textContent = "0";
    } else {
        advantageNum.textContent = "";
    }
}

//DIC NUMBER BUTTON STUFF HERE

//ROLL BUTTON STUFF HERE
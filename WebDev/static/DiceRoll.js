
function redirectToPage(target){
    window.location.href = target;
}

const advantageCheck = document.getElementById("check");
const diceNum = document.getElementById("diceNum");
const advantageNum = document.getElementById("advantageDice");

//NOT WORKING FULLY RN GO AWAY
advantageCheck.onclick = function(){
    if (advantageCheck.checked){
        advantageNum.textContent = "0";
    } else {
        advantageNum.textContent = "";
    }
}
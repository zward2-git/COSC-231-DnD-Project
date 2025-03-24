
function redirectToPage(target){
    window.location.href = target;
}

//pop up stuff
const popUp = document.getElementById("popUp");
const addButton = document.getElementById("addButton");
const span = document.getElementById("closeButton");

addButton.onclick = function() {
    popUp.style.display = "block";
}

span.onclick = function() {
    popUp.style.display = "none";
}

window.onclick = function(event) {
    if (event.target == popUp) {
        popUp.style.display = "none";
    }
}

//new charcter insertion
const submit = document.getElementById("submit");
const charInfo = document.getElementById("newCharInfo");
const name = document.getElementById("newName");
const pic = document.getElementById("charPic")

submit.onclick = function() {
    popUp.style.display = "none";

    let newChar = document.createElement("div");
    newChar.className = "card";

    let newName = document.createElement("h4");
    newName.className = "charName";
    newName.textContent = name.value;
    
    newChar.appendChild(newName);

    document.getElementById("container").appendChild(newChar);
}
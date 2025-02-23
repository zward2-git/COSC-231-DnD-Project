console.log("site is running");

let user;
let pass;
const messDis = document.getElementById("loginMess");

//function to send username and password into the python code
/*
async function sendUserPass(username, password){

    
}*/

//possibly will need database with user data forgein keys or we can make a python dictionary of somesort

//I'll be using fake administrator logins for now :) and will change this all later
document.getElementById("loginButt").onclick = function(){

    user = document.getElementById("username").value;
    let notAdmin = true;

    
    if(user != "admin"){
        messDis.textContent = "Wrong Username, please retry.";
    }
    else{ 
        pass = document.getElementById("password").value;

        if(pass == "mygf"){
            notAdmin = false;
            console.log(user);
            messDis.textContent = ' ';

            //going to put the sendUserPass function here and reroute user to their homepage
        }
        else{
            messDis.textContent = "You are not the Admin, GTFO.";
         }
    }
}
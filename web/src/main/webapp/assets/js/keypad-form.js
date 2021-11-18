

let count = 0;

let cardNo;
let endDate;
let cvv;
let issueNo;
let amount;




function checkStoredValues() {
    console.log(cardNo);
    console.log(endDate);
    console.log(cvv);
    console.log(issueNo);
}

function callStoredValues() {
    document.getElementById("cardNo").value = cardNo;
    document.getElementById("endDate").value = endDate;
    document.getElementById("cvv").value = cvv;
    document.getElementById("issueNo").value = issueNo;
    document.getElementById("amount").value = amount;
    
    document.getElementById("btnSubmitHidden").click();
    
}

let btnTransaction = document.getElementById("btnTransaction");
    
    btnTransaction.style.visibility = "hidden";
    
let invisibleDiv = document.getElementById("invisibleDiv");
    
    invisibleDiv.style.display = "none";

document.getElementById("btnKeyPad").addEventListener("click", event =>{
    let inputField = document.getElementById(count);
    
    
    if (count == 0) {
        cardNo = inputField.value;
        inputField.type = "hidden";
        count+=1;
        document.getElementById("label").innerHTML = "Enter expiry date in MM/YY format:"
        document.getElementById(count).type = "text";
    }
    
    else if (count == 1) {
        endDate = inputField.value;
        inputField.type = "hidden";
        count+=1;
        document.getElementById("label").innerHTML = "Enter CVV code:"
        document.getElementById(count).type = "text";
    }
    
    else if (count == 2) {
        cvv = inputField.value;
        inputField.type = "hidden";
        count+=1;
        document.getElementById("label").innerHTML = "Enter issue number:"
        document.getElementById(count).type = "text";
    }
    
    else if (count == 3) {
        issueNo = inputField.value;
        inputField.type = "hidden";
        count+=1;
        document.getElementById("label").innerHTML = "Enter amount:"
        document.getElementById(count).type = "text";
    }
    
    else if (count == 4) {
        amount = inputField.value;
        inputField.type = "hidden";
        document.getElementById("label").innerHTML = "Press 'Initiate Transaction' to process"
        btnTransaction.style.visibility = "visible";
    }

});








//dsadasd
document.getElementsByName("selectButtons").forEach(e => e.addEventListener("click", function() {
document.getElementsByName('numpad').forEach(element => {
element.setAttribute('onclick', `document.getElementsByName("${e.value}")[0].value = document.getElementsByName("${e.value}")[0].value + "${element.textContent}"`);
}); 

document.getElementsByName('numpad-back')[0].setAttribute('onclick', `document.getElementsByName("${e.value}")[0].value = document.getElementsByName("${e.value}")[0].value.slice(0, -1)`); 

document.getElementsByName('numpad-clear')[0].setAttribute('onclick', `document.getElementsByName("${e.value}")[0].value = document.getElementsByName("${e.value}")[0].value = '';`);
}));
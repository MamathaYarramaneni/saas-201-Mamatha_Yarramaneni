// This is a closure function https://medium.com/javascript-scene/master-the-javascript-interview-what-is-a-closure-b2f0d2152b36

(function() {
  
  var initialize = function() {
    /*
      1. Add all your event bindings here. Please avoid binding events inline and add your event listeners here.

      onSubmit callback
      disableDuplicateSecondaryDepartment callback,...
    */
   document.getElementById("name").focus;
  //  document.getElementById ("name1").addEventListener("change",onSubmit);
  document.getElementById("department2").options[0].disabled=true;
 
  document.getElementById("department2").value = document.getElementById("department2").options[1].value;
  console.log(document.getElementById("department2").value);
   document.getElementById ("department1").addEventListener( "change",disableDuplicateSecondaryDepartment);
//    console.log("hey1");
   document.getElementById ("submit").addEventListener("click",onSubmit);
   
  };

 var disableDuplicateSecondaryDepartment=function() {
    // 2. in department2, Should disable the option selected in department1
   // alert("abcde");
    var ab= document.getElementById("department1").selectedIndex;
    
    document.getElementById("department2").options[ab].disabled=true;
    console.log(ab);
    for(i=0;i<4;i++){
      if(i!=ab){
        document.getElementById("department2").options[i].disabled=false;
      }
    }
    // var l= document.getElementById("department2").options[abcde].value;
    // console.log(l);
    return;
  };

  var constructData = function() {
    val1=document.getElementById("name").value;
    val2=document.getElementById("phno").value;
    val3=document.getElementById("emailaddress").value;
    val4=document.getElementById("department1").value;
    val5=document.getElementById("department2").value;
    var data = {
      "name":val1,
      "phno":val2,
      "emailaddress":val3,
      "department1":val4,
      "department2":val5,
    };
    
   // 3. Construct data from the form here. Please ensure that the keys are the names of input elements

    return data;
  }

  var validateResults = function(data) {
    var isValid = true;
    var arr=Object.values(data);
    console.log(arr);
    console.log(arr[0]);
   // 4. Check if the data passes all the validations here
    isValid=(validatename(arr[0])&&validatephno(arr[1]) && validateemail(arr[2])&& validatedept(arr[3],arr[4]));
   //
    return isValid;
  };
  function validatedept(a,b){
    if(a==b){
      return false;
    }
    else return true;
  }
  function validateemail(emailval){
    var reg=/^[a-zA-Z0-9.@]+@college.edu$/;
   // console.log( reg.test(emailval));
    return reg.test(emailval);

  }
  function validatephno(phono){
   
    return phono.match(/\d/g).length<=10;
    //   const regex = /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/;
    //  console.log(phono);
    //   console.log(regex.test(phono));
    //   return regex.test(phono);
  
  }
  function validatename(name1) { 
    var regex = /^[a-zA-Z ]{0,100}$/;
  if(regex.test(name1)){
    return true;
  }
  else{
    return false;
  }
 }
 
  var onSubmit = function(event) {
    //5. Figure out how to avoid the redirection on form submit
    event.preventDefault();
    console.log("heyons");
    var data = constructData();
    console.log(data);
    if (validateResults(data)) {
      console.log("inresults");
      printResults(data);
    } else {
      
      var resultsDiv = document.getElementById("results");
      resultsDiv.innerHTML = '';
      resultsDiv.classList.add("hide");
    
    }
  };

  var printResults = function(data) {
    var constructElement = function([key, value]) {
      return `<p class='result-item'>${key}: ${value}</p>`;
    };

    var resultHtml = (Object.entries(data) || []).reduce(function(innerHtml, keyValuePair) {
      //debugger
      return innerHtml + constructElement(keyValuePair);
    }, '');
    var resultsDiv = document.getElementById("results");
    resultsDiv.innerHTML = resultHtml;
    resultsDiv.classList.remove("hide");
  };

  /*
    Initialize the javascript functions only after the html DOM content has loaded.
    This is to ensure that the elements are present in the DOM before binding any event listeners to them.
  */
  document.addEventListener('DOMContentLoaded', initialize);
})();

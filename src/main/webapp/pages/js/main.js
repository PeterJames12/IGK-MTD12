/**
    * @author igor on 11.01.17.
    */
function validator(form,message) {

    var userInput = form[form.id + ":username"];

    if (userInput.value == ''){

        alert(message);
        userInput.focus();
        return false;
    } else if (userInput.value == 'username') {
        alert('Field can not be username ');
        userInput.focus();
        return false;
    }

    return true;
}
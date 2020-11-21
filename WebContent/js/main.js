 // Disable form submissions if there are invalid fields
 (function() {
    'use strict';
    window.addEventListener('load', function() {
    // Get the forms we want to add validation styles to
    var sign_in = document.getElementsByClassName('sign_in');
    var register = document.getElementsByClassName('register');
    // validate sign in
    var validate_sign_in = Array.prototype.filter.call(sign_in, function(form) {
        form.addEventListener('submit', function(event) {
        if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
        }
        form.classList.add('was-validated');
        }, false);
    });
    // validate register
    var validate_register = Array.prototype.filter.call(register, function(form) {
        form.addEventListener('submit', function(event) {
        var pas1 = form.pwd.value;
        var pas2 = form.con_pwd.value;
        if (form.checkValidity() === false | pas1 != pas2) {
            event.preventDefault();
            event.stopPropagation();
        }
        form.classList.add('was-validated');
        }, false);
    });
    }, false);
})();
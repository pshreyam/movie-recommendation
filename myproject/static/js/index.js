var toggle_button = document.querySelector("#toggle-button");
var login_form = document.querySelector("#login-form");
var register_form = document.querySelector("#register-form");
toggle_button.addEventListener('click', () => {
    toggle_button.classList.toggle('login-button-render');
    login_form.classList.toggle('hide');
    register_form.classList.toggle('hide');
});
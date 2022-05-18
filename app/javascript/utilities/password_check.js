document.addEventListener('turbolinks:load', () => {
    let password_confirm = document.getElementById('user_password_confirmation');
    if (password_confirm) password_confirm.addEventListener('input', checkPassword)
})

function checkPassword() {
    let password = document.getElementById('user_password');
    let password_confirm = document.getElementById('user_password_confirmation');

    if (password_confirm.value === '') {
        document.querySelector('.octicon-no-entry').classList.add('hide')
        document.querySelector('.octicon-check-circle').classList.add('hide')
        return
    }

    if (password.value === password_confirm.value) {
        document.querySelector('.octicon-check-circle').classList.remove('hide')
        document.querySelector('.octicon-no-entry').classList.add('hide')
    } else {
        document.querySelector('.octicon-no-entry').classList.remove('hide')
        document.querySelector('.octicon-check-circle').classList.add('hide')
    }
}

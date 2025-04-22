const validationMessages = {
    emptyUsername: "Username cannot be empty.",
    emptyPassword: "Password cannot be empty.",
    invalidCredentials: "Invalid Username or Password.",
    usernameLength: "Username must be at least 6 characters long.",
    usernameNoNumbers: "Username must not contain numbers.",
    passwordLength: "Password must be at least 6 characters long."
};

function checkUsernameValidity(inputUsername) {
    if (!inputUsername.trim()) {
        return validationMessages.emptyUsername;
    }
    if (inputUsername.length < 6) {
        return validationMessages.usernameLength;
    }
    if (/\d/.test(inputUsername)) {
        return validationMessages.usernameNoNumbers;
    }
    return null;
}

function checkPasswordValidity(inputPassword) {
    if (!inputPassword.trim()) {
        return validationMessages.emptyPassword;
    }
    if (inputPassword.length < 6) {
        return validationMessages.passwordLength;
    }
    return null;
}

function validateUserForm(event) {
    event.preventDefault();
    const usernameField = document.querySelector("input[name='username']");
    const passwordField = document.querySelector("input[name='password']");
    const usernameErrorMessage = checkUsernameValidity(usernameField.value);
    const passwordErrorMessage = checkPasswordValidity(passwordField.value);

    const usernameErrorDisplay = document.getElementById("usernameError");
    const passwordErrorDisplay = document.getElementById("passwordError");

    if (usernameErrorMessage) {
        usernameErrorDisplay.textContent = usernameErrorMessage;
        usernameErrorDisplay.style.color = "red";
    } else {
        usernameErrorDisplay.textContent = "";
    }

    if (passwordErrorMessage) {
        passwordErrorDisplay.textContent = passwordErrorMessage;
        passwordErrorDisplay.style.color = "red";
    } else {
        passwordErrorDisplay.textContent = "";
    }

    if (!usernameErrorMessage && !passwordErrorMessage) {
        if (usernameField.value === "testuser" && passwordField.value === "Test@123") {
            alert("Login successful!");
        } else {
            alert(validationMessages.invalidCredentials);
        }
    }
}

document.addEventListener("DOMContentLoaded", () => {
    const userForm = document.querySelector("form");
    userForm.addEventListener("submit", validateUserForm);
});

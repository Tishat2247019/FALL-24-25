function username() {
  let username = document.getElementById("name").value;

  if (username.length < 6) {
    document.getElementById("name_val").style.display = "inline";
  } else {
    document.getElementById("name_val").style.display = "none ";
  }
}

function email1() {
  let email = document.getElementById("email").value;

  if (email.indexOf("@") == -1) {
    document.getElementById("email_val").style.display = "inline";
  } else {
    document.getElementById("email_val").style.display = "none ";
  }
}

function password1() {
  let password = document.getElementById("password").value;

  if (password.length < 6) {
    document.getElementById("pass_val").style.display = "inline";
  } else {
    document.getElementById("pass_val").style.display = "none ";
  }
}
function con_password1() {
  let password = document.getElementById("password").value;
  let con_password = document.getElementById("confirm_password").value;

  if (password !== con_password) {
    document.getElementById("con_pass_val").style.display = "inline";
  } else {
    document.getElementById("con_pass_val").style.display = "none ";
  }
}

function sign_up_req(event) {
  event.preventDefault();
  let name = document.getElementById("name").value;
  let email = document.getElementById("email").value;
  let password = document.getElementById("password").value;
  let confirm_password = document.getElementById("confirm_password").value;
  let type = document.querySelector('input[name="type"]:checked').value;

  let xhttp = new XMLHttpRequest();
  xhttp.open("POST", "../../../controller/opi_controller/reg_check.php", true);
  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  xhttp.send(
    "name=" +
      name +
      "&email=" +
      email +
      "&password=" +
      password +
      "&confirm_password=" +
      confirm_password +
      "&type=" +
      type
  );

  xhttp.onreadystatechange = function () {
    if (this.readyState === 4 && this.status === 200) {
      if (this.responseText.trim() == "success") {
        window.location.href = "signin.html";
      } else {
        // window.location.href = "signup.html";
        alert(this.responseText);
      }
    }
  };
}

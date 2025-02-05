let userId = null;

function confirmedit(event, userId1) {
  event.preventDefault();
  const popup = document.getElementById("confirmPopup");
  const message = document.getElementById("popupMessage");

  message.innerText = `Are you sure you want to edit information of  user ${userId1}?`;
  popup.style.display = "block";

  document.getElementById("confirmYes").style.display = "inline-block";
  document.getElementById("confirmNo").style.display = "inline-block";
  document.getElementById("confirmOk").style.display = "none";

  userId = userId1;
}

function confirmedit1(event) {
  event.preventDefault();
  const popup = document.getElementById("confirmPopup");
  const message = document.getElementById("popupMessage");

  let new_username = document.getElementById("new_username_id").value;
  let new_email = document.getElementById("new_email_id").value;
  let new_type = document.getElementById("new_type_id").value;
  let new_status = document.getElementById("new_status_id").value;

  let xhttp = new XMLHttpRequest();
  xhttp.open("POST", "../../../controller/edit_user_server.php", true);
  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  xhttp.send(
    "idt=" +
      userId +
      "&new_username=" +
      new_username +
      "&new_email=" +
      new_email +
      "&new_type=" +
      new_type +
      "&new_status=" +
      new_status
  );

  xhttp.onreadystatechange = function () {
    if (this.readyState === 4 && this.status === 200) {
      message.innerHTML = this.responseText;
      document.getElementById("confirmYes").style.display = "none";
      document.getElementById("confirmNo").style.display = "none";
      document.getElementById("confirmOk").style.display = "block";
    }
  };
}

document.getElementById("confirmNo").addEventListener("click", function () {
  const popup = document.getElementById("confirmPopup");
  popup.style.display = "none";
});

document.getElementById("confirmOk").addEventListener("click", function () {
  const ok = document.getElementById("confirmPopup");
  ok.style.display = "none";
});

function check_username() {
  let username_input_field = document.getElementById("new_username_id");
  let username = username_input_field.value;
  if (username.trim() !== "") {
    let a = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
    let flag1 = true;
    if (username.length < 6) {
      document.getElementById("name_error").style.display = "inline";
      document.getElementById("name_error").innerText =
        "Username should be atleast 6 chars long";
    } else if (username.length >= 6) {
      for (let i = 0; i < username.length; i++) {
        let flag2 = false;
        for (let j = 0; j < a.length; j++) {
          if (username[i] == a[j]) {
            flag2 = true;
            break;
          }
        }
        if (!flag2) {
          flag1 = false;
          break;
        }
      }
      if (!flag1) {
        document.getElementById("name_error").style.display = "inline";
        document.getElementById("name_error").innerText =
          "username can not contain numbers or special charectera";
      } else {
        document.getElementById("name_error").style.display = "none ";
      }
    } else {
      document.getElementById("name_error").style.display = "none ";
    }
  } else {
    document.getElementById("name_error").style.display = "none ";
  }
}

function check_email() {
  let email_input_field = document.getElementById("new_email_id");
  let email = email_input_field.value;
  if (email.trim() !== "") {
    validate1 = email.indexOf(".com");
    validate2 = email.indexOf("@");
    if (
      validate1 == -1 ||
      validate2 == -1 ||
      validate1 < email.length - 4 ||
      email.length - validate2 < 6
    ) {
      document.getElementById("email_error").style.display = "inline";
      // email_input_field.style.border = "1px solid red";
    } else {
      document.getElementById("email_error").style.display = "none";
    }
  } else {
    document.getElementById("email_error").style.display = "none";
  }
}

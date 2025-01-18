function change_color() {
  let user_status = document.getElementById("status").value;
  console.log(user_status);
  if (user_status == "Active") {
    document.getElementById("status").style.backgroundColor = "green";
  } else {
    document.getElementById("status").style.backgroundColor = "red";
  }
}

change_color();

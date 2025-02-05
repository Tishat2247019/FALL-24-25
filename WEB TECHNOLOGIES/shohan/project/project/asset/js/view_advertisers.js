function search_advs() {
  let search_word = document.querySelector(".search_advs_i").value;
  display_advs_ajax(event, null, search_word);
}

function display_advs_ajax(event, status, search_word) {
  event.preventDefault();
  let xhttp = new XMLHttpRequest();
  xhttp.open("POST", "../../../controller/view_advertisers_server.php", true);
  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

  if (status === null) {
    xhttp.send("search_word=" + search_word);
  } else {
    xhttp.send("status=" + status);
  }

  xhttp.onreadystatechange = function () {
    if (this.readyState === 4 && this.status === 200) {
      let tableBody = document.querySelector(".user_table tbody");
      if (!tableBody) {
        tableBody = document.createElement("tbody");
        document.querySelector(".user_table").appendChild(tableBody);
      }
      tableBody.innerHTML = this.responseText;
    }
  };
}

window.onload = function () {
  display_advs_ajax(event, "All", null);
};

let userId = null;

// function confirmDelete(userId1) {
//   // Show confirmation dialog

//   const popup = document.getElementById("confirmPopup");
//   const message = document.getElementById("popupMessage");

//   message.innerText = `Are you sure you want to delete user ${userId1}?`;
//   popup.style.display = "block";

//   document.getElementById("confirmYes").style.display = "inline-block";
//   document.getElementById("confirmNo").style.display = "inline-block";
//   document.getElementById("confirmOk").style.display = "none";

//   userId = userId1;

// document.getElementById("confirmYes").addEventListener("click", function () {
// let xhttp = new XMLHttpRequest();
// xhttp.open("POST", "../../../model/delete_user.php", true);
// xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
// xhttp.send("idt=" + userId);

// xhttp.onreadystatechange = function () {
//   if (this.readyState === 4 && this.status === 200) {
//     const response = JSON.parse(xhttp.responseText);
//     if (response.success == true) {
//       // alert("User deleted successfully");
//       message.innerText = `User ${currentUserId} successfully deleted.`;
//     } else {
//       // alert(response.message);
//       message.innerText = `Error: ${response.message}`;
//     }
//   } else {
//     alert("An error occurred while deleting the user.");
//   }
// };

// setTimeout(() => {
//   popup.style.display = "none";
// }, 10000);

// });

//const userConfirmed = confirm("Are you sure you want to delete this user?");
// if (userConfirmed) {
//   // Perform AJAX request to delete the user
//   const xhr = new XMLHttpRequest();
//   xhr.open("POST", "../../../model/delete_user.php", true);
//   xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
//   xhr.onload = function () {
//     if (xhr.status === 200) {
//       const response = JSON.parse(xhr.responseText);
//       if (response.success) {
//         alert("User deleted successfully");
//         // Optionally remove the user's row from the table
//         document.getElementById(`user-row-${userId}`).remove();
//       } else {
//         alert(response.message);
//       }
//     } else {
//       alert("An error occurred while deleting the user.");
//     }
//   };
//   xhr.send("idt=" + userId);
//   let xhttp = new XMLHttpRequest();
//   xhttp.open("POST", "../../../model/delete_user.php", true);
//   xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
//   xhttp.onreadystatechange = function () {
//     if (this.readyState === 4 && this.status === 200) {
//       const response = JSON.parse(xhr.responseText);
//       if (response.succes === true) {
//         alert("User deleted successfully");
//       } else {
//         alert(response.message);
//       }
//     } else {
//       alert("An error occurred while deleting the user.");
//     }
//   };
// }
//}

// function confirmDelete1(event) {
//   event.preventDefault();
//   const popup = document.getElementById("confirmPopup");
//   const message = document.getElementById("popupMessage");
//   let xhttp = new XMLHttpRequest();
//   xhttp.open("POST", "../../../model/delete_user.php", true);
//   xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
//   xhttp.send("idt=" + userId);

//   xhttp.onreadystatechange = function () {
//     if (this.readyState === 4 && this.status === 200) {
//       const response = JSON.parse(xhttp.responseText);
//       if (response.success === true) {
//         // alert("User deleted successfully");
//         message.innerText = `User ${userId} successfully deleted.`;
//         document.getElementById("confirmYes").style.display = "none";
//         document.getElementById("confirmNo").style.display = "none";
//         document.getElementById("confirmOk").style.display = "block";
//       } else {
//         // alert(response.message);
//         message.innerText = `Error: ${response.message}`;
//       }
//     }
//   };
// }

// document.getElementById("confirmNo").addEventListener("click", function () {
//   const popup = document.getElementById("confirmPopup");
//   popup.style.display = "none"; // Hide the popup
// });

// document.getElementById("confirmOk").addEventListener("click", function () {
//   const ok = document.getElementById("confirmPopup");
//   ok.style.display = "none"; // Hide the popup
// });

function ad_based_catecogry(event, ad_category_value, search_word) {
  //   ad_category_value = document.getElementById("ad_category").value;
  //   alert(document.getElementById("ad_category").value);

  event.preventDefault();
  let xhttp = new XMLHttpRequest();
  xhttp.open("POST", "../../../controller/manage_ad_server.php", true);
  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

  if (ad_category_value == null) {
    xhttp.send("id=" + idd + "&search_word=" + search_word);
  } else {
    xhttp.send("id=" + idd + "&ad_category=" + ad_category_value);
  }
  xhttp.onreadystatechange = function () {
    if (this.readyState === 4 && this.status === 200) {
      let tableBody = document.querySelector(".ad_table tbody");

      if (!tableBody) {
        tableBody = document.createElement("tbody");
        document.querySelector(".ad_table").appendChild(tableBody);
      }

      if (this.responseText === "no add found") {
        // Create a new <tr> and <td> to display the message
        let messageRow = document.createElement("tr");
        let messageCell = document.createElement("td");
        messageCell.setAttribute("colspan", "8"); // Makes the message span across all columns

        messageCell.innerHTML = "No Ads Found"; // Style it with large font and center text

        messageCell.style.cssText =
          "text-align :center; height : 300px; font-size:100px; font-weight:bold; color:red"; // Append the row with the message
        messageRow.appendChild(messageCell);
        tableBody.innerHTML = ""; // Clear existing content
        tableBody.appendChild(messageRow);
      } else {
        // If not "no ads found", populate the table with the response text
        tableBody.innerHTML = this.responseText;
      }
    }
  };
}

window.onload = function () {
  ad_based_catecogry(event, "All", null);
};

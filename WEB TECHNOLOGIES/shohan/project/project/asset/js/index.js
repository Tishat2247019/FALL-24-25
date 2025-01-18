setTimeout(function () {
  document.querySelector(".logo-container").style.display = "none";
  document.querySelector(".container").style.display = "grid";
}, 2000);

function ad_based_catecogry(event, ad_category_value, search_word) {
  event.preventDefault();
  let xhttp = new XMLHttpRequest();
  xhttp.open("POST", "./controller/index_server.php", true);
  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

  if (ad_category_value == null) {
    xhttp.send("search_word=" + search_word);
  } else {
    xhttp.send("ad_category=" + ad_category_value);
  }

  xhttp.onreadystatechange = function () {
    if (this.readyState === 4 && this.status === 200) {
      let middle = document.querySelector(".middle");

      if (this.responseText.trim() == "No Ad found") {
        // Clear the existing content
        middle.innerHTML = "";

        let no_ad_container = document.createElement("div");
        no_ad_container.style.cssText =
          "display:flex; align-items:center; justify-content:center; background-color: #dcdcdc; height:100%; width:90%; border-radius:15px; padding:10px 0px; margin:15px auto; font-size:5vw; color:red";
        no_ad_container.innerHTML = this.responseText;
        middle.appendChild(no_ad_container);
      } else {
        // If ads are found, display them
        middle.innerHTML = this.responseText;
      }
    }
  };
}

function increase_impression(ad_id) {
  event.preventDefault();
  let xhttp = new XMLHttpRequest();
  xhttp.open("POST", "./controller/index_server.php", true);
  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  xhttp.send("increase_impression=" + ad_id);

  xhttp.onreadystatechange = function () {
    if (this.readyState === 4 && this.status === 200) {
      document.getElementById("impression_" + ad_id).innerHTML =
        this.responseText;
    }
  };
}
function increase_report(ad_id) {
  event.preventDefault();
  let xhttp = new XMLHttpRequest();
  xhttp.open("POST", "./controller/index_server.php", true);
  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  xhttp.send("increase_report=" + ad_id);

  xhttp.onreadystatechange = function () {
    if (this.readyState === 4 && this.status === 200) {
      document.getElementById("report_" + ad_id).innerHTML = this.responseText;
    }
  };
}

window.onload = function () {
  ad_based_catecogry(event, "All", null);
};

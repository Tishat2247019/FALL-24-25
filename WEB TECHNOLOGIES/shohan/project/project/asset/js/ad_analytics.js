function display_ad(event, first_ad_id, second_ad_id) {
  event.preventDefault();

  let first_table_container = document.querySelector(".first_table_container");

  let first_table_container_table = `<table cellspacing="0" class="ad_table">
                            <tr align="center">
                                <th>Parameter</th>
                            </tr>
                            <tr>
                                <td>Posted By</td>
                            </tr>
                            <tr>
                                <td>Title</td>
                            </tr>
                            <tr>
                                <td>Description</td>
                            </tr>
                            <tr>
                                <td>Impressions</td>
                            </tr>
                            <tr>
                                <td>Date Posted</td>
                            </tr>
                        </table>`;
  first_table_container.style = "display:block";
  first_table_container.innerHTML = first_table_container_table;
  document.querySelector(".choose_ad_text_container").style = "display:none";

  let xhttp = new XMLHttpRequest();
  xhttp.open("POST", "../../../controller/ad_analytics_server.php", true);
  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  if (first_ad_id == null) {
    xhttp.send("id=" + second_ad_id + "&which_table=Second AD");
  } else {
    xhttp.send("id=" + first_ad_id + "&which_table=First AD");
  }

  xhttp.onreadystatechange = function () {
    if (this.readyState === 4 && this.status === 200) {
      let second_table_container = document.querySelector(
        ".second_table_container"
      );
      let third_table_container = document.querySelector(
        ".third_table_container"
      );
      if (first_ad_id == null) {
        third_table_container.style = "display:block";
        third_table_container.innerHTML = this.responseText;
      } else {
        second_table_container.style = "display:block";
        second_table_container.innerHTML = this.responseText;
      }
    }
  };
}

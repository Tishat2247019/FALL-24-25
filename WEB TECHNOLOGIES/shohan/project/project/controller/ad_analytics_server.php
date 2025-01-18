<?php
require_once('../model/admodel.php');
require_once('../model/usermodel.php');
require_once('../model/ads_statisticsmodel.php');
$ad_id = $_REQUEST['id'];
$which_table = $_REQUEST['which_table'];
$row=ad_info($ad_id);
$adv_id = $row['user_id'];
$adv_info = user_info($adv_id);
$adv_name = $adv_info['username'];

$ad_statistics_info = show_ad_statistics_info($ad_id);


echo "<table cellspacing= '0' class= 'ad_table '>
                        <tr align= 'center '>
                            <th>{$which_table}</th>
                        </tr>
                        <tr>
                            <td>{$adv_name}</td>
                        </tr>
                        <tr>
                            <td> {$row['ad_title']} </td>
                        </tr>
                        <tr>
                            <td>{$row['ad_description']}</td>
                        </tr>
                        <tr>
                            <td>{$ad_statistics_info['impressions']}</td>
                        </tr>
                        <tr>
                            <td>{$ad_statistics_info['date_posted']}</td>
                        </tr>
                    </table>";


?>
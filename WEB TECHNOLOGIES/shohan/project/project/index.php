<?php
        $db = mysqli_connect("localhost", "root", "", "check");
        $query = " select * from ads ";
        $result = mysqli_query($db, $query);

?>

<html>
<head>
    <title>Home page</title>
    <link rel="stylesheet" href="./asset/css/home.css">
    <!-- <link rel="icon" type="image/x-icon" href="../../SVG/ad.svg"> -->
    <link rel="icon" type="image/x-icon" href="./asset/images/logo/ad.svg">

</head>
<body>
    <div class="main_container">
        <div class="logo-container">
            <svg id="Layer_2" xmlns="http://www.w3.org/2000/svg" width="83.4197" height="52.5672"
                viewBox="0 0 83.4197 52.5672">
                <defs>
                    <style>
                        .cls-1 {
                            fill: none;
                            stroke: #f15a24;
                            stroke-miterlimit: 10;
                        }
                    </style>
                </defs>
                <g id="Layer_1-2">
                    <path class="cls-1"
                        d="M9.7098,47.03l4.78-12.15,6.93-17.5.35-.92h.0099l3.6801-9.31,3.65,9.31,7.24,18.42,1.87,4.8c1.04,3.18,4.67,2.82,4.67,2.82h10.59c9.6199,0,15.9-6.64,15.9-15.47,0-8.79-6.28-15.53-15.9-15.53h-10.52l3.64,3.44h6.88c7.67,0,11.9,5.39,11.9,12.09,0,6.64-4.3699,12.03-11.9,12.03h-7.14c-1.6801.12-1.89-1.22-1.89-1.22L29.3997.51h-7.96L.7397,52.03h23.7v-5h-14.73Z" />
                    <path class="cls-1"
                        d="M56.4998.5h-17.5l6.08,5.72h11.42c12.7401,0,19.7701,8.96,19.7701,20.08,0,11.05-7.26,20.01-19.7701,20.01h-11.7781c-.038.0096-.0731.0232-.1173.0239-.0038.0005-.0072.0007-.011.0013-.0015-.0004-.0028-.0009-.0046-.0009-.0023.0005-.0043.0014-.0069.0014-.0052,0-.0094-.0015-.0137-.0028,0,0-.0002,0-.0002,0-.0017,0-.0031-.0005-.0045-.0009-.0115.0007-.0195.0064-.0315.0064-.001,0-.0016-.0005-.0026-.0005-.0112.0035-.0213.0053-.0324.0088-5.4991.7861-8.0706-1.5632-8.0707-1.5633l-7.8867-18.9686-5.6937,2.4878,7.3738,18.3775c4.04,6.18,8.67,5.35,8.67,5.35h17.61c15.9901,0,26.42-11.05,26.42-25.73,0-14.6-10.4299-25.8-26.42-25.8Z" />
                </g>
            </svg>
        </div>
        <div class="container">
            <div class="header">
                <div class="logo_left">
                    <div class="ad">
                        <img src="./asset/SVG/ad.svg" alt="">
                    </div>
                    <div class="adventure">
                        <img src="./asset/SVG/adventure.svg" alt="">
                    </div>
                </div>


                <div class="buttons_header">
                    <a href="./view/opi_features/auth_feature/signup.html">
                        <button>SIGN UP</button>
                    </a>
                    <a href="./view/opi_features/auth_feature/signin.html">
                        <button>SIGN IN</button>
                    </a>
                </div>
            </div>
            <div class="left">
                <div class="left_container">
                    <h1 class="creativity">Unleash <span>Creativity</span></h1>
                    <h1 class="connect">Connect, Engage, and Grow with <span>personalized advertising</span></h1>
                </div>
            </div>
            <div class="middle">
               
            </div>
            <div class="right">
            <div class="category_container">
                    <div class="text_container_cat">
                        <h1>Browse <span><img src="./asset/SVG/white_ad.svg" alt="" >
                        </span>by Category </h1>
                    </div>
                    <ul>
                        <li><a href="" onclick="ad_based_catecogry(event, 'Education', null)"><img src="./asset/images/home_page_icons/education.png" alt="" >Education</a></li>
                        <li><a href="" onclick="ad_based_catecogry(event, 'Electronics', null)"><img src="./asset/images/home_page_icons/electronics.png" alt="" >electronics</a></li>
                        <li><a href="" onclick="ad_based_catecogry(event, 'Mobile', null)"><img src="./asset/images/home_page_icons/mobile.png" alt="" >Mobiles & Tablets</a></li>
                        <li><a href="" onclick="ad_based_catecogry(event, 'Agriculture', null)"><img src="./asset/images/home_page_icons/agriculture.png" alt="" >Agriculture</a></li>
                        <li><a href="" onclick="ad_based_catecogry(event, 'Property', null)"><img src="./asset/images/home_page_icons/property.png" alt="" >Property</a></li>
                        <li><a href="" onclick="ad_based_catecogry(event, 'Daily Living', null)"><img src="./asset/images/home_page_icons/living.png" alt="" >Daily Living</a></li>
                        <li><a href="" onclick="ad_based_catecogry(event, 'Job', null)"><img src="./asset/images/home_page_icons/jobs.png" alt="" >Jobs</a></li>
                        <li><a href="" onclick="ad_based_catecogry(event, 'Diverse', null)"><img src="./asset/images/home_page_icons/diverse.png" alt="" >Diverse</a></li>
                        <li><a href="" onclick="ad_based_catecogry(event, 'All', null)"><img src="./asset/images/home_page_icons/all.png" alt="" >All</a></li>
                    </ul>
                </div>
            </div>
            <div class="footer"></div>
        </div>
    </div>

    <script src="./asset/js/index.js"></script>

</body>
</html>
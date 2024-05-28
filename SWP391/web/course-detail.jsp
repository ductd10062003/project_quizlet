<%-- 
    Document   : course-detail
    Created on : May 21, 2024, 9:37:42 AM
    Author     : ductd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Academics &mdash; Website by Colorlib</title>
        <meta charset="utf-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
            />

        <link
            href="https://fonts.googleapis.com/css?family=Muli:300,400,700,900"
            rel="stylesheet"
            />
        <link rel="stylesheet" href="fonts/icomoon/style.css" />

        <link rel="stylesheet" href="css/bootstrap.min.css" />
        <link rel="stylesheet" href="css/jquery-ui.css" />
        <link rel="stylesheet" href="css/owl.carousel.min.css" />
        <link rel="stylesheet" href="css/owl.theme.default.min.css" />
        <link rel="stylesheet" href="css/owl.theme.default.min.css" />

        <link rel="stylesheet" href="css/jquery.fancybox.min.css" />

        <link rel="stylesheet" href="css/bootstrap-datepicker.css" />

        <link rel="stylesheet" href="fonts/flaticon/font/flaticon.css" />

        <link rel="stylesheet" href="css/aos.css" />
        <link
            href="css/jquery.mb.YTPlayer.min.css"
            media="all"
            rel="stylesheet"
            type="text/css"
            />

        <script
            src="https://kit.fontawesome.com/84a8258e0d.js"
            crossorigin="anonymous"
        ></script>

        <link rel="stylesheet" href="css/style.css" />
    </head>

    <body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
        <div class="site-wrap">
            <div class="site-mobile-menu site-navbar-target">
                <div class="site-mobile-menu-header">
                    <div class="site-mobile-menu-close mt-3">
                        <span class="icon-close2 js-menu-toggle"></span>
                    </div>
                </div>
                <div class="site-mobile-menu-body"></div>
            </div>

            <%@include file="layout/header.jsp" %>

            <div
                class="site-section ftco-subscribe-1 site-blocks-cover pb-4"
                style="background-image: url('images/bg_1.jpg')"
                >
                <div class="container">
                    <div class="row align-items-end">
                        <div class="col-lg-7">
                            <h2 class="mb-0">How To Create Mobile Apps Using Ionic</h2>
                            <p>Lorem ipsum dolor sit amet consectetur adipisicing.</p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="custom-breadcrumns border-bottom">
                <div class="container">
                    <a href="index.html">Trang chủ</a>
                    <span class="mx-3 icon-keyboard_arrow_right"></span>
                    <a href="courses.html">Khóa học</a>
                    <span class="mx-3 icon-keyboard_arrow_right"></span>
                    <span class="current">Chi tiết</span>
                </div>
            </div>

            <div class="site-section">
                <div class="container">
                    <div id="err" style="text-align: center; color: red; font-style: italic; font-size: 24px; display: none" >
                        <span></span>
                        <i class="fa-solid fa-delete-left" style="cursor: pointer" onclick="closeErr(this)"></i>
                    </div>

                    <div class="container-lg d-flex justify-content-center">

                        <div class="w-75">
                            <div class="d-flex justify-content-between">
                                <h2 class="section-title-underline">
                                    <span>${requestScope.course.course_name}</span>
                                </h2>
                                <button type="button" class="btn btn-success" 
                                        onclick="checkLogin('${sessionScope.member}', this, ${requestScope.course.course_id})"
                                        id="joinClass"
                                        >
                                    ${requestScope.enrolled == 0 ?"Tham gia":"Hủy tham gia"}
                                </button>
                            </div>
                            <div style="font-style: italic">
                                Chủ để: ${requestScope.category.category_name}
                            </div>
                            <div>
                                <div>
                                    <p>
                                        Mentor: ${requestScope.mentor.name}
                                        <i
                                            class="fa-regular fa-message"
                                            style="cursor: pointer"
                                            ></i>
                                    </p>
                                </div>
                            </div>
                            <div class="mt-3">
                                <div>
                                    <c:forEach items="${requestScope.typeOfPractices}" var="TOP">
                                        <button type="button" class="btn btn-outline-primary" onclick="checkJoinClass(this)" >
                                            ${TOP.typeOfPractice_name}
                                        </button>
                                    </c:forEach>
                                </div>
                                <div class="container-fluid p-0">
                                    <div
                                        class="card mt-3 shadow mb-2 bg-body-tertiary rounded maincolor d-flex justify-content-center align-items-center"
                                        style="width: 100%; aspect-ratio: 3 / 1; cursor: pointer; user-select: none; font-size: 24px"
                                        id="flashcard"
                                        >  
                                        <c:set var="quiz" value="${requestScope.quizs[0]}" />
                                        <div
                                            class="card-body d-flex justify-content-center align-items-center w-75 h-100"
                                            onclick="flip(this, `${quiz}`)"
                                            >
                                            <p
                                                class="text-center"
                                                style="overflow-y: auto; max-height: 100%"
                                                >
                                                ${quiz.question}
                                            </p>
                                        </div>
                                    </div>
                                    <div class="container-fluid d-flex justify-content-center">
                                        <i class="fa-solid fa-circle-chevron-left" style="font-size: 32px; cursor: pointer; user-select: none" onclick="nextFL(1, ${fn:length(quizs)})"></i>
                                        <div class="mx-3"><span id="indexFL">1</span>/${fn:length(quizs)}</div>
                                        <i class="fa-solid fa-circle-chevron-right" style="font-size: 32px; cursor: pointer; user-select: none" onclick="nextFL(2, ${fn:length(quizs)})"></i>
                                    </div>
                                </div>

                                <div class="mb-5">
                                    <div style="user-select:none">
                                        Chi tiết <i class="fa-regular fa-eye" style="cursor: pointer" onclick="show()" id="showicon"></i>
                                    </div>
                                    <div id="showAllFlashCard" style="display: none">
                                        <c:forEach items="${requestScope.quizs}" var="quiz">
                                            <div class="border container-fluid d-flex shadow-sm p-3 mb-2 bg-body-tertiary rounded">
                                                <div class="border-right" style="width: 40%">
                                                    ${quiz.question}
                                                </div>
                                                <div class="pl-4" style="width: 60%">
                                                    ${quiz.answer}
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                                <div class="modal" tabindex="-1">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div
                    class="section-bg style-1"
                    style="background-image: url('images/hero_1.jpg')"
                    >
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-4 col-md-6 mb-5 mb-lg-0">
                                <span class="icon flaticon-mortarboard"></span>
                                <h3>Our Philosphy</h3>
                                <p>
                                    Lorem ipsum dolor sit, amet consectetur adipisicing elit.
                                    Reiciendis recusandae, iure repellat quis delectus ea? Dolore,
                                    amet reprehenderit.
                                </p>
                            </div>
                            <div class="col-lg-4 col-md-6 mb-5 mb-lg-0">
                                <span class="icon flaticon-school-material"></span>
                                <h3>Academics Principle</h3>
                                <p>
                                    Lorem ipsum dolor sit, amet consectetur adipisicing elit.
                                    Reiciendis recusandae, iure repellat quis delectus ea? Dolore,
                                    amet reprehenderit.
                                </p>
                            </div>
                            <div class="col-lg-4 col-md-6 mb-5 mb-lg-0">
                                <span class="icon flaticon-library"></span>
                                <h3>Key of Success</h3>
                                <p>
                                    Lorem ipsum dolor sit, amet consectetur adipisicing elit.
                                    Reiciendis recusandae, iure repellat quis delectus ea? Dolore,
                                    amet reprehenderit.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="footer">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-3">
                                <p class="mb-4">
                                    <img src="images/logo.png" alt="Image" class="img-fluid" />
                                </p>
                                <p>
                                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Beatae
                                    nemo minima qui dolor, iusto iure.
                                </p>
                                <p><a href="#">Learn More</a></p>
                            </div>
                            <div class="col-lg-3">
                                <h3 class="footer-heading"><span>Our Campus</span></h3>
                                <ul class="list-unstyled">
                                    <li><a href="#">Acedemic</a></li>
                                    <li><a href="#">News</a></li>
                                    <li><a href="#">Our Interns</a></li>
                                    <li><a href="#">Our Leadership</a></li>
                                    <li><a href="#">Careers</a></li>
                                    <li><a href="#">Human Resources</a></li>
                                </ul>
                            </div>
                            <div class="col-lg-3">
                                <h3 class="footer-heading"><span>Our Courses</span></h3>
                                <ul class="list-unstyled">
                                    <li><a href="#">Math</a></li>
                                    <li><a href="#">Science &amp; Engineering</a></li>
                                    <li><a href="#">Arts &amp; Humanities</a></li>
                                    <li><a href="#">Economics &amp; Finance</a></li>
                                    <li><a href="#">Business Administration</a></li>
                                    <li><a href="#">Computer Science</a></li>
                                </ul>
                            </div>
                            <div class="col-lg-3">
                                <h3 class="footer-heading"><span>Contact</span></h3>
                                <ul class="list-unstyled">
                                    <li><a href="#">Help Center</a></li>
                                    <li><a href="#">Support Community</a></li>
                                    <li><a href="#">Press</a></li>
                                    <li><a href="#">Share Your Story</a></li>
                                    <li><a href="#">Our Supporters</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-12">
                                <div class="copyright">
                                    <p>
                                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                        Copyright &copy;
                                        <script>
                                            document.write(new Date().getFullYear());
                                        </script>
                                        All rights reserved | This template is made with
                                        <i class="icon-heart" aria-hidden="true"></i> by
                                        <a href="https://colorlib.com" target="_blank">Colorlib</a>
                                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- .site-wrap -->

            <!-- loader -->
            <div id="loader" class="show fullscreen">
                <svg class="circular" width="48px" height="48px">
                <circle
                    class="path-bg"
                    cx="24"
                    cy="24"
                    r="22"
                    fill="none"
                    stroke-width="4"
                    stroke="#eeeeee"
                    />
                <circle
                    class="path"
                    cx="24"
                    cy="24"
                    r="22"
                    fill="none"
                    stroke-width="4"
                    stroke-miterlimit="10"
                    stroke="#51be78"
                    />
                </svg>
            </div>

        </div>

        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/jquery-migrate-3.0.1.min.js"></script>
        <script src="js/jquery-ui.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/jquery.stellar.min.js"></script>
        <script src="js/jquery.countdown.min.js"></script>
        <script src="js/bootstrap-datepicker.min.js"></script>
        <script src="js/jquery.easing.1.3.js"></script>
        <script src="js/aos.js"></script>
        <script src="js/jquery.fancybox.min.js"></script>
        <script src="js/jquery.sticky.js"></script>
        <script src="js/jquery.mb.YTPlayer.min.js"></script>

        <script src="js/main.js"></script>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script>

                                            //Tạo 1 flag xem trạng thái show
                                            let showFL = false; //nếu flase -> đang 
                                            function show() {
                                                if (showFL === false) {
                                                    showFL = true;
                                                    document.getElementById('showicon').classList.remove('fa-eye');
                                                    document.getElementById('showicon').classList.add('fa-eye-slash');
                                                    document.getElementById('showAllFlashCard').style.display = 'block';
                                                } else {
                                                    showFL = false;
                                                    document.getElementById('showicon').classList.remove('fa-eye-slash');
                                                    document.getElementById('showicon').classList.add('fa-eye');
                                                    document.getElementById('showAllFlashCard').style.display = 'none';
                                                }
                                            }

                                            //Vì object gửi về là 1 string nên phải làm hàm convert
                                            function stringToObject(string) {
                                                //Tách chuỗi ra thành các phần tử có key với value ví du:
                                                // [name=abc,age=20,gender=male]
                                                let keyValuePairs = string.split("@#split#@");
                                                let obj = {}; // tạo 1 obj rỗng

                                                // duyệt mọi phần tử
                                                for (let i = 0; i < keyValuePairs.length; i++) {
                                                    // Tạo 1 mảng chứa key - value,
                                                    // trong mỗi phần tử lúc nãy vừa tách, ta tách tiếp thành cặp key-value
                                                    // để thêm vào obj
                                                    let keyValue = keyValuePairs[i].split("=");

                                                    // Mảng có 2 phần tử, 0: key, 1: value
                                                    let key = keyValue[0].trim();
                                                    let value = keyValue[1].trim();

                                                    // Check xem value có phải số hay không? nếu là số thì parse
                                                    if (!isNaN(value)) {
                                                        value = parseFloat(value);
                                                    }

                                                    // thêm key-value vào obj
                                                    obj[key] = value;
                                                }

                                                return obj;
                                            }

                                            //Tạo 1 flag xem trạng thái flip
                                            let click_flip = false; // nếu false -> đang là câu hỏi
                                            function flip(id_raw, obj_raw) {
                                                //lấy thẻ rồi đổi text
                                                let obj = stringToObject(obj_raw);
                                                let id = id_raw.querySelector('p');
                                                if (click_flip === false) {
                                                    click_flip = true;
                                                    id.innerHTML = obj.answer;
                                                } else {
                                                    click_flip = false;
                                                    id.innerText = obj.question;
                                                }
                                            }


                                            let index_FL = 0;
                                            function nextFL(status, length) {
                                                if (index_FL < length && index_FL >= 0) {
                                                    if (index_FL > 0 && status === 1)
                                                        index_FL -= 1;
                                                    else if (index_FL < length - 1 && status === 2)
                                                        index_FL += 1;
                                                    $.ajax({
                                                        url: "/SWP391/course-detail?service=nextFL&id=" + index_FL,
                                                        type: "POST",
                                                        success: function (data) {
                                                            let getAllFC = document.getElementById('flashcard');
                                                            getAllFC.innerHTML = data;
                                                        },
                                                        error: function (xhr, status, error) {

                                                        }
                                                    });
                                                    let indexFL = index_FL + 1;
                                                    document.getElementById('indexFL').innerHTML = indexFL;
                                                    //sau khi next thì click_flip sửa về false vì có trường hợp
                                                    //thẻ đổi qua answer sẽ là true và next nó vẫn là true -> next phải nhấn chuột 2 lần
                                                    click_flip = false;
                                                }
                                            }

                                            function checkLogin(member, position, course_id) {
                                                if (member === null || member.trim().length === 0) {
                                                    let err = document.getElementById('err');
                                                    err.querySelector('span').innerHTML = 'Bạn chưa đăng nhập';
                                                    err.style.display = 'block';
                                                } else {
                                                    switch (position.innerText.trim()) {
                                                        case "Tham gia":
                                                            //tạo url
                                                            let url_join = "course-detail?service=joinClass&course_id=" + course_id;
                                                            //tạo 1 form để gửi 
                                                            const form_join = document.createElement('form');
                                                            form_join.method = 'post';
                                                            form_join.action = url_join;
                                                            document.body.appendChild(form_join);
                                                            form_join.submit();
                                                            break;
                                                        case "Hủy tham gia":
                                                            //tạo url
                                                            let url_remove = "course-detail?service=removeClass&course_id=" + course_id;
                                                            //tạo 1 form để gửi 
                                                            const form_remove = document.createElement('form');
                                                            form_remove.method = 'post';
                                                            form_remove.action = url_remove;
                                                            document.body.appendChild(form_remove);
                                                            form_remove.submit();
                                                            break;

                                                    }
                                                }
                                            }

                                            function checkJoinClass(position) {
                                                let join = document.getElementById('joinClass').innerText.trim();
                                                if (join === "Hủy tham gia") {
                                                    switch (position.innerText.trim()) {
                                                        case "Trắc nghiệm":
                                                            console.log("tn");
                                                            break;
                                                        case "Nối thẻ":
                                                            console.log("nt");
                                                            break;
                                                        case "Điền chữ":
                                                            console.log("dc");
                                                            break;
                                                    }
                                                } else {
                                                    let err = document.getElementById('err');
                                                    err.querySelector('span').innerHTML = 'Bạn chưa tham gia lớp học';
                                                    err.style.display = 'block';
                                                }
                                            }

                                            function closeErr(position) {
                                                let parent = position.parentNode;
                                                parent.style.display = 'none';
                                            }

        </script>

    </body>
</html>


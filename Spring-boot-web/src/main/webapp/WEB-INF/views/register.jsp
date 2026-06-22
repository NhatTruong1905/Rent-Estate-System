<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>

<head>
    <title>Đăng ký tài khoản</title>
    <style>
        .register-input {
            border-radius: 4px !important;
            padding: 10px 15px !important;
            border: none !important;
        }
        .register-btn {
            background-color: #007bff !important;
            border: none !important;
            padding: 8px 30px !important;
            font-size: 16px !important;
            border-radius: 4px !important;
        }
        .terms-text {
            font-size: 14px;
            color: #ffffff;
        }
        .terms-text a {
            color: #007bff;
            text-decoration: underline;
        }
    </style>
</head>

<body>
<div class="container">
    <div class="register-form">
        <div class="main-div">

            <c:if test="${not empty message}">
                <div class="alert alert-${alert}">${message}</div>
            </c:if>

            <div class="container-fluid">
                <section class="gradient-custom">
                    <div class="page-wrapper">
                        <div class="row d-flex justify-content-center align-items-center">
                            <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                                <div class="card text-white" style="border-radius: 1rem; background-color: #35bf76; box-shadow: 0 4px 8px rgba(0,0,0,0.1);">
                                    <div class="card-body p-5">
                                        <div class="mb-md-2 mt-md-2 pb-3 text-center">

                                            <h2 class="fw-bold mb-2 text-uppercase" style="letter-spacing: 1px;">SIGN UP</h2>
                                            <p class="text-white-50 mb-5" style="color: #e0e0e0 !important;">Please fill in the form to create an account!</p>

                                            <form action="<c:url value='/register'/>" id="formRegister" method="post">

                                                <div class="form-outline form-white mb-4 text-center">
                                                    <label class="form-label text-white" for="fullName">Fullname</label>
                                                    <input type="text" class="form-control register-input" id="fullName"
                                                           name="fullName" placeholder="Họ và tên" required>
                                                </div>

                                                <div class="form-outline form-white mb-4 text-center">
                                                    <label class="form-label text-white" for="userName">Username</label>
                                                    <input type="text" class="form-control register-input" id="userName"
                                                           name="userName" placeholder="Tên đăng nhập" required>
                                                </div>

                                                <div class="form-outline form-white mb-4 text-center">
                                                    <label class="form-label text-white" for="password">Password</label>
                                                    <input type="password" class="form-control register-input" id="password"
                                                           name="password" placeholder="Mật khẩu" required>
                                                </div>

                                                <div class="form-outline form-white mb-4 text-center">
                                                    <label class="form-label text-white" for="confirmPassword">Confirm your password</label>
                                                    <input type="password" class="form-control register-input" id="confirmPassword"
                                                           name="confirmPassword" placeholder="Nhập lại mật khẩu" required>
                                                </div>

<%--                                                <div class="form-check d-flex justify-content-center mb-4">--%>
<%--                                                    <input class="form-check-input me-2" type="checkbox" value="" id="termsCheck" required style="margin-top: 4px;"/>--%>
<%--                                                    <label class="form-check-label terms-text" for="termsCheck">--%>
<%--                                                        I agree to all statements in <a href="#!">Terms of Service</a>--%>
<%--                                                    </label>--%>
<%--                                                </div>--%>

                                                <button type="submit" class="btn btn-primary register-btn mb-4">Đăng ký</button>
                                            </form>

                                        </div>

                                        <div class="text-center">
                                            <p class="mb-0 text-white account" style="font-size: 14px;">Already have an account?</p>
                                            <a href="<c:url value='/login'/>" style="color: #007bff; text-decoration: none; font-weight: bold;">Login</a>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>

            <script>
                document.getElementById('formRegister').addEventListener('submit', function(event) {
                    var userName = document.getElementById('userName').value.trim();
                    var pass = document.getElementById('password').value;
                    var confirmPass = document.getElementById('confirmPassword').value;

                    if (userName.length < 3) {
                        alert("Tên đăng nhập phải có từ 3 ký tự trở lên!");
                        event.preventDefault();
                        return;
                    }

                    if (pass.length < 6) {
                        alert("Mật khẩu phải có từ 6 ký tự trở lên!");
                        event.preventDefault();
                        return;
                    }

                    if (pass !== confirmPass) {
                        alert("Mật khẩu nhập lại không khớp!");
                        event.preventDefault();
                        return;
                    }
                });
            </script>

        </div>
    </div>
</div>
</body>
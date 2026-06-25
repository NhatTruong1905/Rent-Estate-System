<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="formUrl" value="/api/user"/>
<html>
<head>
    <title>Chỉnh sửa người dùng</title>
</head>
<body>

<div class="main-content" id="main-container">
    <div class="main-content-inner">

        <div class="breadcrumbs" id="breadcrumbs">
            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="/admin/home">Trang chủ</a>
                </li>
                <li>
                    <a href="/admin/user-list">Danh sách người dùng</a>
                </li>
                <li class="active">Thông tin người dùng</li>
            </ul>
        </div>

        <div class="page-content">

            <link rel="stylesheet" href="<c:url value='/admin/css/custom-building-list.css' />"/>

            <style>
                .widget-box {
                    border-radius: 6px !important;
                    box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1) !important;
                    border: 1px solid #d5d5d5 !important;
                    overflow: hidden;
                }

                .widget-header {
                    background-color: #f7f9fa !important;
                    border-bottom: 1px solid #d5d5d5 !important;
                }

                .form-control {
                    border-radius: 5px !important;
                    border: 1px solid #d5d5d5;
                    transition: border-color 0.3s ease, box-shadow 0.3s ease;
                    background-color: #ffffff !important;
                }

                .form-control:focus {
                    border-color: #35bf76;
                    box-shadow: 0 0 5px rgba(53, 191, 118, 0.3);
                }

                .form-control[readonly] {
                    background-color: #ffffff !important;
                    cursor: not-allowed;
                    color: #555;
                }

                input:-webkit-autofill {
                    -webkit-box-shadow: 0 0 0 1000px white inset !important;
                }
            </style>

            <div class="row">
                <div class="col-xs-12">

                    <c:if test="${not empty messageResponse}">
                        <div class="alert alert-block alert-${alert}">
                            <button type="button" class="close" data-dismiss="alert">
                                <i class="ace-icon fa fa-times"></i>
                            </button>
                                ${messageResponse}
                        </div>
                    </c:if>

                    <div class="widget-box">
                        <div class="widget-header">
                            <h5 class="widget-title" style="font-weight: bold; color: #438eb9;">
                                <i class="ace-icon fa fa-user"></i>
                                <c:if test="${empty model.id}">Thêm Mới Người Dùng</c:if>
                                <c:if test="${not empty model.id}">Cập Nhật Người Dùng</c:if>
                            </h5>
                        </div>

                        <div class="widget-body">
                            <div class="widget-main" style="padding: 20px 30px;">

                                <form:form class="form-horizontal" role="form" id="form-edit" modelAttribute="model"
                                           autocomplete="off">

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label no-padding-right"
                                               style="text-align: left; font-weight: bold;"> Vai trò </label>
                                        <div class="col-sm-3">
                                            <form:select path="roleCode" class="form-control" id="roleCode">
                                                <form:option value="" label="-- Chọn vai trò --"/>
                                                <form:options items="${model.roleDTOs}"/>
                                            </form:select>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label no-padding-right"
                                               style="text-align: left; font-weight: bold;"> Tên đăng nhập </label>
                                        <div class="col-sm-10">
                                            <c:if test="${not empty model.id}">
                                                <form:input path="userName" class="form-control" id="userName"
                                                            readonly="true"/>
                                            </c:if>
                                            <c:if test="${empty model.id}">
                                                <form:input path="userName" class="form-control" id="userName"
                                                            autocomplete="new-password"/>
                                            </c:if>
                                        </div>
                                    </div>

                                    <c:if test="${not empty model.id}">
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label no-padding-right"
                                                   style="text-align: left; font-weight: bold;"> Đặt lại mật
                                                khẩu </label>
                                            <div class="col-sm-10">
                                                <input type="password" name="password" class="form-control"
                                                       id="password"
                                                       placeholder="Bỏ trống nếu không muốn đổi mật khẩu"
                                                       readonly onfocus="this.removeAttribute('readonly');"/>
                                            </div>
                                        </div>
                                    </c:if>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label no-padding-right"
                                               style="text-align: left; font-weight: bold;"> Tên đầy đủ </label>
                                        <div class="col-sm-10">
                                            <form:input path="fullName" class="form-control" id="fullName"
                                                        autocomplete="off"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label no-padding-right"
                                               style="text-align: left; font-weight: bold;"> Email </label>
                                        <div class="col-sm-10">
                                            <form:input path="email" class="form-control" id="email"
                                                        autocomplete="off"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label no-padding-right"
                                               style="text-align: left; font-weight: bold;"> Số điện thoại </label>
                                        <div class="col-sm-10">
                                            <form:input path="phone" class="form-control" id="phone"
                                                        autocomplete="off"/>
                                        </div>
                                    </div>

                                    <div class="clearfix form-actions"
                                         style="background-color: transparent; border-top: 1px solid #f0f0f0; margin-bottom: 0;">
                                        <div class="col-md-offset-2 col-md-10">

                                            <c:if test="${empty model.id}">
                                                <button class="btn btn-purple btn-bold" type="button"
                                                        id="btnAddOrUpdateUsers">
                                                    <i class="ace-icon fa fa-check bigger-110"></i> Thêm người dùng
                                                </button>
                                            </c:if>

                                            <c:if test="${not empty model.id}">
                                                <button class="btn btn-primary btn-bold" type="button"
                                                        id="btnAddOrUpdateUsers">
                                                    <i class="ace-icon fa fa-pencil bigger-110"></i> Sửa người dùng
                                                </button>

                                                &nbsp; &nbsp; &nbsp;

                                                <button class="btn btn-warning btn-bold" type="button"
                                                        id="btnResetPassword">
                                                    <i class="ace-icon fa fa-key bigger-110"></i> Đặt lại mật khẩu tự
                                                    động
                                                </button>
                                            </c:if>

                                            &nbsp; &nbsp; &nbsp;

                                            <button class="btn btn-danger btn-bold" type="reset">
                                                <i class="ace-icon fa fa-undo bigger-110"></i> Hủy
                                            </button>
                                        </div>
                                    </div>

                                    <form:hidden path="id" id="userId"/>
                                </form:form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $('#btnAddOrUpdateUsers').click(function (e) {
        e.preventDefault();
        $('.error-msg').remove();

        var formData = $('#form-edit').serializeArray();
        var json = {};
        $.each(formData, function (i, item) {
            json["" + item.name + ""] = item.value;
        });

        var userId = $('#userId').val();
        if (userId != "") {
            json["userName"] = $('#userName').val();
        }

        var hasError = false;

        if (json['roleCode'] == '') {
            $('#roleCode').after('<span class="error-msg" style="color: red; font-style: italic; margin-top: 5px; display: inline-block;">* Vui lòng chọn Vai trò!</span>');
            hasError = true;
        }

        if (json['userName'] == '') {
            $('#userName').after('<span class="error-msg" style="color: red; font-style: italic; margin-top: 5px; display: inline-block;">* Tên đăng nhập không được để trống!</span>');
            hasError = true;
        }

        if (userId != "" && json['password'] !== undefined && json['password'].trim() !== "") {
            if (json['password'].length < 6) {
                $('#password').after('<span class="error-msg" style="color: red; font-style: italic; margin-top: 5px; display: inline-block;">* Mật khẩu phải có ít nhất 6 ký tự!</span>');
                hasError = true;
            }
        }

        if (json['fullName'] == '') {
            $('#fullName').after('<span class="error-msg" style="color: red; font-style: italic; margin-top: 5px; display: inline-block;">* Tên đầy đủ không được để trống!</span>');
            hasError = true;
        }

        if (json['email'] !== '') {
            var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(json['email'])) {
                $('#email').after('<span class="error-msg" style="color: red; font-style: italic; margin-top: 5px; display: inline-block;">* Định dạng email không hợp lệ!</span>');
                hasError = true;
            }
        }

        if (json['phone'] !== '') {
            var phoneRegex = /^[0-9]{10}$/;
            if (!phoneRegex.test(json['phone'])) {
                $('#phone').after('<span class="error-msg" style="color: red; font-style: italic; margin-top: 5px; display: inline-block;">* Số điện thoại phải gồm 10 chữ số!</span>');
                hasError = true;
            }
        }

        if (!hasError) {
            const btn = $(this);
            const originalText = btn.html();
            btn.prop('disabled', true).html('<i class="ace-icon fa fa-spinner fa-spin bigger-110"></i> Đang lưu...');

            if (userId != "") {
                updateUser(json, userId, btn, originalText);
            } else {
                addUser(json, btn, originalText);
            }
        }
    });

    $('#btnResetPassword').click(function (event) {
        event.preventDefault();
        const btn = $(this);
        const originalText = btn.html();
        btn.prop('disabled', true).html('<i class="ace-icon fa fa-spinner fa-spin bigger-110"></i> Đang xử lý...');
        resetPassword($('#userId').val(), btn, originalText);
    });

    function addUser(data, btn, originalText) {
        $.ajax({
            url: '${formUrl}',
            type: 'POST',
            dataType: 'json',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (res) {
                alert("Thêm người dùng thành công!");
                window.location.href = "/admin/user-list";
            },
            error: function (res) {
                btn.prop('disabled', false).html(originalText);
                var errorMsg = "Đã xảy ra lỗi hệ thống!";
                if (res.responseJSON) {
                    if (Array.isArray(res.responseJSON)) {
                        errorMsg = "Lỗi dữ liệu:\n- " + res.responseJSON.join("\n- ");
                    } else if (res.responseJSON.detail) {
                        errorMsg = res.responseJSON.detail;
                    } else if (res.responseJSON.message) {
                        errorMsg = res.responseJSON.message;
                    }
                }
                alert(errorMsg);
            }
        });
    }

    function updateUser(data, id, btn, originalText) {
        $.ajax({
            url: '${formUrl}/' + id,
            type: 'PUT',
            dataType: 'json',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (res) {
                alert("Cập nhật người dùng thành công!");
                window.location.href = "/admin/user-list";
            },
            error: function (res) {
                btn.prop('disabled', false).html(originalText);
                var errorMsg = "Hệ thống gặp lỗi, không thể cập nhật!";
                if (res.responseJSON && Array.isArray(res.responseJSON)) {
                    errorMsg = "Lỗi dữ liệu:\n- " + res.responseJSON.join("\n- ");
                }
                alert(errorMsg);
            }
        });
    }

    function resetPassword(id, btn, originalText) {
        $.ajax({
            url: '${formUrl}/password/' + id + '/reset',
            type: 'PUT',
            dataType: 'json',
            success: function (res) {
                alert("Đặt lại mật khẩu thành công!");
                window.location.href = "/admin/user-edit-" + res.id + "?message=reset_password_success";
            },
            error: function (res) {
                btn.prop('disabled', false).html(originalText);
                alert("Lỗi khi đặt lại mật khẩu!");
            }
        });
    }
</script>
</body>
</html>
<%@include file="/common/taglib.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:url var="customerAPI" value="/api/customers"/>
<html>
<head>
    <title>Chỉnh sửa khách hàng</title>
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
                    <a href="/admin/customer-list">Danh sách khách hàng</a>
                </li>
                <li class="active">Thông tin khách hàng</li>
            </ul>
        </div>

        <div class="page-content">

            <link rel="stylesheet" href="<c:url value='/admin/css/custom-building-list.css' />"/>

            <style>
                .form-control {
                    border-radius: 5px !important;
                    border: 1px solid #d5d5d5;
                    transition: border-color 0.3s ease, box-shadow 0.3s ease;
                }

                .form-control:focus {
                    border-color: #35bf76;
                    box-shadow: 0 0 5px rgba(53, 191, 118, 0.3);
                }
            </style>

            <div class="row">
                <div class="col-xs-12">

                    <div class="widget-box">
                        <div class="widget-header">
                            <h5 class="widget-title" style="font-weight: bold; color: #438eb9;">
                                <i class="ace-icon fa fa-user"></i>
                                <c:if test="${empty customer.id}">Thêm Mới Khách Hàng</c:if>
                                <c:if test="${not empty customer.id}">Cập Nhật Khách Hàng</c:if>
                            </h5>
                        </div>

                        <div class="widget-body">
                            <div class="widget-main" style="padding: 20px 30px;">

                                <form:form class="form-horizontal" role="form" id="form-edit" modelAttribute="customer">

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label no-padding-right"
                                               style="text-align: left; font-weight: bold;"> Tên khách hàng </label>
                                        <div class="col-sm-10">
                                            <form:input path="fullname" class="form-control" id="fullname"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label no-padding-right"
                                               style="text-align: left; font-weight: bold;"> Số điện thoại </label>
                                        <div class="col-sm-10">
                                            <form:input path="phone" class="form-control" id="phone"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label no-padding-right"
                                               style="text-align: left; font-weight: bold;"> Email </label>
                                        <div class="col-sm-10">
                                            <form:input path="email" class="form-control" id="email"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label no-padding-right"
                                               style="text-align: left; font-weight: bold;"> Nhu cầu </label>
                                        <div class="col-sm-10">
                                            <form:input path="demand" class="form-control"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label no-padding-right"
                                               style="text-align: left; font-weight: bold;"> Trạng thái xử lý </label>
                                        <div class="col-sm-3">
                                            <form:select path="status" class="form-control"
                                                         id="status">
                                                <option value="">-- Chọn Trạng Thái Xử Lý --</option>
                                                <form:options items="${status}"></form:options>
                                            </form:select>
                                        </div>
                                    </div>

                                    <div class="clearfix form-actions"
                                         style="background-color: transparent; border-top: 1px solid #f0f0f0; margin-bottom: 0;">
                                        <div class="col-md-offset-2 col-md-10">
                                            <c:if test="${empty customer.id}">
                                                <button class="btn btn-purple btn-bold" type="button"
                                                        id="btnAddOrUpdateCustomer">
                                                    <i class="ace-icon fa fa-check bigger-110"></i> Thêm khách hàng
                                                </button>
                                            </c:if>
                                            <c:if test="${not empty customer.id}">
                                                <button class="btn btn-primary btn-bold" type="button"
                                                        id="btnAddOrUpdateCustomer">
                                                    <i class="ace-icon fa fa-pencil bigger-110"></i> Sửa khách hàng
                                                </button>
                                            </c:if>

                                            &nbsp; &nbsp; &nbsp;

                                            <button class="btn btn-danger btn-bold" type="button"
                                                    onclick="window.location.href='/admin/customer-list'">
                                                <i class="ace-icon fa fa-undo bigger-110"></i> Hủy
                                            </button>
                                        </div>
                                    </div>

                                    <form:hidden path="id" id="id"/>
                                </form:form>

                            </div>
                        </div>
                    </div>

                    <c:if test="${not empty customer.id}">
                        <div class="widget-box" style="margin-top: 20px;">
                            <div class="widget-header">
                                <h5 class="widget-title" style="font-weight: bold; color: #438eb9;">
                                    <i class="ace-icon fa fa-comments-o"></i> Chăm sóc khách hàng
                                </h5>
                                <div class="widget-toolbar">
                                    <button class="btn btn-sm btn-success" title="Thêm giao dịch"
                                            onclick="openTransactionModal()"
                                            style="padding: 0 10px; margin-bottom: 3px;">
                                        <i class="fa fa-plus-circle"></i> Thêm giao dịch
                                    </button>
                                </div>
                            </div>

                            <div class="widget-body">
                                <div class="widget-main no-padding">
                                    <table class="table table-bordered table-striped" style="margin: 0;">
                                        <thead>
                                        <tr>
                                            <th class="text-center">Ngày tạo</th>
                                            <th class="text-center">Người tạo</th>
                                            <th class="text-center">Ngày sửa</th>
                                            <th class="text-center">Người sửa</th>
                                            <th class="text-left">Chi tiết giao dịch</th>
                                            <th class="text-center">Thao tác</th>
                                        </tr>
                                        </thead>
                                            <%--                                        <tbody>--%>
                                            <%--                                            <c:forEach var="item" items="${customer.listTransaction}">--%>
                                            <%--                                                <tr>--%>
                                            <%--                                                    <td class="text-center">${item.createdDate}</td>--%>
                                            <%--                                                    <td class="text-center">${item.createdBy}</td>--%>
                                            <%--                                                    <td class="text-center">${item.modifiedDate}</td>--%>
                                            <%--                                                    <td class="text-center">${item.modifiedBy}</td>--%>
                                            <%--                                                    <td>${item.transactionDetail}</td>--%>
                                            <%--                                                    <td class="text-center">--%>
                                            <%--                                                        <button class="btn btn-xs btn-info" title="Sửa giao dịch">--%>
                                            <%--                                                            <i class="fa fa-pencil"></i>--%>
                                            <%--                                                        </button>--%>
                                            <%--                                                    </td>--%>
                                            <%--                                                </tr>--%>
                                            <%--                                            </c:forEach>--%>

                                            <%--                                            <c:if test="${empty customer.listTransaction}">--%>
                                            <%--                                                <tr>--%>
                                            <%--                                                    <td colspan="6" class="text-center">Chưa có dữ liệu chăm sóc khách hàng.</td>--%>
                                            <%--                                                </tr>--%>
                                            <%--                                            </c:if>--%>
                                            <%--                                        </tbody>--%>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </c:if>

                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $('#btnAddOrUpdateCustomer').click(function (e) {
        e.preventDefault();
        $('.error-msg').remove();

        var formData = $('#form-edit').serializeArray();
        var json = {};

        $.each(formData, function (i, item) {
            json["" + item.name + ""] = item.value;
        });

        var hasError = false;

        if (json['fullname'] == '') {
            $('#fullname').after('<span class="error-msg" style="color: red; font-style: italic; margin-top: 5px; display: inline-block;">* Tên khách hàng không được để trống!</span>');
            hasError = true;
        }

        if (json['phone'] == '') {
            $('#phone').after('<span class="error-msg" style="color: red; font-style: italic; margin-top: 5px; display: inline-block;">* Số điện thoại không được để trống!</span>');
            hasError = true;
        }

        if (!hasError) {
            const btn = $(this);
            const originalText = btn.html();
            btn.prop('disabled', true).html('<i class="ace-icon fa fa-spinner fa-spin bigger-110"></i> Đang lưu...');

            saveCustomer(json, btn, originalText);
        }
    });

    function saveCustomer(data, btn, originalText) {
        $.ajax({
            url: "${customerAPI}",
            type: "POST",
            data: JSON.stringify(data),
            dataType: "JSON",
            contentType: "application/json",
            success: function (response) {
                if (data.id) {
                    alert("Cập nhật khách hàng thành công!");
                } else {
                    alert("Thêm khách hàng thành công!");
                }
                window.location.href = "/admin/customer-list";
            },
            error: function (response) {
                btn.prop('disabled', false).html(originalText);
                var errorMsg = "Hệ thống gặp lỗi, không thể cập nhật!";
                if (response.responseJSON && Array.isArray(response.responseJSON)) {
                    errorMsg = "Lỗi dữ liệu:\n- " + response.responseJSON.join("\n- ");
                }
                alert(errorMsg);
                console.log(response);
            }
        });
    }

    function openTransactionModal() {
        alert("Chức năng thêm giao dịch đang được xây dựng!");
    }
</script>
</body>
</html>
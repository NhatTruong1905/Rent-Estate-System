<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
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
                    <a href="/admin/customer-list">Quản lý khách hàng</a>
                </li>
                <li class="active">Thông tin khách hàng</li>
            </ul>
        </div>

        <div class="page-content">

            <style>
                .widget-box {
                    border-radius: 6px !important;
                    box-shadow: 0 2px 6px rgba(0,0,0,0.1) !important;
                    border: 1px solid #d5d5d5 !important;
                    overflow: hidden;
                    margin-bottom: 20px;
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

                .table-transaction thead tr th {
                    background-color: #559166 !important;
                    color: white !important;
                    text-transform: uppercase;
                    vertical-align: middle;
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
                                        <label class="col-sm-2 control-label no-padding-right" style="text-align: left;"> Tên khách hàng </label>
                                        <div class="col-sm-10">
                                            <form:input path="fullname" class="form-control" id="fullname" placeholder="Nhập tên khách hàng..."/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label no-padding-right" style="text-align: left;"> Số điện thoại </label>
                                        <div class="col-sm-10">
                                            <form:input path="phone" class="form-control" id="phone" placeholder="Nhập số điện thoại..."/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label no-padding-right" style="text-align: left;"> Email </label>
                                        <div class="col-sm-10">
                                            <form:input path="email" class="form-control" id="email" placeholder="Nhập email..."/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label no-padding-right" style="text-align: left;"> Tên công ty </label>
                                        <div class="col-sm-10">
                                            <form:input path="companyName" class="form-control" placeholder="Nhập tên công ty..."/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label no-padding-right" style="text-align: left;"> Nhu cầu </label>
                                        <div class="col-sm-10">
                                            <form:input path="demand" class="form-control" placeholder="Nhập nhu cầu khách hàng..."/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label no-padding-right" style="text-align: left;"> Trạng thái xử lý </label>
                                        <div class="col-sm-4">
                                            <form:select path="statusAssignment" class="form-control">
                                                <form:option value="" label="---Chọn trạng thái xử lý---"/>
                                                <form:options items="${transactionType}"/>
                                            </form:select>
                                        </div>
                                    </div>

                                    <div class="clearfix form-actions text-center" style="background-color: transparent; border-top: 1px solid #f0f0f0; margin-bottom: 0;">
                                        <c:if test="${empty customer.id}">
                                            <button class="btn btn-primary btn-bold" type="button" id="btnAddOrUpdateCustomer">
                                                Thêm thông tin
                                            </button>
                                        </c:if>
                                        <c:if test="${not empty customer.id}">
                                            <button class="btn btn-primary btn-bold" type="button" id="btnAddOrUpdateCustomer">
                                                Sửa thông tin
                                            </button>
                                        </c:if>

                                        &nbsp; &nbsp; &nbsp;

                                        <a href="/admin/customer-list" class="btn btn-warning btn-bold">
                                            Hủy thao tác
                                        </a>
                                    </div>

                                    <form:hidden path="id" id="customerId"/>
                                </form:form>

                            </div>
                        </div>
                    </div>

                    <c:if test="${not empty customer.id}">
                        <div class="widget-box">
                            <div class="widget-header" style="background-color: #f7f9fa !important; padding-right: 15px;">
                                <h5 class="widget-title" style="font-weight: bold; color: #438eb9; line-height: 38px;">
                                    Chăm sóc khách hàng
                                </h5>
                                <div class="widget-toolbar no-border" style="padding-top: 4px;">
                                    <button class="btn btn-sm btn-success btn-bold" title="Thêm giao dịch" onclick="openTransactionModal()">
                                        <i class="fa fa-plus"></i> Thêm giao dịch
                                    </button>
                                </div>
                            </div>

                            <div class="widget-body">
                                <div class="widget-main no-padding">
                                    <table class="table table-bordered table-striped table-transaction" style="margin: 0;">
                                        <thead>
                                            <tr>
                                                <th class="text-center">NGÀY TẠO</th>
                                                <th class="text-center">NGƯỜI TẠO</th>
                                                <th class="text-center">NGÀY SỬA</th>
                                                <th class="text-center">NGƯỜI SỬA</th>
                                                <th class="text-left">CHI TIẾT GIAO DỊCH</th>
                                                <th class="text-center">THAO TÁC</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="item" items="${customer.listTransaction}">
                                                <tr>
                                                    <td class="text-center">${item.createdDate}</td>
                                                    <td class="text-center">${item.createdBy}</td>
                                                    <td class="text-center">${item.modifiedDate}</td>
                                                    <td class="text-center">${item.modifiedBy}</td>
                                                    <td>${item.transactionDetail}</td>
                                                    <td class="text-center">
                                                        <button class="btn btn-xs btn-info" title="Sửa giao dịch">
                                                            <i class="fa fa-pencil"></i>
                                                        </button>
                                                    </td>
                                                </tr>
                                            </c:forEach>

                                            <c:if test="${empty customer.listTransaction}">
                                                <tr>
                                                    <td colspan="6" class="text-center">Chưa có dữ liệu chăm sóc khách hàng.</td>
                                                </tr>
                                            </c:if>
                                        </tbody>
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
            btn.prop('disabled', true).html('<i class="ace-icon fa fa-spinner fa-spin bigger-110"></i> Đang xử lý...');

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
                    alert("Cập nhật thông tin khách hàng thành công!");
                } else {
                    alert("Thêm khách hàng thành công!");
                }
                window.location.href = "/admin/customer-list";
            },
            error: function (response) {
                btn.prop('disabled', false).html(originalText);
                var errorMsg = "Hệ thống gặp lỗi, không thể cập nhật!";
                if(response.responseJSON && Array.isArray(response.responseJSON)) {
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
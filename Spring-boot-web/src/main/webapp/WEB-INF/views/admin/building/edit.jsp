<%@include file="/common/taglib.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Chỉnh sửa tòa nhà</title>
</head>
<body>

<div class="main-content" id="main-container">
    <div class="main-content-inner">

        <div class="breadcrumbs" id="breadcrumbs">
            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="#">Trang chủ</a>
                </li>
                <li>
                    <a href="/admin/building-list">Danh sách tòa nhà</a>
                </li>
                <li class="active">Thông tin tòa nhà</li>
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
                                <i class="ace-icon fa fa-building-o"></i>
                                <c:if test="${empty building.id}">Thêm Mới Tòa Nhà</c:if>
                                <c:if test="${not empty building.id}">Cập Nhật Tòa Nhà</c:if>
                            </h5>
                        </div>

                        <div class="widget-body">
                            <div class="widget-main" style="padding: 20px 30px;">

                                <form:form class="form-horizontal" role="form" id="form-edit" modelAttribute="building">

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label no-padding-right"
                                               style="text-align: left; font-weight: bold;"> Tên tòa nhà </label>
                                        <div class="col-sm-10">
                                            <form:input path="name" class="form-control" id="name"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label no-padding-right"
                                               style="text-align: left; font-weight: bold;"> Quận </label>
                                        <div class="col-sm-3">
                                            <form:select path="district" class="form-control" id="district">
                                                <option value="">-- Chọn Quận --</option>
                                                <form:options items="${districts}"></form:options>
                                            </form:select>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label no-padding-right"
                                               style="text-align: left; font-weight: bold;"> Phường </label>
                                        <div class="col-sm-10">
                                            <form:input path="ward" class="form-control" id="ward"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label no-padding-right"
                                               style="text-align: left; font-weight: bold;"> Đường </label>
                                        <div class="col-sm-10">
                                            <form:input path="street" class="form-control" id="street"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label no-padding-right"
                                               style="text-align: left; font-weight: bold;"> Kết cấu </label>
                                        <div class="col-sm-10">
                                            <form:input path="structure" class="form-control"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label no-padding-right"
                                               style="text-align: left; font-weight: bold;"> Số tầng hầm </label>
                                        <div class="col-sm-10">
                                            <form:input path="numberOfBasement" class="form-control"
                                                        id="numberOfBasement"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label no-padding-right"
                                               style="text-align: left; font-weight: bold;"> Diện tích sàn </label>
                                        <div class="col-sm-10">
                                            <form:input path="floorArea" class="form-control" id="floorArea"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label no-padding-right"
                                               style="text-align: left; font-weight: bold;"> Hướng </label>
                                        <div class="col-sm-10">
                                            <form:input path="direction" class="form-control"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label no-padding-right"
                                               style="text-align: left; font-weight: bold;"> Hạng </label>
                                        <div class="col-sm-10">
                                            <form:input path="level" class="form-control"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label no-padding-right"
                                               style="text-align: left; font-weight: bold;"> Diện tích thuê </label>
                                        <div class="col-sm-10">
                                            <form:input path="rentArea" class="form-control"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label no-padding-right"
                                               style="text-align: left; font-weight: bold;"> Giá thuê </label>
                                        <div class="col-sm-10">
                                            <form:input path="rentPrice" class="form-control" id="rentPrice"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label no-padding-right"
                                               style="text-align: left; font-weight: bold;"> Mô tả giá </label>
                                        <div class="col-sm-10">
                                            <form:input path="rentPriceDescription" class="form-control"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label no-padding-right"
                                               style="text-align: left; font-weight: bold;"> Phí dịch vụ </label>
                                        <div class="col-sm-10">
                                            <form:input path="serviceFee" class="form-control"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label no-padding-right"
                                               style="text-align: left; font-weight: bold;"> Phí ô tô </label>
                                        <div class="col-sm-10">
                                            <form:input path="carFee" class="form-control"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label no-padding-right"
                                               style="text-align: left; font-weight: bold;"> Phí mô tô </label>
                                        <div class="col-sm-10">
                                            <form:input path="motoFee" class="form-control"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label no-padding-right"
                                               style="text-align: left; font-weight: bold;"> Phí ngoài giờ </label>
                                        <div class="col-sm-10">
                                            <form:input path="overtimeFee" class="form-control"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label no-padding-right"
                                               style="text-align: left; font-weight: bold;"> Tiền điện </label>
                                        <div class="col-sm-10">
                                            <form:input path="electricityFee" class="form-control"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label no-padding-right"
                                               style="text-align: left; font-weight: bold;"> Tiền nước </label>
                                        <div class="col-sm-10">
                                            <form:input path="waterFee" class="form-control"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label no-padding-right"
                                               style="text-align: left; font-weight: bold;"> Đặt cọc </label>
                                        <div class="col-sm-10">
                                            <form:input path="deposit" class="form-control"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label no-padding-right"
                                               style="text-align: left; font-weight: bold;"> Thanh toán </label>
                                        <div class="col-sm-10">
                                            <form:input path="payment" class="form-control"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label no-padding-right"
                                               style="text-align: left; font-weight: bold;"> Thời hạn thuê </label>
                                        <div class="col-sm-10">
                                            <form:input path="rentTime" class="form-control"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label no-padding-right"
                                               style="text-align: left; font-weight: bold;"> Thời gian trang
                                            trí </label>
                                        <div class="col-sm-10">
                                            <form:input path="decorationTime" class="form-control"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label no-padding-right"
                                               style="text-align: left; font-weight: bold;"> Tên quản lý </label>
                                        <div class="col-sm-10">
                                            <form:input path="managerName" class="form-control" id="managerName"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label no-padding-right"
                                               style="text-align: left; font-weight: bold;"> SĐT quản lý </label>
                                        <div class="col-sm-10">
                                            <form:input path="managerPhoneNumber" class="form-control"
                                                        id="managerPhoneNumber"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label no-padding-right"
                                               style="text-align: left; font-weight: bold;"> Loại tòa nhà </label>
                                        <div class="col-sm-10">
                                            <div class="custom-checkbox-spring" style="margin-top: 6px;"
                                                 id="typeCodeWrapper">
                                                <form:checkboxes path="typeCode" items="${typeCodes}"/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label no-padding-right"
                                               style="text-align: left; font-weight: bold;"> Phí môi giới </label>
                                        <div class="col-sm-10">
                                            <form:input path="brokerageFee" class="form-control"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label no-padding-right"
                                               style="text-align: left; font-weight: bold;"> Ghi chú </label>
                                        <div class="col-sm-10">
                                            <form:textarea path="note" class="form-control" rows="3"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label no-padding-right"
                                               style="text-align: left; font-weight: bold;"> Hình đại diện </label>
                                        <div class="col-sm-10">
                                            <form:input path="image" type="file" id="uploadImage"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label no-padding-right"
                                               style="text-align: left; font-weight: bold;"></label>
                                        <div class="col-sm-10">
                                            <c:if test="${not empty building.image}">
                                                <img src="${building.image}" id="viewImage" width="300px" height="300px"
                                                     style="margin-top: 50px">
                                            </c:if>
                                            <c:if test="${empty building.image}">
                                                <img src="/img/pageNotFound.jpg" id="viewImage" width="300px"
                                                     height="300px">
                                            </c:if>
                                        </div>
                                    </div>

                                    <div class="clearfix form-actions"
                                         style="background-color: transparent; border-top: 1px solid #f0f0f0; margin-bottom: 0;">
                                        <div class="col-md-offset-2 col-md-10">
                                            <c:if test="${empty building.id}">
                                                <button class="btn btn-purple btn-bold" type="button"
                                                        id="btnAddOrUpdateBuilding">
                                                    <i class="ace-icon fa fa-check bigger-110"></i> Thêm tòa nhà
                                                </button>
                                            </c:if>
                                            <c:if test="${not empty building.id}">
                                                <button class="btn btn-primary btn-bold" type="button"
                                                        id="btnAddOrUpdateBuilding">
                                                    <i class="ace-icon fa fa-pencil bigger-110"></i> Sửa tòa nhà
                                                </button>
                                            </c:if>

                                            &nbsp; &nbsp; &nbsp;

                                            <button class="btn btn-danger btn-bold" type="reset">
                                                <i class="ace-icon fa fa-undo bigger-110"></i> Hủy
                                            </button>
                                        </div>
                                    </div>

                                    <form:hidden path="id"/>
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
    const CLOUD_NAME = "dokjzty69";
    const UPLOAD_PRESET = "building";

    async function uploadToCloudinary(file) {
        const formData = new FormData();
        formData.append("file", file);
        formData.append("upload_preset", UPLOAD_PRESET);

        try {
            const response = await fetch(`https://api.cloudinary.com/v1_1/` + CLOUD_NAME + `/image/upload`, {
                method: 'POST',
                body: formData
            });
            const data = await response.json();
            return data.secure_url;
        } catch (error) {
            console.error("Lỗi khi upload lên Cloudinary:", error);
            return null;
        }
    }

    $('#btnAddOrUpdateBuilding').click(async function (e) {
        e.preventDefault();
        $('.error-msg').remove();

        var formData = $('#form-edit').serializeArray();
        var json = {};
        var typeCode = [];

        $.each(formData, function (i, item) {
            if (item.name != "typeCode") {
                json["" + item.name + ""] = item.value;
            } else {
                typeCode.push(item.value);
            }
        });

        json['typeCode'] = typeCode;

        var hasError = false;

        if (json['name'] == '') {
            $('#name').after('<span class="error-msg" style="color: red; font-style: italic; margin-top: 5px; display: inline-block;">* Tên tòa nhà không được để trống!</span>');
            hasError = true;
        }
        if (json['district'] == '') {
            $('#district').after('<span class="error-msg" style="color: red; font-style: italic; margin-top: 5px; display: inline-block;">* Vui lòng chọn Quận!</span>');
            hasError = true;
        }
        if (json['ward'] == '') {
            $('#ward').after('<span class="error-msg" style="color: red; font-style: italic; margin-top: 5px; display: inline-block;">* Tên phường không được để trống!</span>');
            hasError = true;
        }
        if (json['street'] == '') {
            $('#street').after('<span class="error-msg" style="color: red; font-style: italic; margin-top: 5px; display: inline-block;">* Tên đường không được để trống!</span>');
            hasError = true;
        }

        if (json['numberOfBasement'] == '' || json['numberOfBasement'] < 0) {
            $('#numberOfBasement').after('<span class="error-msg" style="color: red; font-style: italic; margin-top: 5px; display: inline-block;">* Số tầng hầm không hợp lệ (phải >= 0)!</span>');
            hasError = true;
        }
        if (json['floorArea'] == '') {
            $('#floorArea').after('<span class="error-msg" style="color: red; font-style: italic; margin-top: 5px; display: inline-block;">* Diện tích sàn không được để trống!</span>');
            hasError = true;
        }
        if (json['rentPrice'] == '') {
            $('#rentPrice').after('<span class="error-msg" style="color: red; font-style: italic; margin-top: 5px; display: inline-block;">* Giá thuê không được để trống!</span>');
            hasError = true;
        }
        if (json['rentArea'] == '') {
            $('#rentArea').after('<span class="error-msg" style="color: red; font-style: italic; margin-top: 5px; display: inline-block;">* Diện tích thuê không được để trống!</span>');
            hasError = true;
        }
        if (json['managerName'] == '') {
            $('#managerName').after('<span class="error-msg" style="color: red; font-style: italic; margin-top: 5px; display: inline-block;">* Tên quản lý không được để trống!</span>');
            hasError = true;
        }
        if (json['managerPhoneNumber'] == '') {
            $('#managerPhoneNumber').after('<span class="error-msg" style="color: red; font-style: italic; margin-top: 5px; display: inline-block;">* Số điện thoại quản lý không được để trống!</span>');
            hasError = true;
        }
        if (json['typeCode'].length <= 0) {
            $('#typeCodeWrapper').after('<span class="error-msg" style="color: red; font-style: italic; margin-top: 5px; display: inline-block;">* Loại tòa nhà không được để trống!</span>');
            hasError = true;
        }

        if (!hasError) {
            const btn = $(this);
            const originalText = btn.html();
            btn.prop('disabled', true).html('<i class="ace-icon fa fa-spinner fa-spin bigger-110"></i> Đang lưu...');
            try {
                var fileInput = $('#uploadImage')[0].files[0];

                if (fileInput) {
                    var imageUrl = await uploadToCloudinary(fileInput);
                    if (imageUrl) {
                        json['image'] = imageUrl;
                    } else {
                        alert("Upload ảnh thất bại, vui lòng kiểm tra lại mạng hoặc cấu hình Cloudinary!");
                        btn.prop('disabled', false).html(originalText);
                        return;
                    }
                }
                addBuilding(json);
            } catch (error) {
                console.error(error);
                alert("Đã xảy ra lỗi trong quá trình xử lý!");
            } finally {
                btn.prop('disabled', false).html(originalText);
            }
        }
    })

    $('#uploadImage').change(function (event) {
        openImage(this, "viewImage");
    })

    function openImage(input, imageView) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#' + imageView).attr('src', reader.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }

    function addBuilding(data) {
        $.ajax({
            url: "/api/buildings",
            type: "POST",
            data: JSON.stringify(data),
            dataType: "JSON",
            contentType: "application/json",
            success: function (response) {
                if (data.id) {
                    alert("Cập nhập tòa nhà " + response.message + " thành công!");
                    console.log("success");
                    window.location.href = "<c:url value='/admin/building-list' />"
                } else {
                    alert("Thêm tòa nhà " + response.message + " thành công!");
                    console.log("success");
                    window.location.href = "<c:url value='/admin/building-list' />"
                }
            },
            error: function (response) {
                var errorData = response.responseJSON;

                if (errorData && errorData.detail) {
                    alert("Lỗi dữ liệu: " + errorData.detail);
                } else if (Array.isArray(errorData)) {
                    alert("Lỗi: " + errorData.join("\n"));
                } else {
                    alert("Hệ thống gặp lỗi, vui lòng thử lại sau!");
                }
                console.log("Error details:", response);
            }
        });
    }
</script>
</body>
</html>
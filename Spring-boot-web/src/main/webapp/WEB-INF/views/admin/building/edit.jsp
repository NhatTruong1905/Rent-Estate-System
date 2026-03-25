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

            <div class="row">
                <div class="col-xs-12">

                    <form:form class="form-horizontal" role="form" id="form-edit" modelAttribute="building">

                        <div class="form-group">
                            <label class="col-sm-2 control-label no-padding-right" style="text-align: left;"> Tên tòa
                                nhà </label>
                            <div class="col-sm-10">
                                <form:input path="name" class="form-control" id="name"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label no-padding-right" style="text-align: left;">
                                Quận </label>
                            <div class="col-sm-3">
                                <form:select path="district" class="form-control">
                                    <option value="">-- Chọn Quận --</option>
                                    <form:options items="${districts}"></form:options>
                                </form:select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label no-padding-right" style="text-align: left;">
                                Phường </label>
                            <div class="col-sm-10">
                                <form:input path="ward" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label no-padding-right" style="text-align: left;">
                                Đường </label>
                            <div class="col-sm-10">
                                <form:input path="street" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label no-padding-right" style="text-align: left;"> Kết
                                cấu </label>
                            <div class="col-sm-10">
                                <form:input path="structure" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label no-padding-right" style="text-align: left;"> Số tầng
                                hầm </label>
                            <div class="col-sm-10">
                                <form:input path="numberOfBasement" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label no-padding-right" style="text-align: left;"> Diện tích
                                sàn </label>
                            <div class="col-sm-10">
                                <form:input path="floorArea" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label no-padding-right" style="text-align: left;">
                                Hướng </label>
                            <div class="col-sm-10">
                                <form:input path="direction" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label no-padding-right" style="text-align: left;">
                                Hạng </label>
                            <div class="col-sm-10">
                                <form:input path="level" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label no-padding-right" style="text-align: left;"> Diện tích
                                thuê </label>
                            <div class="col-sm-10">
                                <form:input path="rentArea" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label no-padding-right" style="text-align: left;"> Giá
                                thuê </label>
                            <div class="col-sm-10">
                                <form:input path="rentPrice" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label no-padding-right" style="text-align: left;"> Mô tả
                                giá </label>
                            <div class="col-sm-10">
                                <form:input path="rentPriceDescription" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label no-padding-right" style="text-align: left;"> Phí dịch
                                vụ </label>
                            <div class="col-sm-10">
                                <form:input path="serviceFee" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label no-padding-right" style="text-align: left;"> Phí ô
                                tô </label>
                            <div class="col-sm-10">
                                <form:input path="carFee" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label no-padding-right" style="text-align: left;"> Phí mô
                                tô </label>
                            <div class="col-sm-10">
                                <form:input path="motoFee" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label no-padding-right" style="text-align: left;"> Phí ngoài
                                giờ </label>
                            <div class="col-sm-10">
                                <form:input path="overtimeFee" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label no-padding-right" style="text-align: left;"> Tiền
                                điện </label>
                            <div class="col-sm-10">
                                <form:input path="electricityFee" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label no-padding-right" style="text-align: left;"> Tiền
                                nước </label>
                            <div class="col-sm-10">
                                <form:input path="waterFee" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label no-padding-right" style="text-align: left;"> Đặt
                                cọc </label>
                            <div class="col-sm-10">
                                <form:input path="deposit" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label no-padding-right" style="text-align: left;"> Thanh
                                toán </label>
                            <div class="col-sm-10">
                                <form:input path="payment" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label no-padding-right" style="text-align: left;"> Thời hạn
                                thuê </label>
                            <div class="col-sm-10">
                                <form:input path="rentTime" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label no-padding-right" style="text-align: left;"> Thời gian
                                trang trí </label>
                            <div class="col-sm-10">
                                <form:input path="decorationTime" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label no-padding-right" style="text-align: left;"> Tên quản
                                lý </label>
                            <div class="col-sm-10">
                                <form:input path="managerName" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label no-padding-right" style="text-align: left;"> SĐT quản
                                lý </label>
                            <div class="col-sm-10">
                                <form:input path="managerPhoneNumber" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label no-padding-right" style="text-align: left;"> Loại tòa
                                nhà </label>
                            <div class="col-sm-10">
                                <form:checkboxes path="typeCode" items="${typeCodes}"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label no-padding-right" style="text-align: left;"> Phí môi
                                giới </label>
                            <div class="col-sm-10">
                                <form:input path="brokerageFee" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label no-padding-right" style="text-align: left;"> Ghi
                                chú </label>
                            <div class="col-sm-10">
                                <form:textarea path="note" class="form-control" rows="3"/>
                            </div>
                        </div>

                        <div class="clearfix form-actions">
                            <div class="col-md-offset-2 col-md-10">
                                <c:if test="${empty building.id}">
                                    <button class="btn btn-info" type="button" id="btnAddOrUpdateBuilding">
                                        <i class="ace-icon fa fa-check bigger-110"></i> Thêm tòa nhà
                                    </button>
                                </c:if>
                                <c:if test="${not empty building.id}">
                                    <button class="btn btn-pink" type="button" id="btnAddOrUpdateBuilding">
                                        <i class="ace-icon fa fa-check bigger-110"></i> Sửa tòa nhà
                                    </button>
                                </c:if>


                                &nbsp; &nbsp; &nbsp;

                                <button class="btn" type="reset">
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

<script>
    $('#btnAddOrUpdateBuilding').click(function (e) {
        e.preventDefault();

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

        if (json['name'] != '') {
            $('#name').after('<span style="color: red">Name not null!</span>')
        }
        if (json['district'] != '') {
            $('#district').after('<span style="color: red">District not null!</span>')
        } else {
            addBuilding(json);
        }
    })

    function addBuilding(data) {
        $.ajax({
            url: "/api/buildings",
            type: "POST",
            data: JSON.stringify(data),
            dataType: "JSON",
            contentType: "application/json",
            success: function (response) {
                alert("Thêm tòa nhà thành công!");
                console.log("success");
            },
            error: function (response) {
                alert(response.responseJson);
                console.log("error");
            }
        });
    }
</script>
</body>
</html>
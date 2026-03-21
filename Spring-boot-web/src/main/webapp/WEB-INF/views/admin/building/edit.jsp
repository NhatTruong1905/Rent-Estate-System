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

                    <form class="form-horizontal" role="form" id="form-edit">

                        <div class="form-group">
                            <label class="col-sm-2 control-label no-padding-right" style="text-align: left;"> Tên tòa
                                nhà </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="name"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label no-padding-right" style="text-align: left;">
                                Quận </label>
                            <div class="col-sm-3">
                                <select class="form-control" name="districtId">
                                    <option value="">--Chọn quận--</option>
                                    <option value="QUAN_1">Quận 1</option>
                                    <option value="QUAN_2">Quận 2</option>
                                    <option value="QUAN_TD">Quận Thủ Đức</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label no-padding-right" style="text-align: left;">
                                Phường </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="ward"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label no-padding-right" style="text-align: left;">
                                Đường </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="street"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label no-padding-right" style="text-align: left;"> Kết
                                cấu </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="structure"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label no-padding-right" style="text-align: left;"> Số tầng
                                hầm </label>
                            <div class="col-sm-10">
                                <input type="number" class="form-control" name="numberOfBasement"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label no-padding-right" style="text-align: left;"> Diện tích
                                sàn </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="floorArea"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label no-padding-right" style="text-align: left;">
                                Hướng </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="direction"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label no-padding-right" style="text-align: left;">
                                Hạng </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="level"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label no-padding-right" style="text-align: left;"> Diện tích
                                thuê </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="rentAreaId"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label no-padding-right" style="text-align: left;"> Giá
                                thuê </label>
                            <div class="col-sm-10">
                                <input type="number" class="form-control" name="rentPrice"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label no-padding-right" style="text-align: left;"> Mô tả
                                giá </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="rentPriceDescription"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label no-padding-right" style="text-align: left;"> Phí dịch
                                vụ </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="serviceFee"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label no-padding-right" style="text-align: left;"> Phí ô
                                tô </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="carFee"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label no-padding-right" style="text-align: left;"> Phí mô
                                tô </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="motorbikeFee"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label no-padding-right" style="text-align: left;"> Phí ngoài
                                giờ </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="overtimeFee"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label no-padding-right" style="text-align: left;"> Tiền
                                điện </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="electricityfee"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label no-padding-right" style="text-align: left;"> Tiền
                                nước </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="waterFee"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label no-padding-right" style="text-align: left;"> Đặt
                                cọc </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="deposit"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label no-padding-right" style="text-align: left;"> Thanh
                                toán </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="payment"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label no-padding-right" style="text-align: left;"> Thời hạn
                                thuê </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="rentTime"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label no-padding-right" style="text-align: left;"> Thời gian
                                trang trí </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="decorationTime"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label no-padding-right" style="text-align: left;"> Tên quản
                                lý </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="managerName"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label no-padding-right" style="text-align: left;"> SĐT quản
                                lý </label>
                            <div class="col-sm-10">
                                <input type="number" class="form-control" name="managerPhoneNumber"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label no-padding-right" style="text-align: left;"> Loại tòa
                                nhà </label>
                            <div class="col-sm-10">
                                <label class="inline" style="margin-right: 20px; padding-top: 5px;">
                                    <input type="checkbox" class="ace" id="tangtret" name="typeCode" value="tang-tret">
                                    <span class="lbl"> Tầng trệt</span>
                                </label>
                                <label class="inline" style="margin-right: 20px; padding-top: 5px;">
                                    <input type="checkbox" class="ace" id="nguyencan" name="typeCode"
                                           value="nguyen-can">
                                    <span class="lbl"> Nguyên căn</span>
                                </label>
                                <label class="inline" style="padding-top: 5px;">
                                    <input type="checkbox" class="ace" id="noithat" name="typeCode" value="noi-that">
                                    <span class="lbl"> Nội thất</span>
                                </label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label no-padding-right" style="text-align: left;"> Phí môi
                                giới </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="brokerageFee"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label no-padding-right" style="text-align: left;"> Ghi
                                chú </label>
                            <div class="col-sm-10">
                                <textarea class="form-control" name="note" rows="3"></textarea>
                            </div>
                        </div>

                        <div class="clearfix form-actions">
                            <div class="col-md-offset-2 col-md-10">
                                <button class="btn btn-info" type="button" id="btnAddBuilding">
                                    <i class="ace-icon fa fa-check bigger-110"></i> Thêm tòa nhà
                                </button>

                                &nbsp; &nbsp; &nbsp;

                                <button class="btn" type="reset">
                                    <i class="ace-icon fa fa-undo bigger-110"></i> Hủy
                                </button>
                            </div>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $('#btnAddBuilding').click(function (e) {
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

        if (json['name'] != '' && typeCode.length != 0) {
            addBuilding(json);
        } else {
            alert("Tên và Loại tòa nhà không được để trống!")
        }
    })

    function addBuilding(data) {
        $.ajax({
            url: "http://localhost:8080/api/buildings",
            type: "POST",
            data: JSON.stringify(data),
            dataType: "JSON",
            contentType: "application/json",
            success: function (response) {
                alert("Thêm tòa nhà thành công!");
                console.log("success");
            },
            error: function (response) {
                alert("Đã có lỗi xảy ra!");
                console.log("error");
            }
        });
    }
</script>
</body>
</html>
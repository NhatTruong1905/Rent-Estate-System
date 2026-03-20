<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 3/20/2026
  Time: 12:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Building Edit</title>
</head>
<body>
<div class="flex-grow-1 bg-white">

    <div class="bg-light border-bottom px-4 py-2" style="font-size: 0.85rem;">
        <i class="fa fa-home text-primary me-1"></i>
        <a href="#" class="text-decoration-none" style="color: #2b7dbc;">Home Admin</a>
        <i class="fa fa-angle-right text-secondary mx-2" style="font-size: 0.75rem;"></i>
        <span class="text-secondary">Dashboard</span>
    </div>

    <div class="p-4 pt-3">

        <div class="pb-2 mb-4" style="border-bottom: 1px dotted #e2e2e2;">
            <h4 class="mb-0 fw-normal d-inline-block" style="color: #2679b5;">Thông tin tòa nhà</h4>
            <small class="text-secondary ms-2" style="letter-spacing: 1px;">» overview & stats</small>
        </div>

        <form id="form-edit">

            <div class="row mb-2">
                <label class="col-sm-2 col-form-label">Tên tòa nhà</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control form-control-sm rounded-0" name="name">
                </div>
            </div>

            <div class="row mb-2">
                <label class="col-sm-2 col-form-label">Quận</label>
                <div class="col-sm-3">
                    <select class="form-select form-select-sm rounded-0" name="districtId">
                        <option value="">--Chọn quận--</option>
                        <option value="QUAN_1">Quận 1</option>
                        <option value="QUAN_2">Quận 2</option>
                        <option value="QUAN_TD">Quận Thủ Đức</option>
                    </select>
                </div>
            </div>

            <div class="row mb-2">
                <label class="col-sm-2 col-form-label">Phường</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control form-control-sm rounded-0" name="ward">
                </div>
            </div>

            <div class="row mb-2">
                <label class="col-sm-2 col-form-label">Đường</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control form-control-sm rounded-0" name="street">
                </div>
            </div>

            <div class="row mb-2">
                <label class="col-sm-2 col-form-label">Kết cấu</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control form-control-sm rounded-0" name="structure">
                </div>
            </div>

            <div class="row mb-2">
                <label class="col-sm-2 col-form-label">Số tầng hầm</label>
                <div class="col-sm-10">
                    <input type="number" class="form-control form-control-sm rounded-0" name="numberOfBasement">
                </div>
            </div>

            <div class="row mb-2">
                <label class="col-sm-2 col-form-label">Diện tích sàn</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control form-control-sm rounded-0" name="floorArea">
                </div>
            </div>

            <div class="row mb-2">
                <label class="col-sm-2 col-form-label">Hướng</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control form-control-sm rounded-0" name="direction">
                </div>
            </div>

            <div class="row mb-2">
                <label class="col-sm-2 col-form-label">Hạng</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control form-control-sm rounded-0" name="level">
                </div>
            </div>

            <div class="row mb-2">
                <label class="col-sm-2 col-form-label">Diện tích thuê</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control form-control-sm rounded-0" name="rentAreaId">
                </div>
            </div>

            <div class="row mb-2">
                <label class="col-sm-2 col-form-label">Giá thuê</label>
                <div class="col-sm-10">
                    <input type="number" class="form-control form-control-sm rounded-0" name="rentPrice">
                </div>
            </div>

            <div class="row mb-2">
                <label class="col-sm-2 col-form-label">Mô tả giá</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control form-control-sm rounded-0"
                           name="rentPriceDescription">
                </div>
            </div>

            <div class="row mb-2">
                <label class="col-sm-2 col-form-label">Phí dịch vụ</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control form-control-sm rounded-0" name="serviceFee">
                </div>
            </div>

            <div class="row mb-2">
                <label class="col-sm-2 col-form-label">Phí ô tô</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control form-control-sm rounded-0" name="carFee">
                </div>
            </div>

            <div class="row mb-2">
                <label class="col-sm-2 col-form-label">Phí mô tô</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control form-control-sm rounded-0" name="motorbikeFee">
                </div>
            </div>

            <div class="row mb-2">
                <label class="col-sm-2 col-form-label">Phí ngoài giờ</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control form-control-sm rounded-0" name="overtimeFee">
                </div>
            </div>

            <div class="row mb-2">
                <label class="col-sm-2 col-form-label">Tiền điện</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control form-control-sm rounded-0" name="electricityfee">
                </div>
            </div>

            <div class="row mb-2">
                <label class="col-sm-2 col-form-label">Tiền nước</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control form-control-sm rounded-0" name="waterFee">
                </div>
            </div>

            <div class="row mb-2">
                <label class="col-sm-2 col-form-label">Đặt cọc</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control form-control-sm rounded-0" name="deposit">
                </div>
            </div>

            <div class="row mb-2">
                <label class="col-sm-2 col-form-label">Thanh toán</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control form-control-sm rounded-0" name="payment">
                </div>
            </div>

            <div class="row mb-2">
                <label class="col-sm-2 col-form-label">Thời hạn thuê</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control form-control-sm rounded-0" name="rentTime">
                </div>
            </div>

            <div class="row mb-2">
                <label class="col-sm-2 col-form-label">Thời gian trang trí</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control form-control-sm rounded-0" name="decorationTime">
                </div>
            </div>

            <div class="row mb-2">
                <label class="col-sm-2 col-form-label">Tên quản lý</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control form-control-sm rounded-0" name="managerName">
                </div>
            </div>

            <div class="row mb-2">
                <label class="col-sm-2 col-form-label">SĐT quản lý</label>
                <div class="col-sm-10">
                    <input type="number" class="form-control form-control-sm rounded-0"
                           name="managerPhoneNumber">
                </div>
            </div>

            <div class="row mb-2 align-items-center">
                <label class="col-sm-2 col-form-label">Loại tòa nhà</label>
                <div class="col-sm-10 d-flex gap-3">
                    <div class="form-check mb-0">
                        <input class="form-check-input rounded-0" type="checkbox" id="tangtret" name="typeCode"
                               value="tang-tret">
                        <label class="form-check-label" for="tangtret">Tầng trệt</label>
                    </div>
                    <div class="form-check mb-0">
                        <input class="form-check-input rounded-0" type="checkbox" id="nguyencan" name="typeCode"
                               value="nguyen-can">
                        <label class="form-check-label" for="nguyencan">Nguyên căn</label>
                    </div>
                    <div class="form-check mb-0">
                        <input class="form-check-input rounded-0" type="checkbox" id="noithat" name="typeCode"
                               value="noi-that">
                        <label class="form-check-label" for="noithat">Nội thất</label>
                    </div>
                </div>
            </div>

            <div class="row mb-2">
                <label class="col-sm-2 col-form-label">Phí môi giới</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control form-control-sm rounded-0" name="brokerageFee">
                </div>
            </div>

            <div class="row mb-4">
                <label class="col-sm-2 col-form-label">Ghi chú</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control form-control-sm rounded-0" name="note">
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-sm-10 offset-sm-2">
                    <button type="submit" class="btn btn-primary px-4 rounded-0" id="btnAddBuilding">Thêm tòa
                        nhà
                    </button>
                    <button type="button" class="btn btn-secondary px-4 rounded-0 ms-2">Hủy</button>
                </div>
            </div>

        </form>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
        crossorigin="anonymous"></script>

<script>
    $('#btnAddBuilding').click(function (e) {
        e.preventDefault();

        var formData = $('#form-edit').serializeArray();
        var json = {};
        var typeCode = [];

        $.each(formData, function (i, item) {
            if (it.name != "typeCode") {
                json["" + item.name + ""] = item.value;
            } else {
                typeCode.push(it.value);
            }
        });

        json['typeCode'] = typeCode;

        if (json['name'] != '' && typeCode.length != 0) {
            addBuilding(json);
        } else {
            alert("Tên và typeCode không được thiếu!")
        }
    })

    function addBuilding(data) {
        $.ajax({
            url: "https://localhost:8080/api/buildings",
            type: "POST",
            data: JSON.stringify,
            dataType: "JSON",
            contentType: "application/json",
            success: function (response) {
                console.log("success")
            },
            error: function (response) {
                console.log("error")
            }
        });
    }
</script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<html>
<head>
    <meta charset='utf-8'>
    <title>Building List</title>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet"/>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
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
                <li class="active">Danh sách tòa nhà</li>
            </ul>
        </div>

        <div class="page-content">

            <link rel="stylesheet" href="<c:url value='/admin/css/custom-building-list.css' />"/>
            <div class="row">
                <div class="col-xs-12">

                    <div class="widget-box" id="searchCollapse">
                        <div class="widget-header">
                            <h5 class="widget-title">Tìm kiếm</h5>

                            <div class="widget-toolbar">
                                <a href="#" id="btnReload" title="Làm mới">
                                    <i class="ace-icon fa fa-refresh green"></i>
                                </a>

                                <a href="#" data-action="collapse" title="Ẩn bảng" id="iconCollapse">
                                    <i class="ace-icon fa fa-chevron-up"></i>
                                </a>

                                <a href="#" data-action="close" id="btnClose" title="Đóng bảng">
                                    <i class="ace-icon fa fa-times red"></i>
                                </a>
                            </div>
                        </div>

                        <div class="widget-body">
                            <div class="widget-main">
                                <form:form id="listForm" action="/admin/building-list" method="GET"
                                           modelAttribute="modelSearch">
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <div class="col-sm-6">
                                                <label>Tên tòa nhà</label>
                                                <form:input path="name" class="form-control"/>
                                            </div>
                                            <div class="col-sm-6">
                                                <label>Diện tích sàn</label>
                                                <form:input path="floorArea" class="form-control"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="space-4"></div>

                                    <div class="row">
                                        <div class="col-xs-12">
                                            <div class="col-sm-3">
                                                <label>Quận</label>
                                                <form:select path="district" class="form-control">
                                                    <option value="">-- Chọn Quận --</option>
                                                    <form:options items="${districts}"></form:options>
                                                </form:select>
                                            </div>
                                            <div class="col-sm-4">
                                                <label>Phường</label>
                                                <form:input path="ward" class="form-control"/>
                                            </div>
                                            <div class="col-sm-5">
                                                <label>Đường</label>
                                                <form:input path="street" class="form-control"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="space-4"></div>

                                    <div class="row">
                                        <div class="col-xs-12">
                                            <div class="col-sm-4">
                                                <label>Số tầng hầm</label>
                                                <form:input path="numberOfBasement" class="form-control"/>
                                            </div>
                                            <div class="col-sm-4">
                                                <label>Hướng</label>
                                                <form:input path="direction" class="form-control"/>
                                            </div>
                                            <div class="col-sm-4">
                                                <label>Hạng</label>
                                                <form:input path="level" class="form-control"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="space-4"></div>

                                    <div class="row">
                                        <div class="col-xs-12">
                                            <div class="col-sm-3">
                                                <label>Diện tích từ</label>
                                                <form:input path="areaFrom" class="form-control"/>
                                            </div>
                                            <div class="col-sm-3">
                                                <label>Diện tích đến</label>
                                                <form:input path="areaTo" class="form-control"/>
                                            </div>
                                            <div class="col-sm-3">
                                                <label>Giá thuê từ</label>
                                                <form:input path="rentPriceFrom" class="form-control"/>
                                            </div>
                                            <div class="col-sm-3">
                                                <label>Giá thuê đến</label>
                                                <form:input path="rentPriceTo" class="form-control"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="space-4"></div>

                                    <div class="row">
                                        <div class="col-xs-12">
                                            <div class="col-sm-4">
                                                <label>Tên Quản lý</label>
                                                <form:input path="managerName" class="form-control"/>
                                            </div>
                                            <div class="col-sm-4">
                                                <label>SĐT Quản lý</label>
                                                <form:input path="managerPhoneNumber" class="form-control"/>
                                            </div>
                                            <div class="col-sm-4">
                                                <label>Chọn nhân viên</label>
                                                <form:select path="staffId" class="form-control">
                                                    <option value="">-- Chọn Nhân Viên --</option>
                                                    <form:options items="${staffs}"></form:options>
                                                </form:select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="space-8"></div>

                                    <div class="row">
                                        <div class="col-xs-12">
                                            <link rel="stylesheet"
                                                  href="<c:url value='/admin/css/custom-building-list.css' />"/>

                                            <div class="custom-checkbox-spring" style="margin-top: 5px;">
                                                <label class="title-label">Loại tòa nhà: </label>
                                                <form:checkboxes path="typeCode" items="${typeCodes}"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="space-8"></div>

                                    <div class="row">
                                        <div class="col-xs-12">
                                            <button type="button" class="btn btn-sm btn-primary" id="btnSearch">
                                                Tìm kiếm <i class="ace-icon fa fa-arrow-right icon-on-right"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form:form>
                            </div>
                        </div>
                    </div>

                    <div class="pull-right" style="margin-bottom: 10px; margin-top: 10px;">
                        <a href="/admin/building-edit" class="btn btn-purple btn-bold" title="Thêm tòa nhà">
                            <i class="fa fa-plus-circle bigger-120"></i> Thêm tòa nhà
                        </a>

                        <button class="btn btn-danger btn-bold" title="Xóa các tòa nhà đã chọn" id="btnDeleteBuilding">
                            <i class="fa fa-trash-o bigger-120"></i> Xóa
                        </button>
                    </div>
                    <div class="clearfix"></div>

                    <div class="table-responsive">
                        <table class="table table-bordered table-striped align-middle" id="buildingList">
                            <thead>
                            <tr>
                                <th class="center" style="width: 40px;">
                                    <label class="pos-rel">
                                        <input type="checkbox" class="ace"/>
                                        <span class="lbl"></span>
                                    </label>
                                </th>
                                <th>Tên tòa nhà</th>
                                <th>Địa chỉ</th>
                                <th>Số tầng hầm</th>
                                <th>Tên quản lý</th>
                                <th>SĐT quản lý</th>
                                <th>Diện tích sàn</th>
                                <th>Diện tích thuê</th>
                                <th>Diện tích trống</th>
                                <th>Giá thuê</th>
                                <th>Phí dịch vụ</th>
                                <th>Phí môi giới</th>
                                <th class="text-center">Thao tác</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="item" items="${buildingList}">
                                <tr>
                                    <td class="center">
                                        <label class="pos-rel">
                                            <input type="checkbox" class="ace" value="${item.id}"/>
                                            <span class="lbl"></span>
                                        </label>
                                    </td>
                                    <td>${item.name}</td>
                                    <td>${item.address}</td>
                                    <td>${item.numberOfBasement}</td>
                                    <td>${item.managerName}</td>
                                    <td>${item.managerPhoneNumber}</td>
                                    <td>${item.floorArea}</td>
                                    <td>${item.rentArea}</td>
                                    <td>${item.emptyArea}</td>
                                    <td>${item.rentPrice}</td>
                                    <td>${item.serviceFee}</td>
                                    <td>${item.brokerageFee}</td>
                                    <td class="text-center text-nowrap">
                                        <button class="btn btn-xs btn-success" onclick="assignmentBuilding(${item.id})"
                                                title="Giao tòa nhà"><i class="fa fa-check-square"></i></button>
                                        <a class="btn btn-xs btn-info" title="Sửa tòa nhà"
                                           href="/admin/building-edit-${item.id}"><i
                                                class="fa fa-pencil"></i>
                                        </a>
                                        <button class="btn btn-xs btn-danger" title="Xóa tòa nhà"
                                                onclick="deleteOneBuilding(${item.id})"><i
                                                class="fa fa-trash"></i></button>
                                    </td>
                                </tr>
                            </c:forEach>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="assignmentBuildingModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Danh sách nhân viên</h4>
            </div>
            <div class="modal-body">
                <table class="table table-bordered table-striped" id="staffList">
                    <thead>
                    <tr>
                        <th class="center" style="width: 60px;">
                            <label class="pos-rel">
                                <input type="checkbox" class="ace" id="checkAllStaff"/>
                                <span class="lbl"></span>
                            </label>
                        </th>
                        <th class="center">Họ tên nhân viên</th>
                    </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="btnAssignmentBuilding">Giao tòa nhà</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">Đóng</button>
            </div>
        </div>
    </div>
    <input type="hidden" id="buildingId" value="">
</div>

<script>

    $('#btnReload').click(function (e) {
        e.preventDefault()
        window.location.href = "/admin/building-list";
    })

    $('#btnSearch').click(function (e) {
        e.preventDefault()

        $('#listForm').submit();
    })

    function assignmentBuilding(id) {
        $('#buildingId').val(id);
        $('#assignmentBuildingModal').modal('show');
        loadStaff(id);
    }

    $(document).ready(function () {
        $('#buildingList, #staffList').on('change', 'thead input[type=checkbox]', function () {
            var isChecked = $(this).prop('checked');
            $(this).closest('table').find('tbody input[type=checkbox]').prop('checked', isChecked);
        });

        $('#buildingList, #staffList').on('change', 'tbody input[type=checkbox]', function () {
            var $table = $(this).closest('table');
            var totalCheckboxes = $table.find('tbody input[type=checkbox]').length;
            var checkedCheckboxes = $table.find('tbody input[type=checkbox]:checked').length;

            $table.find('thead input[type=checkbox]').prop('checked', totalCheckboxes === checkedCheckboxes && totalCheckboxes > 0);
        });
    });

    function loadStaff(id) {
        $.ajax({
            url: "/api/buildings/" + id + "/staffs",
            type: "GET",
            dataType: "JSON",
            success: function (response) {
                var row = '';
                $.each(response.data, function (index, item) {
                    row += '<tr>';
                    row += '<td class="center">';
                    row += '  <label class="pos-rel">';
                    row += '    <input type="checkbox" class="ace" value="' + item.staffId + '" ' + item.checked + '>';
                    row += '    <span class="lbl"></span>';
                    row += '  </label>';
                    row += '</td>';
                    row += '<td class="center">' + item.fullName + '</td>';
                    row += '</tr>';
                });

                $('#staffList').find('tbody').html(row);

                var total = $('#staffList tbody input[type=checkbox]').length;
                var checked = $('#staffList tbody input[type=checkbox]:checked').length;
                $('#staffList thead input[type=checkbox]').prop('checked', total === checked && total > 0);
            },
            error: function (response) {
                console.log("Lỗi tải danh sách nhân viên!");
            }
        });
    }

    $('#btnAssignmentBuilding').click(function (e) {
        e.preventDefault();

        var json = {}
        json['buildingId'] = $('#buildingId').val();
        var staffIds = $('#staffList').find('tbody input[type = checkbox]:checked').map(function () {
            return $(this).val();
        }).get();
        json['staffIds'] = staffIds;
        if (json['buildingId'] != null) {
            updateAssignment(json);
        } else {
            alert("Id của tòa nhà không được thiếu!");
        }

    })

    function updateAssignment(data) {
        $.ajax({
            url: "/api/assignments",
            type: "POST",
            dataType: "JSON",
            data: JSON.stringify(data),
            contentType: "application/json",
            success: function (response) {
                console.log("success")
                if (data.staffIds && data.staffIds.length !== 0) {
                    alert("Đã giao tòa nhà cho nhân viên " + response.message + " !")
                } else {
                    alert("Đã thu hồi quyền quản lý của tất cả nhân viên đối với tòa nhà này!");
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

    $('#btnDeleteBuilding').click(function (e) {
        e.preventDefault();

        var data = {}
        var ids = $('#buildingList').find('tbody input[type = checkbox]:checked').map(function () {
            return $(this).val();
        }).get();
        data['ids'] = ids

        if (data['ids'] != '') {
            deleteBuilding(data['ids'])
        } else {
            alert("Không có tòa nhà được chọn")
        }

    })

    function deleteOneBuilding(id) {
        deleteBuilding(id);
    }

    function deleteBuilding(data) {
        $.ajax({
            url: "/api/buildings/" + data,
            type: "DELETE",
            dataType: "JSON",
            success: function (response) {
                console.log("success")
                alert("Xóa tòa nhà " + response.message + " thành công!");
                window.location.href = "<c:url value='/admin/building-list' />"
            },
            error: function (response) {
                console.log("error")
                alert("Xoá tòa nhà " + response.message + " thất bại!");
            }
        });
    }
</script>
</body>
</html>
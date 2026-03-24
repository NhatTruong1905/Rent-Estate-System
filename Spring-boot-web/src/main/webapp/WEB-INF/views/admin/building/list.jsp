<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<html>
<head>
    <meta charset='utf-8'>
    <title>Building List</title>
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
                                            <form:checkboxes path="typeCode" items="${typeCodes}"/>
                                        </div>
                                    </div>
                                    <div class="space-8"></div>

                                    <div class="row">
                                        <div class="col-xs-12">
                                            <button type="button" class="btn btn-sm btn-success" id="btnSearch">
                                                Tìm kiếm <i class="ace-icon fa fa-arrow-right icon-on-right"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form:form>
                            </div>
                        </div>
                    </div>

                    <div class="pull-right" style="margin-bottom: 10px; margin-top: 10px;">
                        <a href="/admin/building-edit">
                            <button class="btn btn-white btn-info btn-bold" title="Thêm tòa nhà">
                                <i class="fa fa-plus-circle purple bigger-120"></i>
                            </button>
                        </a>
                        <button class="btn btn-white btn-warning btn-bold" title="Xóa" id="btnDeleteBuilding">
                            <i class="fa fa-trash-o pink bigger-120"></i>
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
                                        <button class="btn btn-xs btn-danger" title="Xóa tòa nhà"><i
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
                        <th class="center" style="width: 40px;">
                            <label class="pos-rel">
                                <input type="checkbox" class="ace" value="30"/>
                                <span class="lbl"></span>
                            </label>
                        </th>
                        <th>Họ tên nhân viên</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td class="center">
                            <label class="pos-rel">
                                <input type="checkbox" class="ace" value="31"/>
                                <span class="lbl"></span>
                            </label>
                        </td>
                        <td>Nguyen van A</td>
                    </tr>
                    <tr>
                        <td class="center">
                            <label class="pos-rel">
                                <input type="checkbox" class="ace" value="32"/>
                                <span class="lbl"></span>
                            </label>
                        </td>
                        <td>Nguyen van B</td>
                    </tr>
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
    // const searchCollapse = document.getElementById('searchCollapse');
    // const iconCollapse = document.getElementById('iconCollapse');
    //
    // if (searchCollapse) {
    //     searchCollapse.addEventListener('hidden.bs.collapse', function () {
    //         iconCollapse.classList.remove('fa-chevron-up');
    //         iconCollapse.classList.add('fa-chevron-down');
    //     });
    //
    //     searchCollapse.addEventListener('shown.bs.collapse', function () {
    //         iconCollapse.classList.remove('fa-chevron-down');
    //         iconCollapse.classList.add('fa-chevron-up');
    //     });
    // }

    $('#btnReload').click(function (e) {
        e.preventDefault()

        $('#listForm').trigger('reset');
    })

    $('#btnSearch').click(function (e) {
        e.preventDefault()

        $('#listForm').submit();
    })

    function assignmentBuilding(id) {
        $('#buildingId').val(id);
        $('#assignmentBuildingModal').modal('show');
    }

    $('#btnAssignmentBuilding').click(function (e) {
        e.preventDefault();

        var json = {}
        json['buildingId'] = $('#buildingId').val();
        var staffIds = $('#staffList').find('tbody input[type = checkbox]:checked').map(function () {
            return $(this).val();
        }).get();
        json['staffIds'] = staffIds;

        if (json['buildingId'] != '' && json['staffIds'].length != 0) {
            updateAssignment(json);
        } else {
            alert('Id của tòa nhà và nhân viên không được rỗng!')
        }
    })

    $('#btnDeleteBuilding').click(function (e) {
        e.preventDefault();

        var data = {}
        var ids = $('#buildingList').find('tbody input[type = checkbox]:checked').map(function () {
            return $(this).val();
        }).get();
        data['ids'] = ids

        deleteBuilding(data['ids'])
    })


    function updateAssignment(data) {
        $.ajax({
            url: "https://localhost:8080/api/assignments",
            type: "DELETE",
            dataType: "JSON",
            success: function (response) {
                console.log("success")
            },
            error: function (response) {
                console.log("error")
            }
        });
    }

    function deleteBuilding(data) {
        $.ajax({
            url: "https://localhost:8080/api/buildings" + data,
            type: "POST",
            data: JSON.stringify(data),
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
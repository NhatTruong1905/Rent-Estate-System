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
                                <a href="#" data-action="collapse" id="iconCollapse">
                                    <i class="ace-icon fa fa-chevron-up"></i>
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
                                                <select class="form-control" name="district">
                                                    <option value="">--Chọn quận--</option>
                                                    <option value="QUAN_1">Quận 1</option>
                                                    <option value="QUAN_2">Quận 2</option>
                                                    <option value="QUAN_TD">Quận Thủ Đức</option>
                                                </select>
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
                                                <select class="form-control" name="staffId">
                                                    <option value="">-- Chọn Nhân Viên --</option>
                                                    <option value="1">Trần Văn D</option>
                                                    <option value="2">Trần Xuân V</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="space-8"></div>

                                    <div class="row">
                                        <div class="col-xs-12">
                                            <label class="inline" style="margin-right: 15px;">
                                                <input class="ace" type="checkbox" value="noi-that" name="typeCode">
                                                <span class="lbl"> Nội thất</span>
                                            </label>
                                            <label class="inline" style="margin-right: 15px;">
                                                <input class="ace" type="checkbox" value="tang-tret" name="typeCode">
                                                <span class="lbl"> Tầng trệt</span>
                                            </label>
                                            <label class="inline">
                                                <input class="ace" type="checkbox" value="nguyen-can" name="typeCode">
                                                <span class="lbl"> Nguyên căn</span>
                                            </label>
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
                            <tr>
                                <td class="center">
                                    <label class="pos-rel">
                                        <input type="checkbox" class="ace" value="1"/>
                                        <span class="lbl"></span>
                                    </label>
                                </td>
                                <td>DEV Building 1</td>
                                <td>12, Phan Xích Long, Quận 1</td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td class="text-center text-nowrap">
                                    <button class="btn btn-xs btn-success" onclick="assignmentBuilding(1)"
                                            title="Giao tòa nhà"><i class="fa fa-check-square"></i></button>
                                    <button class="btn btn-xs btn-info" title="Sửa tòa nhà"><i class="fa fa-pencil"></i>
                                    </button>
                                    <button class="btn btn-xs btn-danger" title="Xóa tòa nhà"><i
                                            class="fa fa-trash"></i></button>
                                </td>
                            </tr>
                            <tr>
                                <td class="center">
                                    <label class="pos-rel">
                                        <input type="checkbox" class="ace" value="3"/>
                                        <span class="lbl"></span>
                                    </label>
                                </td>
                                <td>DEV Building 2</td>
                                <td>12, Phan Xích Long, Quận 1</td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td class="text-center text-nowrap">
                                    <button class="btn btn-xs btn-success" onclick="assignmentBuilding(3)"
                                            title="Giao tòa nhà"><i class="fa fa-check-square"></i></button>
                                    <button class="btn btn-xs btn-info" title="Sửa tòa nhà"><i class="fa fa-pencil"></i>
                                    </button>
                                    <button class="btn btn-xs btn-danger" title="Xóa tòa nhà"><i
                                            class="fa fa-trash"></i></button>
                                </td>
                            </tr>
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
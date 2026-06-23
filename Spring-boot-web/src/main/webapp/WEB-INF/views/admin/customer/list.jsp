<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="formUrl" value="/admin/customer-list"/>
<c:url var="customerAPI" value="/api/customers"/>
<html>
<head>
    <meta charset='utf-8'>
    <title>Danh sách khách hàng</title>

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
                    <a href="/admin/home">Trang chủ</a>
                </li>
                <li class="active">Danh sách khách hàng</li>
            </ul>
        </div>

        <div class="page-content">

            <link rel="stylesheet" href="<c:url value='/admin/css/custom-building-list.css' />"/>

            <style>
                .table-custom-header thead tr th {
                    background-color: #559166 !important;
                    color: white !important;
                    text-transform: uppercase;
                    vertical-align: middle;
                }
                .form-group-custom {
                    margin-bottom: 15px;
                }
            </style>

            <c:if test="${not empty messageResponse}">
                <div class="alert alert-block alert-${alert}">
                    <button type="button" class="close" data-dismiss="alert">
                        <i class="ace-icon fa fa-times"></i>
                    </button>
                        ${messageResponse}
                </div>
            </c:if>

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
                            </div>
                        </div>

                        <div class="widget-body">
                            <div class="widget-main">
                                <form:form id="listForm" action="${formUrl}" method="GET" modelAttribute="modelSearch">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <div class="form-group-custom">
                                                <label>Tên khách hàng</label>
                                                <form:input path="fullname" class="form-control" placeholder="Nhập tên..."/>
                                            </div>
                                            <div class="form-group-custom">
                                                <label>Di động</label>
                                                <form:input path="phone" class="form-control" placeholder="Nhập số điện thoại..."/>
                                            </div>
                                            <div class="form-group-custom">
                                                <label>Tình trạng</label>
                                                <form:select path="statusAssignment" class="form-control">
                                                    <form:option value="" label="---Chọn tình trạng---"/>
                                                    <form:options items="${statusAssignment}"/>
                                                </form:select>
                                            </div>
                                        </div>

                                        <div class="col-sm-6">
                                            <div class="form-group-custom">
                                                <label>Email</label>
                                                <form:input path="email" class="form-control" placeholder="Nhập địa chỉ email..."/>
                                            </div>
                                            <security:authorize access="hasRole('MANAGER')">
                                                <div class="form-group-custom">
                                                    <label>Nhân viên quản lí</label>
                                                    <form:select path="staffId" class="form-control">
                                                        <form:option value="" label="---Chọn nhân viên---"/>
                                                        <form:options items="${staffList}"/>
                                                    </form:select>
                                                </div>
                                            </security:authorize>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-xs-12 text-center" style="margin-top: 15px;">
                                            <button type="button" class="btn btn-sm btn-primary" id="btnSearch">
                                                <i class="ace-icon fa fa-search"></i> Tìm kiếm
                                            </button>
                                            <a href="${formUrl}" class="btn btn-sm btn-danger">
                                                <i class="ace-icon fa fa-undo"></i> Hoàn tác
                                            </a>
                                        </div>
                                    </div>
                                </form:form>
                            </div>
                        </div>
                    </div>

                    <div class="pull-right" style="margin-bottom: 10px; margin-top: 10px;">
                        <a href="/admin/customer-edit" class="btn btn-purple btn-bold" title="Thêm khách hàng">
                            <i class="fa fa-user-plus bigger-120"></i> Thêm khách hàng
                        </a>

                        <security:authorize access="hasRole('MANAGER')">
                            <button class="btn btn-danger btn-bold" title="Xóa các khách hàng đã chọn"
                                    id="btnDeleteCustomer">
                                <i class="fa fa-trash-o bigger-120"></i> Xóa
                            </button>
                        </security:authorize>
                    </div>
                    <div class="clearfix"></div>

                    <div class="table-responsive">
                        <display:table name="params.listResult" cellspacing="0" cellpadding="0"
                                       requestURI="${formUrl}" partialList="true" sort="external"
                                       size="${params.totalItems}" defaultsort="2" defaultorder="ascending"
                                       id="tableList" pagesize="${params.maxPageItems}" export="false"
                                       class="table table-bordered table-striped align-middle table-custom-header"
                                       style="margin: 3em 0 1.5em;" htmlId="customerList">

                            <display:column title="<label class='pos-rel'><input type='checkbox' class='ace' id='checkAll'/><span class='lbl'></span></label>"
                                    class="center" headerClass="center" style="width: 40px;">
                                <label class="pos-rel">
                                    <input type="checkbox" class="ace" value="${tableList.id}"/>
                                    <span class="lbl"></span>
                                </label>
                            </display:column>

                            <display:column headerClass="text-center" property="fullname" title="TÊN KHÁCH HÀNG"/>
                            <display:column headerClass="text-center" property="phone" title="DI ĐỘNG"/>
                            <display:column headerClass="text-center" property="email" title="EMAIL"/>
                            <display:column headerClass="text-center" property="note" title="NHU CẦU"/>
                            <display:column headerClass="text-center" property="createdBy" title="NGƯỜI THÊM"/>
                            <display:column headerClass="text-center" property="createdDate" title="NGÀY THÊM"/>
                            <display:column headerClass="text-center" property="statusAssignment" title="TÌNH TRẠNG"/>

                            <display:column headerClass="text-center" class="text-center text-nowrap" title="THAO TÁC">
                                <security:authorize access="hasRole('MANAGER')">
                                    <button class="btn btn-xs btn-primary" onclick="assignmentCustomer(${tableList.id})" title="Giao khách hàng">
                                        <i class="fa fa-users"></i>
                                    </button>
                                </security:authorize>

                                <a class="btn btn-xs btn-success" title="Sửa khách hàng" href="/admin/customer-edit-${tableList.id}">
                                    <i class="fa fa-pencil"></i>
                                </a>

                                <security:authorize access="hasRole('MANAGER')">
                                    <button class="btn btn-xs btn-danger" title="Xóa khách hàng" onclick="deleteOneCustomer(${tableList.id})">
                                        <i class="fa fa-trash"></i>
                                    </button>
                                </security:authorize>
                            </display:column>

                        </display:table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="assignmentCustomerModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Danh sách nhân viên</h4>
            </div>
            <div class="modal-body">
                <table class="table table-bordered table-striped" id="staffListModal">
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
                    <tbody></tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="btnAssignmentCustomer">Giao khách hàng</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">Đóng</button>
            </div>
        </div>
    </div>
    <input type="hidden" id="customerId" value="">
</div>

<script>
    $('#btnReload').click(function (e) {
        e.preventDefault();
        window.location.href = "${formUrl}";
    });

    $('#btnSearch').click(function (e) {
        e.preventDefault();
        $('#listForm').submit();
    });

    $(document).ready(function () {
        $('#customerList, #staffListModal').on('change', 'thead input[type=checkbox]', function () {
            var isChecked = $(this).prop('checked');
            $(this).closest('table').find('tbody input[type=checkbox]').prop('checked', isChecked);
        });

        $('#customerList, #staffListModal').on('change', 'tbody input[type=checkbox]', function () {
            var $table = $(this).closest('table');
            var totalCheckboxes = $table.find('tbody input[type=checkbox]').length;
            var checkedCheckboxes = $table.find('tbody input[type=checkbox]:checked').length;
            $table.find('thead input[type=checkbox]').prop('checked', totalCheckboxes === checkedCheckboxes && totalCheckboxes > 0);
        });
    });

    function assignmentCustomer(id) {
        $('#customerId').val(id);
        $('#assignmentCustomerModal').modal('show');
        loadStaff(id);
    }

    function loadStaff(id) {
        $.ajax({
            url: "${customerAPI}/" + id + "/staffs",
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
                $('#staffListModal').find('tbody').html(row);

                var total = $('#staffListModal tbody input[type=checkbox]').length;
                var checked = $('#staffListModal tbody input[type=checkbox]:checked').length;
                $('#staffListModal thead input[type=checkbox]').prop('checked', total === checked && total > 0);
            },
            error: function (response) {
                console.log("Lỗi tải danh sách nhân viên!");
            }
        });
    }

    $('#btnAssignmentCustomer').click(function (e) {
        e.preventDefault();
        var json = {};
        json['customerId'] = $('#customerId').val();
        json['staffIds'] = $('#staffListModal').find('tbody input[type=checkbox]:checked').map(function () { return $(this).val(); }).get();

        if (json['customerId'] != null) {
            updateAssignment(json);
        } else {
            alert("Id của khách hàng không được thiếu!");
        }
    });

    function updateAssignment(data) {
        $.ajax({
            url: "/api/assignments/customer",
            type: "POST",
            dataType: "JSON",
            data: JSON.stringify(data),
            contentType: "application/json",
            success: function (response) {
                if (data.staffIds && data.staffIds.length !== 0) {
                    alert("Đã giao khách hàng cho nhân viên thành công!");
                } else {
                    alert("Đã thu hồi quyền quản lý của tất cả nhân viên đối với khách hàng này!");
                }
                $('#assignmentCustomerModal').modal('hide');
            },
            error: function (response) {
                alert("Hệ thống gặp lỗi, vui lòng thử lại sau!");
                console.log("Error details:", response);
            }
        });
    }

    $('#btnDeleteCustomer').click(function (e) {
        e.preventDefault();
        var ids = $('#customerList').find('tbody input[type=checkbox]:checked').map(function () { return $(this).val(); }).get();

        if (ids && ids.length > 0) {
            deleteCustomer(ids);
        } else {
            alert("Vui lòng chọn ít nhất một khách hàng để xóa!");
        }
    });

    function deleteOneCustomer(id) {
        deleteCustomer([id]);
    }

    function deleteCustomer(ids) {
        var idString = ids.join(',');
        $.ajax({
            url: "${customerAPI}/" + idString,
            type: "DELETE",
            dataType: "JSON",
            success: function (response) {
                alert("Xóa khách hàng thành công!");
                window.location.href = "${formUrl}?message=delete_success";
            },
            error: function (response) {
                alert("Xóa khách hàng thất bại!");
                console.log("Error details:", response);
            }
        });
    }
</script>
</body>
</html>
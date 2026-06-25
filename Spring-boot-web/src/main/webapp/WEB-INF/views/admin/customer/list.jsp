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
            <div class="row">
                <div class="col-xs-12">

                    <c:if test="${not empty messageResponse}">
                        <div class="alert alert-block alert-${alert}">
                            <button type="button" class="close" data-dismiss="alert">
                                <i class="ace-icon fa fa-times"></i>
                            </button>
                                ${messageResponse}
                        </div>
                    </c:if>

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
                                <form:form id="listForm" action="${formUrl}" method="GET"
                                           modelAttribute="modelSearch">
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <div class="col-sm-6">
                                                <label>Tên khách hàng</label>
                                                <form:input path="fullname" class="form-control"/>
                                            </div>
                                            <div class="col-sm-6">
                                                <label>Di động</label>
                                                <form:input path="phone" class="form-control"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="space-4"></div>

                                    <div class="row">
                                        <div class="col-xs-12">
                                            <div class="col-sm-6">
                                                <label>Email</label>
                                                <form:input path="email" class="form-control"/>
                                            </div>
                                            <div class="col-sm-6">
                                                <label>Trạng thái xử lý</label>
                                                <form:select path="status" class="form-control">
                                                    <option value="">-- Chọn Trạng Thái Xử Lý --</option>
                                                    <form:options items="${status}"></form:options>
                                                </form:select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="space-4"></div>

                                    <div class="row">
                                        <div class="col-xs-12">
                                            <security:authorize access="hasRole('MANAGER')">
                                                <div class="col-sm-6">
                                                    <label>Chọn nhân viên</label>
                                                    <form:select path="staffId" class="form-control">
                                                        <option value="">-- Chọn Nhân Viên --</option>
                                                        <form:options items="${staffList}"></form:options>
                                                    </form:select>
                                                </div>
                                            </security:authorize>
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
                        <a href="/admin/customer-edit" class="btn btn-purple btn-bold" title="Thêm khách hàng">
                            <i class="fa fa-plus-circle bigger-120"></i> Thêm khách hàng
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
                                       id="tableList" pagesize="${params.maxPageItems}"
                                       export="false"
                                       class="table table-bordered table-striped align-middle"
                                       style="margin: 3em 0 1.5em;"
                                       htmlId="customerList">

                            <display:column
                                    title="<label class='pos-rel'><input type='checkbox' class='ace' id='checkAll'/><span class='lbl'></span></label>"
                                    class="center" headerClass="center" style="width: 40px;">
                                <label class="pos-rel">
                                    <input type="checkbox" class="ace" value="${tableList.id}"/>
                                    <span class="lbl"></span>
                                </label>
                            </display:column>

                            <display:column headerClass="text-center" property="fullname" title="Tên khách hàng"/>
                            <display:column headerClass="text-center" property="phone" title="Di động"/>
                            <display:column headerClass="text-center" property="email" title="Email"/>
                            <display:column headerClass="text-center" property="demand" title="Nhu cầu"/>
                            <display:column headerClass="text-center" property="createdBy" title="Người thêm"/>
                            <display:column headerClass="text-center" property="createdDate" title="Ngày thêm"/>
                            <display:column headerClass="text-center" property="status" title="Trạng thái xử lý"/>

                            <display:column headerClass="text-center" class="text-center text-nowrap" title="Thao tác">
                                <security:authorize access="hasRole('MANAGER')">
                                    <button class="btn btn-xs btn-success" onclick="assignmentCustomer(${tableList.id})"
                                            title="Giao khách hàng">
                                        <i class="fa fa-check-square"></i>
                                    </button>
                                </security:authorize>

                                <a class="btn btn-xs btn-info" title="Sửa khách hàng"
                                   href="/admin/customer-edit-${tableList.id}">
                                    <i class="fa fa-pencil"></i>
                                </a>

                                <security:authorize access="hasRole('MANAGER')">
                                    <button class="btn btn-xs btn-danger" title="Xóa khách hàng"
                                            onclick="deleteOneCustomer(${tableList.id})">
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
                <button type="button" class="btn btn-primary" id="btnAssignmentCustomer">Giao khách hàng</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">Đóng</button>
            </div>
        </div>
    </div>
    <input type="hidden" id="customerId" value="">
</div>

<script>

    $('#btnReload').click(function (e) {
        e.preventDefault()
        window.location.href = "${formUrl}";
    })

    $('#btnSearch').click(function (e) {
        e.preventDefault()

        $('#listForm').submit();
    })

    function assignmentCustomer(id) {
        $('#customerId').val(id);
        $('#assignmentCustomerModal').modal('show');
        loadStaff(id);
    }

    $(document).ready(function () {
        $('#customerList, #staffList').on('change', 'thead input[type=checkbox]', function () {
            var isChecked = $(this).prop('checked');
            $(this).closest('table').find('tbody input[type=checkbox]').prop('checked', isChecked);
        });

        $('#customerList, #staffList').on('change', 'tbody input[type=checkbox]', function () {
            var $table = $(this).closest('table');
            var totalCheckboxes = $table.find('tbody input[type=checkbox]').length;
            var checkedCheckboxes = $table.find('tbody input[type=checkbox]:checked').length;

            $table.find('thead input[type=checkbox]').prop('checked', totalCheckboxes === checkedCheckboxes && totalCheckboxes > 0);
        });
    });

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

    $('#btnAssignmentCustomer').click(function (e) {
        e.preventDefault();

        var json = {}
        json['customerId'] = $('#customerId').val();
        var staffIds = $('#staffList').find('tbody input[type = checkbox]:checked').map(function () {
            return $(this).val();
        }).get();
        json['staffIds'] = staffIds;

        if (json['customerId'] != null) {
            updateAssignment(json);
        } else {
            alert("Id của khách hàng không được thiếu!");
        }

    })

    function updateAssignment(data) {
        $.ajax({
            url: "/api/assignments/customer",
            type: "POST",
            dataType: "JSON",
            data: JSON.stringify(data),
            contentType: "application/json",
            success: function (response) {
                console.log("success")
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

        var data = {}
        var ids = $('#customerList').find('tbody input[type = checkbox]:checked').map(function () {
            return $(this).val();
        }).get();
        data['ids'] = ids

        if (data['ids'] != '') {
            deleteCustomer(data['ids'])
        } else {
            alert("Không có khách hàng được chọn")
        }

    })

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
                console.log("success")
                alert("Xóa khách hàng thành công!");
                window.location.href = "${formUrl}?message=delete_success"
            },
            error: function (response) {
                console.log("error")
                alert("Xóa khách hàng thất bại!");
            }
        });
    }
</script>
</body>
</html>
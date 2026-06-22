<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="formUrl" value="/admin/user-list"/>
<c:url var="formAjax" value="/api/user"/>
<html>
<head>
    <meta charset='utf-8'>
    <title>Danh sách người dùng</title>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
                <li class="active">Danh sách người dùng</li>
            </ul>
        </div>

        <div class="page-content">
            <link rel="stylesheet" href="<c:url value='/admin/css/custom-building-list.css' />"/>

            <div class="row">
                <div class="col-xs-12">

                    <c:if test="${messageResponse!=null}">
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
                                <form:form id="listForm" action="${formUrl}" method="GET" modelAttribute="model">
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <div class="col-sm-6">
                                                <label>Giá trị cần tìm (Tên, Username)</label>
                                                <form:input path="searchValue" class="form-control"/>
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
                        <a href="/admin/user-edit" class="btn btn-purple btn-bold" title="Thêm người dùng">
                            <i class="fa fa-plus-circle bigger-120"></i> Thêm người dùng
                        </a>

                        <button class="btn btn-danger btn-bold" title="Xóa các người dùng đã chọn" id="btnDeleteUser">
                            <i class="fa fa-trash-o bigger-120"></i> Xóa
                        </button>
                    </div>
                    <div class="clearfix"></div>

                    <div class="table-responsive">
                        <display:table name="model.listResult" cellspacing="0" cellpadding="0"
                                       requestURI="${formUrl}" partialList="true" sort="external"
                                       size="${model.totalItems}" defaultsort="2" defaultorder="ascending"
                                       id="tableList" pagesize="${model.maxPageItems}"
                                       export="false"
                                       class="table table-bordered table-striped align-middle"
                                       style="margin: 3em 0 1.5em;"
                                       htmlId="userList">

                            <display:column
                                    title="<label class='pos-rel'><input type='checkbox' class='ace' id='checkAll'/><span class='lbl'></span></label>"
                                    class="center" headerClass="center" style="width: 40px;">
                                <label class="pos-rel">
                                    <input type="checkbox" class="ace" value="${tableList.id}"/>
                                    <span class="lbl"></span>
                                </label>
                            </display:column>

                            <display:column headerClass="text-center" property="userName" title="Tên đăng nhập"/>
                            <display:column headerClass="text-center" property="fullName" title="Họ và tên"/>

                            <display:column headerClass="text-center" class="text-center text-nowrap" title="Thao tác">
                                <c:if test="${tableList.roleCode != 'MANAGER'}">
                                    <a class="btn btn-xs btn-info" title="Sửa người dùng"
                                       href="/admin/user-edit-${tableList.id}">
                                        <i class="fa fa-pencil"></i>
                                    </a>
                                </c:if>
                                <c:if test="${tableList.roleCode == 'MANAGER'}">
                                    <span class="label label-warning">Bảo vệ</span>
                                </c:if>
                            </display:column>

                        </display:table>
                    </div>
                </div>
            </div>
        </div>
    </div>
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
        $('#userList').on('change', 'thead input[type=checkbox]', function () {
            var isChecked = $(this).prop('checked');
            $(this).closest('table').find('tbody input[type=checkbox]').prop('checked', isChecked);
        });

        $('#userList').on('change', 'tbody input[type=checkbox]', function () {
            var $table = $(this).closest('table');
            var totalCheckboxes = $table.find('tbody input[type=checkbox]').length;
            var checkedCheckboxes = $table.find('tbody input[type=checkbox]:checked').length;
            $table.find('thead input[type=checkbox]').prop('checked', totalCheckboxes === checkedCheckboxes && totalCheckboxes > 0);
        });
    });

    $('#btnDeleteUser').click(function (e) {
        e.preventDefault();
        var ids = $('#userList').find('tbody input[type=checkbox]:checked').map(function () {
            return $(this).val();
        }).get();

        if (ids.length > 0) {
            deleteUser(ids);
        } else {
            alert("Không có người dùng nào được chọn!");
        }
    });

    function deleteUser(data) {
        $.ajax({
            url: "${formAjax}/",
            type: "DELETE",
            dataType: "JSON",
            contentType: "application/json",
            data: JSON.stringify(data),
            success: function (response) {
                alert("Xóa người dùng thành công!");
                window.location.href = "${formUrl}?message=delete_success";
            },
            error: function (response) {
                console.log("Error details:", response);
                alert("Hệ thống gặp lỗi hoặc bạn không có quyền xóa!");
            }
        });
    }
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div id="sidebar" class="sidebar                  responsive                    ace-save-state">
    <script type="text/javascript">
        try {
            ace.settings.loadState('sidebar')
        } catch (e) {
        }
    </script>
    <style>
        .sidebar-shortcuts-large .btn {
            width: 42px !important;
            height: 38px !important;
            padding: 0 !important;
            margin: 0 2px !important;
            border-radius: 6px !important;
            border: none !important;

            display: inline-flex !important;
            align-items: center !important;
            justify-content: center !important;

            transition: all 0.3s ease !important;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1) !important;
        }

        .sidebar-shortcuts-large .btn:hover {
            transform: translateY(-2px) !important;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15) !important;
            opacity: 0.9 !important;
        }

        .sidebar-shortcuts-large .btn i,
        .sidebar-shortcuts-large .btn svg {
            margin: 0 !important;
            font-size: 16px !important;
            width: 16px !important;
            height: 16px !important;
        }

        .sidebar-shortcuts-large {
            display: flex !important;
            justify-content: center !important;
            flex-wrap: nowrap !important;
            padding: 10px 0 !important;
        }

        .sidebar-shortcuts-large .btn {
            width: 38px !important;
            height: 38px !important;
            padding: 0 !important;
            margin: 0 2px !important;
            border-radius: 6px !important;
            border: none !important;

            display: inline-flex !important;
            align-items: center !important;
            justify-content: center !important;

            transition: all 0.3s ease !important;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1) !important;
        }

        .sidebar-shortcuts-large .btn:hover {
            transform: translateY(-2px) !important;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15) !important;
            opacity: 0.9 !important;
        }

        .sidebar-shortcuts-large .btn i,
        .sidebar-shortcuts-large .btn svg {
            margin: 0 !important;
            font-size: 15px !important;
            width: 15px !important;
            height: 15px !important;
        }
    </style>
    <div class="sidebar-shortcuts">
        <div class="sidebar-shortcuts-large">
            <a href="/trang-chu">
                <button class="btn btn-success"
                        style="text-align: center; width: 41px; line-height: 24px; padding: 0; border-width: 4px;"
                        title="Trang chủ">
                    <svg xmlns="http://www.w3.org/2000/svg" width="14" height="12" fill="currentColor"
                         class="bi bi-door-open" viewBox="0 0 16 16">
                        <path d="M8.5 10c-.276 0-.5-.448-.5-1s.224-1 .5-1 .5.448.5 1-.224 1-.5 1z"/>
                        <path d="M10.828.122A.5.5 0 0 1 11 .5V1h.5A1.5 1.5 0 0 1 13 2.5V15h1.5a.5.5 0 0 1 0 1h-13a.5.5 0 0 1 0-1H3V1.5a.5.5 0 0 1 .43-.495l7-1a.5.5 0 0 1 .398.117zM11.5 2H11v13h1V2.5a.5.5 0 0 0-.5-.5zM4 1.934V15h6V1.077l-6 .857z"/>
                    </svg>
                </button>
            </a>

            <button class="btn btn-info">
                <i class="ace-icon fa fa-pencil"></i>
            </button>

            <button class="btn btn-warning">
                <i class="ace-icon fa fa-users"></i>
            </button>

            <button class="btn btn-danger">
                <i class="ace-icon fa fa-cogs"></i>
            </button>
        </div>
        <div class="sidebar-shortcuts-mini">
            <span class="btn btn-success"></span>

            <span class="btn btn-info"></span>

            <span class="btn btn-warning"></span>

            <span class="btn btn-danger"></span>
        </div>
    </div>

    <ul class="nav nav-list">
        <li class="">
            <a href="#" class="dropdown-toggle">
                <i class="menu-icon fa fa-building"></i>
                <span class="menu-text">Quản Lý Tòa nhà</span>
            </a>
            <b class="arrow"></b>
            <ul class="submenu">
                <li class="">
                    <a href='/admin/building-list'>
                        <i class="menu-icon fa fa-caret-right"></i>
                        Danh sách tòa nhà
                    </a>
                    <b class="arrow"></b>
                </li>
            </ul>
        </li>
    </ul>
    <security:authorize access="hasAnyRole('MANAGER','STAFF')">
        <ul class="nav nav-list">
            <li class="">
                <a href="#" class="dropdown-toggle">
                    <i class="menu-icon fa fa-folder-open-o"></i>
                    <span class="menu-text">Quản Lý Khách Hàng</span>
                </a>
                <b class="arrow"></b>
                <ul class="submenu">
                    <li class="">
                        <a href='/admin/customer-list'>
                            <i class="menu-icon fa fa-caret-right"></i>
                            Danh sách khách hàng
                        </a>
                        <b class="arrow"></b>
                    </li>
                </ul>
            </li>
        </ul>
    </security:authorize>
    <security:authorize access="hasRole('MANAGER')">
        <ul class="nav nav-list">
            <li class="">
                <a href="#" class="dropdown-toggle">
                    <i class="menu-icon fa fas fa-users"></i>
                    <span class="menu-text">Quản Lý Tài Khoản</span>
                </a>
                <b class="arrow"></b>
                <ul class="submenu">
                    <li class="">
                        <a href='/admin/user-list'>
                            <i class="menu-icon fa fa-caret-right"></i>
                            Danh sách tài khoản
                        </a>
                        <b class="arrow"></b>
                    </li>
                </ul>
            </li>
        </ul>
    </security:authorize>

    <%--    <ul class="nav nav-list">--%>
    <%--        <li class="">--%>
    <%--            <a href="#" class="dropdown-toggle">--%>
    <%--                <i class="menu-icon fa fas fa-users"></i>--%>
    <%--                <span class="menu-text">Quản Lý Khách Hàng</span>--%>
    <%--            </a>--%>
    <%--            <b class="arrow"></b>--%>
    <%--            <ul class="submenu">--%>
    <%--                <li class="">--%>
    <%--                    <a href='/admin/customer-list'>--%>
    <%--                        <i class="menu-icon fa fa-caret-right"></i>--%>
    <%--                        Danh sách khách hàng--%>
    <%--                    </a>--%>
    <%--                    <b class="arrow"></b>--%>
    <%--                </li>--%>
    <%--            </ul>--%>
    <%--        </li>--%>
    <%--    </ul>--%>
    <div class="sidebar-toggle sidebar-collapse">
        <i class="ace-icon fa fa-angle-double-left ace-save-state" data-icon1="ace-icon fa fa-angle-double-left"
           data-icon2="ace-icon fa fa-angle-double-right"></i>
    </div>
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<%@ page import="com.javaweb.security.utils.SecurityUtils" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div id="navbar" class="navbar navbar-default ace-save-state"
     style="background-color: #2c3e50; border-bottom: 1px solid #1a252f; box-shadow: 0 2px 4px rgba(0,0,0,0.1);">
    <div class="navbar-container ace-save-state" id="navbar-container">
        <div class="navbar-header pull-left">
            <a href="/admin/home" class="navbar-brand" style="color: white; padding: 10px 15px;">
                <small>
                    <i class="fa fa-leaf" style="color: #2ecc71;"></i> <span
                        style="font-weight: 600; letter-spacing: 1px;">TRANG QUẢN TRỊ</span>
                </small>
            </a>
        </div>

        <div class="navbar-buttons navbar-header pull-right" role="navigation">
            <ul class="nav ace-nav">
                <li class="light-10" style="background-color: transparent !important;">
                    <a data-toggle="dropdown" href="#" class="dropdown-toggle"
                       style="background-color: rgba(255,255,255,0.1); color: white; transition: 0.3s;">
                        <i class="ace-icon fa fa-user-circle bigger-120"></i> &nbsp; Xin
                        chào, <%=SecurityUtils.getPrincipal().getFullName()%>
                        <i class="ace-icon fa fa-caret-down"></i>
                    </a>

                    <ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                        <li>
                            <a href="/admin/profile-<%=SecurityUtils.getPrincipal().getUsername()%>">
                                <i class="ace-icon fa fa-user blue"></i>
                                Thông tin tài khoản
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value="/admin/profile-password"/>">
                                <i class="ace-icon fa fa-key orange"></i>
                                Đổi mật khẩu
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="<c:url value='/logout'/>" style="color: #d9534f;">
                                <i class="ace-icon fa fa-power-off"></i>
                                Thoát
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>
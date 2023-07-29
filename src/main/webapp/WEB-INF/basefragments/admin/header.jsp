<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="header-manage-list flex z-50 justify-between items-center bg-white py-2 shadow-lg fixed top-0">
    <div class="px-2">
        <img src="/assets/images/webdocsach.png" alt="Logo" class="rounded-xl w-70"/>
    </div>
    <div class="account-menu">
        <div class="dropdown ">
            <div class="menu border rounded-xl">
                <button class="p-2 bg-white text-base cursor-pointer rounded-xl transition-all flex gap-2 items-center">
                    <img src="/assets/images/dacnhantam.png" alt="Account's image"
                         class="w-5 h-5 rounded-full border-slate-400 border"/>
                    <span>${user.fullname}</span>
                    <i class="fas fa-caret-down"></i>
                </button>
            </div>

            <div class="rounded-lg overflow-hidden transition-all min-w-[160px] z-1 overflow-hidden dropdown-content bg-white shadow-lg">
                <a href="#">Trang cá nhân</a>
                <a href="#">Thông báo</a>
                <a href="#">Cài đặt</a>
                <a href="/auth/logout">Đăng xuất</a>
            </div>
        </div>

    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
    $(document).ready(function () {
        $.ajax({
            type: "GET",
            data: "username=" + $("#username").val(),
            url: "/api/auth/get-id",
            success: function (result) {
                console.log(result);
                $("#custId").val(result);
            },
            error: function (result) {
                console.log(result)
            }
        });
    });
</script>

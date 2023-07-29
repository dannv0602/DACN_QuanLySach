<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<div class="main-content item">
    <div class="title">
        <h2 class="title-content">
            Danh sách tài khoản
        </h2>
    </div>

    <!-- Start Search -->
    <div class="search">


        <label class="search-title"><b>Tìm kiếm:</b></label>
        <form method="POST" action="/admin/search-users">
            <div class="search-by-username">

                <input type="text"
                       class="search-username-input"
                       id="search-username-input"
                       name="input"
                       value="${searchInput }"
                />

                <button class="search-btn" type="submit">
                    <i class="fas fa-search"></i>Tìm

                </button>
            </div>
        </form>


    </div>
    <!-- End Search -->

    <!--role-->
    <form method="post" action="/admin/delete-all-users">

        <div class="user-role">
            <div class="role-control">
                <a href="/admin/users?role-id=1" class="role-user" id="role-user-link">Client</a>
                <span>/</span>
                <a href="/admin/users?role-id=2" class="role-admin" id="role-admin-link">Admin</a>
            </div>
            <div class="manage-user-btn">
                <button class="delete-user-btn" type="submit">
                    <i class="far fa-times-circle"></i>Xóa tất cả
                </button>
            </div>
        </div>
        <!--End role-->

        <!--Start list users -->
        <div class="list-user-container flex flex-col items-center gap-2">
            <h3>${message }</h3>
            <table class="w-full text-sm text-left text-gray-500">
                <!-- table header -->
                <thead class="text-xs text-gray-700 uppercase bg-gray-100">
                <tr>
                    <th class="px-6 py-3 border-0 rounded-l-lg">
                        <input type="checkbox" class="checkbox-delete-btn"/>
                    </th>
                    <th class="px-6 py-3 border-0">ID</th>
                    <th class="px-6 py-3 border-0">Username</th>
                    <th class="px-6 py-3 border-0">Email</th>
                    <th class="px-6 py-3 border-0">Điện thoại</th>

                    <th class="px-6 py-3 border-0">Role</th>
                    <th class="px-6 py-3 border-0 rounded-r-lg">Tùy chỉnh</th>
                </tr>
                </thead>

                <!--End table header -->

                <!--Start table data -->
                <tbody>
                <c:forEach items="${users}" var="user">
                    <tr class="bg-white hover:bg-gray-50 transition-all [&:not(:last-child)]:border-b">
                        <td class="px-6 py-4 border-0 rounded-l-lg">
                            <input type="checkbox" name="delete-item"
                                   class="delete-item" value="${user.id}"/>
                        </td>
                        <td class="px-6 py-4 border-0">${user.id }</td>

                        <td class="px-6 py-4 border-0">${user.username }</td>

                        <td class="px-6 py-4 border-0">${user.email}</td>

                        <td class="px-6 py-4 border-0">${user.phone }</td>

                        <td class="px-6 py-4 border-0">
                            <c:forEach
                                    items="${roles}" var="role">
                                <c:if test="${role.key==user.id }">
                                    <c:forEach items="${role.value}" var="userRole">
                                        ${userRole.name} <br/>
                                    </c:forEach>
                                </c:if>
                            </c:forEach>
                        </td>

                        <td class="px-6 py-4 border-0 rounded-r-lg">
                            <div class="custom-btn">

                                <c:url value="/admin/edit-user" var="url">
                                    <c:param name="id" value="${user.id}"/>

                                </c:url>
                                <a href="${url}" class="edit-custom-btn">Sửa</a>
                                <c:url value="/admin/delete-user" var="url">
                                    <c:param name="id" value="${user.id}"/>

                                </c:url>
                                <a href="${url}" class="delete-custom-btn">Xóa</a>

                            </div>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>

                <!-- End table data -->
            </table>


            <!-- Start paging -->
            <div class="m-4">
                <ul class="flex items-center -space-x-px h-8 gap-1 text-sm">

                    <c:if test="${currentpage > 0 }">
                        <li><a href="/admin/users/${currentpage-1}"
                               class="previous-page  flex items-center justify-center px-3 h-8 ml-0 leading-tight text-gray-500 bg-white border border-gray-300 rounded-l-lg hover:bg-gray-100 hover:text-gray-700">&lt</a>
                        </li>
                    </c:if>

                    <c:forEach items="${totalPages}" var="page">
                        <c:if test="${currentpage == page }">
                            <li><a href="/admin/books/${page}"
                                   class="page-number rounded flex items-center justify-center px-3 h-8 ml-0 leading-tight text-gray-100 bg-gray-600 border border-gray-700 hover:bg-gray-500 hover:text-gray-50">${page+1}</a>
                            </li>
                        </c:if>
                        <c:if test="${currentpage != page }">
                            <li><a href="/admin/books/${page}"
                                   class="page-number flex rounded items-center justify-center px-3 h-8 ml-0 leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700">${page+1}</a>
                            </li>
                        </c:if>
                    </c:forEach>


                    <c:forEach items="${searchPages}" var="page">
                        <li><a href="/admin/search/${page}"
                               class="page-number rounded flex items-center justify-center px-3 h-8 ml-0 leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700">${page+1}</a>
                        </li>
                    </c:forEach>


                    <c:if test="${currentpage < totalPages.size()-1 }">
                        <li><a href="/admin/books/${currentpage+1}"
                               class="next-page rounded flex items-center justify-center px-3 h-8 leading-tight text-gray-500 bg-white border border-gray-300 rounded-r-lg hover:bg-gray-100 hover:text-gray-700">&gt</a>
                        </li>
                    </c:if>
                </ul>
            </div>

            <!-- End paging -->
        </div>
        <!--End list users -->
    </form>
</div>

<script>
    var checkboxBtn = document.querySelector('.checkbox-delete-btn');
    checkboxBtn.onclick = function () {
        var items = document.querySelectorAll('.delete-item');
        if (checkboxBtn.checked) {

            items.forEach(item => {
                item.checked = true;
            })
        } else {
            items.forEach(item => {
                item.checked = false;
            })
        }
    }
    var adminRoleLink = document.querySelector('#role-admin-link');
    var userRoleLink = document.querySelector('#role-user-link');


    if (window.location.href.includes('/admin/users?role-id=2')) {
        adminRoleLink.style.textDecoration = 'underline';
        userRoleLink.style.textDecoration = 'none';

    }

</script>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<div class="main-content item">
    <div class="title">
        <h2 class="title-content">
            <a class="title-content" href="/admin/books">Danh sách quản lý</a>
        </h2>
    </div>

    <!-- Start Search -->
    <div class="search">


        <label class="search-title"><b>Tìm kiếm</b></label>
        <form method="POST" action="/admin/search">
            <div class="search-by-bookname">
                <label class="search-bookname-label" for="search-bookname-input">Tên
                    sách</label>
                <input type="text" class="search-bookname-input"
                       id="search-bookname-input" name="bookname" value="${bookname}"/>
            </div>

            <div class="search-by-authorname">

                <label class="search-authorname-label" for="search-authorname-input">Tên tác giả</label> <input
                    type="text" class="search-authorname-input"
                    id="search-authorname-input" name="authorname"/>
            </div>


            <button class="search-btn" type="submit">
                <i class="fas fa-search"></i>Tìm
            </button>
        </form>

    </div>
    <!-- End Search -->

    <form method="post" action="/admin/DeleteAll">
        <!-- Manage book button -->
        <div class="manage-book">
            <div class="manage-book-btn">
                <c:url value="/admin/books/addBook" var="url">

                </c:url>
                <a href="${url}" class="add-book-btn"><i
                        class="fas fa-plus-circle"></i>Thêm sách</a>
                <c:url value="/admin/DeleteAll" var="url">


                </c:url>
                <button class="delete-book-btn" type="submit">
                    <i class="far fa-times-circle"></i>Xóa
                </button>
            </div>

            <div class="books-total">
                <p class="books-amount">Tổng số sách là  ${total} quyển</p>
            </div>
        </div>
        <!-- Manage book button-->

        <!--Start list books -->
        <div class="list-book-container flex flex-col items-center gap-2">
            <h3>${message}</h3>
            <table class="w-full text-sm text-left text-gray-500">
                <thead class="text-xs text-gray-700 uppercase bg-gray-100">
                <tr>
                    <th class="px-6 py-3 border-0 rounded-l-lg"><input type="checkbox" class="checkbox-delete-btn"/>
                    </th>
                    <th class="px-6 py-3 border-0">ID</th>
                    <th class="px-6 py-3 border-0">Hình ảnh</th>
                    <th class="px-6 py-3 border-0">Tên sách</th>
                    <th class="px-6 py-3 border-0">Tác giả</th>
                    <th class="px-6 py-3 border-0">Thể loại</th>
                    <th class="px-6 py-3 border-0">Trạng thái</th>
                    <th class="px-6 py-3 border-0">Ngày đăng</th>
                    <th class="px-6 py-3 border-0">Trạng thái đọc</th>
                    <th class="px-6 py-3 border-0 rounded-r-lg">Tùy chỉnh</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${books}" var="book">
                    <!--Start table data -->
                    <tr class="bg-white hover:bg-gray-50 transition-all [&:not(:last-child)]:border-b">
                        <td class="px-6 py-4 border-0 rounded-l-lg"><input type="checkbox" name="delete-item"
                                                                           class="delete-item" value="${book.id}"/></td>
                        <td class="px-6 py-4 border-0">${book.id }</td>
                        <td class="px-6 py-4 border-0 tr-book-image"><img
                                src="${book.thumbnail }" alt="Image" class="book-image"
                                width="36px" height="30px"/></td>
                        <td class="tr-width-12 px-6 py-4 border-0">${book.name}</td>
                        <td class="tr-width-12 px-6 py-4 border-0"><c:forEach
                                items="${book.authors}" var="author">

                            ${author.fullname},
                        </c:forEach></td>
                        <td class="tr-width-12 px-6 py-4 border-0"><c:forEach
                                items="${book.categories}" var="category">
                            ${category.name},
                        </c:forEach></td>


                        <c:choose>
                            <c:when test="${book.status==1}">
                                <td class="px-6 py-4 border-0">Hoàn thành</td>

                            </c:when>
                            <c:otherwise>

                                <td class="px-6 py-4 border-0">Đang update</td>
                            </c:otherwise>
                        </c:choose>

                        <td class="px-6 py-4 border-0">${book.modTime }</td>
                        <td class="tr-width-12 px-6 py-4 border-0">
                            <c:forEach
                                    items="${readFormats}" var="readFormat">
                                <c:if test="${readFormat.key==book.id }">
                                    <c:forEach items="${readFormat.value}" var="format">
                                        ${format} <br/>
                                    </c:forEach>
                                </c:if>
                            </c:forEach></td>

                        <td class="px-6 py-4 border-0 rounded-r-lg">
                            <div class="custom-btn">

                                <c:url value="/admin/edit" var="url">
                                    <c:param name="id" value="${book.id}"/>

                                </c:url>
                                <a href="${url}" class="edit-custom-btn">Sửa</a>
                                <c:url value="/admin/delete-book" var="url">
                                    <c:param name="id" value="${book.id}"/>

                                </c:url>
                                <a href="${url}" class="delete-custom-btn">Xóa</a>

                            </div>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
                </tbody>
            </table>

            <!-- Start paging -->
            <div class="m-4">
                <ul class="flex items-center -space-x-px h-8 gap-1 text-sm">

                    <c:if test="${currentpage > 0 }">
                    <li><a href="/admin/books/${currentpage-1}"
                           class="previous-page flex items-center justify-center px-3 h-8 ml-0 leading-tight text-gray-500 bg-white border border-gray-300 rounded-l-lg hover:bg-gray-100 hover:text-gray-700">&lt</a>
                    <li>
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
        <!--End list books -->
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
</script>

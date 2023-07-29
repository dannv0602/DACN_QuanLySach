<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<div class="main-content item">
    <div class="title">
        <h2 class="title-content">Danh sách bình luận</h2>
    </div>

    <!-- Start Search -->
    <div class="search">
        <form method="POST" action="/admin/searchComment">
            <div class="search-by-bookname">
                <input type="text" class="search-bookname-input"
                       id="search-bookname-input" name="username"/>
                <b>Filter by user</b>
            </div>

            <div class="search-by-authorname">
                <input type="text" class="search-authorname-input"
                       id="search-authorname-input" name="bookname"/> <b>Filter by book</b>
            </div>
            <button class="search-btn" type="submit">
                <i class="fas fa-search"></i>Tìm

            </button>
        </form>
    </div>
    <!-- End Search -->

    <!-- Manage book button -->

    <form method="post" action="/admin/DeleteAllComment">
        <div class="manage-book">
            <div class="manage-book-btn">
                <button class="delete-book-btn" type="submit">
                    <i class="far fa-times-circle"></i>Xóa
                </button>

            </div>

            <div class="books-total">
                <p class="books-amount">Tổng số bình luận sách ${total}</p>
            </div>
        </div>
        <!-- Manage book button-->

        <!--Start list books -->
        <div class="list-book-container flex flex-col items-center gap-2">
            <table class="w-full text-sm text-left text-gray-500">
                <!-- table header -->
                <thead class="text-xs text-gray-700 uppercase bg-gray-100">
                <tr>
                    <th class="px-6 py-3 border-0 rounded-l-lg"><input type="checkbox"/></th>
                    <th class="px-6 py-3 border-0">ID</th>
                    <th class="px-6 py-3 border-0">User</th>
                    <th class="px-6 py-3 border-0">Comment</th>
                    <th class="px-6 py-3 border-0">Ngày đăng</th>
                    <th class="px-6 py-3 border-0">Tên sách</th>
                    <th class="px-6 py-3 border-0">Trạng thái</th>
                    <th class="px-6 py-3 border-0 rounded-r-lg">Tùy chỉnh</th>
                </tr>
                </thead>
                <!--End table header -->

                <!--Start table data -->
                <tbody>
                <c:forEach items="${comments}" var="comment">
                    <tr class="bg-white hover:bg-gray-50 transition-all [&:not(:last-child)]:border-b">
                        <td class="px-6 py-4 border-0 rounded-l-lg"><input type="checkbox"
                                                                           name="delete-item" class="delete-item"
                                                                           value="${comment.id}"/></td>

                        <td class="px-6 py-4 border-0">${comment.id }</td>

                        <td class="px-6 py-4 border-0 tr-width-12">
                            <div class="commnet-space">
                                <div class="comment-img">
                                    <i class="fas fa-user comment-width"></i>
                                </div>
                                <div class="comment-item">
                                    <p>${comment.user.username }</p>

                                    <p class="comment-email">${comment.user.email }</p>
                                </div>
                            </div>
                        </td>

                        <td class="px-6 py-4 border-0 tr-width-12">${comment.content}</td>
                        <td class="px-6 py-4 border-0 tr-book-image">${comment.modTime}</td>
                        <td class="px-6 py-4 border-0 tr-width-12">${comment.book.name }</td>

                        <c:choose>
                            <c:when test="${comment.status==1}">
                                <td class="px-6 py-4 border-0">Hiện</td>

                            </c:when>
                            <c:otherwise>

                                <td class="px-6 py-4 border-0 tr-width-12">Ẩn</td>
                            </c:otherwise>
                        </c:choose>

                        <td class="px-6 py-4 border-0 rounded-r-lg tr-width-12">
                            <div class="custom-btn custom-btn-3" style="display:flex;">
                                <c:url value="/admin/DeleteCommentBook" var="url">
                                    <c:param name="id" value="${comment.id}"/>

                                </c:url>
                                <a href="${url }" class="delete-custom-btn">Xóa</a>
                                <c:url value="/admin/spamComment" var="url">
                                    <c:param name="id" value="${comment.id}"/>

                                </c:url>
                                <a href="${url }" class="spam-custom-btn">Spam</a>
                                <c:url value="/admin/approvedComment" var="url">
                                    <c:param name="id" value="${comment.id}"/>

                                </c:url>
                                <a href="${url }" class="approved-custom-btn">Approved</a>
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
                        <li><a href="/admin/comments/${currentpage-1}"
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
        <!--End list books -->
    </form>
</div>

</body>
</html>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<div class="main-content item">
    <div class="title">
        <h2 class="title-content">Danh sách bình luận</h2>
    </div>

    <!-- Start Search -->
    <div class="search">
        <form method="GET">
            <div class="search-by-bookname">
                <input type="text" class="search-bookname-input"
                       id="search-bookname-input" name="q"/>
                <b>Filter by user</b>
            </div>
            <button class="search-btn text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800"
                    type="submit">
                <i class="fas fa-search"></i>Tìm

            </button>
        </form>
    </div>
    <!-- End Search -->

    <!-- Manage book button -->

    <div class="manage-book">
        <div class="books-total" style="margin-bottom: 30px">
            <p>Tổng số bình luận sách ${results.totalElements}</p>
        </div>
    </div>
    <!-- Manage book button-->

    <!--Start list books -->
    <div class="list-book-container flex flex-col items-center gap-2">
        <table class="w-full text-sm text-left text-gray-500">
            <thead class="text-xs text-gray-700 uppercase bg-gray-100">
            <!-- table header -->
            <tr>
                <th class="px-6 py-3 border-0 rounded-l-lg">ID</th>
                <th class="px-6 py-3 border-0">User</th>
                <th class="px-6 py-3 border-0">Comment</th>
                <th class="px-6 py-3 border-0">Ngày đăng</th>
                <th class="px-6 py-3 border-0">Nội dung</th>
                <th class="px-6 py-3 border-0 rounded-r-lg">Tùy chỉnh</th>
            </tr>
            </thead>
            <!--End table header -->
            <tbody>
            <!--Start table data -->
            <c:forEach items="${results.content}" var="comment">

                <tr class="bg-white hover:bg-gray-50 transition-all [&:not(:last-child)]:border-b">
                    <td class="px-6 py-4 border-0 rounded-l-lg">${comment.id }</td>

                    <td class="px-6 py-4 border-0">
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

                    <td class="px-6 py-4 border-0 w-80">${comment.content}</td>
                    <td class="px-6 py-4 border-0 tr-book-image">${comment.modTime}</td>
                    <td class="px-6 py-4 border-0">
                        <p style="max-width: 200px; overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-box-orient: vertical; -webkit-line-clamp: 3; margin: 0 auto;">
                                ${comment.quote.content }
                        </p>
                    </td>

                    <td class="px-6 py-4 border-0 rounded-r-lg">
                        <div class="custom-btn custom-btn-3"
                             style="display: flex; justify-content: center">
                            <a href="/admin/quote/comments/delete/${comment.id}"
                               class="delete-custom-btn">Xóa</a>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>

            <!-- End table data -->
        </table>
        <!-- Start paging -->
        <div style="margin-top: 10px">
            <c:if test="${results.totalPages>0 }">
                <nav>
                    <ul style="display: flex; list-style: none">
                        <li style="margin: 0 5px;"><a href=""
                                                      data="${results.number > 0 ? results.number:1}"
                                                      class="pagination-link">Previous</a></li>
                        <c:forEach items="${pages}" var="page">
                            <c:choose>
                                <c:when test="${page!=results.number+1}">
                                    <li style="margin: 0 5px;"><a href="" data="${page}"
                                                                  class="pagination-link">${page }</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li style="margin: 0 5px"><a href="" data="${page }"
                                                                 aria-current="page" class="pagination-link"
                                                                 style="color: red">${page }</a></li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        <li style="margin: 0 5px;"><a href=""
                                                      data="${results.number+2>results.totalPages?results.totalPages:results.number+2}"
                                                      class="pagination-link">Next</a></li>
                    </ul>
                </nav>
            </c:if>
        </div>
        <!-- End paging -->
    </div>
    <!--End list books -->
</div>
<script>
    const url_string = window.location.href;
    const url = new URL(url_string);
    const search = url.searchParams.get("q");
    const paginationLinks = document.querySelectorAll(".pagination-link");
    const navItems = document.querySelectorAll(".nav-item");
    if (paginationLinks) {
        paginationLinks.forEach(item => {
            var search = location.search.substring(1);
            const params = search ? JSON.parse('{"' + decodeURI(search).replace(/"/g, '\\"')
                .replace(/&/g, '","').replace(/=/g, '":"') + '"}') : {};
            const page = item.getAttribute("data");
            params.page = page;
            const href = decodeURIComponent(new URLSearchParams(params).toString());
            item.setAttribute("href", '/admin/quote/comments' + "?" + href);
        })
    }
</script>

</body>
</html>
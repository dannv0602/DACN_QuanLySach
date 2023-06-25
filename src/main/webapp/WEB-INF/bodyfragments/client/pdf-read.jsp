<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<section class="introduce">
	<div class="container">
		<div class="introduce-title">
			<h1 class="product-title">${bookDTO.name}</h1>
			<div class="introduce-title-author">
				<p class="info-item">
					<span class="info-label">Tác giả</span>
					<c:forEach items="${bookDTO.authors}" var="author" varStatus="loop">
						<a href="/books?author=${author.slug}">
						<span class="info-item">${author.fullname}
						</span>
							<c:if test="${loop.index != bookDTO.authors.size() - 1}">
								<span class="mr-3">,</span>
							</c:if>
						</a>
					</c:forEach>
				</p>
			</div>

		</div>
		<div class="introduce-content">
			<p>Giới thiệu sách</p>
			<p class="detail-description">${bookDTO.description }</p>
		</div>



		<div class="introduce-pdf">

			<iframe
				src="https://drive.google.com/file/d/1iboU_WRL68hO1ALn04lTfkHn6io6lHay/preview"
<%--					src=${pdfSelected.url}--%>
				width="640" height="480" allow="autoplay"></iframe>
		</div>
		<div class="content-share">
			<div class="content-share-icon">

			</div>
			<div class="content-share-button">
				<button>
					<div class="content-share-button-icon">
						<i class="fa-solid fa-headphones"></i>
					</div>
					<div class="content-share-button-name">
						<p>Nghe Audio</p>
					</div>

				</button>
				<button>
					<div class="content-share-button-icon">
						<i class="fa-solid fa-file-pdf"></i>
					</div>
					<div class="content-share-button-name">
						<p>Đọc pdf</p>
					</div>

				</button>
			</div>
		</div>
		<div class="introduce-scroll">
			<ul>
				<li>
					<div class="introduce-scroll-stt">00</div>
					<div class="introduce-scroll-chapter">Chương 0</div>
					<div class="introduce-scroll-title">Lời Nói đầu</div>
				</li>
				<li>
					<div class="introduce-scroll-stt">01</div>
					<div class="introduce-scroll-chapter">Chương 1</div>
					<div class="introduce-scroll-title">Chúng ta thật sự muốn gì</div>
				</li>
				<li>
					<div class="introduce-scroll-stt">02</div>
					<div class="introduce-scroll-chapter">Chương 2</div>
					<div class="introduce-scroll-title">Ứng xử thế nào khi phỏng
						vấn tìm việc</div>
				</li>
				<li>
					<div class="introduce-scroll-stt">03</div>
					<div class="introduce-scroll-chapter">Chương 3</div>
					<div class="introduce-scroll-title">Chẳng bao giờ quá muộn để
						bắt đầu lại</div>
				</li>
				<li>
					<div class="introduce-scroll-stt">04</div>
					<div class="introduce-scroll-chapter">Chương 4</div>
					<div class="introduce-scroll-title">Lạc lối và bắt đầu lại ra
						sao?</div>
				</li>
				<li>
					<div class="introduce-scroll-stt">05</div>
					<div class="introduce-scroll-chapter">Chương 5</div>
					<div class="introduce-scroll-title">Du học muộn, tại sao
						không?</div>
				</li>
				<li>
					<div class="introduce-scroll-stt">06</div>
					<div class="introduce-scroll-chapter">Chương 6</div>
					<div class="introduce-scroll-title">Một thế hệ phát triển</div>
				</li>
				<li>
					<div class="introduce-scroll-stt">07</div>
					<div class="introduce-scroll-chapter">Chương 7</div>
					<div class="introduce-scroll-title">Vì sao bạn khởi nghiệp</div>
				</li>
				<li>
					<div class="introduce-scroll-stt">08</div>
					<div class="introduce-scroll-chapter">Chương 8</div>
					<div class="introduce-scroll-title">Tuổi trẻ bạn muốn gì</div>
				</li>
				<li>
					<div class="introduce-scroll-stt">09</div>
					<div class="introduce-scroll-chapter">Chương 9</div>
					<div class="introduce-scroll-title">Lời kết thúc</div>
				</li>
				<li>
					<div class="introduce-scroll-stt">10</div>
					<div class="introduce-scroll-chapter">Chương 10</div>
					<div class="introduce-scroll-title">Du học muộn, tại sao
						không?</div>
				</li>
				<li>
					<div class="introduce-scroll-stt">11</div>
					<div class="introduce-scroll-chapter">Chương 11</div>
					<div class="introduce-scroll-title">Một thế hệ phát triển</div>
				</li>
				<li>
					<div class="introduce-scroll-stt">12</div>
					<div class="introduce-scroll-chapter">Chương 12</div>
					<div class="introduce-scroll-title">Vì sao bạn khởi nghiệp</div>
				</li>
				<li>
					<div class="introduce-scroll-stt">13</div>
					<div class="introduce-scroll-chapter">Chương 13</div>
					<div class="introduce-scroll-title">Tuổi trẻ bạn muốn gì</div>
				</li>
				<li>
					<div class="introduce-scroll-stt">14</div>
					<div class="introduce-scroll-chapter">Chương 14</div>
					<div class="introduce-scroll-title">Lời kết thúc</div>
				</li>
			</ul>
		</div>
	</div>
</section>

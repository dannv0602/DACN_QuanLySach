package com.web.dacn.service.client;

import com.web.dacn.dto.book.AudioDTO;
import com.web.dacn.dto.book.BookDTO;
import com.web.dacn.dto.book.OnlineDTO;

import java.util.List;

public interface PDFService {
    public BookDTO findBookBySlug(String slug);

    public List<AudioDTO> findPdfsByBook(Long bookId);

    public boolean existsPdf(Long id);

    public boolean existsEbook(Long id);
}

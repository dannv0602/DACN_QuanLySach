package com.web.dacn.service.client;

import com.web.dacn.dto.book.BookDTO;
import com.web.dacn.dto.book.OnlineDTO;

public interface PDFService {
    BookDTO loadBook(String slug);
    OnlineDTO loadChapter(long bookId, int chapter);
    boolean existsPdfRead(long bookId);
    boolean existsAudio(long bookId);
}

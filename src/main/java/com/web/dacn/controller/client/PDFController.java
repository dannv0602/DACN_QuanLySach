package com.web.dacn.controller.client;

import com.web.dacn.service.client.PDFService;
import com.web.dacn.service.client.ReadOnlineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/pdf-read")
public class PDFController {
    @Autowired
    private PDFService pdfService;
    @GetMapping("/{bookId}")
    public ModelAndView getPdfReadPage(@PathVariable("bookId") String bookId) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("pdf-read"); // Đặt tên trang jsp là "pdf-read"

        // Truyền dữ liệu tới trang JSP nếu cần
        modelAndView.addObject("bookId", bookId);

        // Thực hiện các xử lý khác nếu cần

        return modelAndView;
    }
}


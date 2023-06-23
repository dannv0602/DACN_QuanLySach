package com.web.dacn.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PDFController {

    @GetMapping("/pdf-read/{bookId}")
    public ModelAndView getPdfReadPage(@PathVariable("bookId") String bookId) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("pdf-read"); // Đặt tên trang jsp là "pdf-read"

        // Truyền dữ liệu tới trang JSP nếu cần
        modelAndView.addObject("bookId", bookId);

        // Thực hiện các xử lý khác nếu cần

        return modelAndView;
    }
}


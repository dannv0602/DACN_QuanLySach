package com.web.dacn.controller.client;

import com.web.dacn.dto.book.AudioDTO;
import com.web.dacn.dto.book.BookDTO;
import com.web.dacn.dto.book.OnlineDTO;
import com.web.dacn.service.client.PDFService;
import com.web.dacn.service.client.ReadOnlineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/pdf-read")
public class PDFController {
    @Autowired
    private PDFService pdfService;
    @GetMapping("/{slug}")
    private ModelAndView getAudioBook(@PathVariable(value = "slug") String slug) {
        ModelAndView mav = new ModelAndView("pdfReadPage");

        BookDTO bookDTO = pdfService.findBookBySlug(slug);
        if(bookDTO == null)
            return new ModelAndView("404");

        List<AudioDTO> audioDTOs = pdfService.findAudiosByBook(bookDTO.getId());

        if(audioDTOs == null || audioDTOs.size()<1) {
            return new ModelAndView("404");
        }

        AudioDTO audioSelected = audioDTOs.get(0);
        audioDTOs.remove(0);

        mav.addObject("existsPdf", pdfService.existsPdf((long)bookDTO.getId()));
        mav.addObject("existsEbook", pdfService.existsEbook((long)bookDTO.getId()));

        mav.addObject("bookDTO", bookDTO);
        mav.addObject("audioSelected", audioSelected);
        mav.addObject("audioDTOs", audioDTOs);

        return mav;
    }
}


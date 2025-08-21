package com.quanlyphongtro.controller;

import com.quanlyphongtro.entity.KhachThue;
import com.quanlyphongtro.service.KhachThueService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/khachthue")
public class KhachThueController {

    private final KhachThueService service;

    @Autowired
    public KhachThueController(KhachThueService service) {
        this.service = service;
    }

    @GetMapping
    public String list(Model model) {
        List<KhachThue> list = service.findAll();
        model.addAttribute("items", list);
        return "khachthue/list";
    }

    @GetMapping("/new")
    public String createForm(Model model) {
        model.addAttribute("item", new KhachThue());
        return "khachthue/form";
    }

    @PostMapping
    public String create(@ModelAttribute("item") @Valid KhachThue item,
                         BindingResult bindingResult,
                         Model model) {
        if (bindingResult.hasErrors()) {
            return "khachthue/form";
        }
        if (service.existsByCccd(item.getCccd())) {
            bindingResult.rejectValue("cccd", "duplicate", "CCCD đã tồn tại");
            return "khachthue/form";
        }
        service.save(item);
        return "redirect:/khachthue";
    }

    @GetMapping("/{id}/edit")
    public String editForm(@PathVariable Integer id, Model model) {
        KhachThue item = service.findById(id).orElse(null);
        if (item == null) return "redirect:/khachthue";
        model.addAttribute("item", item);
        return "khachthue/form";
    }

    @PostMapping("/{id}/update")
    public String update(@PathVariable Integer id,
                         @ModelAttribute("item") @Valid KhachThue item,
                         BindingResult bindingResult,
                         Model model) {
        if (bindingResult.hasErrors()) {
            return "khachthue/form";
        }
        KhachThue existing = service.findById(id).orElse(null);
        if (existing == null) return "redirect:/khachthue";
        if (!existing.getCccd().equals(item.getCccd()) && service.existsByCccd(item.getCccd())) {
            bindingResult.rejectValue("cccd", "duplicate", "CCCD đã tồn tại");
            return "khachthue/form";
        }
        item.setId(id);
        service.save(item);
        return "redirect:/khachthue";
    }

    @GetMapping("/{id}/delete")
    public String delete(@PathVariable Integer id) {
        service.deleteById(id);
        return "redirect:/khachthue";
    }
}


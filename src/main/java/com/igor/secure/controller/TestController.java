package com.igor.secure.controller;

import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author igor on 28.01.17.
 */
@Component
@RequestMapping("/test")
public class TestController {

    @RequestMapping(method = RequestMethod.GET)
    public String loadAdminPage(Model model) {
        return "test";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String loadAdminPageP(Model model) {
        return "test";
    }
}

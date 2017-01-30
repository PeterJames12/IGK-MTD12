package com.igor.secure.controller;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author igor on 28.01.17.
 */
@Component
@RequestMapping("/developer")
public class DeveloperController {

    @RequestMapping(method = RequestMethod.GET)
    public String loadDeveloperPage() {
        return "/dev/developer";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String loadDeveloperPageG() {
        return "/dev/developer";
    }
}

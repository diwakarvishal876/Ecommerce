package com.ecom_backend.Ecommerce.restController;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DemoRestController {
    @GetMapping
    public String helloWorld(){
        return "Hello World";
    }
}

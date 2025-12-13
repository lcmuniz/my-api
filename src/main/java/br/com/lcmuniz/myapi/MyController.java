package br.com.lcmuniz.myapi;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@RestController
public class MyController {

    @RequestMapping("/hello")
    public String hello() {
        return "Hello, World! Now is " + LocalDateTime.now().format(DateTimeFormatter.ofPattern("MM/dd/YYYY 'at' HH:mm"))+ ".";
    }

}

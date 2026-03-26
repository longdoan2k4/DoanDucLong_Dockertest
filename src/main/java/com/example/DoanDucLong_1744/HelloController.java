// HelloController.java
package com.example.DoanDucLong_1744; // Đổi tên package cho khớp với thư mục của bạn

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    // Đây là endpoint API đơn giản
    @GetMapping("/api/hello")
    public String greeting() {
        return "Xin chào từ Spring Boot API!";
    }
}
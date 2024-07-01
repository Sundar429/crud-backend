package com.sundar_java.crud_backend;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@SpringBootApplication
public class CrudBackendApplication {

	public static void main(String[] args) {
		SpringApplication.run(CrudBackendApplication.class, args);



	}
	@GetMapping("/welcome")
	public String sayHello() {
		System.out.println("In the Spring Boot main");
		return "Hello, Welcome to the Spring Boot world";
	}




}

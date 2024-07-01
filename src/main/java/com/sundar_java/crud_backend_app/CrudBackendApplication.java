package com.sundar_java.crud_backend_app;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;


@SpringBootApplication
public class CrudBackendApplication {

	public static void main(String[] args) {
		SpringApplication.run(CrudBackendApplication.class, args);



	}
	@GetMapping("/welecome")
	public String sayHello(){
		System.out.println("In the Spring boot main");
		return "Hello Welecome to sprng boot world";
	}





}

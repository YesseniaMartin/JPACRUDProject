package com.skilldistillery.bootbooks;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;

@EntityScan("com.skilldistillery.jpabooks")
@SpringBootApplication
public class BootBooksApplication {

	public static void main(String[] args) {
		SpringApplication.run(BootBooksApplication.class, args);
	}
	
}

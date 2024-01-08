package com.woof;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan(basePackages = "com.woof.mapper")
public class WoofProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(WoofProjectApplication.class, args);
	}

}

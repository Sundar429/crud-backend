package com.sundar_java.crud_backend.config;




import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;

import org.springframework.security.web.SecurityFilterChain;

import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import java.util.Arrays;
import java.util.Collections;

@Configuration
@EnableWebSecurity
public class WebConfig {


    @Bean
    SecurityFilterChain securityFilterChain(HttpSecurity http)throws Exception{

        http.sessionManagement(management ->management.sessionCreationPolicy(SessionCreationPolicy.STATELESS))

                .cors(cors->cors.configurationSource(corsConfigrationSource()));
        return http.build();
    }

    private CorsConfigurationSource corsConfigrationSource() {

        return request -> {
            CorsConfiguration cfg=new CorsConfiguration();

            cfg.setAllowedOrigins(Arrays.asList(
                    "http://localhost:3000",
                    "https://crud-frontend-sandy.vercel.app/"


            ));
            cfg.setAllowedMethods(Collections.singletonList("*"));
            cfg.setAllowCredentials(true);
            cfg.setAllowedHeaders(Collections.singletonList("*"));
            cfg.setExposedHeaders(Arrays.asList("Authorization"));
            cfg.setMaxAge(3600L);
            return cfg;
        };

    }
}
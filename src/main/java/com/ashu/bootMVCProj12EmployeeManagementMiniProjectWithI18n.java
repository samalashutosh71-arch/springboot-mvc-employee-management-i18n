package com.ashu;

import java.util.Locale;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

@SpringBootApplication
public class bootMVCProj12EmployeeManagementMiniProjectWithI18n 
{
	@Bean(name = "localeResolver")
	public SessionLocaleResolver createLocaleresolver()//to activate i8n on the whole app
	{
		SessionLocaleResolver resolver=new SessionLocaleResolver();
		resolver.setDefaultLocale(new Locale("en", "US"));
		return resolver;
		
	}
	@Bean("lci")
	public LocaleChangeInterceptor createLCI() {//to trap request and enable locale on each record
		LocaleChangeInterceptor interceptor=new LocaleChangeInterceptor();
		interceptor.setParamName("language");
		return interceptor;
		
	}
	

	public static void main(String[] args) {
		SpringApplication.run(bootMVCProj12EmployeeManagementMiniProjectWithI18n.class, args);
	}

}

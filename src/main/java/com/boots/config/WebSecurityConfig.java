package com.boots.config;

import com.boots.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    UserService userService;

    @Bean
    public BCryptPasswordEncoder bCryptPasswordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Override
    protected void configure(HttpSecurity httpSecurity) throws Exception {
        httpSecurity
                .csrf()
                    .disable()
                .authorizeRequests()
                    //Для не зареєстрованих користувачів
                    .antMatchers("/registration").not().fullyAuthenticated()
                    //Для користувачів з ролью "ADMIN"
                    .antMatchers("/edit","carlist","/admin/**").hasRole("ADMIN")
                    .antMatchers("/forum").hasRole("USER")
                    //Доступ для будь-кого
                    .antMatchers("/", "/resources/**").permitAll()
                //Сторінки які потребують аутентифікації
                .anyRequest().authenticated()
                .and()
                    //Налаштування для входу в систему
                    .formLogin()
                    .loginPage("/login")
                    //Перенаправлення на головну
                    .defaultSuccessUrl("/")
                    .permitAll()
                .and()
                    .logout()
                    .permitAll()
                    .logoutSuccessUrl("/");
    }

    @Autowired
    protected void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userService).passwordEncoder(bCryptPasswordEncoder());
    }
}

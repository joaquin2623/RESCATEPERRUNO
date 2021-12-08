package idat.edu.pe.controladores.configuracion;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true, securedEnabled = true)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

	@Override
	protected void configure(HttpSecurity http) throws Exception {

		http.authorizeRequests()
		.antMatchers("/css/**", "/imagenes/**", "/js/**", "/", "/principal", "/home", "/inicio", "/logeo", "/login","/rest/**")
		.permitAll()
		.antMatchers("/usuario/listarTodo").hasAnyRole("ADMIN","LECTOR","CREADOR","EDITOR","DEPURADOR")
		.antMatchers("/usuario/nuevo").hasAnyRole("ADMIN","CREADOR")
		.antMatchers("/usuario/guardar").hasAnyRole("ADMIN","CREADOR","EDITOR")
		.antMatchers("/usuario/actualizar/**").hasAnyRole("ADMIN","EDITOR")
		.antMatchers("/usuario/eliminar/**").hasAnyRole("ADMIN","DEPURADOR")
		.anyRequest().authenticated()
		.and().formLogin().loginPage("/login").defaultSuccessUrl("/bienvenida", true).permitAll()
		.and().logout()
		.permitAll();

	}
	
	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {

		PasswordEncoder encoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		auth.inMemoryAuthentication().withUser("admin").password(encoder.encode("admin")).roles("ADMIN").and()
		.withUser("jorge").password(encoder.encode("jorge")).roles("LECTOR").and()
		.withUser("maria").password(encoder.encode("maria")).roles("CREADOR").and()
		.withUser("elena").password(encoder.encode("elena")).roles("LECTOR","DEPURADOR").and()
		.withUser("ernesto").password(encoder.encode("ernesto")).roles("EDITOR","LECTOR").and();

	}
		
}


package karate.demo;

import com.intuit.karate.junit5.Karate;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;
import org.junit.jupiter.api.MethodOrderer;

@TestMethodOrder(MethodOrderer.OrderAnnotation.class) // Define que usaremos el orden de las anotaciones
public class TestSuite {

    @Test
    @Order(1) // Ejecutar primero SignupTest
    void testSignup() {
        Karate.run("classpath:features/SignUp.feature").relativeTo(getClass());
    }

    @Test
    @Order(2) // Ejecutar después LoginTest
    void testLogin() {
        Karate.run("classpath:features/Login.feature").relativeTo(getClass());
    }

}

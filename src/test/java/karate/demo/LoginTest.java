package karate.demo;

import com.intuit.karate.junit5.Karate;

class LoginTest {

    @Karate.Test
    Karate testLogin() {
        return Karate.run("classpath:features/Login.feature").relativeTo(getClass());
    }

}

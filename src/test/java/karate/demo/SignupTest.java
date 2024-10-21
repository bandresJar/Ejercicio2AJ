package karate.demo;

import com.intuit.karate.junit5.Karate;

class SignupTest {

    @Karate.Test
    Karate testSignup() {
        return Karate.run("classpath:features/SignUp.feature").relativeTo(getClass());
    }

}

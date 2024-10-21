
package karate.demo;

import com.intuit.karate.junit5.Karate;

class DemoBlazeTest {

    @Karate.Test
    Karate testAll() {
        return Karate.run("classpath:features/DemoBlaze.feature").relativeTo(getClass());
    }
}

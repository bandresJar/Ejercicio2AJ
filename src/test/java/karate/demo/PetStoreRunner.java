
package karate.demo;

import com.intuit.karate.junit5.Karate;

class PetStoreRunner {

    @Karate.Test
    Karate testAll() {
        return Karate.run("classpath:features/petStore.feature").relativeTo(getClass());
    }
}

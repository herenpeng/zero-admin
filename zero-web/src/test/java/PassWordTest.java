import com.zero.MyApplication;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * @author herenpeng
 * @since 2021-03-13 23:28
 */
@RunWith(SpringRunner.class)
@SpringBootTest(classes = MyApplication.class, webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
public class PassWordTest {

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Test
    public void test() {
        String encode = passwordEncoder.encode("111111");
        System.out.println(encode);
    }

}

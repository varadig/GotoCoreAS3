package core.notification.test {
import core.base.CoreBaseClass;
import core.notification.CoreNotification;

public class A1 extends CoreBaseClass {
    public function A1() {
        CoreNotification.createNotification("testNoti1")
                .addParam("text", "foo")
                .addParam("value", "bar")
                .send()

    }
}
}

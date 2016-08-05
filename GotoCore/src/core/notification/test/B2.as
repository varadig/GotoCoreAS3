package core.notification.test {
import core.base.CoreBaseClass;
import core.notification.CoreListener;

public class B2 extends CoreBaseClass {
    public function B2() {
        CoreListener.register("testNoti1", this.listenerB2Test);
    }

    private function listenerB2Test(params:Array):void {
        log("B2.listenerB2Test():  " + params["text"]);
        log("B2.listenerB2Test():  " + params["value"]);
    }
}
}

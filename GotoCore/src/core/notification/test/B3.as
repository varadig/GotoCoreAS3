package core.notification.test {
import core.base.CoreBaseClass;
import core.notification.CoreListener;

public class B3 extends CoreBaseClass {
    public function B3() {
        CoreListener.register("testNoti1", this.listenerB3Test);
    }

    private function listenerB3Test(params:Array):void {
        log("B3.listenerB2Test():  " + params["text"]);
        log("B3.listenerB2Test():  " + params["value"]);
    }
}
}

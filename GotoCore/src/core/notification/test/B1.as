
package core.notification.test
{
import core.base.CoreBaseClass;
import core.notification.CoreListener;

public class B1 extends CoreBaseClass
	{
		public function B1()
		{
			CoreListener.register("testNoti1",this.listenerB1Test);
		}

		private function listenerB1Test(params:Array):void
		{
			log("B1.listenerB1Test():  " + params["text"]);
			log("B1.listenerB1Test():  " + params["value"]);
		}
	}
}

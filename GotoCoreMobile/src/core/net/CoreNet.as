package core.net
{
import air.net.URLMonitor;

import flash.events.StatusEvent;
import flash.net.URLRequest;

public class CoreNet extends CoreBaseClass
	{
		private static var instance:CoreNet;
		private var monitor:URLMonitor;

		public function CoreNet()
		{
			this.monitor=new URLMonitor(new URLRequest('http://carnation.hu'));

			monitor.addEventListener(StatusEvent.STATUS, announceStatus);
			monitor.start();

		}

		private function announceStatus(e:StatusEvent):void
		{
			this.context.setParam('internet.available', monitor.available);
		}

		public static function getInstance():CoreNet
		{
			if (instance == null)
				instance=new CoreNet();
			return instance;
		}
	}
}

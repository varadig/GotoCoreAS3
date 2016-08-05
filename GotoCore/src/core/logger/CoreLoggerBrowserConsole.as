package core.logger
{
import core.logger.base.CoreBaseLogger;

import flash.external.ExternalInterface;

public class CoreLoggerBrowserConsole extends CoreBaseLogger
	{
		public function CoreLoggerBrowserConsole()
		{
			super();
		}

		override protected function addLogEntry(message:String):void
		{

			if (ExternalInterface.available)
				ExternalInterface.call("console.log", message);
		}
	}
}

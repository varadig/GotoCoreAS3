package core.communication.base
{
import core.base.CoreBaseClass;
import core.communication.interfaces.ICoreCommunication;

public class CoreBaseCommunication extends CoreBaseClass implements ICoreCommunication
	{
		public function CoreBaseCommunication()
		{
			super();
		}

		public function sendEmail(address:String):void
		{
		}

		public function sendSms(number:String):void
		{

		}

		public function phoneCall(phoneNumber:String):void
		{

		}
	}
}

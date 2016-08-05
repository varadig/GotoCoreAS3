package core.communication
{
import core.communication.base.CoreBaseCommunication;
import core.communication.utils.CoreCommunicationUtils;

import flash.net.URLRequest;
import flash.net.navigateToURL;

public class CoreCommunicationWeb extends CoreBaseCommunication
	{
		public function CoreCommunicationWeb()
		{
			super();
		}

		override public function sendEmail(address:String):void
		{
			if (!CoreCommunicationUtils.isValidEmail(address))
			{
				log("the email adress is not valide!!!");
				return;
			}
			navigateToURL(new URLRequest('mailto::' + address));
		}

		override public function sendSms(number:String):void
		{
			throw new Error('web platform can not send sms!');
		}

		override public function phoneCall(number:String):void
		{
			throw new Error('web platform can not phone call!');
		}
		{
			throw new Error('web platform can not send sms!');
		}
	}
}

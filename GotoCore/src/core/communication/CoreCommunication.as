package core.communication
{
import core.base.CoreBaseClass;
import core.communication.base.CoreBaseCommunication;

public class CoreCommunication extends CoreBaseClass
	{
		private static var instance:CoreCommunication;
		private var platform:CoreBaseCommunication;

		public static const SEND_EMAIL:String = 'send.email';
		public static const SEND_SMS:String = 'send.sms';
		public static const PHONE_CALL:String = 'send.sms';

		public static function getInstance(platform:CoreBaseCommunication):CoreCommunication
		{
			if (instance == null)
				instance=new CoreCommunication(platform);
			return instance;
		}

		public function CoreCommunication(platform:CoreBaseCommunication)
		{
			this.platform=platform;
			this.sc.registerService(SEND_EMAIL, this.serviceSendEmail);
			this.sc.registerService(SEND_SMS, this.serviceSendSms);
			this.sc.registerService(PHONE_CALL, this.servicePhoneCall);
			this.init();
		}


		private function serviceSendSms(params:Array):void
		{
			this.platform.sendSms(params.number);
		}

		private function serviceSendEmail(params:Array):void
		{
			this.platform.sendEmail(params.address);
		}

		private function servicePhoneCall(params:Array):void
		{
			this.platform.phoneCall(params.phoneNumber);
		}

		private function init():void
		{
			// TODO Auto Generated method stub

		}
	}
}



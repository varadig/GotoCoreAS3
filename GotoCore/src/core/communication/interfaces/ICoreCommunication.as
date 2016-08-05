package core.communication.interfaces
{

	public interface ICoreCommunication
	{
		function sendEmail(address:String):void
		function sendSms(phoneNumber:String):void
		function phoneCall(phoneNumber:String):void
	}
}

package core.mobile
{
import core.base.CoreBaseClass;

import pl.randori.air.nativeextensions.ios.APNSExtension;
import pl.randori.air.nativeextensions.ios.APNSExtensionEvent;

public class CoreiOSNativePushNotification extends CoreBaseClass
	{
		private var apnServiceExtension:APNSExtension;

		public function CoreiOSNativePushNotification()
		{
			this.init();
			this.sc.registerService('register.for.remote.notification', this.seriviceRegisterForRemoteNotification)
		}

		private function seriviceRegisterForRemoteNotification(params:Array):void
		{
			apnServiceExtension.registerForRemoteNotifications();
		}

		private function init():void
		{
			apnServiceExtension=new APNSExtension();
			apnServiceExtension.addEventListener(APNSExtensionEvent.APN_SERVICE_EVENT, onRemoteNotificationEvent);
		}

		protected function onRemoteNotificationEvent(event:APNSExtensionEvent):void
		{
			//infoArea.text+='\nReceived event: ' + e.eventInfo;
		}
	}
}

package core.net {
import air.net.URLMonitor;

import core.base.CoreBaseClass;
import core.notification.CoreNotification;

import flash.events.StatusEvent;
import flash.net.URLRequest;

public class CoreNet extends CoreBaseClass {
	/*SERVICES*/
	private static var instance:CoreNet;

	/**/
	/*NOTIFICATIONS*/
	public static const TEST:String = "core.network.test";
	public static const START:String = "core.network.start";
	public static const STOP:String = "core.network.stop";
	/*PARAMS*/
	public static const NET_AVAILABLE:String = "nore.net.net.available";
	public static const POLLING_INTERVAL:String = "core.net.polling.interval";
	public static const IS_AVAILABLE:String = "core.net.is.available";

	public function CoreNet(testUrl:String) {
		if (!regex.test(testUrl))
			throw new Error("The testUrl in CoreNet is not valid, please pass a valid url.");

		this.sc.registerService(TEST, this.serviceTest);
		this.sc.registerService(START, this.serviceStart);
		this.sc.registerService(STOP, this.serviceStop);


		this.monitor = new URLMonitor(new URLRequest(testUrl));
		monitor.addEventListener(StatusEvent.STATUS, announceStatus);


	}

	public static function getInstance(testUrl:String):CoreNet {
		if (instance == null)
			instance = new CoreNet(testUrl);
		return instance;
	}

	private var monitor:URLMonitor;
	private var regex:RegExp = /^http(s)?:\/\/((\d+\.\d+\.\d+\.\d+)|(([\w-]+\.)+([a-z,A-Z][\w-]*)))(:[1-9][0-9]*)?(\/([\w-.\/:%+@&=]+[\w- .\/?:%+@&=]*)?)?(#(.*))?$/i;

	private function get netAvailableNotification():CoreNotification {
		return this.sc.getService(CoreNotification.CREATE_NOTIFICATION).addParam(CoreNotification.NAME, NET_AVAILABLE).execute();
	}

	private function serviceTest(params:Array):void {
		if (!this.monitor.running) {

			this.monitor.pollInterval = (params[POLLING_INTERVAL]) ? params[POLLING_INTERVAL] : 1000;
			this.monitor.start();
			this.monitor.stop();
		}
	}

	private function serviceStop(params:Array):void {
		if (this.monitor.running)
			this.monitor.stop();
	}

	private function serviceStart(params:Array):void {
		if (this.monitor.running)
			this.monitor.stop();

		this.monitor.pollInterval = (params[POLLING_INTERVAL]) ? params[POLLING_INTERVAL] : 1000;
		this.monitor.start();
	}

	private function announceStatus(e:StatusEvent):void {
		log("CoreNet.announceStatus(e)");
		var notification:CoreNotification = this.netAvailableNotification;
		notification.setParam(IS_AVAILABLE, monitor.available);
		notification.send();
	}
}
}

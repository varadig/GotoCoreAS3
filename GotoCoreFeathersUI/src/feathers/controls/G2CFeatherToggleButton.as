/**
 * Created by varadig on 05/11/14.
 */
package feathers.controls {
import core.base.CoreBaseClassFactory;
import core.base.CoreCallback;
import core.context.CoreContext;
import core.notification.CoreNotification;
import core.service.CoreServiceContainer;

import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;

public class G2CFeatherToggleButton extends ToggleButton {
	public static const HOVER:String = TouchPhase.HOVER;
	public static const BEGAN:String = TouchPhase.BEGAN;
	public static const ENDED:String = TouchPhase.ENDED;
	public static const MOVED:String = TouchPhase.MOVED;
	public static const STATIONARY:String = TouchPhase.STATIONARY;
	public var sc:CoreServiceContainer;

	public var context:CoreContext;


	public var callbacks:Array = [];


	public function G2CFeatherToggleButton() {

		CoreBaseClassFactory.construct(this);
		this.addEventListener(TouchEvent.TOUCH, this.touchHandler)
	}

	public function serviceAddCallback(params:Array):void {
		CoreBaseClassFactory.serviceAddCallback(this, params);
	}

	public function serviceAddCallbacks(params:Array):void {
		CoreBaseClassFactory.serviceAddCallbacks(this, params);
	}

	protected function createCallBack(group:String):CoreCallback {
		return CoreBaseClassFactory.createCallBack(this, group);
	}

	protected function log(message:Object):void {
		CoreBaseClassFactory.log(this, message);
	}

	protected function touchHandler(event:TouchEvent):void {
		var touch:Touch = event.getTouch(this);
		if (!touch)
			return;
		this.createCallBack(touch.phase);
	}
	protected function createNotificaionByName(name:String):CoreNotification {
		return this.sc.getService(CoreNotification.CREATE_NOTIFICATION)
				.addParam(CoreNotification.NAME, name)
				.execute();
	}
}
}



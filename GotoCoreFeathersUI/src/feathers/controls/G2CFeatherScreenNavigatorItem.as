/**
 * Created by varadig on 19/10/14.
 */
package feathers.controls {
import core.base.CoreBaseClassFactory;
import core.base.CoreCallback;
import core.context.CoreContext;
import core.notification.CoreNotification;
import core.service.CoreServiceContainer;

public class G2CFeatherScreenNavigatorItem extends ScreenNavigatorItem {
	protected static var nameIndex:int = 0;

	public function G2CFeatherScreenNavigatorItem(screen:Object = null, events:Object = null, properties:Object = null) {
		super(screen, events, properties);
		this._name = this.generateName();
		CoreBaseClassFactory.construct(this);
	}

	public var sc:CoreServiceContainer;

	public var context:CoreContext;

	public var callbacks:Array = [];
	protected var namePrefix:String = "gui.screen.navigator.item";
	private var _name:String;

	public function get name():String {
		return this._name as String;
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

	private function generateName():String {
		return (this.namePrefix + G2CFeatherScreenNavigatorItem.nameIndex++) as String;
	}
	protected function createNotificaionByName(name:String):CoreNotification {
		return this.sc.getService(CoreNotification.CREATE_NOTIFICATION)
				.addParam(CoreNotification.NAME, name)
				.execute();
	}
}
}



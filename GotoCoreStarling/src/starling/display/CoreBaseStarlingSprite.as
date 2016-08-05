/**
 * Created with IntelliJ IDEA.
 * User: varadig
 * Date: 2013.12.10.
 * Time: 12:54
 * To change this template use File | Settings | File Templates.
 */
package starling.display {
import core.base.CoreBaseClassFactory;
import core.base.CoreCallback;
import core.context.CoreContext;
import core.service.CoreServiceContainer;

public class CoreBaseStarlingSprite extends Sprite {
	public var sc:CoreServiceContainer;

	public var context:CoreContext;

	public var callbacks:Array = [];
	protected static var nameIndex:int = 0;
	protected var namePrefix:String = "core.base.starling.sprite";

	public function CoreBaseStarlingSprite() {
		this.name = this.generateName();
		CoreBaseClassFactory.construct(this);
	}


	public function serviceAddCallback(params:Array):void {
		CoreBaseClassFactory.serviceAddCallback(this, params);
	}

	public function serviceAddCallbacks(params:Array):void {
		CoreBaseClassFactory.serviceAddCallbacks(this, params);
	}
	public function serviceRemoveCallback(params:Array):void {
		CoreBaseClassFactory.serviceRemoveCallback(this, params);
	}
	public function serviceRemoveCallbacks(params:Array):void {
		CoreBaseClassFactory.serviceRemoveCallbacks(this, params);
	}



	protected function createCallBack(group:String):CoreCallback {
		return CoreBaseClassFactory.createCallBack(this, group);
	}


	protected function log(message:Object):void {
		CoreBaseClassFactory.log(this, message);
	}

	private function generateName():String {
		return (this.namePrefix + CoreBaseStarlingSprite.nameIndex++) as String;
	}
}
}



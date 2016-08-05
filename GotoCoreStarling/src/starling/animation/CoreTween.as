/**
 * Created by varadig on 1/13/15.
 */
package starling.animation {
import core.base.CoreBaseClassFactory;
import core.base.CoreCallback;
import core.context.CoreContext;
import core.service.CoreServiceContainer;

public class CoreTween extends Tween {
    public var sc:CoreServiceContainer;

    public var context:CoreContext;

    public var callbacks:Array = [];
    private var _name:String;

    public function get name():String {
        return this._name as String;
    }

    protected static var nameIndex:int = 0;
    protected var namePrefix:String = "core.tween";

    public function CoreTween(target:Object, time:Number, transition:Object = "linear"):* {
        CoreBaseClassFactory.construct(this);
        this._name = this.generateName();
        super(target, time, transition);

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
        return (this.namePrefix + CoreTween.nameIndex++) as String;
    }
}
}



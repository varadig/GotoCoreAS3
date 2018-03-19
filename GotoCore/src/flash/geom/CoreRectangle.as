/**
 * Created by varadig on 30/11/14.
 */
package flash.geom {
import core.base.CoreBaseClassFactory;
import core.base.CoreCallback;
import core.context.CoreContext;
import core.service.CoreServiceContainer;

public class CoreRectangle extends Rectangle {
    protected static var nameIndex:int = 0;

    public var sc:CoreServiceContainer;
    public var context:CoreContext;
    public var callbacks:Array = [];
    protected var namePrefix:String = "object";

    private var _name:String;

    public function CoreRectangle(x:Number = 0, y:Number = 0, width:Number = 0, height:Number = 0) {
        super(x, y, width, height);
        this._name = this.generateName();

        CoreBaseClassFactory.construct(this);
    }

    public function get name():String {
        return this._name as String;
    }

    public function serviceAddCallback(params:Array):void {
        CoreBaseClassFactory.serviceAddCallback(this, params);
    }

    public function serviceAddCallbacks(params:Array):void {
        CoreBaseClassFactory.serviceAddCallbacks(this, params);
    }

    public function createCallBack(group:String):CoreCallback {
        return CoreBaseClassFactory.createCallBack(this, group);
    }

    public function serviceRemoveCallback(params:Array):void {
        CoreBaseClassFactory.serviceRemoveCallback(this, params);
    }

    public function serviceRemoveCallbacks(params:Array):void {
        CoreBaseClassFactory.serviceRemoveCallbacks(this, params);
    }


    protected function log(...message):void {
        CoreBaseClassFactory.log(this, message);
    }

    private function generateName():String {
        return (this.namePrefix + CoreRectangle.nameIndex++) as String;
    }

}
}



/**
 * Created with IntelliJ IDEA.
 * User: varadig
 * Date: 2013.11.11.
 * Time: 14:30
 * To change this template use File | Settings | File Templates.
 */
package engine.starlingpunk {
import com.saia.starlingPunk.SPCamera;

import core.base.CoreBaseClassFactory;
import core.base.CoreCallback;
import core.context.CoreContext;
import core.service.CoreServiceContainer;

public class CoreSPCamera extends SPCamera {
    public var sc:CoreServiceContainer;

    public var context:CoreContext;

    public var callbacks:Array = new Array();

    protected static var nameIndex:int = 0;

    protected var namePrefix:String = "StarlingPunkCamera";

    private var _name:String;


    public function CoreSPCamera() {
        super();
        this._name = this.generateName();

        CoreBaseClassFactory.construct(this);
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

    public function get name():String {
        return this._name as String;
    }

    private function generateName():String {
        return (this.namePrefix + CoreSPCamera.nameIndex++) as String;
    }

}
}

/**
 * Created by varadig on 31/10/14.
 */
package core.base {
import core.context.CoreContext;
import core.service.CoreServiceContainer;

import flash.events.EventDispatcher;

public class CoreBaseEventDispatcher extends EventDispatcher {
    protected static var nameIndex:int = 0;

    public var sc:CoreServiceContainer;

    public var context:CoreContext;

    public var callbacks:Array = [];
    protected var namePrefix:String = "core.base.event.dispatcher";

    private var _name:String;

    public function get name():String {
        return this._name as String;
    }

    public function CoreBaseEventDispatcher() {
        super(null);
        this._name = this.generateName();

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
        return (this.namePrefix + CoreBaseEventDispatcher.nameIndex++) as String;
    }
}
}



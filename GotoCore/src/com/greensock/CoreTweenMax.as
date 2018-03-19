/**
 * Created by varadig on 28/11/14.
 */
package com.greensock {
import core.base.CoreBaseClassFactory;
import core.base.CoreCallback;
import core.context.CoreContext;
import core.service.CoreServiceContainer;

public class CoreTweenMax extends TweenMax {
    public var sc:CoreServiceContainer;
    public var context:CoreContext;
    public var callbacks:Array = [];
    private var _name:String;
    protected static var nameIndex:int = 0;
    protected var namePrefix:String = "core.tween.max";

    public function CoreTweenMax(target:Object, duration:Number, vars:Object) {
        this._name = this.generateName();
        CoreBaseClassFactory.construct(this);
        super(target, duration, vars)


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

    protected function log(...message):void {
        CoreBaseClassFactory.log(this, message);
    }

    private function generateName():String {
        return (this.namePrefix + CoreTweenMax.nameIndex++) as String;
    }


}
}


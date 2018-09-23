/**
 * Created with IntelliJ IDEA.
 * User: varadig
 * Date: 2013.11.11.
 * Time: 14:26
 * To change this template use File | Settings | File Templates.
 */
package engine.starlingpunk {
import com.saia.starlingPunk.SPEngine;

import core.base.CoreBaseClassFactory;
import core.base.CoreCallback;
import core.context.CoreContext;
import core.service.CoreServiceContainer;

public class CoreSPEngine extends SPEngine {
    public var sc:CoreServiceContainer;

    public var context:CoreContext;


    public var callbacks:Array = new Array();


    public function CoreSPEngine() {
        super();
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
}
}



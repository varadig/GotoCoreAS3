/**
 * Created by varadig on 10/31/15.
 */
package plugins.mxml.feathers {
import core.base.CoreBaseClassFactory;
import core.base.CoreCallback;
import core.context.CoreContext;
import core.service.CoreServiceContainer;

import feathers.core.StackScreenNavigatorApplication;

public class GuiStackScreenNavigatorApplication extends StackScreenNavigatorApplication {
    public var sc:CoreServiceContainer;

    public var context:CoreContext;


    public var callbacks:Array = [];


    public function GuiStackScreenNavigatorApplication() {
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

    override protected function initialize():void {
        super.initialize();
        this.initializeCoreModules();
        this.initializeModules();
        this.initializeApplication();
    }

    protected function initializeCoreModules():void {
    }

    protected function initializeModules():void {
    }

    protected function initializeApplication():void {
    }

    protected function startApplication(params:Array=null):void {
    }
}
}

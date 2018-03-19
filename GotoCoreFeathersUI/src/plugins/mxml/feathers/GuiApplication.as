/**
 * Created by varadig on 10/31/15.
 */
package plugins.mxml.feathers {
import core.base.CoreBaseClassFactory;
import core.base.CoreCallback;
import core.context.CoreContext;
import core.logger.CoreLoggerBrowserConsole;
import core.logger.CoreLoggerDebug;
import core.logger.base.CoreBaseLogger;
import core.service.CoreServiceContainer;
import core.utils.CoreUtils;

import feathers.core.Application;
import feathers.skins.IStyleProvider;

import flash.system.Capabilities;

public class GuiApplication extends Application {
    public namespace gui_core_feathersui = "http://www.go2design.hu/gui/core/feathersui";
    public var sc:CoreServiceContainer;
    public var context:CoreContext;
    public var callbacks:Array = [];
    public static var globalStyleProvider:IStyleProvider;


    protected var loggers:Vector.<CoreBaseLogger>;


    override protected function initialize():void {
        super.initialize();
        this.loggers = new <CoreBaseLogger>[];
        if (Capabilities.isDebugger) {
            this.loggers.push(new CoreLoggerDebug());
            if (CoreUtils.isBrowser)
                this.loggers.push(new CoreLoggerBrowserConsole());
        }
    }

    public function GuiApplication() {
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
}
}

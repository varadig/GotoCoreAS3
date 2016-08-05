package core.base {
import core.base.interfaces.IExecutable;
import core.context.CoreContext;
import core.logger.CoreLogger;
import core.service.CoreServiceContainer;

public class CoreBaseClassFactory {
    public static function construct(_instance:*):void {
        _instance.sc = CoreServiceContainer.getInstance();
        _instance.context = CoreContext.getInstance();
        _instance.sc.registerService(_instance.name + CoreCallback.ADD_CALLBACK, _instance.serviceAddCallback);
        _instance.sc.registerService(_instance.name + CoreCallback.ADD_CALLBACKS, _instance.serviceAddCallbacks);
        _instance.sc.registerService(_instance.name + CoreCallback.REMOVE_CALLBACK, _instance.serviceRemoveCallback);
        _instance.sc.registerService(_instance.name + CoreCallback.REMOVE_CALLBACKS, _instance.serviceRemoveCallbacks);
    }

    public static function serviceAddCallback(_instance:*, params:Array):void {
        var group:String = params[CoreCallback.GROUP];
        var callback:IExecutable = params[CoreCallback.CALLBACK];

        CoreBaseClassFactory.addCallback(_instance, group, callback);
    }

    public static function serviceRemoveCallback(_instance:*, params:Array):void {
        var group:String = params[CoreCallback.GROUP];
        var callback:IExecutable = params[CoreCallback.CALLBACK];
        CoreBaseClassFactory.removeCallback(_instance, group, callback);
    }

    public static function serviceAddCallbacks(_instance:*, params:Array):void {
        var group:String = params[CoreCallback.GROUP];
        var callbacks:Vector.<IExecutable> = params[CoreCallback.CALLBACKS];

        for each (var callback:IExecutable in callbacks)
            CoreBaseClassFactory.addCallback(_instance, group, callback);
    }

    public static function serviceRemoveCallbacks(_instance:*, params:Array):void {
        var group:String = params[CoreCallback.GROUP];
        _instance.callbacks[group] = null;
    }


    public static function createCallBack(_instance:*, group:String):CoreCallback {
        return new CoreCallback(group, _instance.callbacks[group]);
    }

    public static function addCallback(_instance:*, group:String, callback:IExecutable):void {
        if (_instance.callbacks[group] == null)
            _instance.callbacks[group] = [];

        _instance.callbacks[group].push(callback);
    }

    public static function removeCallback(_instance:*, group:String, callback:IExecutable):void {
        if (_instance.callbacks[group] == null)
            return;
        var index:int = Array(_instance.callbacks).indexOf(callback);
        Array(_instance.callbacks).splice(index, 1)
    }

    public static function log(_instance:*, message:Object):void {
        if (_instance.sc.hasService(CoreLogger.LOGGER_LOG)) {
            _instance.sc.getService(CoreLogger.LOGGER_LOG).addParam(CoreLogger.MESSAGE, message).execute();
        }
    }
}
}



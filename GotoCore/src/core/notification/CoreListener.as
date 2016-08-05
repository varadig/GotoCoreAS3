﻿package core.notification {
import core.base.CoreBaseFunctionWrapper;
import core.service.CoreServiceContainer;

public class CoreListener extends CoreBaseFunctionWrapper {

    internal static const REGISTER_LISTENER:String = "core.listener.register.listener";
    internal static const REGISTER_LISTENERS:String = "core.listener.register.listeners";
    internal static const REMOVE_LISTENERS_BY_NAME:String = "core.listener.remove.listeners.by.name";
    internal static const REMOVE_LISTENER:String = "core.listener.remove.listener";
    internal static const REMOVE_LISTENERS:String = "core.listener.remove.listeners";
    internal static const REFERENCE:String = "reference";
    internal static const LISTENER:String = "listener";
    internal static const NAME:String = "name";
    public static const BASE_NAME:String = "base.name";

    public function CoreListener(name:String, reference:Function):void {
        super(name, reference);
    }


    override public function notify():void {
        this.call();
    }

    public static function register(name:String, callback:Function):void {
        var listener:CoreListener = new CoreListener(name, callback);
        CoreServiceContainer.getInstance().getService(CoreListener.REGISTER_LISTENER)
                .addParam(CoreListener.LISTENER, listener)
                .addParam(CoreListener.NAME, name)
                .execute();
    }

    public static function registers(names:Vector.<String>, callback:Function):void {
        for each(var name:String in names)
            CoreListener.register(name, callback);
    }

    public static function unregister(name:String, callback:Function):void {
        CoreServiceContainer.getInstance().getService(CoreListener.REMOVE_LISTENER)
                .addParam(CoreListener.NAME, name)
                .addParam(CoreListener.REFERENCE, callback)
                .execute();
    }
}
}



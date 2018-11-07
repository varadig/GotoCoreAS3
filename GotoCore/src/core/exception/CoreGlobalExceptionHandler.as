package core.exception {
import core.base.CoreBaseClass;
import core.logger.interfaces.IGlobalExceptionHandler;

import flash.display.LoaderInfo;
import flash.events.UncaughtErrorEvent;

import mx.managers.ISystemManager;

[Mixin]
[DefaultProperty("handlerActions")]
public class CoreGlobalExceptionHandler extends CoreBaseClass {
    private static var loaderInfo:LoaderInfo;

    [ArrayElementType("core.logger.interfaces.IGlobalExceptionHandler")]
    public var handlerActions:Array;

    public var preventDefault:Boolean;

    public static function init(sm:Object):void
    {
        loaderInfo = sm.loaderInfo;
    }

    public function CoreGlobalExceptionHandler()
    {
        loaderInfo.uncaughtErrorEvents.addEventListener(UncaughtErrorEvent.UNCAUGHT_ERROR,
                uncaughtErrorHandler);
    }

    private function uncaughtErrorHandler(event:UncaughtErrorEvent):void
    {
        for each (var action:IGlobalExceptionHandler in handlerActions)
        {
            action.handle(event.error);
        }

        if (preventDefault == true)
        {
            event.preventDefault();
        }
    }
}
}
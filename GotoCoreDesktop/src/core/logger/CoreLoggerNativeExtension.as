/**
 * Created by varadig on 7/25/15.
 */
package core.logger {
import core.logger.base.CoreBaseLogger;

import flash.events.StatusEvent;
import flash.external.ExtensionContext;

public class CoreLoggerNativeExtension extends CoreBaseLogger {
    private var ctx:ExtensionContext;

    public function CoreLoggerNativeExtension(contextID:String) {
        super();
        this.ctx = ExtensionContext.createExtensionContext(contextID, null);
        this.ctx.addEventListener(StatusEvent.STATUS, this.onStatusEvent);
    }

    private function onStatusEvent(event:StatusEvent):void {
        if (event.code == "log")
            trace(event);
    }
}
}

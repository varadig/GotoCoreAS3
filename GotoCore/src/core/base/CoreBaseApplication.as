/**
 * Created by varadig on 1/27/16.
 */
package core.base {
import core.logger.CoreLoggerBrowserConsole;
import core.logger.CoreLoggerDebug;
import core.logger.base.CoreBaseLogger;
import core.utils.CoreUtils;

import flash.events.Event;
import flash.system.Capabilities;


public class CoreBaseApplication extends CoreBaseSprite {
    protected var loggers:Vector.<CoreBaseLogger>;

    public function CoreBaseApplication() {
        super();
        this.addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
    }

    private function addedToStageHandler(event:Event):void {
        this.removeEventListener(Event.ADDED_TO_STAGE, this.addedToStageHandler);
        this.initialize();
    }

    protected function initialize():void {
        this.loggers = new <CoreBaseLogger>[];
        this.context.stage = this.stage;
        if (Capabilities.isDebugger) {
            this.loggers.push(new CoreLoggerDebug());
            if (CoreUtils.isBrowser)
                this.loggers.push(new CoreLoggerBrowserConsole());
        }
    }
}
}

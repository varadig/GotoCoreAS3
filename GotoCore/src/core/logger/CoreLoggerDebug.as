package core.logger {
import core.logger.base.CoreBaseLogger;

/**
 * @author varadig
 */
public class CoreLoggerDebug extends CoreBaseLogger {
    override protected function addLogEntry(message:String):void {
        var reg:RegExp = /<p>(.*?)<\/p>/gi;

        var raw:String = createEntryFrom(message).replace(reg, "$1");

        trace(raw);
    }
}
}

/**
 * Created by varadig on 1/19/15.
 */
package core.utils {
import core.base.CoreBaseClass;
import core.logger.CoreLogger;
import core.service.CoreServiceContainer;

public class Log extends CoreBaseClass {
    public function Log():void {
    }

    public static function add(...message):void {
        if (!CoreServiceContainer.getInstance().hasService(CoreLogger.LOGGER_LOG))
            return;
        CoreServiceContainer
                .getInstance()
                .getService(CoreLogger.LOGGER_LOG)
                .addParam(CoreLogger.MESSAGE, message)
                .execute();
    }

    public static function error(...message):void {
        Log.add("<font color='#FF0000'>" + message + "</font>");
    }

    public static function major(...message):void {
        Log.add("<font color='#000FFFF'>" + message + "</font>");
    }
}
}

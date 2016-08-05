package core.logger {
import core.base.CoreBaseClass;
import core.logger.base.CoreBaseLogger;

public class CoreLogger extends CoreBaseClass {
    public static const LOGGER_LOG:String = "logger.log";
    public static const MESSAGE:String = "message";

    private var loggers:Vector.<CoreBaseLogger>;
    private static var instance:CoreLogger;

    public static function getInstance(loggers:Vector.<CoreBaseLogger>):CoreLogger {
        if (instance == null)
            instance = new CoreLogger(loggers);
        return instance;
    }

    public function CoreLogger(loggers:Vector.<CoreBaseLogger>):void {
        this.loggers = loggers;
        this.sc.registerService(LOGGER_LOG, this.serviceLog);
    }

    private function serviceLog(params:Array):void {
        for each(var logger:CoreBaseLogger in  this.loggers)
            logger.addLog(params[MESSAGE]);
    }
}
}

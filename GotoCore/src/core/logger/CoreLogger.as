package core.logger {
import core.base.CoreBaseClass;
import core.logger.base.CoreBaseLogger;

public class CoreLogger extends CoreBaseClass {
    public static const LOGGER_LOG:String = "logger.log";
    public static const MESSAGE:String = "message";

    private static var _loggers:Vector.<CoreBaseLogger>;
    private static var instance:CoreLogger;

    public static function getInstance(loggers:Vector.<CoreBaseLogger>=null):CoreLogger {
        if (instance == null)
            instance = new CoreLogger(loggers);
        return instance;
    }


    public static function addLogger(logger:CoreBaseLogger):void {
        CoreLogger.getInstance();
        if (_loggers == null)
            _loggers = new Vector.<CoreBaseLogger>();
        _loggers.push(logger);
    }

    public function CoreLogger(loggers:Vector.<CoreBaseLogger>):void {
        _loggers = loggers;
        this.sc.registerService(LOGGER_LOG, this.serviceLog);
    }

    private function serviceLog(params:Array):void {
        for each(var logger:CoreBaseLogger in  _loggers)
            logger.addLog(params[MESSAGE]);
    }
}
}

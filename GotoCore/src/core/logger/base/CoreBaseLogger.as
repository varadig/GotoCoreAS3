package core.logger.base {
import core.base.CoreBaseClass;
import core.logger.interfaces.ICoreLogger;
import core.utils.CoreUtils;

public class CoreBaseLogger extends CoreBaseClass implements ICoreLogger {
    protected var br:String = "\n";

    public function addLog(...messages):void {
        for each(var message:* in messages)
            this.addLogEntry(String(message));
    }

    protected function addLogEntry(message:String):void {
    }


    protected function createEntryFrom(message:String):String {
        return (CoreUtils.timeStamp + " ----> " + message + this.br);
    }
}
}

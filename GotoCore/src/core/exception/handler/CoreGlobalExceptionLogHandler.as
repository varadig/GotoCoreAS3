package core.exception.handler {
import core.base.CoreBaseClass;
import core.logger.interfaces.IGlobalExceptionHandler;

import mx.utils.StringUtil;

public class CoreGlobalExceptionLogHandler extends CoreBaseClass implements IGlobalExceptionHandler {

    public function handle(error:Object):void {
        if (error is Error) {
            var errorObj:Error = error as Error;

            this.log(StringUtil.substitute("{0}. {1}\n {2}", [
                errorObj.errorID,
                errorObj.message,
                errorObj.getStackTrace()]));
        }
    }
}
}

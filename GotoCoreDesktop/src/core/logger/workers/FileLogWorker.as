/**
 * Created by varadig on 1/29/16.
 */
package core.logger.workers {
import core.base.CoreBaseClass;

import flash.filesystem.File;

public class FileLogWorker extends CoreBaseClass implements ILogWorker {
    private var _file:File;

    public function FileLogWorker(file:File) {
        super();
        this._file = file;
    }

    public function get file():File {
        return _file;
    }
}
}

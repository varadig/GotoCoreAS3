/**
 * Created by varadig on 1/29/16.
 */
package core.logger.workers {
import core.base.CoreBaseClass;

public class ServerLogWorker extends CoreBaseClass implements ILogWorker {
    private var _url:String;
    private var _filename:String;

    public function ServerLogWorker(url:String, filename:String) {
        super();
        this._filename = filename;
        this._url = url;
    }

    public function get url():String {
        return _url;
    }

    public function get filename():String {
        return _filename;
    }
}
}

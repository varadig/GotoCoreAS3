/**
 * Created with IntelliJ IDEA.
 * User: varadig
 * Date: 2013.10.15.
 * Time: 12:45
 * To change this template use File | Settings | File Templates.
 */
package core.logger {
import core.logger.base.CoreBaseLogger;
import core.logger.workers.ILogWorker;
import core.logger.workers.ServerLogWorker;

import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.net.URLLoader;
import flash.net.URLLoaderDataFormat;
import flash.net.URLRequest;
import flash.net.URLRequestMethod;
import flash.net.URLVariables;

public class CoreLoggerServer extends CoreBaseLogger {
    public static const URLS:String = "server.log.urls";
    public static const FILENAME:String = "server.log.filename";
    private var logWorker:ServerLogWorker;

    public function CoreLoggerServer(logWorker:ILogWorker) {
        this.logWorker = logWorker as ServerLogWorker;
        trace("CoreLoggerServer initialize");
        this.init();
    }

    private var requests:Vector.<URLRequest>;
//    private var loaders:Vector.<URLLoader>;
//    private var variables:URLVariables;

    override protected function addLogEntry(message:String):void {
        var urlVariables:URLVariables = new URLVariables();
        var loader:URLLoader;
        urlVariables.log = this.createEntryFrom(message);
        urlVariables.filename = this.logWorker.filename;

        for each(var request in this.requests) {
            request.data = urlVariables;
            loader = new URLLoader();
            loader.dataFormat = URLLoaderDataFormat.TEXT;
            loader.load(request);
        }
    }

    private function init():void {
//        this.variables = new URLVariables();
        this.requests = new Vector.<URLRequest>();
//        this.loaders = new Vector.<URLLoader>();

        var request:URLRequest = new URLRequest(this.logWorker.url);
        request.method = URLRequestMethod.POST;

//        var loader:URLLoader = new URLLoader(request);
//        loader.addEventListener(IOErrorEvent.IO_ERROR, handleEvents);
//        loader.addEventListener(Event.COMPLETE, handleEvents);
//        loader.dataFormat = URLLoaderDataFormat.TEXT;
        this.requests.push(request);
//        this.loaders.push(loader);
    }

    private function handleEvents(event:Event):void {
        switch (event.type) {
            case IOErrorEvent.IO_ERROR:
                trace(event);
                break;
            case Event.COMPLETE:
                event.target.removeEventListener(Event.COMPLETE, this.handleEvents);
                trace(URLLoader(event.target) + " complete!");
                break;
        }
    }
}
}

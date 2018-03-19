/**
 * Created by varadig on 12/9/14.
 */
package core.asset {
import core.base.CoreBaseClassFactory;
import core.base.CoreCallback;
import core.context.CoreContext;
import core.service.CoreServiceContainer;

import flash.display.Loader;
import flash.display.LoaderInfo;
import flash.events.HTTPStatusEvent;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.events.SecurityErrorEvent;
import flash.media.Sound;
import flash.net.URLLoader;
import flash.net.URLLoaderDataFormat;
import flash.net.URLRequest;
import flash.system.ImageDecodingPolicy;
import flash.system.LoaderContext;
import flash.text.Font;
import flash.utils.ByteArray;
import flash.utils.Dictionary;
import flash.utils.setTimeout;

import starling.events.Event;
import starling.utils.AssetManager;
import starling.utils.SystemUtil;

public class CoreAssetManager extends AssetManager {
    private static const HTTP_RESPONSE_STATUS:String = "httpResponseStatus";

    private var mFonts:Dictionary;
    public var sc:CoreServiceContainer;

    public var context:CoreContext;

    public var callbacks:Array = [];
    protected static var nameIndex:int = 0;
    protected var namePrefix:String = "core.asset.manager";

    private var _name:String;

    public function get name():String {
        return this._name as String;
    }

    public function CoreAssetManager(scaleFactor:Number = 1, useMipmaps:Boolean = false) {
        this._name = this.generateName();

        super(scaleFactor, useMipmaps);
        this.mFonts = new Dictionary();
        CoreBaseClassFactory.construct(this);
    }

    private function generateName():String {
        return (this.namePrefix + CoreAssetManager.nameIndex++) as String;
    }

    public function getFont(name:String):Font {
        if (name in mFonts)
            return mFonts[name];
        return null;
    }

    override protected function log(message:String):void {
//		super.log(message);
        CoreBaseClassFactory.log(this, message);

    }

    override protected function loadRawAsset(rawAsset:Object, onProgress:Function, onComplete:Function):void {
        var extension:String = null;
        var loaderInfo:LoaderInfo = null;
        var urlLoader:URLLoader = null;
        var url:String = null;

        if (rawAsset is Class) {
            setTimeout(complete, 1, new rawAsset());
        }
        else if (rawAsset is String) {
            url = rawAsset as String;
            extension = getExtensionFromUrl(url);

            urlLoader = new URLLoader();
            urlLoader.dataFormat = URLLoaderDataFormat.BINARY;
            urlLoader.addEventListener(IOErrorEvent.IO_ERROR, onIoError);
            urlLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onSecurityError);
            urlLoader.addEventListener(HTTP_RESPONSE_STATUS, onHttpResponseStatus);
            urlLoader.addEventListener(ProgressEvent.PROGRESS, onLoadProgress);
            urlLoader.addEventListener(Event.COMPLETE, onUrlLoaderComplete);
            urlLoader.load(new URLRequest(url));
        }

        function onIoError(event:IOErrorEvent):void {
            log("IO error: " + event.text);
            dispatchEventWith(Event.IO_ERROR, false, url);
            complete(null);
        }

        function onSecurityError(event:SecurityErrorEvent):void {
            log("security error: " + event.text);
            dispatchEventWith(Event.SECURITY_ERROR, false, url);
            complete(null);
        }

        function onHttpResponseStatus(event:HTTPStatusEvent):void {
            if (extension == null) {
                var headers:Array = event["responseHeaders"];
                var contentType:String = getHttpHeader(headers, "Content-Type");

                if (contentType && /(audio|image)\//.exec(contentType))
                    extension = contentType.split("/").pop();
            }
        }

        function onLoadProgress(event:ProgressEvent):void {
            if (onProgress != null && event.bytesTotal > 0)
                onProgress(event.bytesLoaded / event.bytesTotal);
        }

        function onUrlLoaderComplete(event:Object):void {
            var bytes:ByteArray = transformData(urlLoader.data as ByteArray, url);
            var sound:Sound;

            if (extension)
                extension = extension.toLowerCase();

            switch (extension) {

                case "swt":

                    break;
                case "mpeg":
                case "mp3":
                    sound = new Sound();
                    sound.loadCompressedDataFromByteArray(bytes, bytes.length);
                    bytes.clear();
                    complete(sound);
                    break;
                case "jpg":
                case "jpeg":
                case "png":
                case "gif":
                    var loaderContext:LoaderContext = new LoaderContext(checkPolicyFile);
                    var loader:Loader = new Loader();
                    loaderContext.imageDecodingPolicy = ImageDecodingPolicy.ON_LOAD;
                    loaderInfo = loader.contentLoaderInfo;
                    loaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onIoError);
                    loaderInfo.addEventListener(Event.COMPLETE, onLoaderComplete);
                    loader.loadBytes(bytes, loaderContext);
                    break;

                case "ttf":
                case "otf":
                case "ttc":
                    var loaderContext:LoaderContext = new LoaderContext(checkPolicyFile);
                    var loader:Loader = new Loader();
                    loaderInfo = loader.contentLoaderInfo;
                    loaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onIoError);
                    loaderInfo.addEventListener(Event.COMPLETE, onLoaderComplete);
                    loader.loadBytes(bytes, loaderContext);
                    break;
                default: // any XML / JSON / binary data
                    complete(bytes);
                    break;
            }
        }

        function onLoaderComplete(event:Object):void {
            urlLoader.data.clear();
            complete(event.target.content);
        }

        function complete(asset:Object):void {
            // clean up event listeners

            if (urlLoader) {
                urlLoader.removeEventListener(IOErrorEvent.IO_ERROR, onIoError);
                urlLoader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, onSecurityError);
                urlLoader.removeEventListener(HTTP_RESPONSE_STATUS, onHttpResponseStatus);
                urlLoader.removeEventListener(ProgressEvent.PROGRESS, onLoadProgress);
                urlLoader.removeEventListener(Event.COMPLETE, onUrlLoaderComplete);
            }

            if (loaderInfo) {
                loaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, onIoError);
                loaderInfo.removeEventListener(Event.COMPLETE, onLoaderComplete);
            }

            // On mobile, it is not allowed / endorsed to make stage3D calls while the app
            // is in the background. Thus, we pause queue processing if that's the case.

            if (SystemUtil.isDesktop)
                onComplete(asset);
            else
                SystemUtil.executeWhenApplicationIsActive(onComplete, asset);
        }
    }

    private function getHttpHeader(headers:Array, headerName:String):String {
        if (headers) {
            for each (var header:Object in headers)
                if (header.name == headerName) return header.value;
        }
        return null;
    }

    public function serviceAddCallback(params:Array):void {
        CoreBaseClassFactory.serviceAddCallback(this, params);
    }

    public function serviceAddCallbacks(params:Array):void {
        CoreBaseClassFactory.serviceAddCallbacks(this, params);
    }

    public function serviceRemoveCallback(params:Array):void {
        CoreBaseClassFactory.serviceRemoveCallback(this, params);
    }

    public function serviceRemoveCallbacks(params:Array):void {
        CoreBaseClassFactory.serviceRemoveCallbacks(this, params);
    }


    protected function createCallBack(group:String):CoreCallback {
        return CoreBaseClassFactory.createCallBack(this, group);
    }


}
}

package plugins.as3
{
import core.base.CoreBaseClassFactory;
import core.base.CoreCallback;
import core.context.CoreContext;
import core.service.CoreServiceContainer;

import flash.net.URLLoader;
import flash.net.URLRequest;

/**
	 * @author varadig
	 */
	public class CoreURLLoader extends URLLoader
	{
		public var sc:CoreServiceContainer;

		public var context:CoreContext;
		protected static var nameIndex:int=0;

		protected var namePrefix:String="gui_http_service";

		private var _name:String;
		public var callbacks:Array=[];

		public function CoreURLLoader(request:URLRequest=null)
		{
			super(request);
			this._name=this.generateName();

			CoreBaseClassFactory.construct(this);
		}

		public function serviceAddCallback(params:Array):void
		{
			CoreBaseClassFactory.serviceAddCallback(this, params);
		}

		public function serviceAddCallbacks(params:Array):void
		{
			CoreBaseClassFactory.serviceAddCallbacks(this, params);
		}

		protected function createCallBack(group:String):CoreCallback
		{
			return CoreBaseClassFactory.createCallBack(this, group);
		}

		protected function log(message:Object):void
		{
			CoreBaseClassFactory.log(this, message);
		}

		public function get name():String
		{
			return this._name as String;
		}

		private function generateName():String
		{
			return (this.namePrefix + nameIndex++) as String;
		}
	}
}

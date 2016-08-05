package plugins.as3 {
import com.bealearts.collection.VectorList;

import core.base.CoreBaseClassFactory;
import core.base.CoreCallback;
import core.context.CoreContext;
import core.service.CoreServiceContainer;

/**
	 * @author varadig
	 */
	public class CoreVectorList extends VectorList {
				public var sc:CoreServiceContainer;

		public var context:CoreContext;
		public var callbacks:Array=[];
		
		
		public function CoreVectorList(source : Object = null) {
			super(source); 
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
	}
}

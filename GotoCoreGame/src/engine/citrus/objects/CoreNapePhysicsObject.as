/**
 * Created with IntelliJ IDEA.
 * User: varadig
 * Date: 2013.12.10.
 * Time: 13:28
 * To change this template use File | Settings | File Templates.
 */
package engine.citrus.objects
{
import citrus.objects.NapePhysicsObject;

import core.base.CoreBaseClassFactory;
import core.base.CoreCallback;
import core.context.CoreContext;
import core.service.CoreServiceContainer;

public class CoreNapePhysicsObject extends NapePhysicsObject
{

	public var sc:CoreServiceContainer;

	public var context:CoreContext;

	public var callbacks:Array = new Array();

	public function CoreNapePhysicsObject(name:String, params:Object = null)
	{
		super(name, params);
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



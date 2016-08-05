package core.base
{
import core.base.interfaces.IExecutable;

public class CoreBaseParameterHolder implements IExecutable
{
	protected var params:Array = [];

	public function addParam(name:String, value:Object):IExecutable
	{
		if (this.params[ name ] == null)
			this.params[ name ] = value;

		return this;
	}

	public function setParam(name:String, value:Object):IExecutable
	{
		this.params[ name ] = value;

		return this;
	}

	public function addParams(params:Array):IExecutable
	{
		for (var key:String in params)
			this.addParam(key, params[key]);

		return this;
	}

	public function setParams(params:Array):IExecutable
	{
		for (var key:String in params) this.setParam(key, params[key]);

		return this;
	}

	//CoreListener Abstract method
	public function notify():void
	{
	}

	//CoreService Abstract method
	public function execute():*
	{
		return null;
	}

	//CoreNotification Abstract method
	public function send():void
	{
	}
}
}

package core.base.interfaces
{

	/**
	 * @author varadig
	 */
	public interface IExecutable
	{
		function addParam(name:String, value:Object):IExecutable
		function addParams(params:Array):IExecutable
		function setParam(name:String, value:Object):IExecutable
		function setParams(params:Array):IExecutable
		function execute():*
		function notify():void
		function send():void
	}
}

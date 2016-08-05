package core.service {
import core.base.CoreBaseFunctionWrapper;

public class CoreService extends CoreBaseFunctionWrapper {
	/*PROPERTIES*/
	public static const CORE_SERVICE_NAME:String = "core.service.name";

	public function CoreService(name:String, reference:Function) {
		super(name, reference);
	}

	override public function execute():* {
		return this.call();
	}

	override public function clone():* {
		var service:CoreService = new CoreService(this.name, this.reference);
		service.addParams(this.params);
		return service;
	}

}
}

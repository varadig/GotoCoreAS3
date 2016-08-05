package core.logger {
import core.logger.base.CoreBaseLogger;
import core.logger.interfaces.ICoreConsole;

public class CoreLoggerApplicationConsol extends CoreBaseLogger {
	private var console:ICoreConsole;
	public static const SHOW_CONSOLE:String = "logger.show.console";
	public static const HIDE_CONSOLE:String = "logger.hide.console";
	public static const SWITCH_CONSOLE_STATE:String = "logger.switch.console";

	public function CoreLoggerApplicationConsol(console:ICoreConsole) {
		this.console = console;

		this.sc.registerService(SHOW_CONSOLE, this.showConsole);
		this.sc.registerService(HIDE_CONSOLE, this.hideConsole);
		this.sc.registerService(SWITCH_CONSOLE_STATE, this.switchConsole);
	}

	override protected function addLogEntry(message:String):void {
		this.console.appendText(this.createEntryFrom(message));
	}

	private function showConsole(params:Array):void {
		if (params.alpha != null) this.console.setAlpha(params.alpha);

		this.console.show();
	}

	private function hideConsole():void {
		this.console.hide();
	}

	private function switchConsole(params:Array):void {
		this.console.switchState();
	}
}
}

/**
 * Created with IntelliJ IDEA.
 * User: varadig
 * Date: 12/5/13
 * Time: 7:24 PM
 * To change this template use File | Settings | File Templates.
 */
package plugins.mxml.spark
{
import spark.events.TextOperationEvent;

public class GuiMultilineLabel extends GuiTextArea
{
	public function GuiMultilineLabel()
	{
		super();
		this.selectable = false;
		this.addEventListener(TextOperationEvent.CHANGE, this.onTextOperationEvent)
	}

	private function onTextOperationEvent(event:TextOperationEvent):void
	{
		this.textDisplay.selectable = false;
		this.mouseEnabled = false;
		this.heightInLines = NaN;
	}
}
}

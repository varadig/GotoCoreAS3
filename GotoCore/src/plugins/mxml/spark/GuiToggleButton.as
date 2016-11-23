package plugins.mxml.spark
{
import core.base.CoreBaseClassFactory;
import core.base.CoreCallback;
import core.context.CoreContext;
import core.service.CoreServiceContainer;

import flash.events.MouseEvent;

import spark.components.ToggleButton;

public class GuiToggleButton extends ToggleButton
	{
	public function GuiToggleButton() {
		CoreBaseClassFactory.construct(this);
	}
		public var sc:CoreServiceContainer;
		public var context:CoreContext;
		public var callbacks:Array=[];

	[Bindable]
	public var selectedIcon:Object;
	[Bindable]
	public var upIcon:Object;

		public function serviceAddCallback(params:Array):void
		{
			CoreBaseClassFactory.serviceAddCallback(this, params);
		}

		public function serviceAddCallbacks(params:Array):void
		{
			CoreBaseClassFactory.serviceAddCallbacks(this, params);
		}

	public function serviceRemoveCallback(params:Array):void {
		CoreBaseClassFactory.serviceRemoveCallback(this, params);
	}

	public function serviceRemoveCallbacks(params:Array):void {
		CoreBaseClassFactory.serviceRemoveCallbacks(this, params);
	}

		protected function createCallBack(group:String):CoreCallback
		{
			return CoreBaseClassFactory.createCallBack(this, group);
		}

		protected function log(message:Object):void
		{
			CoreBaseClassFactory.log(this, message);
		}

		override protected function clickHandler(event:MouseEvent):void
		{
			super.clickHandler(event);

			switch (event.type)
			{
				case MouseEvent.MOUSE_OVER:
					this.createCallBack("mouse.over").send();
					break;
				case MouseEvent.MOUSE_OUT:
					this.createCallBack("mouse.out").send();
					break;
				case MouseEvent.MOUSE_DOWN:
					this.createCallBack("mouse.down").send();
					break;
				case MouseEvent.MOUSE_UP:
					this.createCallBack("mouse.up").send();
					break;
			}
		}
	}
}



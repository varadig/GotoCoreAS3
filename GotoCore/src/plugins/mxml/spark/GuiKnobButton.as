package plugins.mxml.spark
{
import core.base.CoreBaseClassFactory;
import core.base.CoreCallback;
import core.context.CoreContext;
import core.service.CoreServiceContainer;

import flash.events.Event;
import flash.events.MouseEvent;

import spark.components.Button;

public class GuiKnobButton extends Button
	{
	public function GuiKnobButton() {
		CoreBaseClassFactory.construct(this);
		this.addEventListener(MouseEvent.MOUSE_MOVE, this.mouseEventHandler);
	}
		public var sc:CoreServiceContainer;
		public var context:CoreContext;
	public var callbacks:Array = [];
		private var _radiusX:Number;
		private var _radiusY:Number;
		private var _sector:Sector;

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

	private function updatePosition():void {
		var ratio:Number = _radiusX / _radiusY;
		var angle:Number = Math.atan2(mouseX, mouseY);

		updatePositionFromDegree(90 - (Math.atan2(Math.sin(angle), Math.cos(angle) * ratio)) * (180 / Math.PI));
		log(90 - (Math.atan2(Math.sin(angle), Math.cos(angle) * ratio)) * (180 / Math.PI));
		dispatchEvent(new Event(Event.CHANGE));
	}

	private function updatePositionFromDegree(value:Number):void {
		_sector.degree = value;
		_sector.radiusX = _radiusX;
		_sector.radiusY = _radiusY;

		this.x = _sector.x;
		this.y = _sector.y;
	}

		override protected function clickHandler(event:MouseEvent):void
		{
			log("GuiKnobButton.clickHandler(event)");

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
				case MouseEvent.MOUSE_MOVE:
				{
					updatePosition();
				}
			}
		}
	}
}

class Sector
{

	public var degree:Number;
	public var radiusX:Number;
	public var radiusY:Number;

	public function Sector(degree:Number=0, radiusX:Number=10, radiusY:Number=10)
	{
		this.degree=degree;
		this.radiusX=radiusX;
		this.radiusY=radiusY;
	}

	public function get x():Number
	{
		return radiusX * Math.cos(degree * Math.PI / 180);
	}

	public function get y():Number
	{
		return radiusY * Math.sin(degree * Math.PI / 180);
	}

	public function toString():String
	{
		return "[Sector] degree: " + degree + ", radiusX: " + radiusX + ", radiusY: " + radiusY + ", x: " + x + ", y: " + y;
	}
}

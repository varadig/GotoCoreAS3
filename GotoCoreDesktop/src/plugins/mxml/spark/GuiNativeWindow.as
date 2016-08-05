package plugins.mxml.spark
{
import core.base.CoreBaseClassFactory;
import core.base.CoreCallback;
import core.context.CoreContext;
import core.service.CoreServiceContainer;

import flash.display.NativeWindow;
import flash.display.NativeWindowInitOptions;
import flash.events.Event;

import mx.core.UIComponent;
import mx.events.FlexEvent;
import mx.managers.WindowedSystemManager;

/**
	 * @author varadig
	 */
	public class GuiNativeWindow extends NativeWindow
	{

		public var sc:CoreServiceContainer;

		public var context:CoreContext;

		public var callbacks:Array=[];

		protected static var nameIndex:int=0;

		protected var namePrefix:String="native_window";

		private var _name:String;

		private var _systemManager:WindowedSystemManager;
		private var _content:UIComponent;

		public function GuiNativeWindow(initOptions:NativeWindowInitOptions)
		{
			super(initOptions);

			this._name=this.generateName();

			CoreBaseClassFactory.construct(this);
			//* Add in a listener for the Activate event - this is where we add in the content
			this.addEventListener(Event.ACTIVATE, windowActivateHandler);
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
			return (this.namePrefix + GuiNativeWindow.nameIndex++) as String;
		}

		//* Custom function to allow the content to be passed into the window
		public function addChildControls(control:UIComponent):void
		{
			_content=control;
		}

		//* This handler actually adds the content to the NativeWindow
		private function windowActivateHandler(event:Event):void
		{
			//* Process the event
			event.preventDefault();
			event.stopImmediatePropagation();
			removeEventListener(Event.ACTIVATE, windowActivateHandler);

			//* Create the children and add an event listener for re-sizing the window
			if (stage)
			{
				//* create a WindowedSystemManager to hold the content
				if (!_systemManager)
				{
					//*    Create a system manager
					_systemManager=new WindowedSystemManager(_content);
				}

				//* Add the content to the stage
				stage.addChild(_systemManager);

				//* Dispatch a creation complete event
				dispatchEvent(new FlexEvent(FlexEvent.CREATION_COMPLETE));

				//* Add in a resize event listener
				stage.addEventListener(Event.RESIZE, windowResizeHandler);
			}
		}

		//* Resizes the content in response to a change in size
		private function windowResizeHandler(event:Event):void
		{
			_content.width=stage.stageWidth;
			_content.height=stage.stageHeight;
		}
	}
}


package core.base 
{

	public class CoreBaseFunctionWrapper extends CoreBaseParameterHolder
	{
		protected var name : String;

		protected var reference : Function;

		public function CoreBaseFunctionWrapper ( name : String , reference : Function ) : void
		{
			this.name = name;
			this.reference = reference;
		}

		protected function call ( ) : *
		{
			return this.reference( this.params );
		}

		public function has (reference : Function) : Boolean
		{
			return (this.reference == reference);	
		}

		//Abstract function
		public function clone () : *
		{
			return null;
		}
	}
}

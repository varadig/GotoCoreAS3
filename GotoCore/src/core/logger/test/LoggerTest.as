
package core.logger.test 
{

import core.test.UnitTest;

public class LoggerTest extends UnitTest
	{
		override public function run () : void 
		{
			this.sc.getService( "logger.log" ).addParam( "message" , "Log: " + this.generateText( ) );
		}
	}
}

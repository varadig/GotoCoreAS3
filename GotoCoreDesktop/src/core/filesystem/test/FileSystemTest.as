
package core.filesystem.test
{
import core.test.UnitTest;

import flash.utils.ByteArray;

public class FileSystemTest extends UnitTest
	{
		private var testFolder : String = "test";

		override public function run () : void 
		{
			this.initialize( );
			this.getSubFoldersTests( );
			this.folderExistsTest( );
			this.fileExistsTests( );
			this.appendFilesTest( );
			this.readFileTest( );
			this.copyTest( );
		}

		private function initialize () : void 
		{
			if(this.sc.getService( "folder.exists" ).addParam( "path" , this.testFolder ).execute( ))
			{
				this.sc.getService( "delete.folder" ).addParam( "path" , this.testFolder ).execute( );
			}
			
			this.sc.getService( "create.folder" ).addParam( "path" , this.testFolder + "/text" ).execute( );
			this.sc.getService( "create.folder" ).addParam( "path" , this.testFolder + "/binary" ).execute( );

			this.sc.getService( "create.text.file" ).addParam( "path" , this.testFolder + "/text/test.txt" ).execute( );
			this.sc.getService( "create.binary.file" ).addParam( "path" , this.testFolder + "/binary/test.dat" ).execute( );
		}

		private function getSubFoldersTests () : void 
		{
			this.sc.getService( "get.sub.folders" ).addParam( "path" , "test2" ).execute( );
		}

		private function folderExistsTest () : void
		{
			this.sc.getService( "folder.exists" ).addParam( "path" , this.testFolder + "/text" ).execute( ) ;
			this.sc.getService( "folder.exists" ).addParam( "path" , this.testFolder + "/binary" ).execute( ) ;
		}

		private function fileExistsTests () : void 
		{
			this.sc.getService( "file.exists" ).addParam( "path" , this.testFolder + "/text/test.txt" ).execute( ) ;
			this.sc.getService( "file.exists" ).addParam( "path" , this.testFolder + "/binary/test.dat" ).execute( ) ;
		}

		private function appendFilesTest () : void 
		{
			this.sc.getService( "append.text.file" ).addParam( "path" , this.testFolder + "/text/test.txt" ).addParam( "content" , this.generateText( ) ).execute( );
			this.sc.getService( "append.binary.file" ).addParam( "path" , this.testFolder + "/binary/test.dat" ).addParam( "content" , this.generateBinary( ) ).execute( );
		}

		private function readFileTest () : void 
		{
			log( this.sc.getService( "read.text.file" ).addParam( "path" , this.testFolder + "/text/test.txt" ).execute( ) );
			log( this.sc.getService( "read.binary.file" ).addParam( "path" , this.testFolder + "/binary/test.dat" ).execute( ) );
		}

		private function copyTest () : void
		{
			this.sc.getService( "copy.folder" ).addParam( "from" , this.testFolder ).addParam( "to" , this.testFolder + "/copyedTest" ).execute( );
			this.sc.getService( "copy.file" ).addParam( "from" , this.testFolder + "/copyedTest/text/test.txt" ).addParam( "to" , this.testFolder + "/copyedTest/text/copyedTest.txt" ).execute( );
		}

		private function generateBinary () : ByteArray
		{
			var ba : ByteArray = new ByteArray( );
			var len : int = Math.random( ) * 10000;
			
			for(var i : int = 0; i < len; i++)	ba.writeInt( Math.random( ) * 255 );
			
			return ba;
		}
	}
}

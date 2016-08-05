package core.mobile {
import core.base.CoreBaseClass;
import core.notification.CoreNotification;
import core.service.CoreService;

import flash.filesystem.File;
import flash.filesystem.FileMode;
import flash.filesystem.FileStream;
import flash.utils.ByteArray;

import pl.randori.air.nativeextensions.ios.MailExtension;
import pl.randori.air.nativeextensions.ios.MailExtensionEvent;

public class CoreIOSNativeMail extends CoreBaseClass
	{
		public static const BUNDLE:String="bundle";
		public static const DOCUMENTS:String="documents";

		public static const IMAGE_PNG_MIME_TYPE:String="image/png";
		public static const TEXT_XML_MIME_TYPE:String="text/xml";

		private var file:File;
		private var mail:MailExtension;
		public var writeComplete:CoreService;

		public function CoreIOSNativeMail()
		{
			this.mail=new MailExtension();
			this.mail.addEventListener(MailExtensionEvent.MAIL_COMPOSER_EVENT, onMailEvent);
			this.mail.addEventListener(MailExtensionEvent.MAIL_RESULT_CANCELED, onMailEvent);
		}

		public function send(params:Array):void
		{
			this.writeComplete=params.writeComplete;
			this.writeTemporaryFile(params.filename, params.content);
			this.mail.sendMail(params.subject, params.message, params.recipient, null, null, ["Default.png|bundle|image/png|Application splash screen.png", this.buildAttachment(params)]);
		}

		private function onMailEvent(event:MailExtensionEvent):void
		{
			switch (event.type)
			{
				case MailExtensionEvent.MAIL_COMPOSER_EVENT:
				{
					this.emailSent.send();
					break;
				}

				case MailExtensionEvent.MAIL_RESULT_CANCELED:
				{
					break;
				}
			}
			this.file.deleteFile();

			this.mail.removeEventListener(MailExtensionEvent.MAIL_COMPOSER_EVENT, onMailEvent);
			this.mail.removeEventListener(MailExtensionEvent.MAIL_RESULT_CANCELED, onMailEvent);
		}

		public function writeTemporaryFile(filename:String, content:Object):void
		{
			this.file=File.documentsDirectory.resolvePath(filename);

			var fileStream:FileStream=new FileStream();
			fileStream.open(file, FileMode.WRITE);
			fileStream.writeBytes(ByteArray(content));
			fileStream.close();
			if (writeComplete)
				writeComplete.execute();

		}

		private function buildAttachment(params:Array):String
		{
			return params.filename + "|" + params.bundle + "|" + params.mimetype + "|" + params.filename;
		}


		private function get emailSent():CoreNotification
		{
			return this.sc.getService('create.notification').addParam('name', 'email.sent.notification').execute() as CoreNotification;
		}
	}
}



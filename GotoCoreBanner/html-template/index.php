<!DOCTYPE html>
<html>
<head>
	<title>
		TELENOR
	</title>
	<style type="text/css">
	body{
		background-color: #CCCCCC;
	}
	table
	{
		background-color: #FCFCFC;
		
	}
	</style>
	<script type="text/javascript">

	var popup;
	function loadBanner(src)
	{
		var params = 'width='+screen.width+' height='+screen.height
		popup = window.open(src, "", params);
		popup.addEventListener('load', resizeTocontent, false);	
	}

	function resizeTocontent()
	{
		popup.resizeTo(popup.document.width,popup.document.height);

	}
	</script>
</head>
<body>
<?php
 if ($handle = opendir('./html')) {
   while (false !== ($file = readdir($handle)))
      {
        if ($file != "." && $file != "..")
	  	{
	  		$file_parts = pathinfo($file);
	  		if($file_parts['extension']=="html")
	  		{

				$htmlFilePath = './html/'.$file;
				$htmlFileName = $file_parts['filename'];
				$swfFilePath = $file_parts["filename"].".swf";

//				$javaFuncString = "loadBanner("'.$htmlFilePath.'")";
        		$table .='<tr>';
        		$table .='<td><button onclick=loadBanner("'.$htmlFilePath.'")>'.$htmlFileName.'</button></td>';
        		//$table .='<td><a href="'.$htmlFilePath.'">'.$htmlFileName.'</a></td>';
        		$table .='<td><a href="download.php?filename=./swf/' .$swfFilePath. '">DOWNLOAD</a></td>';
        		$table .='</tr>';
	  		}
        }
    }
  closedir($handle);
  }       
?>

<table border="2" cellpadding="10" align="center">
<tr><td>TESTLINKS</td><td>DOWNLOADLINKS</td></tr>
<?=$table?>
</table>
</body>
</html>
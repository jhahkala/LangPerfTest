<?php

function handleFile($filename) {
echo round(microtime(true) * 1000) . ";";
$handle = fopen($filename, "rb");
$contents = fread($handle, filesize($filename));
fclose($handle);
echo round(microtime(true) * 1000) . ";";
$fileout = $filename . ".out";
$handle = fopen($fileout, "wb");
fwrite($handle, $contents, filesize($filename));
#echo $fileout;
fclose($handle);
echo round(microtime(true) * 1000) . "\n";
return;
}

if($argc!=2){
	echo "usage iotest.php <directory> \n";
	exit(1);
}
for ($i = 0; $i <= 999; $i++){
$currFile = sprintf("%s%s%03d%s", $argv[1], "/small", $i, ".rnd");

handleFile($currFile);
}
handleFile( $argv[1] . "/big.rnd");

#echo size($contents);
?>
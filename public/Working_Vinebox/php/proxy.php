<?php
error_reporting(0);
if(isset( $_GET['ID'] )) {
	libxml_use_internal_errors(true);
	$c = file_get_contents("https://vine.co/v/".$_GET['ID']);
	$d = new DomDocument();
	$d->loadHTML($c);
	$xp = new domxpath($d);
	foreach ($xp->query("//meta[@property='twitter:player:stream']") as $el) {
	    echo $el->getAttribute("content");
	}
} else { die('No Vine'); }?>
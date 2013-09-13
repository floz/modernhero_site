<?php

	$mail = $_POST[ "mail" ];
	
	$file = "mails.txt";
	$current = file_get_contents( $file );
	$current .= $mail."\n";
	file_put_contents( $file, $current );

	echo true;

?>
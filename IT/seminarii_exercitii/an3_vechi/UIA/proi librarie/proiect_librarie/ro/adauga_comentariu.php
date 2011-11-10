<?php
	if($_POST['nume_utilizator'] == "" || $_POST['adresa_email'] == "" || $_POST['comentariu'] == "")
	{
		print "Trebuie completate toate campurile!";
		exit;
	}
	include("conectare.php");
	$numeFaraTags = strip_tags($_POST['nume_utilizator']);
	$emailFaraTags = strip_tags($_POST['adresa_email']);
	$comentariuFaraTags = strip_tags($_POST['comentariu']);
	mysql_query("insert into comentarii (id_carte, nume_utilizator, adresa_email, comentariu) values(".$_POST['id_carte'].",'".$numeFaraTags."','".$emailFaraTags."','".$comentariuFaraTags."')");
	$inapoi = "carte.php?id_carte=".$_POST['id_carte'];
	header("location: $inapoi");
?>
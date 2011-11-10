<?php
	session_start();
	include("conectare.php");
	include("page_top.php");
	include("meniu.php");
	$id_carte = $_GET['id_carte'];
	$resursa = mysql_query("select titlu, nume_autor, descriere, pret from carti, autori where id_carte=".$id_carte." and carti.id_autor=autori.id_autor");
	$row = mysql_fetch_array($resursa);
?>
	<td valign="top">
		<table>
			<tr>
				<td valign="top">
					<?php
						$adresaImagine="coperte/".$id_carte.".jpg";
						if(file_exists($adresaImagine))
							print '<img src="'.$adresaImagine.'" width="75" height="100" hspace="10"><br>';
					?>
				</td>
				<td valign="top">
					<h1><?php print $row['titlu']; ?></h1>
					<i>de <b><?php print $row['nume_autor']; ?></b></i>
					<p><i><?php print $row['descriere']; ?></i></p>
					<p>Pret: <?php print $row['pret']; ?> lei</p>
				</td>
			</tr>
		</table>
	<form action="cos.php?actiune=adauga" method="POST">
		<input type="hidden" name="id_carte" value="<?php print $id_carte; ?>">
		<input type="hidden" name="titlu" value="<?php print $rowCarte['titlu']; ?>">
		<input type="hidden" name="nume_autor" value="<?php print $rowCarte['nume_autor']; ?>">
		<input type="hidden" name="pret" value="<?php print $rowCarte['pret']; ?>">
		<input type="submit" value="Cumpara acum!">
	</form>
	<p><b>Opiniile cititorilor</b></p>
	<?php
		$resursaComentarii = mysql_query("select * from comentarii where id_carte=".$id_carte);
		while($row = mysql_fetch_array($resursaComentarii))
			print '<div style="width:400px; border:1px solid $ffffff; background-color:#f9f1e7; padding:5px;"><a href="mailto:'.$row['adresa_email'].'">'.$row['nume_utilizator'].'</a><br>'.$row['comentariu'].'</div>';
	?>
	<br>
	<div style="width:400px; border:1px solid #632415; background-color:#f9f1e7; padding:5px;"><b>Adauga opinia ta:</b>
		<hr size="1">
		<form action="adauga_comentariu.php" method="POST">
			Nume: <input pype="text" name="nume_utilizator"><br>
			Email: <input type="text" name="adresa_email"><br><br>
			Comentariu: <br> <textarea name="comentariu" cols="45"></textarea><br><br>
			<input type="hidden" name="id_carte" value="<?php print $id_carte; ?>">
			<center> <input type="submit" value="Adauga"></center>
		</form>
	</div>
	</td>
<?php
	include("page_bottom.php");
?>
<?php
	session_start();
	include("conectare.php");
	include("page_top.php");
	include("meniu.php");
	$id_domeniu = $_GET['id_domeniu'];
	$resursaNumeDomeniu = mysql_query("select nume_domeniu from domenii where id_domeniu=".$id_domeniu);
	$numeDomeniu = mysql_result($resursaNumeDomeniu, 0, "nume_domeniu");
?>
<td valign = "top">
	<h1>Domeniu: <?php print $numeDomeniu; ?></h1>
	<b>Carti in domeniul <u><i><?php print $numeDomeniu; ?></i></u>:</b>
	<table cellpadding="5">
	<?php
		$resursa = mysql_query("select id_carte, titlu, descriere, pret, nume_autor from carti, autori, domenii where carti.id_domeniu=domenii.id_domeniu and carti.id_autor=autori.id_autor and domenii.id_domeniu=".$id_domeniu);
		while($row = mysql_fetch_array($resursa))
		{
			?>
			<tr>
				<td align = "center">
				<?php
					$adresaImagine = "coperte/".$row['id_carte'].".jpg";
					if(file_exists($adresaImagine))
						print '<img src="'.$adresaImagine.'" width="75" height="100"><br>';
					else
						print '<div style="width:75px; height:100px; border: 1px black solid; background-color:#cccccc">Fara imagine</div>';
				?>
				</td>
				<td>
					<b><a href="carte.php?id_carte=<?php print $row['id_carte']; ?>"> <?php print $row['titlu']; ?></a></b><br><i>de <?php print $row['nume_autor']; ?></i><br>Pret: <?php print $row['pret']; ?> lei
				</td>
			</tr>
			<?php
		}
			?>
	</table>
</td>
<?php
	include("page_bottom.php");
?>
<td valign="top" width="125">
<div style="width:120px; background-color: #f9f1e7; padding:4px; border:solid #632415 1px">
<b>Alege domeniul</b>
<hr size="1">
<?php
	$resursa = mysql_query("select * from domenii order by nume_domeniu asc");
	while($row = mysql_fetch_array($resursa))
		print '<a href="domeniu.php?id_domeniu='.$row['id_domeniu'].'">'.$row['nume_domeniu'].'</a><br>';
?>
</div>
<br>
<div style="width:120px; background-color:#f9f1e7; padding:4px; border:solid #632415 1px">
<form action="cautare.php" method="GET"><b>Cautare</b><br>
	<input type="text" name="cuvant" size="12"><br>
	<input type="submit" value="Cauta">
</form>
</div>
<br>
<div style="width:120px; background-color:f9f1e7; padding:4px; border:solid #632415 1px;">
	<b>Cos</b><br>
	<?php	
		$nrCarti = 0;
		$totalValoare = 0;
		for($i = 0; $i < count($_SESSION['titlu']); $i ++)
		{
			$nr_carti = $nrCarti + $_SESSION['nr_buc'][$i];
			$totalValoare = $totalValoare + ($_SESSION['nr_buc'][$i] * $_SESSION['pret'][$i]);
		}
	?>
	Aveti <b><?php print $nrCarti; ?></b> carti in cos, in valoare totala de <b><?php print $totalValoare; ?></b> lei.<a href="cos.php">Apasati aici pentru a vedea continutul cosului</a>
</div>
<p><a href="index.php">Pagina principala</a></p>
<a href="../en/index.php"><img src="traducere.jpg" width="50" height="30"></a>
</td>
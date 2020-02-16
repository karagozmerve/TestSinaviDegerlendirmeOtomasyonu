<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="com.OBS.controller.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Puan Listele</title>
</head>
<body>

	<form id="PuanListeleForm" name="TestDuzeltmeForm" method="POST" action="obsController">
		<table id="PuanListeleTablosu" class ="table table-striped table-bordered" border="1">
			
				
	
		</table>
		
				<input type="hidden" name="Komut" value="TestDuzeltildi"/>

				<input type="hidden" id="CevapListe"  name="CevapListe"/>
		
	</form>

<script>

	var OgrenciSayisi = ${SonucListele.size()};
	var SoruSayisi = ${SoruKazanim.size()};
	var puan = 100/SoruSayisi;
	var tablo = document.getElementById('PuanListeleTablosu');

		<%for(int i=0;i<obsController.SonucListele.size();i++) { %>
		var y = "<%= i %>";
		var satirr = tablo.insertRow(y);
		for(var j =0;j<SoruSayisi+1;j++) {
			var Soru = satirr.insertCell(j);
			if(y==0) {
				if(j==0) {
					Soru.innerHTML = "Öğrenci No";
				}
				else if(j==1) {
					Soru.innerHTML = "Adı Soyadı";
				}
				else {
      			    Soru.innerHTML = "Soru"+Number(j-1);
				}
			}
			else {

				if(j==0) {
					var numara = "<%= obsController.SonucListele.get(i).getNumara()%>";
					Soru.innerHTML = numara;
				}
				else if(j==1) {
					var Isim = "<%= obsController.SonucListele.get(i).getIsim()%>";
					Soru.innerHTML = Isim;
				}
				else {
					var Puan = "<%= obsController.SonucListele.get(i).getDogruMu()%>";
					Soru.innerHTML = Number(Puan.charAt(j))*puan;
				}

			}
		}
		<%}%>
	

</script>

</body>
</html>
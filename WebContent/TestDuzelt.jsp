<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test Düzelt</title>
</head>
<body>
	<form id="TestDuzeltmeForm" name="TestDuzeltmeForm" method="POST" action="obsController">
				
		<table id="TestDuzeltmeTablosu" class = "table table-striped table-bordered" border="1">
						<thead>
							<tr class = "thead-dark"> 
								<th scope="col">#</th>
								<th scope="col">Ad Soyad</th>
								<th scope="col">Numara</th>
								<th scope="col">Kitapçık Türü</th>
								<th scope="col">Cevapları</th>	
								<th scope="col">İşlemler</th>					
							</tr> 
						</thead>
						<tbody>	

							<c:forEach items="${SonucListem}" var="Liste">							
								<tr>
									<th scope="row"> ${Liste.getID()} </th>
									<td contenteditable='true'>  ${Liste.getIsim()} </td>
									<td contenteditable='true'>  ${Liste.getNumara()}</td>
									<td contenteditable='true'>  ${Liste.getKitapcik()} </td>
									<td contenteditable='true'>  ${Liste.getCevap()} </td>
									<td> <button class="SilButton" type="button" name="KullaniciSil" onclick="if (confirm('Kaydı Silmek İstediğinizden Emin misiniz ?')) {SatirSil(this);} else {return false;}" value="${Liste.getID()}"><img src="DeleteIcon.png"></button> </td>									
									
								</tr>
							</c:forEach>
						</tbody>
					</table>
				<input type="hidden" name="Komut" value="TestDuzeltildi"/>
				<input type="hidden" id="IsimListe" name="IsimListe"/>
				<input type="hidden" id="NumaraListe"  name="NumaraListe"/>
				<input type="hidden" id="KitapcikListe"  name="KitapcikListe"/>
				<input type="hidden" id="CevapListe"  name="CevapListe"/>
				<input type="button" class="KaydetButon" onclick="ListeyiYolla();" value="Kaydet"/> 
		</form>
	<script>
		var IsimArray = [];
  		var NumaraArray = [];
  		var CevapArray = [];
  		var KitapcikArray = [];
  		var OncedenSilinenler = [];
  		
		function ListeyiYolla() {
			var SatirSayisi = document.getElementById("TestDuzeltmeTablosu").getElementsByTagName("tr").length;
			for(var j = 1;j<SatirSayisi;j++) {					
			  		IsimArray.push(document.getElementById("TestDuzeltmeTablosu").rows[j].cells[1].innerHTML);				
					NumaraArray.push(document.getElementById("TestDuzeltmeTablosu").rows[j].cells[2].innerHTML);									
					KitapcikArray.push(document.getElementById("TestDuzeltmeTablosu").rows[j].cells[3].innerHTML);				
					CevapArray.push(document.getElementById("TestDuzeltmeTablosu").rows[j].cells[4].innerHTML);					
				
			}
			document.TestDuzeltmeForm.IsimListe.value=IsimArray;
          	document.TestDuzeltmeForm.NumaraListe.value=NumaraArray;
          	document.TestDuzeltmeForm.KitapcikListe.value=KitapcikArray;
          	document.TestDuzeltmeForm.CevapListe.value=CevapArray;
          	document.TestDuzeltmeForm.submit();
		}		
		
		function SatirSil(elmnt) {
			if(OncedenSilinenler.length!=0) {
				var index = elmnt.value;
				for(var q =0;q<OncedenSilinenler.length;q++) {
					if(Number(index)>OncedenSilinenler[q]) {
						index=index-1;
					}
				}
				document.getElementById("TestDuzeltmeTablosu").deleteRow(index);
				OncedenSilinenler.push(index);
			}
			else {
				document.getElementById("TestDuzeltmeTablosu").deleteRow(elmnt.value);
				OncedenSilinenler.push(elmnt.value);
			}
			
		}

	</script>

</body>
</html>
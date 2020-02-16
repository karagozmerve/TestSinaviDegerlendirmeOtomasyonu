<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form name="CevapAnahtariForm" method="POST" action="obsController">
		<table id="CevapAnahtariTablo" class = "table table-striped table-bordered" border="1">
						<thead>
							<tr class = "thead-dark"> 
								<th scope="col">Kitapçık Türü</th>
								<th scope="col">Cevaplar</th>					
							</tr> 
						</thead>
						<tbody>													
								
						</tbody>
					</table>	
		<input type="hidden" id="AnahtarArray"  name="AnahtarArray"/>
		<input type="hidden" name="Komut" value="CevapAnahtariYukle"/>
		<input type="button" class="KaydetButon" onclick="CevaplariYolla();" value="Değerlendir"/> 
	</form>
	
	
	
	<input type="file" accept="text/plain" id="SinavIsaretlemeleri" onchange="openFile(event)"/><br>
	


	<script>
      var openFile = function(event) {
        var input = event.target;

        var reader = new FileReader();
        reader.onload = function(){
          var text = reader.result;
          console.log(reader.result.substring(0, 200));
          Kontrol(text);
        };
        reader.readAsText(input.files[0],'windows-1254');
      	
      };
      
      function Kontrol(text) {
    	  var tablo = document.getElementById('CevapAnahtariTablo');
    	  var CevapSayisi = (text.match(/\n/g)||[]).length;
    	  
    	  	var CevapAnahtari = [];
         	var disagiden = "";
    	  	
			for(var i =0;i<CevapSayisi;i++) {    		
              	var Satir = text.split('\n')[i];
              	CevapAnahtari.push(Satir);
              	var satirr = tablo.insertRow(i+1);
              	var kutu1 = satirr.insertCell(0);
              	var kutu2 = satirr.insertCell(1);
              	kutu1.innerHTML = Satir.charAt(0);
              	kutu2.innerHTML = Satir.slice(1);
			}
    	  
			document.CevapAnahtariForm.AnahtarArray.value=CevapAnahtari;
			
			
      }
      
      function CevaplariYolla() {
    	  document.CevapAnahtariForm.submit();
      }
      
      </script>
	</body>
</html>
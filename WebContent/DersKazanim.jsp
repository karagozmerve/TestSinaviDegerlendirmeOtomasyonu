<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Ders Kazanım</title>

<style>



.SilButton {
	border:none;
	background: transparent;
}

#Yazi {
		width:550px;
		height: 25px;
	}
	
#DersKazanim {
	font-size: 150%;
	font-family: "Times New Roman", Times, serif;
}

.EkleButton {
	background-image: url('aktifeklebuton.png');
	background-repeat: no-repeat;
	padding: 18px 75px;
	display: inline-block;
	border-radius: 8px;
	width: 13px;
	height: 10px;
}

.EkleButton:disabled {
	border: 1px solid #999999;
  	background-image: url('eklebuton.png');
	background-repeat: no-repeat;
}
#Kaydet{
    border: none;
    padding-left: 1000px;
    
}
.container{
	border: 1px solid;
	-moz-box-shadow: 1px 2px 4px rgba(0, 0, 0,0.5);
  	-webkit-box-shadow: 1px 2px 4px rgba(0, 0, 0, .5);
  	box-shadow: 1px 2px 4px rgba(0, 0, 0, .5);
  	position: absolute;	
     left: 200px;
     top: 80px;
  	width:70%;
}
.container input[type="text"],
</style>

</head>
<body>


	<form name="Form" class="container" action ="obsController" method="GET">
<div class="w3-container w3-black">
  <h2 align="center"><i>Kazanım Ekle</i></h2>
</div>
<br />
<div id="DersKazanim">	
	<label id="h1"></label>
</div>
	
        <input type="text" class="w3-input" id="Yazi" name="Yazi" onkeyup="Bosmu()"/>
          <br />
        <input type="button" id="kazanimekle" name="kazanimekle" class="EkleButton" disabled onclick="KazanimEkle();"/>
  
      <span id="KazanimListesi"> 
      
      
      </span>
      
      <input type="button" id="Kaydet" onclick="submitForm();" style="background:url(Tick.png) no-repeat center ; width:30px; height:30px; visibility:hidden;" />
      <input type="hidden" name="Komut"/>
      <input type="hidden" name="Kazanimlar"/>
      <input type="hidden" name="KazanimDersID"/>
      
   </form>
	
<script>

	document.Form.KazanimDersID.value = "<%=session.getAttribute("KazanimDersID")%>";
	document.title = "<%=session.getAttribute("KazanimDersAdi")%>";
	document.getElementById("h1").innerHTML = 'Lütfen '+document.title+' Dersi İçin Kazanımları Giriniz.';
	document.title = document.title+' Dersinin Kazanımları';

var DersKazanimListesi, Kazanim, ListeBoyut, i;

	DersKazanimListesi = [];

	function submitForm(komut){
		document.Form.Komut.value="DersKazanimEkle";
		document.Form.Kazanimlar.value= DersKazanimListesi;
		document.Form.submit();
	}
	
	function Bosmu() {
		
		if(document.getElementById("Yazi").value==="") { 
            document.getElementById('kazanimekle').disabled = true; 
        } else { 
            document.getElementById('kazanimekle').disabled = false;
        }
	}

	function KazanimSil(elmnt) {
		
		var value = elmnt.value;
		
	if(confirm('Kazanimi Silmek İstediğinizden Emin misiniz ?')) 
	{
		for( var j = 0; j < DersKazanimListesi.length; j++){ 
			   if ( DersKazanimListesi[j] === value) {
				   
				   DersKazanimListesi.splice(j, 1);
			   }
			}
	}
	KazanimListele();
}

	
    function KazanimEkle() {
    document.getElementById('Kaydet').style.visibility='visible';
    var text = document.getElementById("Yazi").value;
	DersKazanimListesi.push(text);
	KazanimListele();
	
	}
    
    function KazanimListele() {
    	ListeBoyut = DersKazanimListesi.length;	
    	Kazanim = "<ul>";
    	for (i = 0; i < ListeBoyut; i++) {
    		Kazanim += "<li> <b>" + (Number(i)+1) + "</b> : " + DersKazanimListesi[i] + "</li>";
    		Kazanim += "<button type='button' value='"+DersKazanimListesi[i]+"' onclick='KazanimSil(this)' id='SilButton' class='SilButton'><img src='DeleteIcon.png'></button>"
    	}
    	Kazanim += "</ul>";
    	
    	document.getElementById("KazanimListesi").innerHTML = Kazanim;
    	document.getElementById("Yazi").value = "";
    	document.getElementById('kazanimekle').disabled = true;
    }


</script>

</body>
</html>

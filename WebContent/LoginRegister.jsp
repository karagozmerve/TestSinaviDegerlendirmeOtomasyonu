<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<style>

.ListeleButton {
color: #75756E !important;
text-transform: uppercase;
text-decoration: none;
background: #D5D85F;
padding: 20px;
display: inline-block;
transition: all 0.4s ease 0s;
border:none;
box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
}

.ListeleButton:hover {
color: #ffffff !important;
background: #000000;
transition: all 0.4s ease 0s;
border-radius: 11px;
}

.SilButton {

color: #FFFFFF;
background: #D23B3B;
border: none;
padding: 15px 32px;
text-align: center;
display: inline-block;
font-size: 16px;
border-radius: 8px;
}

.SilButton:disabled {

  border: 1px solid #999999;
  background-color: #cccccc;
  color: #666666;
  text-align: center;

}
	
.GirisButton {
	color: #FFFFFF;
	padding: 23px 120px;
	display: inline-block;
	font-size: 16px;
	border-radius: 8px;
	height: 20px;
	border: none; 
	background-color: transparent;
	margin-left: 1001px;
		margin-top: 43px;
	

	
}
	
.GirisButton:disabled {

  border: 1px solid #999999;
  background-color: #cccccc;
  color: #666666;
  text-align: center;

}
	


.RedirectButton {
	color: #FFFFFF;
	background: #7C2B21;
	border: none;
	padding: 32px 70px;
	text-align: center;
	display: inline-block;
	font-size: 16px;
	border-radius: 8px;
}

.RedirectButton:hover{
	background: #D85656;
	box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
}

 body {
	background: url(Loginbg.jpg) no-repeat center center fixed;
	 background-size: 100% 100%;
	 
 }

.container {
  width: 550px;
  clear: both;
}

#BeniHatirla {
	width:0.8em;
	height:0.8em;
	top:+3px;
	position:relative;
	margin-top: 58px;
	margin-left: 1130px;
}

#SicilNo {
	margin-top: 187px;
	margin-left: 1006px;
	opacity: 0.5;
	border-radius: 8px;
	width: 250px;
	height: 5px:
	
}
#Sifre{
margin-top: 50px;
margin-left: 1006px;
	opacity: 0.5;
	border-radius: 8px;
	width: 250px;
	height: 5px:
}
</style>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<link rel="icon" type="image/x-icon" href="LoginTitleIcon.png" />

<meta charset="ISO-8859-1">
<title>Test Sınavı Değerlendirme Otomasyonu</title>
</head>
<body>



<form name="Form" action ="obsController" method="POST">
				
			<input minlength="9" maxlength="9" required onkeypress='return event.charCode>= 48 &&event.charCode<= 57' type = "text" name="GirisSicilNo" id="SicilNo" > 
			<br /><br />
			<input type = "password" name="GirisSifre" id="Sifre" > <br />
			<input type="checkbox" id="BeniHatirla"> <br><br>
	
			<input type="button" class="GirisButton" onclick="submitForm('Giris');" />		<br><br>

	
			<input type="hidden" name="Komut"/>
	
</form>


<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script>

	//Cookie Kontrolü


	//Reset Değeri(Tabloları Oto Listeleme) Sıfırlama
	<% session.setAttribute("Reset",""); %>
	
	//Hata Kontrol
	<% if("".equals(session.getAttribute("Dikkat"))||session.getAttribute("Dikkat")==null) { %> 
		<% if("".equals(session.getAttribute("Cookie"))||session.getAttribute("Cookie")==null) { %>
		var SicilNo = getCookie("SicilNo");
		var Sifre = getCookie("Sifre");
		if(Sifre!=""&&SicilNo!="") {
		document.getElementById("SicilNo").value = SicilNo;
		document.getElementById("Sifre").value = Sifre;
		submitForm('Giris');
			}
	<%	} else { %>
			document.cookie = "SicilNo=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
			document.cookie = "Sifre=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
			<%}
	} 
	else {
	%>
	
	var Hata = "<%= session.getAttribute("Dikkat") %>";
	
	alert(Hata);
	
	<%}
		session.setAttribute("Dikkat","");
		session.setAttribute("Cookie","");
	%>

	//Giris Yapilmadi Bilgisi İle Yönlendirildiyse Uyarı Mesajı!
	<% if("Yapilmadi".equals(session.getAttribute("Giris"))) { %>
		var SicilNo = getCookie("SicilNo");
		var Sifre = getCookie("Sifre");
		if(Sifre==""&&SicilNo=="") {
			alert("Lütfen Giriş Yapınız !");
		}
		
	<%}
		session.setAttribute("Giris","");
	%>
	


function submitForm(komut){
	if(document.getElementById("BeniHatirla").checked==true) {
		document.cookie = "SicilNo="+ document.getElementById("SicilNo").value + "; path=/;";
		document.cookie = "Sifre="+ document.getElementById("Sifre").value + "; path=/;";
	}
	document.Form.Komut.value=komut;
	document.Form.submit();
}

function getCookie(cookieadi) {
	  var adi = cookieadi + "=";
	  var decodedCookie = decodeURIComponent(document.cookie);
	  var ca = decodedCookie.split(';');
	  for(var i = 0; i <ca.length; i++) {
	    var c = ca[i];
	    while (c.charAt(0) == ' ') {
	      c = c.substring(1);
	    }
	    if (c.indexOf(adi) == 0) {
	      return c.substring(adi.length, c.length);
	    }
	  }
	  return "";
	}



</script>

</body>
</html>

<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ page import="com.OBS.yardimcilar.*"%>
	<%@ page import="java.util.ArrayList"%>
    <%@ page import="java.util.List"%>
    <%@ page import="com.OBS.controller.*"%>
    <%@ page import="com.OBS.model.Donem"%>
    <%@ page import="com.OBS.dao.DonemDao"%>
    <%@ page import="com.OBS.model.DersAtama"%>
    <%@ page import="com.OBS.dao.DersAtamaDao"%>
    
<!DOCTYPE html>
<html>
<head>

<link rel="icon" type="image/x-icon" href="TitleIcon.png" />

<script>
  UPLOADCARE_PUBLIC_KEY = '11cec1552bc168e27053';
</script>

<script src="https://ucarecdn.com/libs/widget/3.x/uploadcare.full.min.js"></script>

<link rel="stylesheet" 

href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css" />     
<link rel="stylesheet" 

href="https://cdn.datatables.net/buttons/1.2.1/css/buttons.dataTables.min.css" />     
<Script src="https://code.jquery.com/jquery-1.12.3.js" 

type="text/javascript"></Script>     
<Script src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js" 
type="text/javascript"></Script>     
<Script src="https://cdn.datatables.net/buttons/1.2.1/js/dataTables.buttons.min.js" 
type="text/javascript"></Script>     
<Script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js" 
type="text/javascript"></Script>     
<Script src="https://cdn.datatables.net/buttons/1.2.1/js/buttons.html5.min.js" 
type="text/javascript"></Script>


<style>

.editicon{
	padding-bottom: -50px;
}

.editicon2{
	padding-bottom: -80px;
}

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

.EkleButton {

background: #F3EBEB;
padding-left: 24px;
position: relative;
left: -20px;
top: -5px;
color: #FFFFFF;
border: none;
display: inline-block;
font-size: 16px;
border-radius: 5px;
float: right;
height:80px;
width:110px;



}

.EkleButton:hover {
	color: #EEE2E2 !important;
	background: #A86428;
	padding-left: 24px;
	border-radius: 11px;

}

#AnaSayfa {
	height:425px;
	
}

.DuzenleButton {
	border:none;
	background: transparent;
	width:50px;
}

.SilButton {
	border:none;
	width:50px;
	background: transparent;
}

.CikisButton {
	color: #FFFFFF;
	background: #D23B3B;
	border: none;
	padding: 25px 25px;
	text-align: center;
	display: inline-block;
	font-size: 16px;
	border-radius: 8px;
}


.tablink {
  background-color: #000000;
  color: white;
  float: left;
  border: none;
  border-color: #000000;
  outline: none;
  cursor: pointer;
  padding: 15px 30px;
  font-size: 14px;
  display: inline-block;
  border-radius: 8px;
  
  
}

.tabcontent {

  display: none;
  padding: 100px 20px;
  height: 100%;
  border-style: none;
}

.form-style-8
		{
	font-family: 'Open Sans Condensed', arial, sans;
	font-size: 25px;
	width: 500px;
	padding: 30px;
	background: #FFFFFF;
	margin: 50px auto;
	box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.22);
	-moz-box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.22);
	-webkit-box-shadow:  0px 0px 15px rgba(0, 0, 0, 0.22);

}


.form-style-8 h2{
	background: #4D4D4D;
	text-transform: uppercase;
	font-family: 'Open Sans Condensed', sans-serif;
	color: #797979;
	font-size: 25px;
	font-weight: 150;
	padding: 20px;
	margin: -30px -30px 30px -30px;
}
	
.form-style-8 input[type="text"],
.form-style-8 input[type="date"],
.form-style-8 input[type="datetime"],
.form-style-8 input[type="email"],
.form-style-8 input[type="number"],
.form-style-8 input[type="search"],
.form-style-8 input[type="time"],
.form-style-8 input[type="url"],
.form-style-8 input[type="password"],
.form-style-8 textarea,
.form-style-8 select {
	box-sizing: border-box;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	outline: none;
	display: block;
	width: 100%;
	padding: 3px;
	border: none;
	border-bottom: 1px solid #ddd;
	background: transparent;
	font: 16px Arial, Helvetica, sans-serif;
	height: 45px;
}
	
.form-style-8 button{
	color: #FFFFFF;
	background: #000000;
	border: none;
	padding: 15px 32px;
	text-align: center;
	display: inline-block;
	font-size: 16px;
	border-radius: 8px;
}

.form-style-8 button:hover{
	background-color:#47463E;
	 box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
}

#defaultOpen {

	background-image: url(HomeIcon.jpg);

}

.FormBasligi {

	background-color:#A16027;
	color: #F3EBEB;
	display: inline-block;
	border-radius: 4px;
	font-size: 26px;
	text-align: left;
	width: 100%;
	height: 70px;
	vertical-align: middle;
	line-height: 55px;
}

.FormBasligi#Ders {
	background-color: #A15252;
}

.DersEkleButton {
padding-left: 24px;
position: relative;
left: -20px;
top: -5px;
color: #FFFFFF;
border: none;
display: inline-block;
font-size: 16px;
border-radius: 5px;
float: right;
height:80px;
width:110px;


}

.DersEkleButton:hover {
	background: #A15252;
	padding-left: 24px;
	border-radius: 11px;
}
.FormBasligi#Bolum{
   background-color: #686868;
}
.BolumEkleButton {
padding-left: 24px;
position: relative;
left: -20px;
top: -5px;
color: #FFFFFF;
border: none;
display: inline-block;
font-size: 16px;
border-radius: 5px;
float: right;
height:80px;
width:110px;
}

.BolumEkleButton:hover {
	background: #686868;
	padding-left: 24px;
	border-radius: 11px;
}
.FormBasligi#Donem{
   background-color: #125A27;
}

.DonemEkleButton {
padding-left: 24px;
position: relative;
left: -20px;
top: -5px;
color: #FFFFFF;
border: none;
display: inline-block;
font-size: 16px;
border-radius: 5px;
float: right;
height:80px;
width:110px;


}

.DonemEkleButton:hover {
	background: #125A27;
	padding-left: 24px;
	border-radius: 11px;
}

th:hover {
	cursor: pointer;
	background: #6B6A66;
}
select#ProfilSelectBox {
    -webkit-appearance: none;
    -moz-appearance: none;
    text-indent: 1px;
    text-overflow: '';
}

select#SelectBox {
    -webkit-appearance: none;
    -moz-appearance: none;
    text-indent: 1px;
    text-overflow: '';
}

.selectx {
	width: 200px;
	height: 150px;
    font-size: 25px;
  	font-family: Arial;
  	font-weight: bold;	
	position: absolute;
	right: +20px;
	top: +30px;
	
}

.selectt {
	position: absolute;
	font-size: 25px;
  	font-family: Arial;
  	font-weight: bold;	
	left: +20px;
	top: +30px;
}

.ProfilSecimi:hover {
	background-position: right;
	font-size: 16px;
	padding: 15px 32px;
	-moz-box-shadow: 1px 2px 4px rgba(0, 0, 0,0.5);
  	-webkit-box-shadow: 1px 2px 4px rgba(0, 0, 0, .5);
  	box-shadow: 1px 2px 4px rgba(0, 0, 0, .5);
  	cursor: pointer;
}

.ProfilSecimi {
	width: 197px;
    height: 85px;
	background-image: url('ProfileIcon.png');
	background-repeat: no-repeat;
	background-position: right;
	font-size: 16px;
	padding: 15px 32px;
  	box-shadow: 1px 1px;
  	border: 1px solid black;
  	border-radius: 5px;
}

.SelectBox:hover {
	width: 215px;
    height: 85px;
	background-position: left;
	font-size: 16px;
	padding: 15px 32px;
	-moz-box-shadow: 1px 2px 4px rgba(0, 0, 0,0.5);
  	-webkit-box-shadow: 1px 2px 4px rgba(0, 0, 0, .5);
  	box-shadow: 1px 2px 4px rgba(0, 0, 0, .5);
  	cursor: pointer;
  	padding-left: 60px;
}

.SelectBox {
	width: 215px;
    height: 85px;
	font-size: 16px;
	padding: 15px 32px;
	box-shadow: 1px 1px;
	border: 1px solid black;
  	border-radius: 5px;
    background-image: url('IslemSecme.png');
  	background-repeat: no-repeat;
	background-position: left;
	padding-left: 60px;
	
}

.Header {
	width: 100%;
	height: 220px;
	background-image: url('anasayfalogo.jpeg');
	background-repeat: no-repeat;
	background-position: 53% 0%;
	background-attachment: absolute;
}

.container{
	border: 1px solid;
	-moz-box-shadow: 1px 2px 4px rgba(0, 0, 0,0.5);
  	-webkit-box-shadow: 1px 2px 4px rgba(0, 0, 0, .5);
  	box-shadow: 1px 2px 4px rgba(0, 0, 0, .5);
  	text-align:center;
  	width:100%;
}

.container:hover{
  box-shadow: 2px 2px 2px 2px #888888;
}

.container input[type="text"],
.container input[type="date"],
.container input[type="datetime"],
.container input[type="email"],
.container input[type="number"],
.container input[type="search"],
.container input[type="time"],
.container input[type="url"],
.container input[type="password"],
.container textarea,
.container select {
	box-sizing: border-box;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	outline: none;
	display: block;
	padding: 3px;
	border: none;
	border-bottom: 1px solid #ddd;
	background: transparent;
	font: 16px Arial, Helvetica, sans-serif;
	height: 45px;
	width: 500px;
	left:+300px;
	position:relative;
}

.form-group input[type="radio"] {
	width:1.5em;
	height:1.5em;
	top:+6px;
	position:relative;
}

.form-group {

	text-align:center;
}

.postit2{
    position: absolute;
	left: -5px;
	top: +190px;


}
.postit{
    position: absolute;
	right: +3px;
	top: +190px;


}
</style>


<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<meta charset="UTF-8">
<title>Test Sınavı Değerlendirme Otomasyonu </title>
</head>
<body>

	<div class="Header">

	<div class="selectt" align="right">
	<select class="SelectBox" id="SelectBox" onchange="Degisti('SelectBox')">
		<option selected="selected" disabled> İşlem Seçiniz. </option> 
		<option value="defaultOpen"> Ana Sayfa </option>
		<option value="TestOkumaButton">Test Okut</option>
		
	<% if("Admin".equals(session.getAttribute("Auth"))) { %>
		<optgroup label="Kullanıcı İşlemleri">
		<option value="KullaniciButton"> Kullanıcı Listele </option>
		<option value="KullaniciEkleButton"> Kullanıcı Ekle </option>
	</optgroup>
	<optgroup label="Bölüm İşlemleri">
		<option value="BolumButton"> Bölüm Listele</option>
		<option value="BolumEkleButton"> Bölüm Ekle </option>
	</optgroup>
	<optgroup label="Ders İşlemleri">	
		<option value="DersButton">Ders Listele  </option>
		<option value="DersEkleButton"> Ders Ekle </option>
		<option value="AtananDerslerButton"> Atanan Dersleri Gör </option>
		<option value="DersAtamaEkleButton"> Yeni Ders Ata </option>
	</optgroup>
	<optgroup label="Dönem İşlemleri">	
		<option value="DonemButton">Dönem Listele</option>
		<option value="DonemEkleButton"> Dönem Ekle </option>
	</optgroup>
	<% } else if("NormalKullanici".equals(session.getAttribute("Auth"))) {%>

	
	<%} else { 
		request.getSession().setAttribute("Giris", "Yapilmadi");
		response.sendRedirect("LoginRegister.jsp");
	}
		%>
		
	</select>
	</div>
	
	
	<div class="selectx">
		<select class="ProfilSecimi" id="ProfilSelectBox" onchange="Degisti('ProfilSelectBox')">
		<% if("Admin".equals(session.getAttribute("Auth"))) { %>
			<option hidden="true" disabled selected="selected"> ${Kullanici.getAdSoyad()} (ADMİN) </option>
		<% } else if("NormalKullanici".equals(session.getAttribute("Auth"))){%>
			<option hidden="true" disabled selected="selected"> ${Kullanici.getAdSoyad()} </option>
		<%}%>
			<option value="ProfilButton"> Profil </option>
			<option value="SifreButton">Şifre İşlemleri</option>
			<option value="CikisButton"> Çıkış Yap </option>	
		</select>
		
	</div>
	
	<input  style="display: none;" id="CikisButton" class="CikisButton" type="button" onclick="if (confirm('Çıkmak İstediğinizden Emin misiniz ?')) {CikisSubmit('Cikis');} else {return false;}" value="Çıkış Yap">
	<button style="display: none;" class="tablink" onclick="openPage('AnaSayfa', this)" id="defaultOpen"><img src="HomeIcon.png"/></button>
	<button style="display: none;" id="TestOkumaButton" class="tablink" onclick="openPage('TestOkuma', this)"> Test Okut </button>
	<button style="display: none;" id="KullaniciButton" class="tablink" onclick="openPage('Kullanici', this)"> Kullanıcı İşlemleri </button>
	<button style="display: none;" id="BolumButton" class="tablink" onclick="openPage('Bolum', this)"> Bölüm İşlemleri </button>
	<button style="display: none;" id="DersButton" class="tablink" onclick="openPage('Ders', this)"> Ders İşlemleri </button>
	<button style="display: none;" id="DonemButton" class="tablink" onclick="openPage('Donem', this)"> Dönem İşlemleri </button>
	<button style="display: none;" id="DonemEkleButton" class="tablink" onclick="openPage('DonemEkle', this)"> Dönem Ekleme İşlemleri </button>
	<button style="display: none;" id="KullaniciEkleButton" class="tablink" onclick="openPage('KullaniciEkle', this)"></button>
	<button style="display: none;" id="DersEkleButton" class="tablink" onclick="openPage('DersEkle', this)"></button>
	<button style="display: none;" id="BolumEkleButton" class="tablink" onclick="openPage('BolumEkle', this)"></button>
	<button style="display: none;" id="DersAtamaEkleButton" class="tablink" onclick="openPage('DersAtamaEkle', this)"></button>
	<button style="display: none;" id="AtananDerslerButton" class="tablink" onclick="openPage('AtananDersler', this)"></button>
	<button style="display: none;" id="ProfilButton" class="tablink" onclick="openPage('Profil', this)"></button>
	<button style="display: none;" id="SifreButton" class="tablink" onclick="openPage('Sifre', this)"></button>
	

	</div>
	
	
	<div id="AnaSayfa" class="tabcontent">
		<form name="AnaSayfaForm" method="GET" action="obsController">
				<input type="hidden" name="Komut"/>
				<div class="postit2" align="left">
				<img src="Postit2.png" align="left" />
				</div>
				<div class="postit" align="right">
				<img src="Postit.png" align="right" />
				</div>
				
				
		</form> 
	</div>

	<div id="Sifre" class="tabcontent">
		<div class = "container" align="center">
		<div class="editicon2" align="right">
			<img src="SifreDegistir.png" align="right" width="120" /> 
			</div>
		<h1>Şifre Değiştir</h1> 
		<hr/>
			<form name="SifreGuncelleForm" method="POST" action="obsController">
		<br />
				<div class="form-group">				
					  	Eski Şifre : <input type="password" maxlength="70" required class="form-control" name="ProfilEskiSifre" id="ProfilEskiSifre"/>
				</div><img src="eye-32.png" onmouseover="SifreGorunurluk('Goster','ProfilEskiSifre');" onmouseout="SifreGorunurluk('Kapa','ProfilEskiSifre');" />
					
					<div class="form-group">				
					  	Yeni Şifre : <input type="password" maxlength="70" required class="form-control" id="ProfilYeniSifre" name="ProfilYeniSifre"/>
					</div><img src="eye-32.png" onmouseover="SifreGorunurluk('Goster','ProfilYeniSifre');" onmouseout="SifreGorunurluk('Kapa','ProfilYeniSifre');" />
					
					<div class="form-group">				
					  	Yeni Şifreyi Tekrar Giriniz : <input type="password" maxlength="70" id="ProfilTekrarSifre" required class="form-control" name="ProfilTekrarSifre"/>
					</div><img src="eye-32.png" onmouseover="SifreGorunurluk('Goster','ProfilTekrarSifre');" onmouseout="SifreGorunurluk('Kapa','ProfilTekrarSifre');" />
				    <br />
				    <br />
				    
				    <input type="hidden" name="ProfilSicil" value="${Kullanici.getSicilNo()}"/>				
					<input type="hidden" name="ProfilUnvanID" value="${Kullanici.getUnvanID()}"/>
					<input type="hidden" name="ProfilTC" value="${Kullanici.getTC()}"/>
					<input type="hidden" name="ProfilBolumID" value="${Kullanici.getBolumID()}"/>
					<input type="hidden" name="ProfilAdSoyad" value="${Kullanici.getAdSoyad()}"/>
					<input type="hidden" name="ProfilDogumTarihi" value="${Kullanici.getDogumTarihi()}"/>
					<input type="hidden" id="ProfilAdmin" name="ProfilAdmin" value="${Kullanici.getAdmin()}"/>
					<input type="hidden" name="ProfilCinsiyet" value="${Kullanici.getCinsiyet()}"/>
					<input type="hidden" name="ProfilEposta" value="${Kullanici.getEposta()}"/>
					<input type="hidden" name="Komut"/>
				    
				    <button class="KaydetButon" onclick="SifreGuncelleSubmit('ProfilGuncelle');"><span>Kaydet</span> 
				    </button>
					
		<br>
		<hr/>
		</form>
		</div>
	</div>

	<div id="Profil" class="tabcontent">
	
		<div class = "container" align="center">
			<div class="editicon" align="right">
			<img src="EditProfile.jpg" align="right" width="97" /> 
			</div>
		<h1>Profilim</h1> 
	
		<br>
		<hr/>
		<% if("NormalKullanici".equals(session.getAttribute("Auth"))) {%>
		<h6><i>(Kullanıcı Tarafından E-mail ve Şifre Güncelleme İşlemi Yapılabilmektedir..!)</i></h6>
		<hr/>
		<%} %>
		
				<div> 
				<% if("Admin".equals(session.getAttribute("Auth"))) {%>
					<font size="6"><b><i> Admin  </i></b> </font>
					<hr/>	
					<%} %>
					<% if(("Admin".equals(session.getAttribute("Auth")))||("NormalKullanici".equals(session.getAttribute("Auth")))) {  %>
					<font size="6"><b><u>${Kullanici.getAdSoyad()}</u></b> </font>
					<br>			
					 <i>${Kullanici.getUnvan()}</i>
					<%} %>
					<hr/>
		
				<form name="ProfilGuncelleForm" method="POST" action="obsController">
					
					<div class="form-group">
					  	E-posta : <input type="email" maxlength="100" required class="form-control" id="ProfilEposta" name="ProfilEposta" value="${Kullanici.getEposta()}"/>
					</div>

					<% if("NormalKullanici".equals(session.getAttribute("Auth"))) { %>
					<div class = "form-group">
						Sicil No(*) : <input type="text" disabled maxlength="9" required onkeypress='return event.charCode>= 48 &&event.charCode<= 57' class="form-control" id="ProfilSicil" name="ProfilSicil" value="${Kullanici.getSicilNo()}"/>
					</div>
				
					<div class = "form-group">
						TC Kimlik No(*) : <input type="text" maxlength="11" disabled required onkeypress='return event.charCode>= 48 &&event.charCode<= 57'	class="form-control" id="ProfilTC" name="ProfilTC" value="${Kullanici.getTC()}"/>
					</div>
						
						
					<div class="form-group">
					
					  	Bölümü(*) : <select disabled name="ProfilBolumID" id="ProfilBolumID">
					  	<option selected="selected" hidden="true" disabled  > Bölüm Seçiniz.. </option>
					  		<c:forEach items="${bolumlist}" var="BolumListesi">
					  			<option value="${BolumListesi.getID()}">${BolumListesi.getAdi()}</option>
					  		</c:forEach>
					  	</select>
					</div>										
					
					<div class="form-group">
					  	Ünvanı(*) : <select disabled name="ProfilUnvanID" id="ProfilUnvanID">
					  			<option selected="selected" hidden="true" disabled> Ünvan Seçiniz.. </option>
					  		<c:forEach items="${unvanlist}" var="UnvanListesi">
					  			<option value="${UnvanListesi.getID()}">${UnvanListesi.getAdi()}</option>
					  		</c:forEach>
					  	</select>
					</div>				
					
					<div class="form-group">
					  	Ad Soyad(*) : <input disabled type="text" maxlength="120" id="KullaniciAdSoyad" required class="form-control" name="ProfilAdSoyad" value="${Kullanici.getAdSoyad()}"/>
					</div>
					
					<div class="form-group">
					  	Doğum Tarihi(*) : <input disabled type="date" min="1900-01-01" max="2000-01-01" required class="form-control" name="ProfilDogumTarihi" value="${Kullanici.getDogumTarihi()}"/>
					</div>
				
				<br><br>			 
				<%} %>
					
					<% if("Admin".equals(session.getAttribute("Auth"))) { %>
						
						<div class = "form-group">
						Sicil No(*) : <input type="text" maxlength="9" required onkeypress='return event.charCode>= 48 &&event.charCode<= 57' class="form-control" id="ProfilSicil" name="ProfilSicil" value="${Kullanici.getSicilNo()}"/>
					</div>
				
					<div class = "form-group">
						TC Kimlik No(*) : <input type="text" maxlength="11" required onkeypress='return event.charCode>= 48 &&event.charCode<= 57'	class="form-control" id="ProfilTC" name="ProfilTC" value="${Kullanici.getTC()}"/>
					</div>
						
						
					<div class="form-group">
					
					  	Bölümü(*) : <select name="ProfilBolumID" id="ProfilBolumID">
					  	<option selected="selected" hidden="true" disabled  > Bölüm Seçiniz.. </option>
					  		<c:forEach items="${bolumlist}" var="BolumListesi">
					  			<option value="${BolumListesi.getID()}">${BolumListesi.getAdi()}</option>
					  		</c:forEach>
					  	</select>
					</div>									
					
					<div class="form-group">
					  	Ünvanı(*) : <select name="ProfilUnvanID" id="ProfilUnvanID">
					  			<option selected="selected" hidden="true" disabled> Ünvan Seçiniz.. </option>
					  		<c:forEach items="${unvanlist}" var="UnvanListesi">
					  			<option value="${UnvanListesi.getID()}">${UnvanListesi.getAdi()}</option>
					  		</c:forEach>
					  	</select>
					</div>			
					
					<div class="form-group">
					  	Ad Soyad(*) : <input type="text" maxlength="120" id="KullaniciAdSoyad" required class="form-control" name="ProfilAdSoyad" value="${Kullanici.getAdSoyad()}"/>
					</div>
					
					<div class="form-group">
					  	Doğum Tarihi(*) : <input type="date" min="1900-01-01" max="2000-01-01" required class="form-control" name="ProfilDogumTarihi" value="${Kullanici.getDogumTarihi()}"/>
					</div>
				
				<br><br>			 
						
					<%} %>
					
				<br><br>
					
					<% if("NormalKullanici".equals(session.getAttribute("Auth"))) { %>
					<input type="hidden" name="ProfilSicil" value="${Kullanici.getSicilNo()}"/>				
					<input type="hidden" name="ProfilUnvanID" value="${Kullanici.getUnvanID()}"/>
					<input type="hidden" name="ProfilTC" value="${Kullanici.getTC()}"/>
					<input type="hidden" name="ProfilBolumID" value="${Kullanici.getBolumID()}"/>
					<input type="hidden" name="ProfilAdSoyad" value="${Kullanici.getAdSoyad()}"/>
					<input type="hidden" name="ProfilDogumTarihi" value="${Kullanici.getDogumTarihi()}"/>					
					<%} %>
					<input type="hidden" name="Komut"/>
					<input type="hidden" id="ProfilUnvanIDD" value="${Kullanici.getUnvanID()}"/>
					<input type="hidden" id="ProfilBolumIDD" value="${Kullanici.getBolumID()}"/>
					<script>
							var deger = document.getElementById("ProfilUnvanIDD").value;
							var box = document.getElementById("ProfilUnvanID");
							var options = box.options;
								for(var option, j=0; option=options[j]; j++) {
									if(option.value == deger) {
										box.selectedIndex = j;
										break;
									}
								}						
					</script>
					<script>
							var deger = document.getElementById("ProfilBolumIDD").value;
							var box = document.getElementById("ProfilBolumID");
							var options = box.options;
								for(var option, j=0; option=options[j]; j++) {
									if(option.value==deger) {
										box.selectedIndex = j;
										break;
									}
								}						
					</script>	
					<input type="hidden" id="ProfilAdmin" name="ProfilAdmin" value="${Kullanici.getAdmin()}"/>
					<input type="hidden" id="ProfilSifre" name="ProfilYeniSifre" value="${Kullanici.getSifre()}"/>
					<input type="hidden" name="ProfilCinsiyet" value="${Kullanici.getCinsiyet()}"/>
			
					<button class="KaydetButon" style="background:url(Tick.png) no-repeat center ; width:30px;border:none; height:30px;" onclick="ProfilGuncelleSubmit('ProfilGuncelle');" ></button> <%if("Admin".equals(session.getAttribute("Auth"))) {  %><button type="reset" class="KaydetButon" style="background:url(Close.png) no-repeat center ; width:30px;border:none; height:30px;"></button> <%} %>
				<br><br>
				</form>
				</div>
		</div>
	</div>
	
		<div id="TestOkuma" class="tabcontent">	
		<div class = "container" align="center">
	
		<h1>Test Okutma İşlemi</h1>
		<hr/>
				<form name="TestOkumaForm" method="POST" action="obsController">
				
					<div class="form-group">				
					  	Ders : <select name="FormTestOkumaDers" id="FormTestOkumaDers" onchange="TestOkumaKisitla()">
					  	<option selected="selected" hidden="true" disabled  > Ders Seçiniz.. </option>
					  		<c:forEach items="${ListelenmisDersAtama}" var="TestOkutmaDers">
					  			<option value="${TestOkutmaDers.getDersID()}">${TestOkutmaDers.getDers()}</option>
					  		</c:forEach>
					  	</select>
					</div>					
							
							<script> 
							
							var box = document.getElementById("FormTestOkumaDers");
							var options = box.options;
								for(var j=0; j<options.length; j++) {
									for(var i=0; i<options.length;i++) {
										if((options[j].value == options[i].value)&&(j!=i)&&(!options[j].hidden)) {
											options[i].hidden = true;
										}
									}
								}				
								
							
							</script>
							
					<div class = "form-group">
						Bölüm : <select name="FormTestOkumaBolum" id="FormTestOkumaBolum">
					  	<option selected="selected" hidden="true" disabled  > Bölüm Seçiniz.. </option>
					  		<c:forEach items="${ListelenmisDersAtama}" var="TestOkutmaBolum">
					  			<option value="${TestOkutmaBolum.getBolumID()}">${TestOkutmaBolum.getBolum()}</option>
					  		</c:forEach>
					  	</select>
					</div>	

						<script> 
							
							var box = document.getElementById("FormTestOkumaBolum");
							var options = box.options;
							var lngth = options.length;
								for(var j=0; j<lngth; j++) {
									for(var i=0; i<options.length;i++) {
										if((options[j].value == options[i].value)&&(j!=i)) {
											box.remove(i);
											lngth = options.length;
										}
									}
								}				
								
							
						</script>
					
					<div class = "form-group">
						Dönem : <select name="FormTestOkumaDonem" id="FormTestOkumaDonem">
					  	<option selected="selected" hidden="true" disabled  > Dönem Seçiniz.. </option>
					  		<c:forEach items="${ListelenmisDersAtama}" var="TestOkutmaDonem">
					  			<option value="${TestOkutmaDonem.getDonemID()}">${TestOkutmaDonem.getDonem()}</option>
					  		</c:forEach>
					  	</select>
					</div>	
				
					<div class = "form-group">
						Sınav Türü : <select name="FormTestOkumaTur" id="FormTestOkumaTur">
					  	<option selected="selected" hidden="true" disabled  > Sınav Türü Seçiniz.. </option>
					  			<option value="Vize">Vize</option>
					  			<option value="Final">Final</option>
					  			<option value="Butunleme">Butunleme</option>
					  	</select>
					</div>	
				
				<br><br>
				
					<input type="hidden" id="TestOkumaSicilNo" name="TestOkumaSicilNo" value="${Kullanici.getSicilNo()}"/>
					<input type="hidden" name="Komut"/>
			
					<input type="button" class="KaydetButon" onclick="TestOkumaSubmit('DersAtamaEkleGuncelle');" value="Kaydet"/> <button type="reset" class="KaydetButon">Temizle</button> 
				<br><br>
			</form>
		</div>
	</div>
	
	
	<% if("Admin".equals(session.getAttribute("Auth"))) { %>

	<div id="Kullanici" class="tabcontent">
		<form name="Form" method="GET" action="obsController">	
				<div class="FormBasligi">
					<i> Kullanıcı Listesi </i>  <button class="EkleButton" onclick="submitForm('KullaniciEkle')"> <img src= "Ekle1.jpg" border="0" width="70" height="70"  alt="Kullanıcı eklemek için lütfen tıklayın.."/></button>
					
					<table class = "table table-striped table-bordered" border="1">
						<thead>
							<tr class = "thead-dark"> 
								<th scope="col">#</th>
								<th scope="col">Sicil No</th>
								<th scope="col">Ad Soyad</th>
								<th scope="col">TC</th>
								<th scope="col">Cinsiyet</th>
								<th scope="col">E-Posta</th>
								<th scope="col">Bölümü</th>
								<th scope="col">Ünvanı</th>
								<th scope="col">Doğum Tarihi</th>
								<th scope="col">İşlemler</th>						
							</tr> 
						</thead>
						<tbody>	
							<% int i = 1;%>
							<c:forEach items="${list}" var="KullaniciListesi">
							
								<tr>
									<th scope="row"><% out.println(i); %></th>
									<td>  ${KullaniciListesi.getSicilNo()} </td>
									<td>  ${KullaniciListesi.getAdSoyad()}</td>
									<td>  ${KullaniciListesi.getTC()} </td>
									<td>  ${KullaniciListesi.getStrCinsiyet()} </td>
									<td>  ${KullaniciListesi.getEposta()} </td>
									<td>  ${KullaniciListesi.getBolum()} </td>
									<td>  ${KullaniciListesi.getUnvan()} </td>
									<td>  ${KullaniciListesi.getDogumTarihi()} </td>
									<td>  <button class="DuzenleButton" name="KullaniciDuzenle" onclick="submitForm('KullaniciDuzenle')" value="${KullaniciListesi.getSicilNo()}"><img src="DuzenleIcon.png"></button> <button class="SilButton" name="KullaniciSil" onclick="if (confirm('Kaydı Silmek İstediğinizden Emin misiniz ?')) {submitForm('KullaniciSil');} else {return false;}" value="${KullaniciListesi.getSicilNo()}"><img src="DeleteIcon.png"></button> </td>									
									<%i++; %>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					
				<br><br>
				<input type="hidden" name="Komut"/>	
				<input type="hidden" name="Order"/>					
				</div>			
		</form>
	</div>
	
	<div id="Bolum" class="tabcontent">
		<form name="BolumForm" method="GET" action="obsController">	
				<div id="Bolum" class="FormBasligi">
					<i> Bölüm Listesi </i>  <button class="BolumEkleButton" onclick="BolumsubmitForm('BolumEkle')"><img src= "bolumicon.png" border="0" width="70" height="70"  alt="Bölüm eklemek için lütfen tıklayın.."/> </button>
					
					<table class = "table table-striped table-bordered" border="1">
						<thead>
							<tr class= "thead-dark"> 
								<th scope="col">#</th>
								<th scope="col">Adı</th>
								<th scope="col">Bağlı Olduğu Fakülte</th>
								<th scope="col">İşlemler</th>						
							</tr> 
						</thead>
						<tbody>	
							<% int BolumSayaci = 1;%>
							<c:forEach items="${bolumlist}" var="BolumListesi">
							
								<tr>
									<th scope="row"><% out.println(BolumSayaci); %></th>
									<td>  ${BolumListesi.getAdi()} </td>
									<td>  ${BolumListesi.getFakulte()} </td>
									<td>  <button class="DuzenleButton" name="BolumDuzenle" onclick="BolumsubmitForm('BolumDuzenle')" value="${BolumListesi.getID()}"><img src="DuzenleIcon.png"></button> <button class="SilButton" name="BolumSil" onclick="if (confirm('Kaydı Silmek İstediğinizden Emin misiniz ?')) {BolumsubmitForm('BolumSil');} else {return false;}" value="${BolumListesi.getID()}"><img src="DeleteIcon.png"></button> </td>									
									<%BolumSayaci++;%>
								</tr>
							</c:forEach>
						</tbody>
					</table>
	
				<br><br>
				<input type="hidden" name="Komut"/>
				<input type="hidden" name="BolumOrder"/>				
				</div>			
		</form>
	</div>
	
	<div id="Ders" class="tabcontent">
		
		<form name="DersForm" method="GET" action="obsController">	
				<div id="Ders" class="FormBasligi">
					<i> Ders Listesi </i>  <button class="DersEkleButton" onclick="DerssubmitForm('DersEkle')"><img src= "dersicon.jpg" border="0" width="70" height="70"  alt="Ders eklemek için lütfen tıklayın.."/> </button>
					
					<table class = "table table-striped table-bordered" border="1">
						<thead>
							<tr class= "thead-dark"> 
								<th scope="col">#</th>
								<th scope="col">Ders Kodu</th>
								<th scope="col">Adı</th>
								<th scope="col">Kredi</th>
								<th scope="col">Ait Olduğu Bölüm</th>
								<th scope="col">İşlemler</th>						
							</tr> 
						</thead>
						<tbody>	
							<% int DersSayaci = 1;%>
							<c:forEach items="${derslist}" var="DersListesi">
							
								<tr>
									<th scope="row"><% out.println(DersSayaci); %></th>
									<td>  ${DersListesi.getID()} </td>
									<td>  ${DersListesi.getAdi()} </td>
									<td>  ${DersListesi.getKredi()} </td>
									<td>  ${DersListesi.getBolum()} </td>
									<td>  <button class="DuzenleButton" name="DersDuzenle" onclick="DerssubmitForm('DersDuzenle')" value="${DersListesi.getID()}"><img src="DuzenleIcon.png"></button> <button class="SilButton" name="DersSil" onclick="if (confirm('Kayıtlı Dersi Silmek İstediğinizden Emin misiniz ?')) {DerssubmitForm('DersSil');} else {return false;}" value="${DersListesi.getID()}"><img src="DeleteIcon.png"></button> </td>									
									<%DersSayaci++;%>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				<br><br>
				<input type="hidden" name="Komut"/>
				<input type="hidden" name="DersOrder"/>				
				</div>			
		</form>
		
	</div>
	
	<div id="Donem" class="tabcontent">
		
		<form name="DonemForm" method="GET" action="obsController">	
				<div id="Donem" class="FormBasligi">
					<i> Dönem Listesi </i>  <button type="button" class="DonemEkleButton" onclick="openPage('DonemEkle', this)"><img src= "donemicon.jpg" border="0" width="70" height="70"  alt="Dönem eklemek için lütfen tıklayın.."/> </button>				
					<table class = "table table-striped table-bordered" border="1">
						<thead>
							<tr class= "thead-dark"> 
								<th scope="col">#</th>
								<th scope="col">Adı</th>
								<th scope="col">İşlemler</th>							
							</tr> 
						</thead>
						<tbody>	
							<% int DonemSayaci = 1;%>
							<c:forEach items="${donemlist}" var="DonemListesi">
							
								<tr>
									<th scope="row"><% out.println(DonemSayaci); %></th>
									<td>  ${DonemListesi.getAdi()} </td>
									<td>  <button class="SilButton" name="DonemSil" onclick="if (confirm('Kaydı Silmek İstediğinizden Emin misiniz ?')) {DonemsubmitForm('DonemSil');} else {return false;}" value="${DonemListesi.getID()}"><img src="DeleteIcon.png"></button> </td>									
									<%DonemSayaci++;%>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				<br><br>
				<input type="hidden" name="Komut"/>			
				</div>			
		</form>
	</div>
	
	<div id="DonemEkle" class="tabcontent">
	
	<div class = "container" align="center">
	<div class="editicon" align="right">
			<img src="KEkleGuncelle.jpg" align="right" width="97" /> 
			</div>
		<h1>Dönem Ekle</h1>
		<hr/>
		
				<form name="DonemEkleForm" method="POST" action="obsController">
							
					<div class="form-group">				
					  	Lütfen Dönem Yılını Seçiniz(*) : <select name="FormDonemYil" id="DonemYil" onchange="DonemKisitla()">
					  	<option selected="selected" hidden="true" disabled  > Yıl Seçiniz.. </option>
					  		
					  			<option value="2019">2019-2020</option>
					  			<option value="2020">2020-2021</option>
					  			<option value="2021">2021-2022</option>
					  			<option value="2022">2022-2023</option>
					  			<option value="2023">2023-2024</option>
					  			<option value="2024">2024-2025</option>
					  			<option value="2025">2025-2026</option>
					  			<option value="2026">2026-2027</option>
					  							  		
					  	</select>
					</div>	
					
					<div class="form-group">				
					  	Lütfen Dönemi Seçin(*) : <select name="FormDonem" id="FormDonem">
					  	<option selected="selected" hidden="true" disabled  > Dönem Seçiniz </option>				  		
					  			<option value="1">1</option>
					  			<option value="2">2</option>
					  			<option value="3">Yaz Dönemi</option>
					  			<option value="4">Diğer</option>			  		
					  	</select>
					</div>									
				
				<br><br>
				
					<input type="hidden" name="Komut"/>
				<button class="KaydetButon" style="background:url(Tick.png) no-repeat center ; width:30px;border:none; height:30px;" onclick="DonemEkleSubmit('DonemEkle');" ></button> <button type="reset" class="KaydetButon" style="background:url(Close.png) no-repeat center ; width:30px;border:none; height:30px;"></button>
			
				<br><br>
			</form>
	</div>
	
	</div>
	
	<div id="KullaniciEkle" class="tabcontent">
	
	<div class = "container" align="center">
	<div class="editicon" align="right">
			<img src="KEkleGuncelle.jpg" align="right" width="97" /> 
			</div>
		<h1>Kullanıcı Ekle/Guncelle</h1>
		<br>
		<h6><i>(* işaretli alanları doldurmak zorunludur..!)</i></h6>
		<hr/>
		
		
				<form name="KullaniciEkleForm" method="POST" action="obsController">
				
					<div class = "form-group">
						Sicil No(*) : <input type="text" maxlength="9" required onkeypress='return event.charCode>= 48 &&event.charCode<= 57' class="form-control" id="KullaniciSicilNo" name="KullaniciSicilNo" value="${kullanici.getSicilNo()}"/>
					</div>
				
					<div class = "form-group">
						TC Kimlik No(*) : <input type="text" maxlength="11" required onkeypress='return event.charCode>= 48 &&event.charCode<= 57'	class="form-control" id="KullaniciTC" name="KullaniciTC" value="${kullanici.getTC()}"/>
					</div>
						
					<div class="form-group">
					
					  	Bölümü(*) : <select name="KullaniciBolum" id="KullaniciBolum">
					  	<option selected="selected" hidden="true" disabled  > Bölüm Seçiniz.. </option>
					  		<c:forEach items="${bolumlist}" var="BolumListesi">
					  			<option value="${BolumListesi.getID()}">${BolumListesi.getAdi()}</option>
					  		</c:forEach>
					  	</select>
					</div>					
					<script> 
							var deger = ${kullanici.getBolumID()}
							var box = document.getElementById("KullaniciBolum");
							var options = box.options;
								for(var option, j=0; option=options[j]; j++) {
									if(option.value == deger) {
										box.selectedIndex = j;
										break;
									}
								}
							
					</script>
					
					
					<div class="form-group">
					  	E-posta(*) : <input type="email" maxlength="100" required class="form-control" id="KullaniciEposta" name="KullaniciEposta" value="${kullanici.getEposta()}"/>
					</div>
					
					
					<div class="form-group">
					  	Ünvanı(*) : <select name="KullaniciUnvan" id="KullaniciUnvan">
					  			<option selected="selected" hidden="true" disabled> Ünvan Seçiniz.. </option>
					  		<c:forEach items="${unvanlist}" var="UnvanListesi">
					  			<option value="${UnvanListesi.getID()}">${UnvanListesi.getAdi()}</option>
					  		</c:forEach>
					  	</select>
					</div>
						<script> 
							var deger = ${kullanici.getUnvanID()}
							var box = document.getElementById("KullaniciUnvan");
							var options = box.options;
								for(var option, j=0; option=options[j]; j++) {
									if(option.value == deger) {
										box.selectedIndex = j;
										break;
									}
								}				
						</script>
					
					<%if(("Evet".equals(session.getAttribute("SifreVarmi")))||(session.getAttribute("SifreVarmi")=="Evet")) {%>
					<div class="form-group">				
					  	Şifre(*) : <input type="password" maxlength="70" id="KullaniciSifre" required class="form-control" name="KullaniciSifre"/> <img src="eye-32.png" onmouseover="SifreGorunurluk('Goster','KullaniciSifre');" onmouseout="SifreGorunurluk('Kapa','KullaniciSifre');" />
					</div>
					<br>
					<%} %>

					<div class="form-group">
					  	Cinsiyet(*) : 
					  		<input type="radio" required name="KullaniciCinsiyet" value="0"/> Kadın
					  		<input type="radio" required name="KullaniciCinsiyet" value="1"/> Erkek
					  	
					</div>
					<hr/><br>
						<script>
							var cinsiyet = ${kullanici.getCinsiyet()}
							var radyo = document.getElementsByName('KullaniciCinsiyet')
							for(i=0; i<radyo.length;i++) {
							if(cinsiyet==radyo[i].value)
								radyo[i].checked=true;
							}
						</script>
					
					
					<div class="form-group">
					  	Ad Soyad(*) : <input type="text" maxlength="120" id="KullaniciAdSoyad" required class="form-control" name="KullaniciAdSoyad" value="${kullanici.getAdSoyad()}"/>
					</div>
					
					<div class="form-group">
					  	Doğum Tarihi(*) : <input type="date" min="1900-01-01" max="2000-01-01" required class="form-control" name="KullaniciDogumTarihi" value="${kullanici.getDogumTarihi()}"/>
					</div>
					
					<div class="form-group">
					  	Admin : 
					  		<input type="radio" required name="KullaniciAdmin" value="0"/> Hayır
					  		<input type="radio" required name="KullaniciAdmin" value="1"/> Evet
					  	
					</div>
						<script>
							var cinsiyet = ${kullanici.getAdmin()}
							var radyo = document.getElementsByName('KullaniciAdmin')
							for(i=0; i<radyo.length;i++) {
							if(cinsiyet==radyo[i].value)
								radyo[i].checked=true;
							}
						</script>
				
				<br><br>
				
					<input type="hidden" name="KullaniciSicil" id="KullaniciSicil" value="${kullanici.getSicilNo()}"/>
					<input type="hidden" name="Komut"/>
					<%if(("".equals(session.getAttribute("SifreVarmi")))||(session.getAttribute("SifreVarmi")==null)) {%>
					<input type="hidden" name="KullaniciSifre" id="KullaniciSifre" value="${kullanici.getSifre()}"/>
					<%} %>
			
				<button class="KaydetButon" style="background:url(Tick.png) no-repeat center ; width:30px;border:none; height:30px;" onclick="KullaniciEkleGuncelleSubmit('KullaniciEkleGuncelle');" ></button> <button type="reset" class="KaydetButon" style="background:url(Close.png) no-repeat center ; width:30px;border:none; height:30px;"></button>
					
				<br><br>
				</form>
	</div>
	
	</div>
	
	<div id="DersEkle" class="tabcontent">
	
	<div class = "container">
	<div class="editicon" align="right">
			<img src="dersicon.jpg" align="right" width="97" /> 
			</div>
		<h1>Ders Ekle/Guncelle</h1>
		<br>
		<h6><i>(* işaretli alanları doldurmak zorunludur..!)</i></h6>
		<hr/>
				<form name="DersEkleForm" method="POST" action="obsController">
				
					<div class = "form-group">
						ID(*) : <input type="text" maxlength="12" required class="form-control" id="FormDersID" name="FormDersID" value="${ders.getID()}"/>
					</div>
									
					<div class="form-group">
					  	Adı(*) : <input type="text" maxlength="70" required class="form-control" id="FormDersAdi" name="FormDersAdi" value="${ders.getAdi()}"/>
					</div>
				
					<div class = "form-group">
						Kredisi(*) : <input type="number" min="1" max="6" id="FormDersKredi" required class="form-control" name="FormDersKredi" value="${ders.getKredi()}"/>
					</div>
						
					<div class="form-group">				
					  	Bağlı Olduğu Bölüm : <select name="FormDersBolum" id="DersBolum">
					  	<option selected="selected" hidden="true" disabled  > Bölüm Seçiniz.. </option>
					  		<c:forEach items="${bolumlist}" var="BolumListesi">
					  			<option value="${BolumListesi.getID()}">${BolumListesi.getAdi()}</option>
					  		</c:forEach>
					  	</select>
					</div>					
					<script> 
							var deger = ${ders.getBolumID()}
							var box = document.getElementById("DersBolum");
							var options = box.options;
								for(var option, j=0; option=options[j]; j++) {
									if(option.value == deger) {
										box.selectedIndex = j;
										break;
									}
								}						
					</script>				
				<br><br>
					<input type="hidden" name="DersID" value="${ders.getID()}"/>
					<input type="hidden" name="Komut"/>
			<button class="KaydetButon" style="background:url(Tick.png) no-repeat center ; width:30px;border:none; height:30px;" onclick="BolumEkleGuncelleSubmit('BolumEkleGuncelle');" ></button> <button type="reset" class="KaydetButon" style="background:url(Close.png) no-repeat center ; width:30px;border:none; height:30px;"></button>
			
				<br><br>
			</form>
	</div>
	
	
	
	</div>
	
	<div id="BolumEkle" class="tabcontent">
	
	<div class = "container" align="center">
	<div class="editicon" align="right">
			<img src="BEkleGuncelle.png" align="right" width="97" /> 
			</div>
		<h1>Bölüm Ekle/Guncelle</h1>
		<br>
		<h6><i>(* işaretli alanları doldurmak zorunludur..!)</i></h6>
		<hr/>
		
				<form name="BolumEkleForm" method="POST" action="obsController">
				
					<%if(("Duzenle".equals(session.getAttribute("Islem")))||(session.getAttribute("Islem")=="Duzenle")) {%>
					<div class = "form-group">
						ID(*) : <input type="text" disabled class="form-control" name="FormBolumID" value="${bolum.getID()}"/>
					</div>	
					<%} %>
					<div class="form-group">
					  	Adı(*) : <input type="text" maxlength="120" required class="form-control" id="FormBolumAdi" name="FormBolumAdi" value="${bolum.getAdi()}"/>
					</div>
						
					<div class="form-group">				
					  	Bağlı Olduğu Fakülte(*) : <select name="FormBolumFakulte" id="BolumFakulte">
					  	<option selected="selected" hidden="true" disabled  > Fakülte Seçiniz.. </option>
					  		<c:forEach items="${fakultelist}" var="FakulteListesi">
					  			<option value="${FakulteListesi.getAdi()}">${FakulteListesi.getAdi()}</option>
					  		</c:forEach>
					  	</select>			
					</div>							  			
						
				<br><br>
				
					<input type="hidden" name="BolumID" value="${bolum.getID()}"/>
					<input type="hidden" id="BolumFakultee" value="${bolum.getFakulte()}"/>
					<script>		
							var deger = document.getElementById("BolumFakultee").value;
							var box = document.getElementById("BolumFakulte");
							var options = box.options;
								for(var option, j=0; option=options[j]; j++) {
									if(option.value == deger) {
										box.selectedIndex = j;
										break;
									}
								}						
					</script>	
					
					<input type="hidden" name="Komut"/>
				<button class="KaydetButon" style="background:url(Tick.png) no-repeat center ; width:30px;border:none; height:30px;" onclick="BolumEkleGuncelleSubmit('BolumEkleGuncelle');" ></button> <button type="reset" class="KaydetButon" style="background:url(Close.png) no-repeat center ; width:30px;border:none; height:30px;"></button>
			
				<br><br>
			</form>
	</div>
	
	
	</div>
	
	<div id="AtananDersler" class="tabcontent">
		<form name="AtananDerslerForm" method="GET" action="obsController">	
				<div id="AtananDersler" class="FormBasligi">
					<i> Atanmış Dersler </i>  <button class="AtananDerslerButton" onclick="DersAtamasubmitForm('DersAtamaListele')"><img src= "bolumicon.png" border="0" width="70" height="70"  alt="Ders atamak için lütfen tıklayın.."/> </button>
					
					<table class = "table table-striped table-bordered" border="1">
						<thead>
							<tr class= "thead-dark"> 
								<th scope="col">#</th>
								<th scope="col">Ders Adı</th>
								<th scope="col">Öğretmen Adı</th>
								<th scope="col">Bölüm Adı</th>
								<th scope="col">Dönem</th>
								<th scope="col">İşlemler</th>						
							</tr> 
						</thead>
						<tbody>	
							<% int DersAtamaSayacı = 1;%>
							<c:forEach items="${dersatamalist}" var="DersAtamaListesi">
							
								<tr>
									<th scope="row"><% out.println(DersAtamaSayacı); %></th>
									<td>  ${DersAtamaListesi.getDers()} </td>
									<td>  ${DersAtamaListesi.getKullanici()} </td>
									<td>  ${DersAtamaListesi.getBolum()} </td>
									<td>  ${DersAtamaListesi.getDonem()} </td>
									<td>  <button class="DuzenleButton" name="DersAtamaDuzenle" onclick="DersAtamasubmitForm('DersAtamaDuzenle')" value="${DersAtamaListesi.getID()}"><img src="DuzenleIcon.png"></button> <button class="SilButton" name="DersAtamaSil" onclick="if (confirm('Kaydı Silmek İstediğinizden Emin misiniz ?')) {DersAtamasubmitForm('DersAtamaSil');} else {return false;}" value="${DersAtamaListesi.getID()}"><img src="DeleteIcon.png"></button> </td>									
									<%DersAtamaSayacı++;%>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				<br><br>
				<input type="hidden" name="Komut"/>			
				</div>			
		</form>
	</div>
	
	<div id="DersAtamaEkle" class="tabcontent">
	
		<div class = "container" align="center">
	
		<h1>Ders Atama İşlemi</h1>
		<hr/>
				<form name="DersAtamaEkleForm" method="POST" action="obsController">
				
					<div class="form-group">				
					  	Ders : <select name="FormDersAtamaDers" id="DersAtamaDers">
					  	<option selected="selected" hidden="true" disabled  > Ders Seçiniz.. </option>
					  		<c:forEach items="${derslist}" var="DersListesi">
					  			<option value="${DersListesi.getID()}">${DersListesi.getAdi()}</option>
					  		</c:forEach>
					  	</select>
					</div>					
				
					<div class = "form-group">
						Öğretmen : <select name="FormDersAtamaKullanici" id="DersAtamaKullanici">
					  	<option selected="selected" hidden="true" disabled  > Öğretmen Seçiniz.. </option>
					  		<c:forEach items="${list}" var="OgretmenListesi">
					  			<option value="${OgretmenListesi.getSicilNo()}">${OgretmenListesi.getAdSoyad()}</option>
					  		</c:forEach>
					  	</select>
					</div>	
					<script>
							var deger = ${dersatama.getKullaniciSicilNo()};
							var box = document.getElementById("DersAtamaKullanici");
							var options = box.options;
								for(var option, j=0; option=options[j]; j++) {
									if(option.value == deger) {
										box.selectedIndex = j;
										break;
									}
								}						
					</script>
							
					<div class = "form-group">
						Bölüm : <select name="FormDersAtamaBolum" id="DersAtamaBolum">
					  	<option selected="selected" hidden="true" disabled  > Bölüm Seçiniz.. </option>
					  		<c:forEach items="${bolumlist}" var="BolumListesi">
					  			<option value="${BolumListesi.getID()}">${BolumListesi.getAdi()}</option>
					  		</c:forEach>
					  	</select>
					</div>	
					<script>
							var deger = ${dersatama.getBolumID()};
							var box = document.getElementById("DersAtamaBolum");
							var options = box.options;
								for(var option, j=0; option=options[j]; j++) {
									if(option.value == deger) {
										box.selectedIndex = j;
										break;
									}
								}						
					</script>
					
					<div class = "form-group">
						Dönem : <select name="FormDersAtamaDonem" id="DersAtamaDonem">
					  	<option selected="selected" hidden="true" disabled  > Dönem Seçiniz.. </option>
					  		<c:forEach items="${donemlist}" var="DonemListesi">
					  			<option value="${DonemListesi.getID()}">${DonemListesi.getAdi()}</option>
					  		</c:forEach>
					  	</select>
					</div>	
				
				<br><br>
				
					<input type="hidden" name="DersAtamaID" value="${dersatama.getID()}"/>
					<input type="hidden" id="DersAtamaDersIDD" value="${dersatama.getDersID()}"/>
					<input type="hidden" id="DersAtamaDonemIDD" value="${dersatama.getDonemID()}"/>
					<script>
							var deger = document.getElementById("DersAtamaDersIDD").value;
							var box = document.getElementById("DersAtamaDers");
							var options = box.options;
								for(var option, j=0; option=options[j]; j++) {
									if(option.value == deger) {
										box.selectedIndex = j;
										break;
									}
								}						
					</script>
					<script>
							var deger = document.getElementById("DersAtamaDonemIDD").value;
							var box = document.getElementById("DersAtamaDonem");
							var options = box.options;
								for(var option, j=0; option=options[j]; j++) {
									if(option.value==deger) {
										box.selectedIndex = j;
										break;
									}
								}						
					</script>	
					
					<input type="hidden" name="Komut"/>
					<input type="hidden" name="DersAtamaSicilNo" value="${Kullanici.getSicilNo()}"/>
			
					<input type="button" class="KaydetButon" onclick="DersAtamaEkleGuncelleSubmit('DersAtamaEkleGuncelle');" value="Kaydet"/> <button type="reset" class="KaydetButon">Temizle</button> 
				<br><br>
			</form>
		</div>
		
	</div>
	
	<% } %>
	

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script>

	<% if(session.getAttribute("Reset")==null||"".equals(session.getAttribute("Reset"))) {%>
	submitForm('Listele');
	<%}%>
	
	<% if("".equals(session.getAttribute("Hata"))||session.getAttribute("Hata")==null) { 
		
	} 
	else {
	%>
	var Hata = "<%= session.getAttribute("Hata") %>";
	
	alert(Hata);
	
	<%}
		session.setAttribute("Hata","");
	%>
	
	<% if((session.getAttribute("Tab")==null)||"".equals(session.getAttribute("Tab"))) {%>
	document.getElementById("defaultOpen").click();
	<%} else { %>
		var Tab = "<%=session.getAttribute("Tab")%>"
		document.getElementById(Tab).click();
	<%}
	session.setAttribute("Tab","");
	%>
	
	
function DonemEkleSubmit(komut) {
	
	document.DonemEkleForm.Komut.value=komut;
	document.DonemEkleForm.submit();
}
	
function DersAtamaEkleGuncelleSubmit(komut) {
	
	document.DersAtamaEkleForm.Komut.value=komut;
	document.DersAtamaEkleForm.submit();
}
	
function BolumEkleGuncelleSubmit(komut) {
	
	var FormBolumAdi = document.getElementById("FormBolumAdi").value;
	var BolumAdiExpression = /(?!.*\d).{3,}/;
	
	document.getElementById("FormBolumAdi").style.borderStyle = "none";
	document.getElementById("FormBolumAdi").style.borderBottom = "1px solid #ddd";
	
	if(BolumAdiExpression.test(FormBolumAdi)) {
		document.BolumEkleForm.Komut.value=komut;
		document.BolumEkleForm.submit();
	}
	else {
		alert("Bölüm Adı Sayı İçermemeli ve En Az 3 Karakter Olmalıdır.");
		document.getElementById("FormBolumAdi").style.border = "thick solid #DF2828";
	}
	
}
	
function DersEkleGuncelleSubmit(komut) {
	
	var FormDersAdi = document.getElementById("FormDersAdi").value;
	var FormDersKredi = document.getElementById("FormDersKredi").value;
	
	//Borderlarını Eski Haline Getirdim

	document.getElementById("FormDersAdi").style.borderStyle = "none";
	document.getElementById("FormDersAdi").style.borderBottom = "1px solid #ddd";
	document.getElementById("FormDersKredi").style.borderStyle = "none";
	document.getElementById("FormDersKredi").style.borderBottom = "1px solid #ddd";
	
	if(FormDersKredi<=6&&FormDersKredi>=1) {
		if(FormDersAdi.length>=3) {
			document.DersEkleForm.Komut.value=komut;
			document.DersEkleForm.submit();
		}
		else {
			alert("Ders Adı En Az 3 Karakter Olmalıdır.");
			document.getElementById("FormDersAdi").style.border = "thick solid #DF2828";
		}
	}
	else {
		alert("Krediniz [1-6] arasında olmalıdır");
		document.getElementById("FormDersKredi").style.border = "thick solid #DF2828";
	}
	
	
}	

function SifreGuncelleSubmit(komut) {
	var SifreExpression = /(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?!.*\s).{8,20}/;
	var GercekEskiSifre = document.getElementById("ProfilSifre").value;
	var ProfilEskiSifre = document.getElementById("ProfilEskiSifre").value;
	var ProfilYeniSifre = document.getElementById("ProfilYeniSifre").value;
	var ProfilTekrarSifre = document.getElementById("ProfilTekrarSifre").value;
	
	document.getElementById("ProfilTekrarSifre").style.borderStyle = "none";
	document.getElementById("ProfilTekrarSifre").style.borderBottom = "1px solid #ddd";
	document.getElementById("ProfilYeniSifre").style.borderStyle = "none";
	document.getElementById("ProfilYeniSifre").style.borderBottom = "1px solid #ddd";
	document.getElementById("ProfilEskiSifre").style.borderStyle = "none";
	document.getElementById("ProfilEskiSifre").style.borderBottom = "1px solid #ddd";
	
	if(GercekEskiSifre==ProfilEskiSifre) {
		if(SifreExpression.test(ProfilYeniSifre)) {
			if(ProfilYeniSifre==ProfilTekrarSifre) {
				document.SifreGuncelleForm.Komut.value=komut;
				document.SifreGuncelleForm.submit();
			}
			else {
				alert("Dikkat ! Yeni Şifreniz Tekrarla Uyuşmamaktadır!");
				document.getElementById("ProfilYeniSifre").style.border = "thick solid #DF2828";
				document.getElementById("ProfilTekrarSifre").style.border = "thick solid #DF2828";
			}
		}
		else {
			alert("Dikkat ! Yeni Şifreniz En Az 1 rakam, 1 küçük ve 1 büyük harf içermeli ve [8-20] karakter arasında olmalıdır.(Boşluk İçermemelidir!)");
			document.getElementById("ProfilYeniSifre").style.border = "thick solid #DF2828";
		}
	}
	else {
		alert("Dikkat ! Eski Şifreniz Yanlış Girilmiştir!");
		document.getElementById("ProfilEskiSifre").style.border = "thick solid #DF2828";
	}
}

	
function ProfilGuncelleSubmit(komut) {
	
	var ProfilEposta = document.getElementById("ProfilEposta").value;
	var EpostaExpression = 	/^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/;
	
	
	document.getElementById("ProfilEposta").style.borderStyle = "none";
	document.getElementById("ProfilEposta").style.borderBottom = "1px solid #ddd";
	
	
	if(EpostaExpression.test(ProfilEposta)) {
		document.ProfilGuncelleForm.Komut.value=komut;
		document.ProfilGuncelleForm.submit();
	}
		
	else {
		alert("Dikkat ! E-Posta adresiniz yanlış girilmiştir. Lütfen kontrol ediniz.(Örn:'ornekemail@gmail.com')");
		document.getElementById("ProfilEposta").style.border = "thick solid #DF2828";
	}
	
}
	
function KullaniciEkleGuncelleSubmit(komut) {
	//Gerekli value ve Expression tanımlamaları yapıldı
	var KullaniciSicilNo = document.getElementById("KullaniciSicilNo").value;
	var KullaniciEposta = document.getElementById("KullaniciEposta").value;
	var KullaniciTC = document.getElementById("KullaniciTC").value;
	var KullaniciSifre = document.getElementById("KullaniciSifre").value;
	var KullaniciAdSoyad = document.getElementById("KullaniciAdSoyad").value;
	var EpostaExpression = 	/^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/;
	var SifreExpression = /(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?!.*\s).{8,20}/;
	var AdSoyadExpression = /(?!.*\d)(?=.*\s).{5,}/;
	
	//Borderlarını Eski Haline Getirdim
	document.getElementById("KullaniciAdSoyad").style.borderStyle = "none";
	document.getElementById("KullaniciAdSoyad").style.borderBottom = "1px solid #ddd";
	document.getElementById("KullaniciTC").style.borderStyle = "none";
	document.getElementById("KullaniciTC").style.borderBottom = "1px solid #ddd";
	document.getElementById("KullaniciSifre").style.borderStyle = "none";
	document.getElementById("KullaniciSifre").style.borderBottom = "1px solid #ddd";
	document.getElementById("KullaniciSicilNo").style.borderStyle = "none";
	document.getElementById("KullaniciSicilNo").style.borderBottom = "1px solid #ddd";
	document.getElementById("KullaniciEposta").style.borderStyle = "none";
	document.getElementById("KullaniciEposta").style.borderBottom = "1px solid #ddd";
	
	if(EpostaExpression.test(KullaniciEposta)) 
	{
		if(KullaniciSicilNo.length==9) {
			if(KullaniciTC.length==11) {
				var TC = [];
				var q;
				for(q=0;q<11;q++) {
					TC.push(KullaniciTC.charAt(q));
				}

				var a = ((Number(TC[0])+Number(TC[2])+Number(TC[4])+Number(TC[6])+Number(TC[8]))*7)-(Number(TC[1])+Number(TC[3])+Number(TC[5])+Number(TC[7]));
				var onuncu = a.toString();
				onuncu = onuncu.charAt(onuncu.length-1);
				var b = Number(TC[0])+Number(TC[1])+Number(TC[2])+Number(TC[3])+Number(TC[4])+Number(TC[5])+Number(TC[6])+Number(TC[7])+Number(TC[8])+Number(onuncu);
				var onbirinci = b.toString();
				onbirinci = onbirinci.charAt(onbirinci.length-1);
				
				if(onuncu==KullaniciTC.charAt(9)&&onbirinci==KullaniciTC.charAt(10)) {
					if(SifreExpression.test(KullaniciSifre)) {
						if(AdSoyadExpression.test(KullaniciAdSoyad)) {
							document.KullaniciEkleForm.Komut.value=komut;
							document.KullaniciEkleForm.submit();
						}
						else {
							alert("Ad Soyad Sayı İçermemeli, Boşluk İçermeli ve En Az 5 Karakter Olmalıdır.");
							document.getElementById("KullaniciAdSoyad").style.border = "thick solid #DF2828";
						}
					}
					else {
						alert("Şifreniz En Az 1 rakam, 1 küçük ve 1 büyük harf içermeli ve [8-20] karakter arasında olmalıdır.(Boşluk İçermemelidir!)");
						document.getElementById("KullaniciSifre").style.border = "thick solid #DF2828";
					}
					
				}
				else {
					alert("Dikkat ! TC Kimlik Numarası Değeriniz yanlış girilmiştir. Lütfen kontrol ediniz.");
					document.getElementById("KullaniciTC").style.border = "thick solid #DF2828";
				}

			}
			else {
				alert("Dikkat ! TC Kimlik Numarası Değeriniz eksik girilmiştir. Lütfen kontrol ediniz.");
				document.getElementById("KullaniciTC").style.border = "thick solid #DF2828";
			}
		}
		else {
			alert("Dikkat ! Sicil Numarası Değeriniz eksik girilmiştir. Lütfen kontrol ediniz.(9 karakter uzunluğunda olmalıdır.)");
			document.getElementById("KullaniciSicilNo").style.border = "thick solid #DF2828";
		}
	} 
	else {
		alert("Dikkat ! E-Posta adresiniz yanlış girilmiştir. Lütfen kontrol ediniz.(Örn:'ornekemail@gmail.com')");
		document.getElementById("KullaniciEposta").style.border = "thick solid #DF2828";
	}

}
	
function listeleSubmit(komut,order) {
	document.Form.Komut.value=komut;
	document.Form.Order.value=order;
	document.Form.submit();
}

function submitForm(komut){
	document.Form.Komut.value=komut;
	document.Form.submit();
}

function DonemsubmitForm(donemkomut) {
	document.DonemForm.Komut.value=donemkomut;
	document.DonemForm.submit();
}

function DerssubmitForm(derskomut) {
	document.DersForm.Komut.value=derskomut;
	document.DersForm.submit();
}

function DersAtamasubmitForm(dersatamakomut) {
	document.AtananDerslerForm.Komut.value=dersatamakomut;
	document.AtananDerslerForm.submit();
}

function DerslisteleSubmit(derskomut,dersorder) {
	document.DersForm.Komut.value=derskomut;
	document.DersForm.DersOrder.value=dersorder;
	document.DersForm.submit();
}

function BolumsubmitForm(bolumkomut) {
	document.BolumForm.Komut.value=bolumkomut;
	document.BolumForm.submit();
}

function BolumlisteleSubmit(bolumkomut,bolumorder) {
	document.BolumForm.Komut.value=bolumkomut;
	document.BolumForm.BolumOrder.value=bolumorder;
	document.BolumForm.submit();
}

function CikisSubmit(komut) {
	document.AnaSayfaForm.Komut.value=komut;
	document.AnaSayfaForm.submit();
}

function Degisti(Id) {
	
	var box = document.getElementById(Id);
	var Islem = box.options[box.selectedIndex].value;
	if(Islem==="KullaniciEkleButton") {
		submitForm('KullaniciEkle');
	}
	else if(Islem==="DersEkleButton") {
		DerssubmitForm('DersEkle');
	}
	else if(Islem==="BolumEkleButton") {
		BolumsubmitForm('BolumEkle');
	}
	else if(Islem==="DonemEkleButton") {
		document.getElementById('DonemEkleButton').click();
	}
	else if(Islem==="DersAtamaEkleButton") {
		DersAtamasubmitForm('DersAtamaEkle');
	}
	else {
		if(Id=="ProfilSelectBox") {
			if(box.selectedIndex!=0) {
				box.selectedIndex=0;
			}
		}
		document.getElementById(Islem).click();
	}

	
}

function TestOkumaKisitla() {
	var Ders = document.getElementById("FormTestOkumaDers").value;
	var SicilNo = document.getElementById("TestOkumaSicilNo").value;	
	var box = document.getElementById("FormTestOkumaBolum");
	var options = box.options;
	var box2 = document.getElementById("FormTestOkumaDonem");
	var options2 = box2.options;
	var BolumList = [];
	var DonemList = [];
	
	document.getElementById("FormTestOkumaBolum").selectedIndex = "0";
	document.getElementById("FormTestOkumaDonem").selectedIndex = "0";
	
	for(var q =0;q<options.length;q++) {
		options[q].hidden = true;
	}
	for(var kk = 0;kk<options2.length;kk++) {
		options2[kk].hidden = true;
	}
	
	<%
	DersAtamaDao dersatamaDAO = new DersAtamaDao();
	List<DersAtama> liste = dersatamaDAO.getList(0);

	for(int i =0;i<liste.size();i++) {
		String derskodu = liste.get(i).getDersID();
		int bolumkodu = liste.get(i).getBolumID();
		int sicil = liste.get(i).getKullaniciSicilNo();
		String donem = liste.get(i).getDonemID();
		%> 
		var ListeBolum = "<%=bolumkodu%>";
		var ListeDers = "<%=derskodu%>";
		var ListeSicil = "<%=sicil%>";
		var ListeDonem = "<%=donem%>";
		if((ListeSicil==SicilNo)&&(ListeDers==Ders)) {
			if(!BolumList.includes(ListeBolum))
			BolumList.push(ListeBolum);
			if(!DonemList.includes(ListeDonem))
			DonemList.push(ListeDonem);
		}
		<%
	}%>
	for(var w = 0;w<BolumList.length;w++) {
		for(var z=0; z<options.length;z++) {
			if(BolumList[w]==options[z].value) {
				options[z].hidden = false;
			}
		}	
	}
	for(var p = 0;p<DonemList.length;p++) {
		for(var t=0; t<options2.length;t++) {
			if(DonemList[p]==options2[t].value) {
					options2[t].hidden = false;		
			}
		}	
	}
}

function DonemKisitla() {
	var box = document.getElementById("DonemYil");
	var box2 = document.getElementById("FormDonem");
	var options = box.options;
	var options2 = box2.options;
	for(var option, j=0; option=options2[j]; j++) {
		option.hidden = false;
	}	
	var SeciliYil = options[box.selectedIndex].value;
	

	<%
	DonemDao donemDAO = new DonemDao();
	List<Donem> donemliste = donemDAO.getList();
	int Yilimiz = 0;
	int Donemimiz =0;
	for(int i=0;i<donemliste.size();i++) {
		String Parselayici = donemliste.get(i).getID();
		Yilimiz = Integer.parseInt(Parselayici.substring(0,4));
		Donemimiz = Integer.parseInt(Parselayici.substring(4,5));
		%> var Yil = "<%=Yilimiz%>";
		var Donemm = "<%=Donemimiz%>";
		if(SeciliYil==Yil){
			if(Donemm=="1") {
				options2[1].hidden = true;
			}
			if(Donemm=="2") {
				options2[2].hidden = true;
			}
			if(Donemm=="3") {
				options2[3].hidden = true;
			}
			if(Donemm=="4") {
				options2[4].hidden = true;
			}
			
		}	
	<%}%>
}

function SifreGorunurluk(Istek,Id) {
	
	var elmnt = document.getElementById(Id);
	if(Istek=="Goster"){
		elmnt.type="text";
	}
	else {
		elmnt.type="password";
	}
}

function openPage(pageName, elmnt) {
	
	  var i, tabcontent, tablinks;
	  tabcontent = document.getElementsByClassName("tabcontent");
	  for (i = 0; i < tabcontent.length; i++) {
	    tabcontent[i].style.display = "none";
	    
	}	  
	  tablinks = document.getElementsByClassName("tablink");
	  for (i = 0; i < tablinks.length; i++) {
		    tablinks[i].style.backgroundColor = "#000000";
		}
	  document.getElementById(pageName).style.display = "block";	  
}


$(document).ready(function () {
    $(document).ready(function () {
        $('table').DataTable({                    
            dom: 'Blfrtip',
            buttons: [{
                text: 'Excele Yaz',                       
                extend: 'excelHtml5',
                exportOptions: {
                    modifier: {
                        selected: true
                    },
                    columns: [0, 1, 2, 3],
                    format: {
                        header: function (data, columnIdx) {
                            return data;
                        },
                        body: function (data, column, row) {
                            // Strip $ from salary column to make it numeric
                            debugger;
                            return column === 4 ? "" : data;
                        }
                    }
                },
                footer: false,
                customize: function (xlsx) {
                    var sheet = xlsx.xl.worksheets['sheet1.xml'];
                    //$('c[r=A1] t', sheet).text( 'Custom text' );
                    //$('row c[r^="C"]', sheet).attr('s', '2');
                }
            }]
        });
    });
});

</script>


</body>
</html>
package com.OBS.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.OBS.dao.*;
import com.OBS.model.*;


public class obsController extends HttpServlet{
	
	
	private static final long serialVersionUID = 1L;
	KullaniciDao kullaniciDAO = new KullaniciDao();
	DersDao dersDAO = new DersDao();
	BolumDao bolumDAO = new BolumDao();
	DersAtamaDao dersatamaDAO = new DersAtamaDao();
	UnvanDao unvanDAO = new UnvanDao();
	FakulteDao fakulteDAO = new FakulteDao();
	DersKazanimDao derskazanimDAO = new DersKazanimDao();
	BolumKazanimDao bolumkazanimDAO = new BolumKazanimDao();
	DonemDao donemDAO = new DonemDao();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("Komut");
		
		switch(action) {
		
		case "Listele" :
			DersListele(request,response,false);
			BolumListele(request,response,false);
			KullaniciListele(request,response,false);
			DersAtamaListele(request,response,false,false);
			DonemListele(request,response,false);
			MainPage(request,response);
			break;
			
		case "Cikis" :
			Cikis(request,response);
			break;
			
			
			//DERS
		case "DersListele" :
			DersListele(request,response,true);
			break;
			
		case "DersSil" :
			DersSil(request,response);
			break;
			
		case "DersEkle" :
			DersRedirect(request,response,"Ekle");
			break;
		
		case "DersDuzenle" :
			DersRedirect(request,response,"Duzenle");
			break;
			
		case "DersKazanimEkle" :
			DersKazanimEkle(request,response);
			break;
		
		case "DersAtamaEkle" :
			DersAtamaRedirect(request,response,"Ekle");
			break;
			
		case "DersAtamaDuzenle" :
			DersAtamaRedirect(request,response,"Duzenle");
			break;
			
		case "DersAtamaListele" :
			DersAtamaListele(request,response,true,false);
			break;
			
		case "DersAtamaSil" :
			DersAtamaSil(request,response);
			break;
	
			
			//KULLANICI
		case "KullaniciListele" :
			KullaniciListele(request,response,true);
			break;
			
		case "KullaniciSil" :
			KullaniciSil(request,response);
			break;
			
		case "KullaniciEkle" :
			KullaniciRedirect(request,response,"Ekle");
			break;
			
		case "KullaniciDuzenle" :
			KullaniciRedirect(request,response,"Duzenle");
			break;
			
			
			//BOLUM
		case "BolumListele" :
			BolumListele(request,response,true);
			break;
			
		case "BolumSil" :
			BolumSil(request,response);
			break;
			
		case "BolumEkle" :
			BolumRedirect(request,response,"Ekle");
			break;
			
		case "BolumDuzenle" :
			BolumRedirect(request,response,"Duzenle");
			break;
			
		case "BolumKazanimEkle" :
			BolumKazanimEkle(request,response);
			break;
			
			
			//DONEM
		case "DonemListele" :
			DonemListele(request,response,true);
			break;
		
		case "DonemSil" :
			DonemSil(request,response);
			break;
		}		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
	
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("Komut");
		
		switch(action) {
	
			case "Giris" :
				GirisKontrol(request,response);
				break;

			case "KullaniciEkleGuncelle" :
				KullaniciEkleGuncelle(request,response);
				break;
				
			case "DersEkleGuncelle" :
				DersEkleGuncelle(request,response);
				break;
				
			case "DersAtamaEkleGuncelle" :
				DersAtamaEkleGuncelle(request,response);
				break;
				
			case "BolumEkleGuncelle" :
				BolumEkleGuncelle(request,response);
				break;
				
			case "DonemEkle" :
				DonemEkle(request,response);
				break;
				
			case "ProfilGuncelle" :
				ProfilGuncelle(request,response);
				break;
				
				
				//TestOkuma	
			case "SinavIsaretlemeleri":
				SinavCek(request,response);
				break;
		}
	}
	
	


	//Giris-Cikis Ýslemleri
	//-----------------------
	
	private void GirisKontrol(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String Sifre = request.getParameter("GirisSifre");
		int SicilNo = Integer.parseInt(request.getParameter("GirisSicilNo"));
		int admin = 0;
		boolean auth = false;
		List<Kullanici> kullanicilistesi = kullaniciDAO.getList("");
		
			for(int i=0; i<kullanicilistesi.size();i++) {
				if(SicilNo==kullanicilistesi.get(i).getSicilNo()) {
					if(Sifre.equals(kullanicilistesi.get(i).getSifre())) {
						admin = kullanicilistesi.get(i).getAdmin();
						if(admin==0)
						request.getSession().setAttribute("Auth", "NormalKullanici");
						else if(admin==1)
						request.getSession().setAttribute("Auth", "Admin");
						
						request.getSession().setAttribute("Kullanici", kullanicilistesi.get(i));
						List<DersAtama> dersatamaliste = dersatamaDAO.getList(kullanicilistesi.get(i).getSicilNo());
						request.getSession().setAttribute("ListelenmisDersAtama", dersatamaliste);
						request.getSession().setAttribute("Dikkat", "");
						auth=true;
						break;
										
					
					}
					else {
						request.getSession().setAttribute("Dikkat", "Girmiþ Olduðunuz Þifre Hatalý !");
						break;
					}
				}
				else {
					request.getSession().setAttribute("Dikkat", "Girdiðiniz SicilNo'ya Ait Bir Kullanýcý Bulunamadý !");
					
				}
			}
				
		
		if(auth)
		response.sendRedirect("AnaMenu.jsp");	
		else 
		response.sendRedirect("LoginRegister.jsp");
		
		
	}
	
	private void Cikis (HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		request.getSession().setAttribute("Auth", "");
		request.getSession().setAttribute("Cookie", "Sil");
		response.sendRedirect("LoginRegister.jsp");
		
	}
	
	
	
	
	//Kullanici Ýslemleri
	//---------------------------
	
	
	private void KullaniciSil(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int SicilNo = Integer.parseInt(request.getParameter("KullaniciSil"));
		
		if(kullaniciDAO.Sil(SicilNo)) {
			request.getSession().setAttribute("Tab", "KullaniciButton");
		}
		else {
			request.getSession().setAttribute("Hata", "Dikkat! Ýþlem Baþarýsýz !");
		}
		KullaniciListele(request,response,true);
		
	}
	
	private void KullaniciListele(HttpServletRequest request, HttpServletResponse response, boolean yenile) throws IOException {

		String Order = request.getParameter("Order");
		List<Kullanici> kullanicilistesi = kullaniciDAO.getList(Order);
		request.getSession().setAttribute("list", kullanicilistesi);
		if(yenile) {
		request.getSession().setAttribute("Tab", "KullaniciButton");
		response.sendRedirect("AnaMenu.jsp");
		}
		
		
	}
	
	private void KullaniciRedirect(HttpServletRequest request, HttpServletResponse response, String Islem) throws IOException {
		
		String SicilNo = request.getParameter("KullaniciDuzenle");
		
		BolumListele(request,response,false);
		
		
		if("Duzenle".equals(Islem)) {
			Kullanici DuzenlenenKullanici = kullaniciDAO.get(Integer.parseInt(SicilNo));
			request.getSession().setAttribute("kullanici", DuzenlenenKullanici);
			request.getSession().setAttribute("Tab", "KullaniciEkleButton");
			request.getSession().setAttribute("SifreVarmi", "");
			response.sendRedirect("AnaMenu.jsp");
		}
		else if("Ekle".equals(Islem)) {
			Kullanici nullkullanici = new Kullanici();
			request.getSession().setAttribute("kullanici",nullkullanici);
			request.getSession().setAttribute("Tab", "KullaniciEkleButton");
			request.getSession().setAttribute("SifreVarmi", "Evet");
			response.sendRedirect("AnaMenu.jsp");
		}
		
	}
	
	private void KullaniciEkleGuncelle(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int SicilNo = Integer.parseInt(request.getParameter("KullaniciSicil"));
		Kullanici yenikullanici = new Kullanici();
		
		yenikullanici.setSicilNo(Integer.parseInt(request.getParameter("KullaniciSicilNo")));
		yenikullanici.setAdSoyad(request.getParameter("KullaniciAdSoyad"));
		yenikullanici.setDogumTarihi(request.getParameter("KullaniciDogumTarihi"));
		yenikullanici.setEposta(request.getParameter("KullaniciEposta"));
		yenikullanici.setSifre(request.getParameter("KullaniciSifre"));
		yenikullanici.setTC(request.getParameter("KullaniciTC"));
		yenikullanici.setBolumID(Integer.parseInt(request.getParameter("KullaniciBolum")));
		yenikullanici.setCinsiyet(request.getParameter("KullaniciCinsiyet"));
		yenikullanici.setUnvanID(Integer.parseInt(request.getParameter("KullaniciUnvan")));
		yenikullanici.setAdmin(Integer.parseInt(request.getParameter("KullaniciAdmin")));
		
		if(SicilNo==0) {
			if(kullaniciDAO.Ekle(yenikullanici))
				request.getSession().setAttribute("Tab", "KullaniciButton");
			else
				request.getSession().setAttribute("Hata", "Dikkat ! Kullanýcý Eklenemedi !");
		}
		else {
			if(kullaniciDAO.Guncelle(yenikullanici))
				request.getSession().setAttribute("Tab", "KullaniciButton");
			else
				request.getSession().setAttribute("Hata", "Dikkat ! Kullanýcý Güncellenemedi !");
		}
		KullaniciListele(request,response,true);
		
	}
	
	
	//Ders Ýþlemleri
	//-------------------------
	
	private void DersListele(HttpServletRequest request, HttpServletResponse response, boolean yenile) throws IOException {
		
		String Order = request.getParameter("DersOrder");
		List<Ders> derslistesi = dersDAO.getList(Order);
		request.getSession().setAttribute("derslist", derslistesi);
		if(yenile) {
		request.getSession().setAttribute("Tab", "DersButton");
		response.sendRedirect("AnaMenu.jsp");
		}
		
	}

	private void DersSil(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String ID = request.getParameter("DersSil");
		
		if(dersDAO.Sil(ID)) {
			request.getSession().setAttribute("Tab", "DersButton");
		}
		else {
			request.getSession().setAttribute("Hata", "Dikkat! Ýþlem Baþarýsýz !");
		}
		DersListele(request,response,true);
		
	}
	
	private void DersRedirect(HttpServletRequest request, HttpServletResponse response, String Islem) throws IOException {
		
		String ID = request.getParameter("DersDuzenle");
		
		BolumListele(request,response,false);
		
		if("Duzenle".equals(Islem)) {
			Ders DuzenlenenDers = dersDAO.get(ID);
			request.getSession().setAttribute("ders", DuzenlenenDers);
			request.getSession().setAttribute("Tab", "DersEkleButton");
			response.sendRedirect("AnaMenu.jsp");
		}
		else if("Ekle".equals(Islem)) {
			Ders nullders = new Ders();
			request.getSession().setAttribute("ders",nullders);
			request.getSession().setAttribute("Tab", "DersEkleButton");
			response.sendRedirect("AnaMenu.jsp");
		}
		
	}
	
	private void DersEkleGuncelle(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String ID = request.getParameter("DersID");
		Ders yeniders = new Ders();
		int redirect =0;
		
		yeniders.setID(request.getParameter("FormDersID"));
		yeniders.setAdi(request.getParameter("FormDersAdi"));
		yeniders.setKredi(Integer.parseInt(request.getParameter("FormDersKredi")));
		yeniders.setBolumID(Integer.parseInt(request.getParameter("FormDersBolum")));
		
		if("".equals(ID)||ID==null) {
			if(dersDAO.Ekle(yeniders)) {
				request.getSession().setAttribute("Tab", "DersButton");
				request.getSession().setAttribute("KazanimDersID", request.getParameter("FormDersID"));
				request.getSession().setAttribute("KazanimDersAdi", request.getParameter("FormDersAdi"));
				redirect = 1;
			}
			else
				request.getSession().setAttribute("Hata", "Dikkat ! Ders Eklenemedi !");
		}
		else {
			if(dersDAO.Guncelle(yeniders))
				request.getSession().setAttribute("Tab", "DersButton");
			else
				request.getSession().setAttribute("Hata", "Dikkat ! Ders Güncellenemedi !");
		}
		if(redirect==0)
		DersListele(request,response,true);
		else
		response.sendRedirect("DersKazanim.jsp");
		
	}
	
	private void DersKazanimEkle(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		DersKazanim derskazanim = new DersKazanim();
		derskazanim.setKazanim(request.getParameter("Kazanimlar"));
		derskazanim.setDersID(request.getParameter("KazanimDersID"));
		
			if(derskazanimDAO.Ekle(derskazanim)) {
				
			}
			else {
				request.getSession().setAttribute("Hata", "Dikkat! Ýþlem Baþarýsýz !");
			}
		DersListele(request,response,true);
	}
	
	private void DersAtamaListele(HttpServletRequest request, HttpServletResponse response,boolean yenile,boolean TestOkuma) throws IOException {
		
		List<DersAtama> dersatamalistesi = dersatamaDAO.getList(0);
		if(TestOkuma) {
			List<DersAtama> ListelenmisDers = dersatamaDAO.getList(Integer.parseInt(request.getParameter("DersAtamaSicilNo")));
			request.getSession().setAttribute("ListelenmisDersAtama", ListelenmisDers);
		}	
		request.getSession().setAttribute("dersatamalist", dersatamalistesi);
		if(yenile) {
		request.getSession().setAttribute("Tab", "AtananDerslerButton");
		response.sendRedirect("AnaMenu.jsp");
		}
		
	}
	
	private void SinavCek(HttpServletRequest request, HttpServletResponse response) {
		String a = request.getParameter("SinavIsaretlemeleri");
		System.out.println(a);
	}
	
	private void DersAtamaSil(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String ID = request.getParameter("DersAtamaSil");
		
		if(dersatamaDAO.Sil(Integer.parseInt(ID))) {
			request.getSession().setAttribute("Tab", "AtananDerslerButton");
		}
		else {
			request.getSession().setAttribute("Hata", "Dikkat! Ýþlem Baþarýsýz !");
		}
		DersAtamaListele(request,response,true,false);
		
	}
	
	private void DersAtamaRedirect(HttpServletRequest request, HttpServletResponse response, String Islem) throws IOException {
		
		String ID = request.getParameter("DersAtamaDuzenle");
		
		BolumListele(request,response,false);
		DersListele(request,response,false);
		KullaniciListele(request,response,false);
		DonemListele(request,response,false);
		
		
		if("Duzenle".equals(Islem)) {
			DersAtama DuzenlenenDersAtama = dersatamaDAO.get(Integer.parseInt(ID));
			request.getSession().setAttribute("dersatama", DuzenlenenDersAtama);
			request.getSession().setAttribute("Tab", "DersAtamaEkleButton");
			response.sendRedirect("AnaMenu.jsp");
		}
		else if("Ekle".equals(Islem)) {
			DersAtama nulldersatama = new DersAtama();
			request.getSession().setAttribute("dersatama",nulldersatama);
			request.getSession().setAttribute("Tab", "DersAtamaEkleButton");
			response.sendRedirect("AnaMenu.jsp");
		}
		
	}
	
	private void DersAtamaEkleGuncelle(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int ID = Integer.parseInt(request.getParameter("DersAtamaID"));
		DersAtama yenidersatama = new DersAtama();
		
		yenidersatama.setID(ID);
		yenidersatama.setDonemID(request.getParameter("FormDersAtamaDonem"));
		yenidersatama.setDersID(request.getParameter("FormDersAtamaDers"));
		yenidersatama.setKullaniciSicilNo(Integer.parseInt(request.getParameter("FormDersAtamaKullanici")));
		yenidersatama.setBolumID(Integer.parseInt(request.getParameter("FormDersAtamaBolum")));

		
		if(ID==0) {
			if(dersatamaDAO.Ekle(yenidersatama))
				request.getSession().setAttribute("Tab", "AtananDerslerButton");
			else
				request.getSession().setAttribute("Hata", "Dikkat ! Ders Atanamadý !");
		}
		else {
			if(dersatamaDAO.Guncelle(yenidersatama))
				request.getSession().setAttribute("Tab", "AtananDerslerButton");
			else
				request.getSession().setAttribute("Hata", "Dikkat ! Atanmýþ Ders Güncellenemedi !");
		}
		DersAtamaListele(request,response,true,true);
		
	}
	
	//Bolum Ýþlemleri
	//---------------------
	
	private void BolumListele(HttpServletRequest request, HttpServletResponse response,boolean yenile) throws IOException {
		
		String Order = request.getParameter("BolumOrder");
		List<Bolum> bolumlistesi = bolumDAO.getList(Order);
		request.getSession().setAttribute("bolumlist", bolumlistesi);
		if(yenile) {
		request.getSession().setAttribute("Tab", "BolumButton");
		response.sendRedirect("AnaMenu.jsp");
		}
		
	}
	
	private void BolumSil(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int ID = Integer.parseInt(request.getParameter("BolumSil"));
		
		if(bolumDAO.Sil(ID)) {
			request.getSession().setAttribute("Tab", "BolumButton");
		}
		else {
			request.getSession().setAttribute("Hata", "Dikkat! Ýþlem Baþarýsýz !");
		}
		BolumListele(request,response,true);
	}
	
	private void BolumRedirect(HttpServletRequest request, HttpServletResponse response, String Islem) throws IOException {
		
		String ID = request.getParameter("BolumDuzenle");		
		
		if("Duzenle".equals(Islem)) {
			Bolum DuzenlenenBolum = bolumDAO.get(Integer.parseInt(ID),"");
			request.getSession().setAttribute("bolum", DuzenlenenBolum);
			request.getSession().setAttribute("Tab", "BolumEkleButton");
			request.getSession().setAttribute("Islem", "Duzenle");
			response.sendRedirect("AnaMenu.jsp");
		}
		else if("Ekle".equals(Islem)) {
			Bolum nullbolum = new Bolum();
			request.getSession().setAttribute("bolum",nullbolum);
			request.getSession().setAttribute("Tab", "BolumEkleButton");
			request.getSession().setAttribute("Islem", "Ekle");
			response.sendRedirect("AnaMenu.jsp");
		}
		
	}
	
	private void BolumEkleGuncelle(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int redirect = 0;
		int ID = Integer.parseInt(request.getParameter("BolumID"));
		Bolum yenibolum = new Bolum();
		
		yenibolum.setID(ID);
		yenibolum.setAdi(request.getParameter("FormBolumAdi"));
		yenibolum.setFakulte(request.getParameter("FormBolumFakulte"));
		
		if(ID==0) {
			if(bolumDAO.Ekle(yenibolum)) {
				Bolum IDAlma = bolumDAO.get(0, request.getParameter("FormBolumAdi"));
				request.getSession().setAttribute("Tab", "BolumButton");
				request.getSession().setAttribute("KazanimBolumID", IDAlma.getID());
				request.getSession().setAttribute("KazanimBolumAdi", request.getParameter("FormBolumAdi"));
				redirect = 1;
			}
			else
				request.getSession().setAttribute("Hata", "Dikkat ! Bolum Eklenemedi !");
		}
		else {
			if(bolumDAO.Guncelle(yenibolum))
				request.getSession().setAttribute("Tab", "BolumButton");
			else
				request.getSession().setAttribute("Hata", "Dikkat ! Bolum Güncellenemedi !");
		}
		if(redirect==0)
			BolumListele(request,response,true);
		else
			response.sendRedirect("BolumKazanim.jsp");
		
		
	}
	
	private void BolumKazanimEkle(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		BolumKazanim bolumKazanim = new BolumKazanim();
		bolumKazanim.setKazanim(request.getParameter("Kazanimlar"));
		bolumKazanim.setBolumID(request.getParameter("KazanimBolumID"));
		
			if(bolumkazanimDAO.Ekle(bolumKazanim)) {
				
			}
			else {
				request.getSession().setAttribute("Hata", "Dikkat! Ýþlem Baþarýsýz !");
			}

		BolumListele(request,response,true);
		
	}
	
	//DÖNEM ÝÞLEMLERÝ
	//---------------------
	private void DonemListele(HttpServletRequest request, HttpServletResponse response,boolean yenile) throws IOException {
		
		List<Integer> Yil = new ArrayList<Integer>();
		List<Donem> donemlistesi = donemDAO.getList();
		
		for(int i=0;i<donemlistesi.size();i++) {
				String Parselayici = donemlistesi.get(i).getID();
				int Yilimiz = Integer.parseInt(Parselayici.substring(0,4));
				Yil.add(Yilimiz);
			}
		request.getSession().setAttribute("yil", Yil);
		request.getSession().setAttribute("donemlist", donemlistesi);
		if(yenile) {
		request.getSession().setAttribute("Tab", "DonemButton");
		response.sendRedirect("AnaMenu.jsp");
		}	
	}
	
	private void DonemSil(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String ID = request.getParameter("DonemSil");
		
		if(donemDAO.Sil(ID)) {
			request.getSession().setAttribute("Tab", "DonemButton");
		}
		else {
			request.getSession().setAttribute("Hata", "Dikkat! Ýþlem Baþarýsýz !");
		}
		DonemListele(request,response,true);
	}
	
	private void DonemEkle(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		Donem donem = new Donem();
		String Yil = request.getParameter("FormDonemYil");
		String Donem = request.getParameter("FormDonem");
		String ID = Yil+Donem;
		if("1".equals(Donem))
			Donem = "Güz Dönemi";
		else if("2".equals(Donem))
			Donem = "Bahar Dönemi";
		else if("3".equals(Donem))
			Donem = "Yaz Dönemi";
		else 
			Donem = "Diðer";
		
		String Adi = Yil+" / "+Donem;
		
		donem.setID(ID);
		donem.setAdi(Adi);
		
			if(donemDAO.Ekle(donem)) {
				
			}
			else {
				request.getSession().setAttribute("Hata", "Dikkat! Ýþlem Baþarýsýz !");
			}

		DonemListele(request,response,true);
		
	}
	
private void ProfilGuncelle(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int SicilNo = Integer.parseInt(request.getParameter("ProfilSicil"));
		Kullanici yenikullanici = new Kullanici();
		
		yenikullanici.setSicilNo(SicilNo);
		yenikullanici.setAdSoyad(request.getParameter("ProfilAdSoyad"));
		yenikullanici.setDogumTarihi(request.getParameter("ProfilDogumTarihi"));
		yenikullanici.setEposta(request.getParameter("ProfilEposta"));
		yenikullanici.setSifre(request.getParameter("ProfilYeniSifre"));
		yenikullanici.setTC(request.getParameter("ProfilTC"));
		yenikullanici.setBolumID(Integer.parseInt(request.getParameter("ProfilBolumID")));
		yenikullanici.setCinsiyet(request.getParameter("ProfilCinsiyet"));
		yenikullanici.setUnvanID(Integer.parseInt(request.getParameter("ProfilUnvanID")));
		yenikullanici.setAdmin(Integer.parseInt(request.getParameter("ProfilAdmin")));
		
		if(SicilNo==0) {
			if(kullaniciDAO.Ekle(yenikullanici))
				request.getSession().setAttribute("Tab", "KullaniciButton");
			else
				request.getSession().setAttribute("Hata", "Dikkat ! Kullanýcý Eklenemedi !");
		}
		else {
			if(kullaniciDAO.Guncelle(yenikullanici)) {
				request.getSession().setAttribute("Tab", "KullaniciButton");
				request.getSession().setAttribute("Kullanici", yenikullanici);
			}
			else
				request.getSession().setAttribute("Hata", "Dikkat ! Kullanýcý Güncellenemedi !");
		}
		KullaniciListele(request,response,true);
		
	}
	
	//Otomatik Listeleme
	private void MainPage(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
			List<Unvan> unvanlistesi = unvanDAO.getList();
			request.getSession().setAttribute("unvanlist", unvanlistesi);
			List<Fakulte> fakultelistesi = fakulteDAO.getList();
			request.getSession().setAttribute("fakultelist", fakultelistesi);
			request.getSession().setAttribute("Reset", "Edildi");
			response.sendRedirect("AnaMenu.jsp");
	}
	
	
}

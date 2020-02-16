package com.OBS.model;

public class DersAtama {
	
	private int ID,KullaniciSicilNo,BolumID;
	private String DonemID,DersID,Kullanici,Donem,Bolum,Ders,Vize,Final,Butunleme;
	
	public DersAtama() {}
	
	
	
	
	//GetMetodlarý
	
	public String getVize() {
		return Vize;
	}
	
	public String getFinal() {
		return Final;
	}
	
	public String getButunleme() {
		return Butunleme;
	}
	
	public int getID() {
		return ID;
	}
	
	public String getKullanici() {
		return Kullanici;
	}
	
	public int getKullaniciSicilNo() {
		return KullaniciSicilNo;
	}
	
	public String getBolum() {
		return Bolum;
	}
	
	public int getBolumID() {
		return BolumID;
	}
	
	public String getDonem() {
		return Donem;
	}
	
	public String getDonemID() {
		return DonemID;
	}
	
	public String getDers() {
		return Ders;
	}
	
	public String getDersID() {
		return DersID;
	}
	
	//Set Metodlarý
	
	public void setVize(String Vize) {
		this.Vize = Vize;
	}
	
	public void setFinal(String Final) {
		this.Final = Final;
	}
	
	public void setButunleme(String Butunleme) {
		this.Butunleme = Butunleme;
	}
	
	public void setID(int ID) {
		this.ID = ID;
	}
	
	public void setKullanici(String Kullanici) {
		this.Kullanici = Kullanici;
	}
	
	public void setKullaniciSicilNo(int KullaniciSicilNo) {
		this.KullaniciSicilNo = KullaniciSicilNo;
	}
	
	public void setBolum(String Bolum) {
		this.Bolum = Bolum;
	}
	
	public void setBolumID(int BolumID) {
		this.BolumID = BolumID;
	}
	
	public void setDonem(String Donem) {
		this.Donem = Donem;
	}
	
	public void setDonemID(String DonemID) {
		this.DonemID = DonemID;
	}
	
	public void setDers(String Ders) {
		this.Ders = Ders;
	}
	
	public void setDersID(String DersID) {
		this.DersID = DersID;
	}
  	
}

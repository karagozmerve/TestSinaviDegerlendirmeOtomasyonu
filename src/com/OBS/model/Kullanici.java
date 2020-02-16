package com.OBS.model;



public class Kullanici {
	
	
	private int SicilNo,UnvanID,BolumID,Admin;
	private String Sifre,AdSoyad,TC,Eposta,DogumTarihi,Bolum,Unvan,StrCinsiyet,Cinsiyet;

	public Kullanici() {	
	}
	
	//Get Metodlarý
	
		public int getAdmin() {
			return Admin;
		}
		
		public int getSicilNo() {
			return SicilNo;
		}
		
		public String getUnvan() {
			return Unvan;
		}

		public String getSifre() {
			return Sifre;
		}
		
		public String getAdSoyad() {
			return AdSoyad;
		}
		
		public String getBolum() {
			return Bolum;
		}
		
		public String getStrCinsiyet() {
			return StrCinsiyet;
		}
		
		public int getUnvanID() {
			return UnvanID;
		}
		
		public String getTC() {
			return TC;
		}
		
		public String getEposta() {
			return Eposta;
		}
		
		public String getDogumTarihi() {
			return DogumTarihi;
		}
		
		public String getCinsiyet() {
			return Cinsiyet;
		}
		
		public int getBolumID() {
			return BolumID;
		}
		
		//Set Metodlarý
		
		public void setAdmin(int Admin) {
			this.Admin = Admin;
		}
		
		public void setCinsiyet(String Cinsiyet) {
			this.Cinsiyet = Cinsiyet;
		}
		
		public void setDogumTarihi(String DogumTarihi) {
			this.DogumTarihi = DogumTarihi;
		}
		
		public void setEposta(String Eposta) {
			this.Eposta = Eposta;
		}
		
		public void setTC(String TC) {
			this.TC = TC;
		}
		
		public void setSicilNo(int SicilNo) {
			this.SicilNo = SicilNo;
		}
		
		public void setBolumID(int BolumID) {
			this.BolumID = BolumID;
		}
		
		public void setSifre(String Sifre) {
			this.Sifre = Sifre;
		}

		public void setAdSoyad(String AdSoyad) {
			this.AdSoyad = AdSoyad;
		}
		
		public void setBolum(String Bolum) {
			this.Bolum = Bolum;
		}
		
		public void setUnvan(String Unvan) {
			this.Unvan = Unvan;
		}
		
		public void setStrCinsiyet(String StrCinsiyet) {
			this.StrCinsiyet = StrCinsiyet;
		}
		
		public void setUnvanID(int UnvanID) {
			this.UnvanID = UnvanID;
		}
	
	
}

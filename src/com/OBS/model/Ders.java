package com.OBS.model;

public class Ders {

	private int Kredi,BolumID;
	private String Adi,ID,Bolum;
	
	public Ders() {}
	
	//Get Metodlarý
	
	public String getBolum() {
		return Bolum;
	}
	
	public String getID() {
		return ID;
	}
	
	public int getKredi() {
		return Kredi;
	}
	
	public int getBolumID() {
		return BolumID;
	}
	
	public String getAdi() {
		return Adi;
	}
	
	//Set Metodlarý
	
	public void setID(String ID) {
		this.ID = ID;
	}
	
	public void setBolum(String Bolum) {
		this.Bolum = Bolum;
	}
	
	public void setKredi(int Kredi) {
		this.Kredi = Kredi;
	}
	
	public void setBolumID(int BolumID) {
		this.BolumID = BolumID;
	}
	
	public void setAdi(String Adi) {
		this.Adi = Adi;
	}
	
}

package com.OBS.model;

public class BolumKazanim {

	private String Kazanim,BolumID;
	
	public BolumKazanim() {}
	
	//Get Metodlar�
	
	public String getBolumID() {
		return BolumID;
	}
	
	public String getKazanim() {
		return Kazanim;
	}
	
	//Set Metodlar�
	public void setBolumID(String BolumID) {
		this.BolumID = BolumID;
	}
	
	public void setKazanim(String Kazanim) {
		this.Kazanim = Kazanim;
	}
	
}


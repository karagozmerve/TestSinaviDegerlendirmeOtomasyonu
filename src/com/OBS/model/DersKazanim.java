package com.OBS.model;

public class DersKazanim {

	private String Kazanim,DersID;
	
	public DersKazanim() {}
	
	//Get Metodlar�
	
	public String getDersID() {
		return DersID;
	}
	
	public String getKazanim() {
		return Kazanim;
	}
	
	//Set Metodlar�
	public void setDersID(String DersID) {
		this.DersID = DersID;
	}
	
	public void setKazanim(String Kazanim) {
		this.Kazanim = Kazanim;
	}
	
}


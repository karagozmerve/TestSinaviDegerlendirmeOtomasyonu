package com.OBS.model;

public class Bolum {
	
	private int ID;
	private String Adi,Fakulte;
	
	public Bolum() {}
	
	//Get Metodlarý
	
		public int getID() {
			return ID;
		}
		
		public String getFakulte() {
			return Fakulte;
		}
		
		public String getAdi() {
			return Adi;
		}
		
	//Set Metodlarý
		
		public void setID(int ID) {
			this.ID = ID;
		}
		
		public void setFakulte(String Fakulte) {
			this.Fakulte = Fakulte;
		}
		
		public void setAdi(String Adi) {
			this.Adi = Adi;
		}
}

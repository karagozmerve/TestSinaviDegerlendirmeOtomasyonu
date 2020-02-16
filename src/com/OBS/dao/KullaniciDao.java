package com.OBS.dao;

import com.OBS.model.Kullanici;
import com.OBS.yardimcilar.DBBaglanti;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class KullaniciDao {

	Connection conn = null;
	Statement stmt = null;
	Statement stmt2 = null;
	Statement stmt3 = null;
	ResultSet rs = null;
	ResultSet rs2 = null;
	ResultSet rs3 = null;
	
	
	
	public static String Coder(String Sifre) {
		
		int uzunluk = Sifre.length();
		uzunluk--;
		
		char birinci = Sifre.charAt(0);
		char sonuncu = Sifre.charAt(uzunluk);
		char besinci = Sifre.charAt(4);
		char ikinci = Sifre.charAt(1);
		
		StringBuilder sb = new StringBuilder(Sifre);
		
		sb.setCharAt(1, besinci);
		sb.setCharAt(4, ikinci);
		sb.deleteCharAt(uzunluk); 
		sb.deleteCharAt(0);

		
		Sifre = sb.toString();
		String YeniSifre = sonuncu+Sifre+birinci;
		
		StringBuilder ysb = new StringBuilder(YeniSifre);
		
		for(int i =0; i<=uzunluk;i++) {
			if(Character.isDigit(YeniSifre.charAt(i))) {
				String charTut = Character.toString(YeniSifre.charAt(i));
				int a = Integer.parseInt(charTut);
				if(a<3) {
					a = a+3;
				}
				else if (a>2&&a<6) {
					a = a+4;
				}
				else if (a==6) {
					a = 0;
				}
				else if (a==7) {
					a = 2;
				}
				else if (a==8) {
					a = 6;
				}
				else if (a==9) {
					a = 1;
				}
				String tutucu = Integer.toString(a);
				char tut = tutucu.charAt(0);
				ysb.setCharAt(i, tut);
				
			}
			else if(Character.isLetter(YeniSifre.charAt(i))) {
				
				String LettercharTut = Character.toString(YeniSifre.charAt(i));
				
				if("n".equals(LettercharTut)) {
					LettercharTut="a";
				}
				else if("d".equals(LettercharTut)) {
					LettercharTut="e";
				}
				else if("k".equals(LettercharTut)) {
					LettercharTut="i";
				}
				else if("l".equals(LettercharTut)) {
					LettercharTut="o";
				}
				else if("m".equals(LettercharTut)) {
					LettercharTut="u";
				}
				else if("a".equals(LettercharTut)) {
					LettercharTut="m";
				}
				else if("o".equals(LettercharTut)) {
					LettercharTut="d";
				}
				else if("e".equals(LettercharTut)) {
					LettercharTut="n";
				}
				else if("u".equals(LettercharTut)) {
					LettercharTut="l";
				}
				else if("i".equals(LettercharTut)) {
					LettercharTut="k";
				}
				else if("r".equals(LettercharTut)) {
					LettercharTut="A";
				}
				else if("A".equals(LettercharTut)) {
					LettercharTut="E";
				}
				else if("E".equals(LettercharTut)) {
					LettercharTut="s";
				}
				else if("s".equals(LettercharTut)) {
					LettercharTut="r";
				}
				
				
				
				char tut = LettercharTut.charAt(0);
				ysb.setCharAt(i, tut);
				
			}
		}
		
		YeniSifre = ysb.toString();
		return YeniSifre;
	}
	
	public static String DeCoder(String Sifre) {
		int uzunluk = Sifre.length();
		uzunluk--;
		char birinci = Sifre.charAt(0);
		char sonuncu = Sifre.charAt(uzunluk);
		char besinci = Sifre.charAt(4);
		char ikinci = Sifre.charAt(1);
		
		StringBuilder sb = new StringBuilder(Sifre);
		
		sb.setCharAt(1, besinci);
		sb.setCharAt(4, ikinci);
		sb.deleteCharAt(uzunluk); 
		sb.deleteCharAt(0);
		
		Sifre = sb.toString();
		String YeniSifre = sonuncu+Sifre+birinci;
		
		StringBuilder ysb = new StringBuilder(YeniSifre);
		
		for(int i =0; i<=uzunluk;i++) {
			if(Character.isDigit(YeniSifre.charAt(i))) {
				String charTut = Character.toString(YeniSifre.charAt(i));
				int a = Integer.parseInt(charTut);
				if(a==1) {
					a = 9;
				}
				else if (a==6) {
					a = 8;
				}
				else if (a==2) {
					a = 7;
				}
				else if (a==0) {
					a = 6;
				}
				else if (a>2&&a<6) {
					a = a-3;
				}
				else if(a>6) {
					a = a-4;
				}
				
				
				String tutucu = Integer.toString(a);
				char tut = tutucu.charAt(0);
				ysb.setCharAt(i, tut);
				
			}
			else if(Character.isLetter(YeniSifre.charAt(i))) {
				
				String LettercharTut = Character.toString(YeniSifre.charAt(i));
				
				if("a".equals(LettercharTut)) {
					LettercharTut="n";
				}
				else if("e".equals(LettercharTut)) {
					LettercharTut="d";
				}
				else if("i".equals(LettercharTut)) {
					LettercharTut="k";
				}
				else if("o".equals(LettercharTut)) {
					LettercharTut="l";
				}
				else if("u".equals(LettercharTut)) {
					LettercharTut="m";
				}
				else if("m".equals(LettercharTut)) {
					LettercharTut="a";
				}
				else if("d".equals(LettercharTut)) {
					LettercharTut="o";
				}
				else if("n".equals(LettercharTut)) {
					LettercharTut="e";
				}
				else if("l".equals(LettercharTut)) {
					LettercharTut="u";
				}
				else if("k".equals(LettercharTut)) {
					LettercharTut="i";
				}
				else if("A".equals(LettercharTut)) {
					LettercharTut="r";
				}
				else if("E".equals(LettercharTut)) {
					LettercharTut="A";
				}
				else if("s".equals(LettercharTut)) {
					LettercharTut="E";
				}
				else if("r".equals(LettercharTut)) {
					LettercharTut="s";
				}
				
				char tut = LettercharTut.charAt(0);
				ysb.setCharAt(i, tut);
				
			}
		}
		
		YeniSifre = ysb.toString();
		return YeniSifre;
		
	}
	
	//CRUD ISLEMLERI
	public boolean Ekle(Kullanici kullanici) {
		boolean basari = false;
		String Sifre = kullanici.getSifre();
		Sifre = Coder(Sifre);
		
		
		try {
			conn = DBBaglanti.openConnection();
			String sql = "Insert into Kullanici(SicilNo,TC,BolumID,Eposta,UnvanID,Cinsiyet,Sifre,AdSoyad,DogumTarihi,Admin) values ('"+kullanici.getSicilNo()+"','"+kullanici.getTC()+"','"+kullanici.getBolumID()+"','"+kullanici.getEposta()+"','"+kullanici.getUnvanID()+"','"+kullanici.getCinsiyet()+"','"+Sifre+"','"+kullanici.getAdSoyad()+"','"+kullanici.getDogumTarihi()+"','"+kullanici.getAdmin()+"')"; 
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
			basari=true;
			
		}catch(SQLException e) {
            e.printStackTrace();
            basari=false;
        }
		
		return basari;
	}
	
	public boolean Sil(int SicilNo) {	
		boolean basari =false;
		String sql = "Update Ders_Atama set KullaniciSicilNo = null where KullaniciSicilNo= "+SicilNo;
		String sql2 = "Delete from kullanici where SicilNo="+SicilNo;
		try {
		conn= DBBaglanti.openConnection();
		stmt = conn.createStatement();
		stmt.executeUpdate(sql);
		stmt2 = conn.createStatement();
		stmt2.executeUpdate(sql2);
		basari = true;
		
		}
		catch(SQLException e) {
            e.printStackTrace();
            basari=false;
        }
		
		return basari;
	}
	
	public boolean Guncelle(Kullanici kullanici) {		
		boolean basari = false;
		String Sifre = kullanici.getSifre();
		Sifre = Coder(Sifre);
		
		try {
			String sql = "Update kullanici set TC = '"+kullanici.getTC()+"',"+"BolumID = '"+kullanici.getBolumID()+"',"+"Eposta = '"+kullanici.getEposta()+"',"+"UnvanID = '"+kullanici.getUnvanID()+"',"+"Cinsiyet = '"+kullanici.getCinsiyet()+"',"+"Sifre = '"+Sifre+"',"+"AdSoyad = '"+kullanici.getAdSoyad()+"',"+"DogumTarihi = '"+kullanici.getDogumTarihi()+"',"+"Admin = '"+kullanici.getAdmin()+"' where SicilNo = '"+kullanici.getSicilNo()+"'";         
			conn = DBBaglanti.openConnection();
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
			basari=true;
		}
		catch(SQLException e) {
            e.printStackTrace();
            basari=false;
        }
		return basari;
	}
	
	public Kullanici get(int SicilNo) {
		Kullanici kullanici = new Kullanici();
		try {
			String sql = "Select * from kullanici where SicilNo = '"+SicilNo+"'";
			conn = DBBaglanti.openConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				String sql2 = "Select Adi from Bolum where ID = "+rs.getInt("BolumID");
				String sql3 = "Select Adi from Unvan where ID = "+rs.getInt("UnvanID");
				stmt2= conn.createStatement();
				rs2 = stmt2.executeQuery(sql2);
				stmt3 = conn.createStatement();
				rs3 = stmt3.executeQuery(sql3);
				while(rs2.next()) {
					kullanici.setBolum(rs2.getString("Adi"));
				}
				while(rs3.next()) {
					kullanici.setUnvan(rs3.getString("Adi"));
				}
				kullanici.setAdSoyad(rs.getString("AdSoyad"));
				kullanici.setSicilNo(rs.getInt("SicilNo"));
				kullanici.setCinsiyet(rs.getString("Cinsiyet"));
				kullanici.setUnvanID(rs.getInt("UnvanID"));
				kullanici.setBolumID(rs.getInt("BolumID"));
				if("1".equals(kullanici.getCinsiyet())) {
					kullanici.setStrCinsiyet("Erkek");
				}
				else {
					kullanici.setStrCinsiyet("Kadýn");
				}
				kullanici.setDogumTarihi((rs.getDate("DogumTarihi")).toString());
				kullanici.setEposta(rs.getString("Eposta"));
				String Sifre = rs.getString("Sifre");
				Sifre = DeCoder(Sifre);
				kullanici.setSifre(Sifre);
				kullanici.setTC(rs.getString("TC"));
				kullanici.setAdmin(rs.getInt("Admin"));
			}
		}
		catch(SQLException e) {
            e.printStackTrace();
        }
		return kullanici;
	}
	
	public List<Kullanici> getList(String Order) {
		List<Kullanici> KullaniciListesi = new ArrayList<Kullanici>();
		
		if("".equals(Order)||Order==null)
			Order = "AdSoyad";
		
		try {
			String sql = "Select * from kullanici Order by "+Order;
			conn = DBBaglanti.openConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				String sql2 = "Select Adi from Bolum where ID = "+rs.getInt("BolumID");
				String sql3 = "Select Adi from Unvan where ID = "+rs.getInt("UnvanID");
				stmt2= conn.createStatement();
				rs2 = stmt2.executeQuery(sql2);
				stmt3 = conn.createStatement();
				rs3 = stmt3.executeQuery(sql3);
				Kullanici kullanici = new Kullanici();
				while(rs2.next()) {
					kullanici.setBolum(rs2.getString("Adi"));
				}
				while(rs3.next()) {
					kullanici.setUnvan(rs3.getString("Adi"));
				}
				kullanici.setAdSoyad(rs.getString("AdSoyad"));
				kullanici.setSicilNo(rs.getInt("SicilNo"));
				kullanici.setCinsiyet(rs.getString("Cinsiyet"));
				kullanici.setAdmin(rs.getInt("Admin"));
				if("1".equals(kullanici.getCinsiyet())) {
					kullanici.setStrCinsiyet("Erkek");
				}
				else {
					kullanici.setStrCinsiyet("Kadýn");
				}
				kullanici.setDogumTarihi((rs.getDate("DogumTarihi")).toString());
				kullanici.setEposta(rs.getString("Eposta"));
				String Sifre = rs.getString("Sifre");
				Sifre = DeCoder(Sifre);
				kullanici.setSifre(Sifre);
				kullanici.setUnvanID(rs.getInt("UnvanID"));
				kullanici.setBolumID(rs.getInt("BolumID"));
				kullanici.setTC(rs.getString("TC"));
				KullaniciListesi.add(kullanici);
			}
		}
		catch(SQLException e) {
            e.printStackTrace();
        }
		return KullaniciListesi;
	}
	
	
	
}
	



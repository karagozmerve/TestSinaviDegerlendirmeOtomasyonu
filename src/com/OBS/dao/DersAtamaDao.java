package com.OBS.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


import com.OBS.model.DersAtama;
import com.OBS.yardimcilar.DBBaglanti;

public class DersAtamaDao {

	Connection conn = null;
	Statement stmt = null;
	Statement stmt2 = null;
	Statement stmt3 = null;
	Statement stmt4 = null;
	Statement stmt5 = null;
	ResultSet rs = null;
	ResultSet rs2 = null;
	ResultSet rs3 = null;
	ResultSet rs4 = null;
	ResultSet rs5 = null;
	
	public boolean Ekle(DersAtama dersatama) {
		boolean basari = false;
		
		try {
			conn = DBBaglanti.openConnection();
			String sql = "Insert into Ders_Atama(KullaniciSicilNo,DonemID,DersID,BolumID,Vize,Final,Butunleme) values ('"+dersatama.getKullaniciSicilNo()+"','"+dersatama.getDonemID()+"','"+dersatama.getDersID()+"','"+dersatama.getBolumID()+"','"+dersatama.getVize()+"','"+dersatama.getFinal()+"','"+dersatama.getButunleme()+"')"; 
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
			basari=true;
			
		}catch(SQLException e) {
            e.printStackTrace();
            basari=false;
        }
		
		return basari;
	}
	
	public boolean Sil(int ID) {	
		boolean basari =false;
		String sql = "Delete from Ders_Atama where ID= "+ID;
		try {
		conn= DBBaglanti.openConnection();
		stmt = conn.createStatement();
		stmt.executeUpdate(sql);
		basari = true;
		
		}
		catch(SQLException e) {
            e.printStackTrace();
            basari=false;
        }
		
		return basari;
	}
	
	public boolean Guncelle(DersAtama dersatama) {		
		boolean basari = false;
		try {
			String sql = "Update Ders_Atama set KullaniciSicilNo = '"+dersatama.getKullaniciSicilNo()+"',"+"BolumID = '"+dersatama.getBolumID()+"',"+"DonemID = '"+dersatama.getDonemID()+"',"+"DersID = '"+dersatama.getDersID()+"',"+"Vize = '"+dersatama.getVize()+"',"+"Final = '"+dersatama.getFinal()+"',"+"Butunleme = '"+dersatama.getButunleme()+"' where ID = '"+dersatama.getID()+"'";         
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
	
	public DersAtama get(int ID) {
		DersAtama dersatama = new DersAtama();
		try {
			String sql = "Select * from Ders_Atama where ID = '"+ID+"'";
			conn = DBBaglanti.openConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				String sql2 = "Select Adi from Bolum where ID = "+rs.getInt("BolumID");
				String sql3 = "Select AdSoyad from Kullanici where SicilNo = "+rs.getInt("KullaniciSicilNo");
				String sql4 = "Select Adi from Ders where ID = '"+rs.getString("DersID")+"'";
				String sql5 = "Select Adi from Donem where ID = '"+rs.getString("DonemID")+"'";
				stmt2= conn.createStatement();
				rs2 = stmt2.executeQuery(sql2);
				stmt3 = conn.createStatement();
				rs3 = stmt3.executeQuery(sql3);
				stmt4= conn.createStatement();
				rs4 = stmt4.executeQuery(sql4);
				stmt5 = conn.createStatement();
				rs5 = stmt5.executeQuery(sql5);
				while(rs2.next())
					dersatama.setBolum(rs2.getString("Adi"));
				while(rs3.next())
					dersatama.setKullanici(rs3.getString("AdSoyad"));
				while(rs4.next())
					dersatama.setDers(rs4.getString("Adi"));
				while(rs5.next())
					dersatama.setDonem(rs5.getString("Adi"));
								
				dersatama.setID(rs.getInt("ID"));
				dersatama.setDonemID(rs.getString("DonemID"));
				dersatama.setDersID(rs.getString("DersID"));
				dersatama.setKullaniciSicilNo(rs.getInt("KullaniciSicilNo"));
				dersatama.setBolumID(rs.getInt("BolumID"));
				dersatama.setVize(rs.getString("Vize"));
				dersatama.setFinal(rs.getString("Final"));
				dersatama.setButunleme(rs.getString("Butunleme"));
			}
		}
		catch(SQLException e) {
            e.printStackTrace();
        }
		return dersatama;
	}
	
	public List<DersAtama> getList(int KullaniciSicilNo) {
		List<DersAtama> DersAtamaListesi = new ArrayList<DersAtama>();
		try {
			String sql = "Select * from Ders_Atama where KullaniciSicilNo = "+KullaniciSicilNo;
			if(KullaniciSicilNo==0)
			sql = "Select * from Ders_Atama Order by DonemID DESC";	
			else
			sql = "Select * from Ders_Atama where KullaniciSicilNo = "+KullaniciSicilNo;	
			
			conn = DBBaglanti.openConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {		
				DersAtama dersatama = new DersAtama();
				
				String sql2 = "Select Adi from Bolum where ID = "+rs.getInt("BolumID");
				String sql3 = "Select AdSoyad from Kullanici where SicilNo = "+rs.getInt("KullaniciSicilNo");
				String sql4 = "Select Adi from Ders where ID = '"+rs.getString("DersID")+"'";
				String sql5 = "Select Adi from Donem where ID = '"+rs.getString("DonemID")+"'";
				stmt2= conn.createStatement();
				rs2 = stmt2.executeQuery(sql2);
				stmt3 = conn.createStatement();
				rs3 = stmt3.executeQuery(sql3);
				stmt4= conn.createStatement();
				rs4 = stmt4.executeQuery(sql4);
				stmt5 = conn.createStatement();
				rs5 = stmt5.executeQuery(sql5);
				while(rs2.next())
					dersatama.setBolum(rs2.getString("Adi"));
				while(rs3.next())
					dersatama.setKullanici(rs3.getString("AdSoyad"));
				while(rs4.next())
					dersatama.setDers(rs4.getString("Adi"));
				while(rs5.next())
					dersatama.setDonem(rs5.getString("Adi"));
								
				dersatama.setID(rs.getInt("ID"));
				dersatama.setDonemID(rs.getString("DonemID"));
				dersatama.setDersID(rs.getString("DersID"));
				dersatama.setKullaniciSicilNo(rs.getInt("KullaniciSicilNo"));
				dersatama.setBolumID(rs.getInt("BolumID"));
				dersatama.setVize(rs.getString("Vize"));
				dersatama.setFinal(rs.getString("Final"));
				dersatama.setButunleme(rs.getString("Butunleme"));
				
				DersAtamaListesi.add(dersatama);
			}
		}
		catch(SQLException e) {
            e.printStackTrace();
        }
		return DersAtamaListesi;
	}
	
}

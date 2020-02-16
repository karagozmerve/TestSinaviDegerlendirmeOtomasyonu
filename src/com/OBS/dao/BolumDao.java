package com.OBS.dao;

import com.OBS.model.Bolum;
import com.OBS.yardimcilar.DBBaglanti;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BolumDao {
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	Statement stmt2 = null;
	Statement stmt3 = null;
	Statement stmt4 = null;
	Statement stmt5 = null;
	
	public boolean Ekle(Bolum bolum) {
		boolean basari = false;
	
		try {
			conn = DBBaglanti.openConnection();
			String sql = "Insert into Bolum(Adi,Fakulte) values ('"+bolum.getAdi()+"','"+bolum.getFakulte()+"')"; 
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
		boolean basari = false;
		String sql= "Delete from Kullanici where BolumID = "+ID;
		String sql2= "Delete from Ders_Atama where BolumID = "+ID;
		String sql3 = "Update Ders set BolumID = null where BolumID = "+ID;
		String sql4 = "Delete from Bolum_Kazanim where BolumID = "+ID;
		String sql5 = "Delete from Bolum where ID = "+ID;

		
		try {
			
			conn= DBBaglanti.openConnection();
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
			stmt2 = conn.createStatement();
			stmt2.executeUpdate(sql2);
			stmt3 = conn.createStatement();
			stmt3.executeUpdate(sql3);
			stmt4 = conn.createStatement();
			stmt4.executeUpdate(sql4);
			stmt5 = conn.createStatement();
			stmt5.executeUpdate(sql5);
			basari = true;
			
		}catch(SQLException e) {
            e.printStackTrace();
            basari=false;
        }	
		
		return basari;
	}
	
	public boolean Guncelle(Bolum bolum) {		
		boolean basari = false;
		try {
			String sql = "Update Bolum set Adi = '"+bolum.getAdi()+"',"+"Fakulte = '"+bolum.getFakulte()+"' where ID = '"+bolum.getID()+"'";         
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
	
	public Bolum get(int ID,String Adi) {
		Bolum bolum = new Bolum();
		String sql = "Select * from Bolum where ID = '"+ID+"'";
		try {
			if("".equals(Adi))
			sql = "Select * from Bolum where ID = '"+ID+"'";
			else
			sql = "Select * from Bolum where Adi = '"+Adi+"'";
				
			conn = DBBaglanti.openConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				bolum.setAdi(rs.getString("Adi"));
				bolum.setFakulte(rs.getString("Fakulte"));
				bolum.setID(rs.getInt("ID"));
			}
		}
		catch(SQLException e) {
            e.printStackTrace();
        }
		return bolum;
	}
	
	public List<Bolum> getList(String Order) {
		List<Bolum> BolumListesi = new ArrayList<Bolum>();
		
		if("".equals(Order)||Order==null)
			Order = "Adi,Fakulte";
		
		try {
			String sql = "Select * from bolum Order by "+Order ;
			conn = DBBaglanti.openConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {		
				Bolum bolum = new Bolum();
				
				bolum.setID(rs.getInt("ID"));
				bolum.setAdi(rs.getString("Adi"));
				bolum.setFakulte(rs.getString("Fakulte"));

				BolumListesi.add(bolum);
			}
		}
		catch(SQLException e) {
            e.printStackTrace();
        }
		return BolumListesi;
	}
	
}

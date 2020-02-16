package com.OBS.dao;

import com.OBS.model.Ders;
import com.OBS.yardimcilar.DBBaglanti;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DersDao {
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	ResultSet rs2 = null;
	Statement stmt2 = null;
	Statement stmt3 = null;
	
	public boolean Ekle(Ders ders) {
		boolean basari = false;
		
		try {
			conn = DBBaglanti.openConnection();
			String sql = "Insert into Ders(ID,Adi,Kredi,BolumID) values ('"+ders.getID()+"','"+ders.getAdi()+"','"+ders.getKredi()+"','"+ders.getBolumID()+"')"; 
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
			basari=true;
			
		}catch(SQLException e) {
            e.printStackTrace();
            basari=false;
        }
		
		return basari;
	}
	
	public boolean Sil(String ID) {
		boolean basari = false;
		String sql= "Delete from Ders where ID = '"+ID+"'";
		String sql2= "Delete from Ders_Atama where DersID = '"+ID+"'";
		String sql3= "Delete from Ders_Kazanim where DersID = '"+ID+"'";
		
		try {
			
			conn= DBBaglanti.openConnection();
			stmt2 = conn.createStatement();
			stmt2.executeUpdate(sql2);
			stmt3 = conn.createStatement();
			stmt3.executeUpdate(sql3);
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
			basari = true;
			
		}catch(SQLException e) {
            e.printStackTrace();
            basari=false;
        }
			
		return basari;
	}
	
	public boolean Guncelle(Ders ders) {		
		boolean basari = false;
		try {
			String sql = "Update Ders set Adi = '"+ders.getAdi()+"',"+"BolumID = '"+ders.getBolumID()+"',"+"Kredi = '"+ders.getKredi()+"' where ID = '"+ders.getID()+"'";         
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
	
	public Ders get(String ID) {
		Ders ders = new Ders();
		try {
			String sql = "Select * from Ders where ID = '"+ID+"'";
			conn = DBBaglanti.openConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				ders.setAdi(rs.getString("Adi"));
				ders.setID(rs.getString("ID"));
				ders.setBolumID(rs.getInt("BolumID"));
				ders.setKredi(rs.getInt("Kredi"));
			}
		}
		catch(SQLException e) {
            e.printStackTrace();
        }
		return ders;
	}
	
	public List<Ders> getList(String Order) { 
		List<Ders> DersListesi = new ArrayList<Ders>();
		
		if("".equals(Order)||Order==null)
			Order = "Adi,BolumID";
		
		try {
			String sql = "Select * from Ders Order by "+Order;
			conn = DBBaglanti.openConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {		
				Ders ders = new Ders();
				String sql2 = "Select Adi from Bolum where ID = "+rs.getInt("BolumID");
				stmt2 = conn.createStatement();
				rs2 = stmt2.executeQuery(sql2);
				while(rs2.next()) {
					ders.setBolum(rs2.getString("Adi"));
				}
				ders.setAdi(rs.getString("Adi"));
				ders.setID(rs.getString("ID"));
				ders.setBolumID(rs.getInt("BolumID"));
				ders.setKredi(rs.getInt("Kredi"));

				DersListesi.add(ders);
			}
		}
		catch(SQLException e) {
            e.printStackTrace();
        }
		return DersListesi;
	}

}

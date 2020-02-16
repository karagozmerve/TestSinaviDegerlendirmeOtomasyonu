package com.OBS.dao;

import com.OBS.model.Donem;
import com.OBS.yardimcilar.DBBaglanti;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DonemDao {
	
	Connection conn = null;
	Statement stmt = null;
	Statement stmt2 = null;
	ResultSet rs = null;
	
	public boolean Ekle(Donem donem) {
		boolean basari = false;
	
		try {
			conn = DBBaglanti.openConnection();
			String sql = "Insert into Donem(ID,Adi) values ('"+donem.getID()+"','"+donem.getAdi()+"')";
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
			basari=true;
			
		}catch(SQLException e) {
            e.printStackTrace();
            basari=false;
        }
		return basari;
	}
	
	public List<Donem> getList() {
		List<Donem> DonemListesi = new ArrayList<Donem>();
			
		try {
			String sql = "Select * from Donem Order by ID DESC";
			conn = DBBaglanti.openConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {		
				Donem donem = new Donem();
				
				donem.setAdi(rs.getString("Adi"));
				donem.setID(rs.getString("ID"));

				DonemListesi.add(donem);
			}
		}
		catch(SQLException e) {
            e.printStackTrace();
        }
		return DonemListesi;
	}
	
	public boolean Sil(String ID) {	
		boolean basari =false;
		String sql = "Delete from Ders_Atama where DonemID = '"+ID+"'";
		String sql2 = "Delete from Donem where ID = '"+ID+"'";
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
	
}

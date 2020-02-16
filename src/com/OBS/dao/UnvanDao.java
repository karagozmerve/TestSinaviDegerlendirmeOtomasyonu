package com.OBS.dao;

import com.OBS.model.Unvan;
import com.OBS.yardimcilar.DBBaglanti;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;



public class UnvanDao {
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;

	public List<Unvan> getList() {
		List<Unvan> UnvanListesi = new ArrayList<Unvan>();
			
		try {
			String sql = "Select * from Unvan Order by Adi";
			conn = DBBaglanti.openConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {		
				Unvan unvan = new Unvan();
				
				unvan.setID(rs.getInt("ID"));
				unvan.setAdi(rs.getString("Adi"));

				UnvanListesi.add(unvan);
			}
		}
		catch(SQLException e) {
            e.printStackTrace();
        }
		return UnvanListesi;
	}
	
	

}

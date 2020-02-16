package com.OBS.dao;

import com.OBS.model.Fakulte;
import com.OBS.yardimcilar.DBBaglanti;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FakulteDao {

	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;

	public List<Fakulte> getList() {
		List<Fakulte> FakulteListesi = new ArrayList<Fakulte>();
			
		try {
			String sql = "Select * from Fakulte Order by Adi";
			conn = DBBaglanti.openConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {		
				Fakulte fakulte = new Fakulte();
				
				fakulte.setAdi(rs.getString("Adi"));

				FakulteListesi.add(fakulte);
			}
		}
		catch(SQLException e) {
            e.printStackTrace();
        }
		return FakulteListesi;
	}
	
}

package com.OBS.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.OBS.model.DersKazanim;
import com.OBS.yardimcilar.DBBaglanti;

public class DersKazanimDao {

	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;

	public List<String> getList(String ID) {
		List<String> DersKazanimListesi = new ArrayList<String>();	
		
		try {
			String sql = "Select * from ders_kazanim where DersID = '"+ID+"'";
			conn = DBBaglanti.openConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {		
			
				String ayir = rs.getString("Kazanim");
				String[] Kazanimlar = ayir.split(",");
				for(int i =0; i<Kazanimlar.length;i++)
				DersKazanimListesi.add(Kazanimlar[i]);
			}
		}
		catch(SQLException e) {
            e.printStackTrace();
        }
		return DersKazanimListesi;
	}
	
	public boolean Ekle(DersKazanim derskazanim) {
		boolean basari = false;
		
		try {
			conn = DBBaglanti.openConnection();
			String sql = "Insert into ders_kazanim(DersID,Kazanim) values ('"+derskazanim.getDersID()+"','"+derskazanim.getKazanim()+"')"; 
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
			basari=true;
			
		}catch(SQLException e) {
            e.printStackTrace();
            basari=false;
        }
		
		return basari;
	}
	
}

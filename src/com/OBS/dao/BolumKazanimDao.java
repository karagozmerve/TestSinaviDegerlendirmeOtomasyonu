package com.OBS.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.OBS.model.BolumKazanim;
import com.OBS.yardimcilar.DBBaglanti;

public class BolumKazanimDao {

	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;

	public List<String> getList(int ID) {
		List<String> BolumKazanimListesi = new ArrayList<String>();	
		
		try {
			String sql = "Select * from bolum_kazanim where BolumID = '"+ID+"'";
			conn = DBBaglanti.openConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {		
			
				String ayir = rs.getString("Kazanim");
				String[] Kazanimlar = ayir.split(",");
				for(int i =0; i<Kazanimlar.length;i++)
				BolumKazanimListesi.add(Kazanimlar[i]);
			}
		}
		catch(SQLException e) {
            e.printStackTrace();
        }
		return BolumKazanimListesi;
	}
	
	public boolean Ekle(BolumKazanim bolumkazanim) {
		boolean basari = false;
		
		try {
			conn = DBBaglanti.openConnection();
			String sql = "Insert into bolum_kazanim(BolumID,Kazanim) values ('"+bolumkazanim.getBolumID()+"','"+bolumkazanim.getKazanim()+"')"; 
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

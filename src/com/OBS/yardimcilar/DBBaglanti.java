package com.OBS.yardimcilar;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBBaglanti {
	
	
	private static Connection connection = null;
	
	public static Connection openConnection() {
		if (connection != null)
            return connection;
        else {
            try {
                Class.forName("com.mysql.jdbc.Driver");
    
                connection = DriverManager.getConnection(
    					"jdbc:mysql://localhost:3306/TestSinaviDegerlendirmeOtomasyonu?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey&characterEncoding=ISO-8859-9","root", "");
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            } catch (SQLException e) {
                e.printStackTrace();
            } 
            return connection;
        }
	}
	
	
}
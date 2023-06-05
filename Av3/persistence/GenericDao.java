package br.edu.fateczl.Av3.persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.springframework.stereotype.Repository;

@Repository
public class GenericDao {
	private Connection c;
	public Connection getConnection() throws ClassNotFoundException, SQLException{
	String hostName = "localhost";
	String dbName = "Av3";
	String user = "sa";
	String senha = "123456";
	Class.forName("net.sourceforge.jtds.jdbc.Driver");
	String connect =
	String.format("jdbc:jtds:sqlserver://%s:1433;databaseNme=%s;user=%s;password=%s",
			hostName, dbName, user, senha);
	c = DriverManager.getConnection(connect);
	
	return c;
	}

}

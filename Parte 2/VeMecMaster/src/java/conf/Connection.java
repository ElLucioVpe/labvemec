/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conf;

import org.springframework.jdbc.datasource.DriverManagerDataSource;

/**
 *
 * @author esteban
 */
public class Connection {
    public DriverManagerDataSource getConnection() {

        DriverManagerDataSource bds = new DriverManagerDataSource();
        bds.setDriverClassName("com.mysql.cj.jdbc.Driver");
        bds.setUrl("jdbc:mysql://localhost/vemecsdb?zeroDateTimeBehavior=CONVERT_TO_NULL&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC");
	bds.setUsername("Admin");
	bds.setPassword("1234");

	return bds;
    }
}

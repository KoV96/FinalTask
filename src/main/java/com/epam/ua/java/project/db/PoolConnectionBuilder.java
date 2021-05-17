package com.epam.ua.java.project.db;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Logger;

public class PoolConnectionBuilder implements ConnectionBuilder{
    private static final Logger LOGGER = Logger.getLogger(PoolConnectionBuilder.class.getName());
    private DataSource dataSource;

    public PoolConnectionBuilder(){
        try{
            Context initContext = new InitialContext();
            dataSource = (DataSource) initContext.lookup("java:comp/env/jdbc/myproject");
        } catch (NamingException e) {
            LOGGER.severe(e.getMessage());
        }
    }
    @Override
    public Connection getConnection() throws SQLException {
        return dataSource.getConnection();
    }

    public void rollBackAndClose(Connection con){
        try {
            con.rollback();
            con.close();
        } catch (SQLException e) {
            LOGGER.severe(e.getMessage());
        }
    }

    public void commitAndClose(Connection con){
        try {
            con.commit();
            con.close();
        } catch (SQLException e) {
            LOGGER.severe(e.getMessage());
        }
    }
}

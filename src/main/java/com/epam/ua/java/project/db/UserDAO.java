package com.epam.ua.java.project.db;

import com.epam.ua.java.project.db.entity.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Logger;
//-----------------------------------Make a transactions in all connections!!!!!!--------------------------------------
/**
 * Data access object for User entity
 */
public class UserDAO {
    private static final Logger LOGGER = Logger.getLogger(UserDAO.class.getName());

    private static final String SQL_FIND_USER_BY_LOGIN = "SELECT * FROM " + DBConst.USER + " WHERE login=?";
    private static final String SQL_FIND_USER_BY_ID = "SELECT * FROM " + DBConst.USER + " WHERE id=?";
    private static final String SQL_UPDATE_USER = "UPDATE " + DBConst.USER + " SET login=?, password=?, firsName=?, " +
            "lastName=?, roleId=? WHERE id=?";
    private static final String SQL_ADD_USER = "INSERT INTO " + DBConst.USER + " VALUES(login=?, password=?, firstname=?, " +
            "lastName=?)";

    /**
     * @param login of the user that needs to find in DB
     * @return user with given login
     */
    public User findUser(String login){
        User user = null;
        ResultSet rs;
        try(Connection con = new PoolConnectionBuilder().getConnection();
            PreparedStatement ps = con.prepareStatement(SQL_FIND_USER_BY_LOGIN)) {
            UserMapper userMapper = new UserMapper();
            ps.setString(1, login);
            rs = ps.executeQuery();
            if (rs.next()){
                user = userMapper.mapRow(rs);
            }
            rs.close();
        } catch (SQLException e) {
            LOGGER.severe(e.getMessage());
        }
        return user;
    }

    /**
     * @param id of the user that needs to find in DB
     * @return user with given id
     */
    public User findUser(long id){
        User user = null;
        ResultSet rs;
        try(Connection con = new PoolConnectionBuilder().getConnection();
            PreparedStatement ps = con.prepareStatement(SQL_FIND_USER_BY_ID)) {
            UserMapper userMapper = new UserMapper();
            ps.setLong(1, id);
            rs = ps.executeQuery();
            if (rs.next()){
                user = userMapper.mapRow(rs);
            }
            rs.close();
        } catch (SQLException e) {
            LOGGER.severe(e.getMessage());
        }
        return user;
    }

    public void updateUser(User user){
        try(Connection con = new PoolConnectionBuilder().getConnection()) {
            updateUser(con, user);
        } catch (SQLException e) {
           LOGGER.severe(e.getMessage());
        }
    }

    public void signupUser(User user){
        try(Connection con = new PoolConnectionBuilder().getConnection()) {
            signup(user, con);
        } catch (SQLException e) {
            LOGGER.severe(e.getMessage());
        }
    }

    private void signup(User user, Connection con) {
        try(PreparedStatement ps = con.prepareStatement(SQL_ADD_USER)) {
            int count = 1;
            ps.setString(count++, user.getLogin());
            ps.setString(count++, user.getPassword());
            ps.setString(count++, user.getFirstName());
            ps.setString(count, user.getLastName());
            ps.executeUpdate();
        } catch (SQLException e) {
            LOGGER.severe(e.getMessage());
        }
    }

    private void updateUser(Connection con, User user) {
        try(PreparedStatement ps = con.prepareStatement(SQL_UPDATE_USER);) {
            int count = 1;
            ps.setLong(count++, user.getId());
            ps.setString(count++, user.getLogin());
            ps.setString(count++, user.getPassword());
            ps.setString(count++, user.getFirstName());
            ps.setString(count++, user.getLastName());
            ps.setInt(count, user.getRoleId());
            ps.executeUpdate();
        } catch (SQLException e) {
           LOGGER.severe(e.getMessage());
        }


    }

    /**
     * Extract user from the result set row
     */
    private static class UserMapper implements EntityMapper<User>{

        @Override
        public User mapRow(ResultSet rs) {
            try {
                User user = new User();
                user.setId(rs.getLong(DBConst.ID));
                user.setFirstName(rs.getString(DBConst.USER_FIRSTNAME));
                user.setLastName(rs.getString(DBConst.USER_LASTNAME));
                user.setLogin(DBConst.USER_LOGIN);
                user.setPassword(rs.getString(DBConst.USER_PASSWORD));
                user.setRoleId(rs.getInt(DBConst.USER_ROLE_ID));
                return user;
            } catch (SQLException e) {
                throw new IllegalStateException();
            }
        }
    }
}

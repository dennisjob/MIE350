package com.mie.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.mie.model.User;
import com.mie.util.DbUtil;

public class UserDao {
	
	private static Connection connection;

	public UserDao() {
		connection = DbUtil.getConnection();
	}
	
	public static void addUser(User user) {
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("insert into Users(Name,Password,Email) values (?, ?, ? )");
			preparedStatement.setString(1, user.getName());
			preparedStatement.setString(2, user.getPassword());
			preparedStatement.setString(3, user.getEmail());
			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void deleteUser(int userId) {
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("delete from Users where UserID = ?");
			preparedStatement.setInt(1, userId);
			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void updateUser(User user) {
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("update Users set Name=?, Password=?, Email=?"
							+ " where UserID=?");
			preparedStatement.setString(1, user.getName());
			preparedStatement.setString(2, user.getPassword());
			preparedStatement.setString(3, user.getEmail());
			preparedStatement.setInt(4, user.getUserId());
			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public List<User> getAllUsers() {
		List<User> users = new ArrayList<User>();
		try {
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("select * from Users");
			while (rs.next()) {
				User user = new User();
				user.setUserId(rs.getInt("UserID"));
				user.setName(rs.getString("Name"));
				user.setPassword(rs.getString("Password"));
				user.setEmail(rs.getString("Email"));
				users.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return users;
	}
	
	public static User getUser(String name, String password, String email) {
		User user = new User();
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("select * from Users where Name=? and Password=? and Email=?");
			preparedStatement.setString(1, name);
			preparedStatement.setString(2, password);
			preparedStatement.setString(3, email);
			ResultSet rs = preparedStatement.executeQuery();

			if (rs.next()) {
				user.setUserId(rs.getInt("UserID"));
				user.setName(rs.getString("Name"));
				user.setPassword(rs.getString("Password"));
				user.setEmail(rs.getString("Email"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return user;
	}
	
	public User getUserById(int userId) {
		User user = new User();
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("select * from Users where UserID=?");
			preparedStatement.setInt(1, userId);
			ResultSet rs = preparedStatement.executeQuery();

			if (rs.next()) {
				user.setUserId(rs.getInt("UserID"));
				user.setName(rs.getString("Name"));
				user.setPassword(rs.getString("Password"));
				user.setEmail(rs.getString("Email"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return user;
	}
	
	public static User login(User user) {
		/**
		 * This method attempts to find the user that is trying to log in by
		 * first retrieving the email and password entered.
		 */
		Statement stmt = null;

		String email = user.getEmail();
		String password = user.getPassword();

		/**
		 * Prepare a query that searches the members table in the database
		 * with the given email and password.
		 */
		String searchQuery = "select * from Users where email='"
				+ email + "' AND password='" + password + "'";

		try {
			// connect to DB
			connection = DbUtil.getConnection();
			stmt = connection.createStatement();
			ResultSet rs = stmt.executeQuery(searchQuery);
			boolean more = rs.next();

			/**
			 * If there are no results from the query, set the User to null.
			 * The person attempting to log in will be redirected to the home
			 * page when User is null.
			 */
			
			if (!more) {
				user = null;
			}

			/**
			 * If the query results in an database entry that matches the
			 * email and password, assign the appropriate information to
			 * the User object.
			 */
			else if (more) {
				user.setUserId(rs.getInt("UserID"));
				user.setName(rs.getString("Name"));
				user.setPassword(rs.getString("Password"));
				user.setEmail(rs.getString("Email"));
			}
		} catch (Exception ex) {
			System.out.println("Log In failed: An Exception has occurred! "
					+ ex);
		}
		/**
		 * Return the User object.
		 */
		return user;

	}

}

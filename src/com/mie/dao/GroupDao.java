package com.mie.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.mie.model.Group;
import com.mie.model.User;
import com.mie.util.DbUtil;

public class GroupDao {
	
	private Connection connection;

	public GroupDao() {
		connection = DbUtil.getConnection();
	}
	
	/**
	 * Adds a new group to the database. When calling this method for a brand new group, your Group
	 * object should have numMembers = 0 because the group's creator is added afterwards.
	 * 
	 * @param group
	 * @param userId
	 */
	public void addGroup(Group group, int userId) {
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("insert into Groups(AccessCode,GroupName,GroupMembers) values (?, ?, ? )");
			preparedStatement.setInt(1, group.getAccessCode());
			preparedStatement.setString(2, group.getName());
			preparedStatement.setInt(3, group.getNumMembers());
			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		addUserToGroup(group, userId);
	}
	
	public void deleteGroup(int groupId) {
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("delete from Groups where GroupID = ?");
			preparedStatement.setInt(1, groupId);
			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void updateGroup(Group group) {
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("update Groups set AccessCode=?, GroupName=?, GroupMembers=?"
							+ " where GroupID=?");
			preparedStatement.setInt(1, group.getAccessCode());
			preparedStatement.setString(2, group.getName());
			preparedStatement.setInt(3, group.getNumMembers());
			preparedStatement.setInt(4, group.getGroupId());
			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void addUserToGroup(Group group, int userId) {
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("insert into BelongsIn(UserID,GroupID) values (?, ? )");
			preparedStatement.setInt(1, userId);
			preparedStatement.setInt(2, group.getGroupId());
			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		group.setNumMembers(group.getNumMembers() + 1);
		updateGroup(group);
	}
	
	public List<Group> getAllGroups() {
		List<Group> groups = new ArrayList<Group>();
		try {
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("select * from Groups");
			while (rs.next()) {
				Group group = new Group();
				group.setGroupId(rs.getInt("GroupID"));
				group.setAccessCode(rs.getInt("AccessCode"));
				group.setName(rs.getString("GroupName"));
				group.setNumMembers(rs.getInt("GroupMembers"));
				groups.add(group);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return groups;
	}
	
	public List<Group> getUsersGroups(int userId) {
		List<Group> groups = new ArrayList<Group>();
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("select * from BelongsIn where UserID=?");
			preparedStatement.setInt(1, userId);
			ResultSet rs = preparedStatement.executeQuery();
			
			while (rs.next()) {
				Group group = getGroupById(rs.getInt("GroupID"));
				groups.add(group);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return groups;
	}
	
	public Group getGroup(int accessCode, String name, int numMembers) {
		Group group = new Group();
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("select * from Groups where AccessCode=? and GroupName=? and GroupMembers=?");
			preparedStatement.setInt(1, accessCode);
			preparedStatement.setString(2, name);
			preparedStatement.setInt(3, numMembers);
			ResultSet rs = preparedStatement.executeQuery();

			if (rs.next()) {
				group.setGroupId(rs.getInt("GroupID"));
				group.setAccessCode(rs.getInt("AccessCode"));
				group.setName(rs.getString("GroupName"));
				group.setNumMembers(rs.getInt("GroupMembers"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return group;
	}
	
	public Group getGroupById(int groupId) {
		Group group = new Group();
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("select * from Groups where GroupID=?");
			preparedStatement.setInt(1, groupId);
			ResultSet rs = preparedStatement.executeQuery();

			if (rs.next()) {
				group.setGroupId(rs.getInt("GroupID"));
				group.setAccessCode(rs.getInt("AccessCode"));
				group.setName(rs.getString("GroupName"));
				group.setNumMembers(rs.getInt("GroupMembers"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return group;
	}
	
	public boolean accessCodeExists(int accessCode) {
		boolean exists = false;
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("select * from Groups where AccessCode=?");
			preparedStatement.setInt(1, accessCode);
			ResultSet rs = preparedStatement.executeQuery();

			if (rs.next()) {
				exists = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return exists;
	}
	
}

package com.mie.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.mie.model.Application;
import com.mie.util.DbUtil;
import java.sql.Date;
public class AppDao {
	private Connection connection;

	public AppDao() {
		connection = DbUtil.getConnection();
	}
	
	public void addApplication(Application app) {
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("insert into JobApplication(JobAppID,CompName,UserID,LinktoApp,AppDeadline,InterOffer,JobOffer,Industry,Position) values (?, ?, ?, ?, ?, ?, ?, ?, ? )");
			preparedStatement.setInt(1, app.getAppId());
			preparedStatement.setString(2, app.getCompany());
			preparedStatement.setInt(3, app.getUserId());
			preparedStatement.setString(4, app.getUrl());
			preparedStatement.setDate(5, app.getDeadline());
			preparedStatement.setInt(6, app.getInterview());
			preparedStatement.setInt(7, app.getJob());
			preparedStatement.setString(8, app.getIndustry());
			preparedStatement.setString(9, app.getPosition());
			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void deleteApplication(int appId) {
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("delete from JobApplication where JobAppID = ?");
			preparedStatement.setInt(1, appId);
			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void updateApplication(Application app) {
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("update JobApplication set CompName=?, UserID=?, LinktoApp=?, AppDeadline=?, InterOffer=?, JobOffer=?, Industry=?, Position=?"
							+ " where JobAppID=?");
			preparedStatement.setString(1, app.getCompany());
			preparedStatement.setInt(2, app.getUserId());
			preparedStatement.setString(3, app.getUrl());
			preparedStatement.setDate(4, app.getDeadline());
			preparedStatement.setInt(5, app.getInterview());
			preparedStatement.setInt(6, app.getJob());
			preparedStatement.setString(7, app.getIndustry());
			preparedStatement.setString(8, app.getPosition());
			preparedStatement.setInt(9, app.getAppId());
			
			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public List<Application> getAllApps() {
		List<Application> apps = new ArrayList<Application>();
		try {
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("select * from JobApplication");
			while (rs.next()) {
				Application app = new Application();
				app.setAppId(rs.getInt("JobAppID"));
				app.setCompany(rs.getString("CompName"));
				app.setUserId(rs.getInt("UserID"));
				app.setUrl(rs.getString("LinktoApp"));
				app.setDeadline(rs.getDate("AppDeadline"));
				app.setInterview(rs.getInt("InterOffer"));
				app.setJob(rs.getInt("JobOffer"));
				app.setIndustry(rs.getString("Industry"));
				app.setPosition(rs.getString("Position"));
				apps.add(app);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return apps;
	}
	
	public List<Application> getUserApps(int userid) {
		List<Application> userapps = new ArrayList<Application>();
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("select * from JobApplication where UserID=?");
			preparedStatement.setInt(1, userid);
			ResultSet rs = preparedStatement.executeQuery();

			if (rs.next()) {
				Application app = new Application();
				app.setAppId(rs.getInt("JobAppId"));
				app.setCompany(rs.getString("CompName"));
				app.setUserId(rs.getInt("UserID"));
				app.setUrl(rs.getString("LinktoApp"));
				app.setDeadline(rs.getDate("AppDeadline"));
				app.setInterview(rs.getInt("InterOffer"));
				app.setJob(rs.getInt("JobOffer"));
				app.setIndustry(rs.getString("Industry"));
				app.setPosition(rs.getString("Position"));
				userapps.add(app);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return userapps;
	}
	
	public Application getAppById(int appid) {
		Application app = new Application();
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("select * from JobApplication where JobAppID=?");
			preparedStatement.setInt(1, appid);
			ResultSet rs = preparedStatement.executeQuery();

			if (rs.next()) {
				app.setAppId(rs.getInt("JobAppID"));
				app.setCompany(rs.getString("CompName"));
				app.setUserId(rs.getInt("UserID"));
				app.setUrl(rs.getString("LinktoApp"));
				app.setDeadline(rs.getDate("AppDeadline"));
				app.setInterview(rs.getInt("InterOffer"));
				app.setJob(rs.getInt("JobOffer"));
				app.setIndustry(rs.getString("Industry"));
				app.setPosition(rs.getString("Position"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return app;
	}
	public Application getApplication(String comp, int userid, String url, Date deadline, int interview, int joboffer, String industry, String position){
		Application app = new Application();
		try{
			PreparedStatement preparedStatement = connection
					.prepareStatement("select * from JobApplication where CompName=?, UserID=?, LinktoApp=?, AppDeadline=?, InterOffer=?, JobOffer=?, Industry=?, Position=?");
			preparedStatement.setString(1, comp);
			preparedStatement.setInt(2, userid);
			preparedStatement.setString(3, url);
			preparedStatement.setDate(4, deadline);
			preparedStatement.setInt(5, interview);
			preparedStatement.setInt(6, joboffer);
			preparedStatement.setString(7, industry);
			preparedStatement.setString(8, position);
			ResultSet rs = preparedStatement.executeQuery();
			
			if (rs.next()) {
				app.setAppId(rs.getInt("JobAppID"));
				app.setCompany(rs.getString("CompName"));
				app.setUserId(rs.getInt("UserID"));
				app.setUrl(rs.getString("LinktoApp"));
				app.setDeadline(rs.getDate("AppDeadline"));
				app.setInterview(rs.getInt("InterOffer"));
				app.setJob(rs.getInt("JobOffer"));
				app.setIndustry(rs.getString("Industry"));
				app.setPosition(rs.getString("Position"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return app;
	}
}

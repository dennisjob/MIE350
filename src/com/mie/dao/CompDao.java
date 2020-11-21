package com.mie.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.mie.model.Company;
import com.mie.util.DbUtil;

public class CompDao {
	private Connection connection;

	public CompDao() {
		connection = DbUtil.getConnection();
	}
	
	public void addCompany(Company comp) {
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("insert into Company(CompanyID,UserID,CompName,CompLink,ConnectionName) values (?, ?, ?, ?, ?)");
			preparedStatement.setInt(1, comp.getCompanyId());
			preparedStatement.setInt(2, comp.getUserId());
			preparedStatement.setString(3, comp.getName());
			preparedStatement.setString(4, comp.getUrl());
			preparedStatement.setString(5, comp.getConnection());
			
			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void deleteCompany(int companyId) {
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("delete from Company where CompanyID = ?");
			preparedStatement.setInt(1, companyId);
			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void updateCompany(Company comp) {
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("update Company set UserID=?, CompName=?, CompLink=?, ConnectionName=?"
							+ " where CompanyID=?");
			preparedStatement.setInt(1, comp.getUserId());
			preparedStatement.setString(2, comp.getName());
			preparedStatement.setString(3, comp.getUrl());
			preparedStatement.setString(4, comp.getConnection());
			preparedStatement.setInt(5, comp.getCompanyId());
			
			
			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public List<Company> getAllCompanies() {
		List<Company> comps = new ArrayList<Company>();
		try {
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("select * from Company");
			while (rs.next()) {
				Company comp = new Company();
				comp.setCompanyId(rs.getInt("CompanyID"));
				comp.setUserId(rs.getInt("UserID"));
				comp.setName(rs.getString("CompName"));
				comp.setUrl(rs.getString("CompLink"));
				comp.setConnection(rs.getString("ConnectionName"));
				
				comps.add(comp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return comps;
	}
	
	public List<Company> getUserCompanies(int userid) {
		List<Company> usercomps = new ArrayList<Company>();
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("select * from Company where UserID=?");
			preparedStatement.setInt(1, userid);
			ResultSet rs = preparedStatement.executeQuery();

			if (rs.next()) {
				Company comp = new Company();
				comp.setCompanyId(rs.getInt("CompanyID"));
				comp.setUserId(rs.getInt("UserID"));
				comp.setName(rs.getString("CompName"));
				comp.setUrl(rs.getString("CompLink"));
				comp.setConnection(rs.getString("ConnectionName"));
			
				usercomps.add(comp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return usercomps;
	}
	
	public Company getCompById(int companyId) {
		Company comp = new Company();
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("select * from Company where CompanyID=?");
			preparedStatement.setInt(1, companyId);
			ResultSet rs = preparedStatement.executeQuery();

			if (rs.next()) {
				comp.setCompanyId(rs.getInt("CompanyID"));
				comp.setUserId(rs.getInt("UserID"));
				comp.setName(rs.getString("CompName"));
				comp.setUrl(rs.getString("CompLink"));
				comp.setConnection(rs.getString("ConnectionName"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return comp;
	}
	public Company getApplcation(int userid, String name, String url, String connect){
		Company comp = new Company();
		try{
			PreparedStatement preparedStatement = connection
					.prepareStatement("select * from Company where UserID=?, CompName=?, CompLink=?, ConnectionName=?");
			preparedStatement.setInt(1, userid);
			preparedStatement.setString(2, name);
			preparedStatement.setString(3, url);
			preparedStatement.setString(4, connect);
			
			
			ResultSet rs = preparedStatement.executeQuery();
			
			if (rs.next()) {
				comp.setCompanyId(rs.getInt("CompanyID"));
				comp.setUserId(rs.getInt("UserID"));
				comp.setName(rs.getString("CompName"));
				comp.setUrl(rs.getString("CompLink"));
				comp.setConnection(rs.getString("ConnectionName"));}
				
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return comp;
	}

}

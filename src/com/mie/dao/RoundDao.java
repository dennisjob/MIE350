package com.mie.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.mie.model.Round;
import com.mie.model.User;
import com.mie.util.DbUtil;

public class RoundDao {

	private Connection connection;
	
	public RoundDao() {
		connection = DbUtil.getConnection();
	}
	
	public void addRound(Round round) {
		try {
			PreparedStatement preparedStatement = connection.prepareStatement("insert into Assessment(AssessType, Date, Location, JobAppID, UserID, CompID, AssessName) values (?, ?, ?, ?, ?, ?, ?)");
			
			preparedStatement.setString(1, round.getRoundType());
			preparedStatement.setTimestamp(2, round.getDateTime());
			preparedStatement.setString(3, round.getLocation());
			preparedStatement.setInt(4, round.getAppId());
			preparedStatement.setInt(5, round.getUserId());
			preparedStatement.setInt(6, round.getCompanyId());
			preparedStatement.setString(7, round.getAssessorName());
			preparedStatement.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void deleteRound(int roundId) {
			try {
				PreparedStatement preparedStatement = connection
						.prepareStatement("delete from Assessment where AssessID = ?");
				preparedStatement.setInt(1, roundId);
				preparedStatement.executeUpdate();

			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	public void updateRound(Round round) {
		try {
			PreparedStatement preparedStatement = connection.prepareStatement("update Assessment set AssessType=?, Date=?, Location=?, JobAppID=?, UserID=?, CompID =?, AssessName=?" + "where AssessID = ?");
			preparedStatement.setString(1, round.getRoundType());
			preparedStatement.setTimestamp(2, round.getDateTime());
			preparedStatement.setString(3, round.getLocation());
			preparedStatement.setInt(4, round.getAppId());
			preparedStatement.setInt(5, round.getUserId());
			preparedStatement.setInt(6, round.getCompanyId());
			preparedStatement.setString(7, round.getAssessorName());
			preparedStatement.setInt(8, round.getRoundId());
			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public List<Round> getAllRounds() {
		List<Round> rounds = new ArrayList<Round>();
		try {
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("select * from Assessment");
			while (rs.next()) {
				Round round = new Round();
				round.setRoundId(rs.getInt("AssessID"));
				round.setRoundType(rs.getString("AssessType"));
				round.setDateTime(rs.getTimestamp("Date"));
				round.setLocation(rs.getString("Location"));
				round.setAppId(rs.getInt("JobAppID"));
				round.setUserId(rs.getInt("UserID"));
				round.setCompanyId(rs.getInt("CompID"));
				round.setAssessorName(rs.getString("AssessName"));
				
				rounds.add(round);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return rounds;
	}
	
	public List<Round> getUsersRounds(int userId) {
		List<Round> rounds = new ArrayList<Round>();
		try {
			PreparedStatement preparedStatement = connection.prepareStatement("select * from Assessment where UserID=?");
			preparedStatement.setInt(1, userId);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				Round round = new Round();
				round.setRoundId(rs.getInt("AssessID"));
				round.setRoundType(rs.getString("AssessType"));
				round.setDateTime(rs.getTimestamp("Date"));
				round.setLocation(rs.getString("Location"));
				round.setAppId(rs.getInt("JobAppID"));
				round.setUserId(rs.getInt("UserID"));
				round.setCompanyId(rs.getInt("CompID"));
				round.setAssessorName(rs.getString("AssessName"));
				
				rounds.add(round);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return rounds;
		
	}
	
	public Round getRound(String roundType, Timestamp dateTime, String location
			, int appId, int userId, int companyId, String assessorName ) {
		
		Round round = new Round();
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("select * from Assessment where AssessType=? and Date=? and Location=?"
							+ "and JobAppID=? and UserID=? and CompID=? and AssessName=?");
			preparedStatement.setString(1, roundType);
			preparedStatement.setTimestamp(2, dateTime);
			preparedStatement.setString(3, location);
			preparedStatement.setInt(4, appId);
			preparedStatement.setInt(5, userId);
			preparedStatement.setInt(6, companyId);
			preparedStatement.setString(7, assessorName);
			ResultSet rs = preparedStatement.executeQuery();

			if (rs.next()) {
				round.setRoundId(rs.getInt("AssessID"));
				round.setRoundType(rs.getString("AssessType"));
				round.setDateTime(rs.getTimestamp("Date"));
				round.setLocation(rs.getString("Location"));
				round.setAppId(rs.getInt("JobAppID"));
				round.setUserId(rs.getInt("UserID"));
				round.setCompanyId(rs.getInt("CompID"));
				round.setAssessorName(rs.getString("AssessName"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return round;
		
	}
	
	public Round getRoundById(int roundId) {
		Round round = new Round();
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("select * from Assessment where AssessID=?");
			preparedStatement.setInt(1, roundId);
			ResultSet rs = preparedStatement.executeQuery();
			
			if (rs.next()) {
				round.setRoundId(rs.getInt("AssessID"));
				round.setRoundType(rs.getString("AssessType"));
				round.setDateTime(rs.getTimestamp("Date"));
				round.setLocation(rs.getString("Location"));
				round.setAppId(rs.getInt("JobAppID"));
				round.setUserId(rs.getInt("UserID"));
				round.setCompanyId(rs.getInt("CompID"));
				round.setAssessorName(rs.getString("AssessName"));
			}
		}
			catch (SQLException e) {
				e.printStackTrace();
	}
		return round;
	}
	
	public HashMap<String, Timestamp> getUsersRoundsByDate(int userId, Timestamp cutoff) {
		HashMap<String, Timestamp> map = new HashMap<String, Timestamp>();
		try {
			PreparedStatement preparedStatement = connection.prepareStatement("select CompName, Position, AssessType, Date from Assessment as A inner join JobApplication as J on A.JobAppID = J.JobAppID where A.UserID=? and AppDeadline>=?;");
			preparedStatement.setInt(1, userId);
			preparedStatement.setTimestamp(2, cutoff);
			ResultSet rs = preparedStatement.executeQuery();
			
			while (rs.next()) {
				String str = rs.getString("CompName") + " " + rs.getString("Position") + " " + rs.getString("AssessType");
				Timestamp date = rs.getTimestamp("Date");
				map.put(str, date);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return map;
	}
	
	
}

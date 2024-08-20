package mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.Criteria;

public abstract class DAOProviderAdapter<T> implements DAOProvider<T>{
	
	protected Connection conn = null;
	protected PreparedStatement pstmt = null;
	protected ResultSet rs = null;

	@Override
	public ArrayList<T> getList(Criteria cri) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int count() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public T read(T t) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public void updateReadCount(int num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean write(T t) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean update(T t) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(T t) {
		// TODO Auto-generated method stub
		return false;
	}
	
}

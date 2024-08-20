package mvc.dao;

import java.util.ArrayList;

import util.Criteria;

public interface DAOProvider<T> {
	
	ArrayList<T> getList(Criteria cri);
	
	int count();
	
	T read(T t);
	
	void updateReadCount(int num);
	
	boolean write(T t);
	
	boolean update(T t);
	
	boolean delete(T t);
}

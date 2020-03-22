package repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.WebNote;
import mybatis.AbstractRepository;

public class MybatisWebNoteDao extends AbstractRepository{
	
	private final String namespace = "mybatis.WebNoteMapper";
	
	public void insertWebNote(WebNote webNote){
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		String statement = null;
		try{
			statement = namespace + ".getMaxMessageNo";
			int messageNo = sqlSession.selectOne(statement);
			webNote.setMessageno(messageNo);
			statement = namespace + ".insertWebNote";
			sqlSession.insert(statement, webNote);
			sqlSession.commit();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
	}
	
	public List<WebNote> getWebNoteList1(String userName){
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		String statement = null;
		try{
			statement = namespace + ".getWebNoteList1";
			return sqlSession.selectList(statement, userName);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return null;
	}
	
	public List<WebNote> getWebNoteList2(String userName){
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		String statement = null;
		try{
			statement = namespace + ".getWebNoteList2";
			return sqlSession.selectList(statement, userName);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return null;
	}
	
	public List<WebNote> getWebNoteList3(int startRow, int endRow, String userName){
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		String statement = null;
		Map<String, Object> map = new HashMap<>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("userName", userName);
		try{
			statement = namespace + ".getWebNoteList3";
			return sqlSession.selectList(statement, map);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return null;
	}
	
	public List<WebNote> getWebNoteList4(int startRow, int endRow, String userName){
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		String statement = null;
		Map<String, Object> map = new HashMap<>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("userName", userName);
		try{
			statement = namespace + ".getWebNoteList4";
			return sqlSession.selectList(statement, map);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return null;
	}
}

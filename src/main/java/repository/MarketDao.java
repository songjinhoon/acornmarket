package repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.CmtDataBean;
import model.MarketDataBean;
import mybatis.AbstractRepository;

public class MarketDao extends AbstractRepository{
	private final String namespace = "mybatis.Market";

	public void insertArticle(MarketDataBean article) throws Exception {

		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int num = 0;
		try {
			String statement = namespace + ".insert_max";
			num = sqlSession.selectOne(statement);
			article.setNum(num);
			sqlSession.insert(namespace + ".insert", article);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
	}
	
	public List<MarketDataBean> getArticle(int getPageStart, int getPageEnd) throws Exception {

		Map map = new HashMap();
		map.put("getPageStart", getPageStart);
		map.put("getPageEnd", getPageEnd);
		
		SqlSession sqlSession = getSqlSessionFactory().openSession();

		try {
			String statement = namespace + ".getArticle";
			return sqlSession.selectList(statement,map);
		} finally {
			sqlSession.close();
		}
	}
	
	public List<MarketDataBean> getArticle(String searchType,String keyword,int getPageStart, int getPageEnd) throws Exception {

		Map map = new HashMap();
		map.put("getPageStart", getPageStart);
		map.put("getPageEnd", getPageEnd);
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		System.out.println(searchType);
		System.out.println(keyword);
		SqlSession sqlSession = getSqlSessionFactory().openSession();

		try {
			String statement = namespace + ".getArticle";
			return sqlSession.selectList(statement,map);
		} finally {
			sqlSession.close();
		}
	}
	
	public MarketDataBean getArticles(int num) throws Exception {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		MarketDataBean article = null;
		try {
			String statement = namespace + ".getArticles";
			article = sqlSession.selectOne(statement, num);
			System.out.println(article);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return article;
	}
	
	public void insertArticle2(CmtDataBean article) throws Exception {

		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int cmt_num;
		try {
			
			System.out.println(article);
			String statement = namespace + ".insert_max2";
			cmt_num = sqlSession.selectOne(statement,article.getNum());
			article.setCmt_num(cmt_num);
			
			System.out.println(article);
			sqlSession.insert(namespace + ".insert2", article);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
	}
	
	public List<CmtDataBean> getArticles2(int num,int getPageStart,int getPageEnd) throws Exception {
		Map map = new HashMap();
		map.put("num", num);
		map.put("getPageStart", getPageStart);
		map.put("getPageEnd", getPageEnd);
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".getArticles2";
			return sqlSession.selectList(statement,map);
		} finally {
			sqlSession.close();
		}
	}
	
	public int getArticleCount() {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".getArticleCount";
			return sqlSession.selectOne(statement);
		} finally {
			sqlSession.close();
		}
	}
	
	public int deleteArticle(int num, String passwd) throws Exception {
		String dbpasswd = null;
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int x = 0;
		try {
			dbpasswd = sqlSession.selectOne(namespace + ".getPasswd", num);
			if (dbpasswd.equals(passwd)) {
				sqlSession.delete(namespace + ".delete", num);
				sqlSession.commit();
				x = 1;
			} else {
				x = 0;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return x;
	}
	
	public double getAverage(int num) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".getAverage";
			return sqlSession.selectOne(statement,num);
		} finally {
			sqlSession.close();
		}
	}
	
	public int getCmtCount(int num) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".getCmtCount";
			return sqlSession.selectOne(statement,num);
		} finally {
			sqlSession.close();
		}
	}
	
}

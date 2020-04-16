package repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import model.CScenterDataBean;
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
	
	public List<MarketDataBean> getArticle() throws Exception {

		SqlSession sqlSession = getSqlSessionFactory().openSession();

		try {
			String statement = namespace + ".getArticle";
			System.out.println(statement);
			return sqlSession.selectList(statement);
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
		int cmt_num = 0;
		try {
			String statement = namespace + ".insert_max2";
			cmt_num = sqlSession.selectOne(statement);
			article.setNum(cmt_num);
			sqlSession.insert(namespace + ".insert2", article);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
	}
	
	public List<CmtDataBean> getArticles2(int num) throws Exception {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		CmtDataBean article = null;
		try {
			String statement = namespace + ".getArticles2";
			return sqlSession.selectList(statement, num);
		} finally {
			sqlSession.close();
		}
	}
}

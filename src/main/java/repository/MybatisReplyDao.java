package repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import model.Reply;
import mybatis.AbstractRepository;

public class MybatisReplyDao extends AbstractRepository {
	private final String namespace = "mybatis.ReplyMapper";

	public List<Reply> getArticles(int num) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectList(namespace + ".listReply", num);
		} finally {
			sqlSession.close();
		}
	}

	public void insertreply(Reply reply) throws Exception {
		SqlSession sqlSession = getSqlSessionFactory().openSession();

		int number = 0;

		try {
			number = sqlSession.selectOne(namespace + ".insert_replynum", number);
			reply.setReplynum(number);
			sqlSession.insert(namespace + ".insertReply", reply);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
	}

	public int updatereply(Reply reply) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			int i = sqlSession.selectOne(namespace + ".check", reply);

			if (i == 0) {

				return 0;
			} else {

				sqlSession.update(namespace + ".updateReply", reply);

				sqlSession.commit();

				return 1;
			}
		} finally {
			sqlSession.close();
		}
	}

	public int deletereply(Reply reply) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();

		try {
			int i = sqlSession.selectOne(namespace + ".check", reply);
			if (i == 0) {

				return 0;

			} else {

				sqlSession.delete(namespace + ".deleteReply", reply);
				sqlSession.commit();

				return 1;
			}
		} finally {
			sqlSession.close();
		}
	}
	

}
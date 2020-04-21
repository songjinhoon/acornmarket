package repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import model.User;
import mybatis.AbstractRepository;

public class MybatisUserDao extends AbstractRepository {

	private final String namespace = "mybatis.UserMapper";

	// �쉶�썝媛��엯
	public void joinUser(User user) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		String statement = null;
		try {
			statement = namespace + ".joinUser";
			sqlSession.insert(statement, user);
			sqlSession.commit();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
	}

	// �씠硫붿씪 泥댄겕
	public int getUserEmailChecked(String userId) {
		int checked = 0;
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		String statement = null;
		try {
			statement = namespace + ".getUserEmailChecked";
			checked = sqlSession.selectOne(statement, userId);
			if (checked == 1) {
				checked = 1;
			} else {
				checked = 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return checked;
	}

	// �쉶�썝 �씠硫붿씪 議고쉶
	public String getUserEmail(String userId) {
		String userEmail = null;
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		String statement = null;

		try {
			statement = namespace + ".getUserEmail";
			System.out.println(userId + "getUserEmail");
			userEmail = sqlSession.selectOne(statement, userId);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return userEmail;
	}

	// �씠硫붿씪 �씤利� �솗�씤
	public void setUserEmailChecked(String userId) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		String statement = null;
		try {
			statement = namespace + ".setUserEmailChecked";
			sqlSession.update(statement, userId);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
	}

	// ID以묐났 議고쉶
	public int getUserIdCheck(String userId) {
		int checked = 0;
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		String statement = null;
		String userIdCheck = "";
		// System.out.println(userId);
		try {
			statement = namespace + ".getUserIdCheck";
			userIdCheck = sqlSession.selectOne(statement, userId);

			if (userIdCheck == null) {
				userIdCheck = "";
			}

			System.out.println(userIdCheck);
			System.out.println(userId);

			if (!userIdCheck.equals(userId)) {
				checked = 0;
			} else {
				checked = 1;
			}
			System.out.println(checked);

			return checked;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return checked;
	}

	// 濡쒓렇�씤
	public String Login(User user) {
		String userId = null;
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		String statement = null;

		try {
			statement = namespace + ".Login";
			userId = sqlSession.selectOne(statement, user);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return userId;
	}

	// �굹�쓽 �삩�룄 議고쉶
	public int getUserScore(String userId) {

		int userScore = 0;
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		String statement = null;
		try {
			statement = namespace + ".getUserScore";
			userScore = sqlSession.selectOne(statement, userId);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return userScore;
	}

	// �쉶�썝 �젙蹂� 議고쉶
	public User getUserInfo(String userId) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		String statement = null;
		User user = null;
		try {
			statement = namespace + ".getUserInfo";
			user = sqlSession.selectOne(statement, userId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return user;
	}

//	�븘�씠�뵒 議댁옱 �뿬遺� �솗�씤
	public String checkUserId(String userName) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		String statement = null;
		try {
			statement = namespace + ".checkUserId";
			return sqlSession.selectOne(statement, userName);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return null;
	}

	// �쉶�썝 �궘�젣
	public void deleteUser(String userId) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		String statement = null;
		try {
			statement = namespace + ".deleteUser";
			sqlSession.delete(statement, userId);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
	}

	public String getUserPasswd(String userId) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		String statement = null;
		String userpasswdCK = null;
		try {
			statement = namespace + ".getUserPasswd";
			userpasswdCK = sqlSession.selectOne(statement, userId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return userpasswdCK;
	}

	// user �젙蹂� �닔�젙
	public int setUserUpdate(User user) {

		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int checked = 0;

		try {

			sqlSession.update(namespace + ".setUserUpdate", user);
			sqlSession.commit();
			checked = 1;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return checked;
	}

	// user蹂몄씤 二쇱냼 議고쉶
	public String getUserAddress(String userid) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		String statement = null;
		String useraddress = null;

		try {
			statement = namespace + ".getUserAddress";
			useraddress = sqlSession.selectOne(statement, userid);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return useraddress;
	}

	// user 二쇰� 嫄곕옒 二쇱냼 寃��깋
	public List<String> getAddress(String useraddress) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		String statement = null;
		try {
			statement = namespace + ".getAddress";
			return sqlSession.selectList(statement, useraddress);
		} finally {
			sqlSession.close();
		}
	}

	public List<String> getUserSub(String useraddress) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		String statement = null;
		try {
			statement = namespace + ".getUserSub";
			return sqlSession.selectList(statement, useraddress);
		} finally {
			sqlSession.close();
		}
	}

	// 상위 x명 유저 가져오기
	public List<User> getUserList(int count) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		String statement = null;
		try {
			statement = namespace + ".getUserList";
			return sqlSession.selectList(statement, count);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return null;
	}
}

package mybatis;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public abstract class AbstractRepository {
	String resource;
	private static SqlSessionFactory sqlSessionFactory;
	
	
	private void setSqlSessionFactory() {
		
		InputStream inputStream;
		
		try {
			inputStream = Resources.getResourceAsStream(resource);
		} catch (IOException e) {
			
			throw new IllegalArgumentException(e);
		
		}
		
		sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
	}

	protected SqlSessionFactory getSqlSessionFactory() {
		
		setSqlSessionFactory();
		return sqlSessionFactory;
		
	}
	
	public void setDbname(String dbname) {
		resource =  "mybatis/mybatis-config" + dbname + ".xml";
		System.out.println(resource);
	}
}

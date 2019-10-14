package com.example.kkhBoard;
import javax.sql.DataSource;
 
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.transaction.annotation.EnableTransactionManagement;
 
@Configuration
@MapperScan(basePackages="com.example.kkhBoard") //mapper 인터페이스를 인식할수 있도록 설정
@EnableTransactionManagement
public class DatabaseConfig {
 
	// DB와 스프링을 연동 시켜주는 JDBC의 datasource,bean과 list에 select문을 담아주는 
	// mybatis-config.xml,SQL문이 쓰일 *mapper.xml 경로설정
    @Bean //스프링에 필요한 객체를 생성
    public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception {
        final SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
        sessionFactory.setDataSource(dataSource);
        PathMatchingResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();
        sessionFactory.setMapperLocations(resolver.getResources("classpath:mybatis/mapper/*.xml"));
        return sessionFactory.getObject();
    }
    // DB에 사용이 끝나면 sqlSessionFactory에 접근하여 커넥션을 close()하는 기능
    @Bean
    public SqlSessionTemplate sqlSessionTemplate(SqlSessionFactory sqlSessionFactory) throws Exception {
      final SqlSessionTemplate sqlSessionTemplate = new SqlSessionTemplate(sqlSessionFactory);
      return sqlSessionTemplate;
    }
 
 
}



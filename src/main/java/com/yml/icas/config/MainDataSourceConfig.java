package com.yml.icas.config;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;

import javax.sql.DataSource;
import java.util.Properties;

@Configuration
@EnableJpaRepositories(
        basePackages = "com.yml.icas.repository",
        entityManagerFactoryRef = "mainEntityManagerFactory",
        transactionManagerRef = "mainTransactionManager"
)
public class MainDataSourceConfig {

    @Bean(name = "mainDataSource")
    @Primary
    @ConfigurationProperties(prefix = "spring.datasource")
    public DataSource mainDataSource() {
        return DataSourceBuilder.create().build();
    }

    @Bean(name = "mainEntityManagerFactory")
    @Primary
    public LocalContainerEntityManagerFactoryBean mainEntityManagerFactory(
            @Qualifier("mainDataSource") DataSource dataSource
    ) {
        LocalContainerEntityManagerFactoryBean em = new LocalContainerEntityManagerFactoryBean();
        em.setDataSource(dataSource);
        em.setPackagesToScan("com.yml.icas.model");
        em.setJpaVendorAdapter(new HibernateJpaVendorAdapter());
        //Properties props = new Properties();
        //props.put("hibernate.show_sql", "true");
        //props.put("hibernate.format_sql", "true");
        //props.put("hibernate.physical_naming_strategy", "org.hibernate.boot.model.naming.CamelCaseToUnderscoresNamingStrategy");
        //props.put("hibernate.physical_naming_strategy", "org.springframework.boot.orm.jpa.hibernate.SpringPhysicalNamingStrategy");
       // props.put("hibernate.implicit_naming_strategy", "org.hibernate.boot.model.naming.ImplicitNamingStrategyJpaCompliantImpl");

       // em.setJpaProperties(props);
        return em;
    }

    @Bean(name = "mainTransactionManager")
    @Primary
    public JpaTransactionManager mainTransactionManager(
            @Qualifier("mainEntityManagerFactory") LocalContainerEntityManagerFactoryBean factory
    ) {
        return new JpaTransactionManager(factory.getObject());
    }
}


package com.yml.icas.config;

import jakarta.persistence.EntityManagerFactory;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.boot.orm.jpa.EntityManagerFactoryBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.transaction.PlatformTransactionManager;

import javax.sql.DataSource;

@Configuration
@EnableJpaRepositories(
        basePackages = "com.yml.icas.hr.repository",    // HR repositories
        entityManagerFactoryRef = "hrEntityManagerFactory",
        transactionManagerRef = "hrTransactionManager"
)
public class HrDataSourceConfig {

    @Bean
    @ConfigurationProperties("spring.hr-datasource")
    public DataSource hrDataSource() {
        return DataSourceBuilder.create().build();
    }

    @Bean
    public LocalContainerEntityManagerFactoryBean hrEntityManagerFactory(
            EntityManagerFactoryBuilder builder) {
        return builder
                .dataSource(hrDataSource())
                .packages("com.yml.icas.hr.model")   // HR entity classes
                .persistenceUnit("hrPU")
                .build();
    }

    @Bean
    public PlatformTransactionManager hrTransactionManager(
            @Qualifier("hrEntityManagerFactory") EntityManagerFactory hrEntityManagerFactory) {
        return new JpaTransactionManager(hrEntityManagerFactory);
    }
}


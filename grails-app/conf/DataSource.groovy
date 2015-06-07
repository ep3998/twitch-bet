dataSource {
    pooled = true
    driverClassName = "com.mysql.jdbc.Driver"
    dialect = "org.hibernate.dialect.MySQL5InnoDBDialect"
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
}

// environment specific settings
environments {
    development {
		dataSource {
			dbCreate = "create" // one of 'create', 'create-drop','update'
			url = "jdbc:mysql://localhost/twitch?useUnicode=yes&characterEncoding=UTF-8"
			username = "root"
			password = "Pika3998"
		}
		hibernate {
			show_sql = true
		}
    }
    test {
        dataSource {
            dbCreate = "create-drop" // one of 'create', 'create-drop','update'
            url = "jdbc:mysql://localhost/TESTDBNAME?useUnicode=yes&characterEncoding=UTF-8"
            username = "test"
            password = "testpw"
        }
    }
    production {
		dataSource {
			username = "admin"
			password = "Pika3998"
			url = "jdbc:mysql://aa1m4jkogvxof3a.c8ufjlqjipye.us-west-1.rds.amazonaws.com:3306/ebdb?reconnect=true"
//			url = "jdbc:mysql://localhost/twitch?useUnicode=yes&characterEncoding=UTF-8"
//			username = "root"
//			password = "Pika3998"
			
			dbCreate = "update"
			properties {
				validationQuery = "SELECT 1"
				testOnBorrow = true
				testOnReturn = true
				testWhileIdle = true
				timeBetweenEvictionRunsMillis = 1800000
				numTestsPerEvictionRun = 3
				minEvictableIdleTimeMillis = 1800000
			}
		}
    }
}

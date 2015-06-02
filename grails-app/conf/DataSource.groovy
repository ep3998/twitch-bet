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
//		dataSource {
//			dbCreate = "create-drop"
//			driverClassName = "org.postgresql.Driver"
//			dialect = org.hibernate.dialect.PostgreSQLDialect
//	
//			uri = new URI(System.env.DATABASE_URL?:"postgres://postgres:kjantar@localhost:5432/postgres")
//	
//			url = "jdbc:postgresql://" + uri.host + ":" + uri.port + uri.path
//			username = uri.userInfo.split(":")[0]
//			password = uri.userInfo.split(":")[1]
//		}
		dataSource {
			dbCreate = "create" // one of 'create', 'create-drop','update'
			url = "jdbc:mysql://localhost/twitch?useUnicode=yes&characterEncoding=UTF-8"
			username = "ep3998"
			password = "kjantar"
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
			dbCreate = "update"
//			driverClassName = "org.postgresql.Driver"
//			dialect = org.hibernate.dialect.PostgreSQLDialect
			uri = new URI(System.env.DATABASE_URL?:"mysql://b39ac7849d6c08:c386fbbc@us-cdbr-iron-east-02.cleardb.net/heroku_bc2c2f3abde1dd9?reconnect=true")
	
			url = "jdbc:mysql://" + uri.host + ":" + uri.port + uri.path
			username = uri.userInfo.split(":")[0]
			password = uri.userInfo.split(":")[1]
		}
//		dataSource {
//			dbCreate = "update"
//			url = "jdbc:mysql://localhost/PRODDBNAME?useUnicode=yes&characterEncoding=UTF-8"
//			username = "prod"
//			password = "prodpw"
//		}
    }
}

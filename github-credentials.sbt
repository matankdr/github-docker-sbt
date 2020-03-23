val username = sys.env.get("GITHUB_USERNAME").getOrElse("")
val password = sys.env.get("GITHUB_PASSWORD").getOrElse("")
credentials += Credentials("GitHub Package Registry", "maven.pkg.github.com", username, password)
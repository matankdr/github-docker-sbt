
Github action with JDK 11.0.5, SBT 1.3.8, Docker and Ivy resolver.

Examples:

```$xslt
name: Run tests
        uses: matankdr/github-docker-sbt@11.0.5-1.3.8-DOCKER-IVY-CREDS7
        with:
          command: sbt test docker:publish publish
          packages-resolver: "ivy creds" 

name: Run test and upload container
        uses: matankdr/github-docker-sbt@11.0.5-1.3.8-DOCKER-IVY-CREDS7
        with:
          command: sbt test docker:publish publish
          packages-resolver: "ivy creds"  
          docker-login-username: "my username"
          docker-login-password: "my password"
          docker-registry: "my registry"
```
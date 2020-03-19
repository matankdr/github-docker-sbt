
Github action with JDK 11.0.5, SBT 1.3.8, Docker and Ivy resolver.

Examples:

```$xslt
name: Run tests
        uses: matankdr/github-docker-sbt@11.0.5-1.3.8-DOCKER-IVY-CREDS
        with:
          packages-resolver: "ivy creds"
          command: sbt test

name: Run test and upload container
        uses: matankdr/github-docker-sbt@11.0.5-1.3.8-DOCKER-IVY-CREDS
        with:
          docker-login-username: "my username"
          docker-login-password: "my password"
          docker-registry: "my registry"
          packages-resolver: "ivy creds"
          command: sbt test docker:publish publish
```
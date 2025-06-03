# Iapetus

> In Greek mythology, Iapetus (/aɪˈæpɪtəs/; eye-AP-ih-təs;[1] Ancient Greek: Ἰαπετός, romanized: Iapetós),[2] also Japetus, is a Titan, the son of Uranus and Gaia[3] and father of Atlas.

## Usage

Include Iapetus as parent in your `pom.xml`.

```xml
<parent>
    <groupId>com.linked-planet.maven</groupId>
    <artifactId>iapetus</artifactId>
    <version>1.0.4</version>
</parent>
```

## Release

Releases are build with `maven-release-plugin` and published to Maven-Central with `central-publishing-maven-plugin`.

Include the credentials for Maven-Central to your `~/.m2/settings.xml`.

```xml
<server>
    <id>central</id>
    <username>Username from Pass</username>
    <password>Password from Pass</password>
</server>
```

Then build and run the release.

```bash
mvn clean install -Piapetus-release
mvn release:prepare -Piapetus-release
mvn release:perform -Piapetus-release
```

# Iapetus

> In Greek mythology, **Iapetus** (/aɪˈæpɪtəs/; eye-AP-ih-təs; Ancient Greek: Ἰαπετός, romanized: Iapetós), also Japetus, is a Titan, the son of Uranus and Gaia and **father of Atlas**.

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

Then build and deploy the release.

```bash
mvn release:prepare release:perform
```

If anything goes wrong, rollback.

```bash
mvn release:rollback
```

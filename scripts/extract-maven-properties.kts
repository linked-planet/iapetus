import java.nio.file.Files
import java.nio.file.Paths
import javax.xml.parsers.DocumentBuilderFactory

// TODO:
// fun printHelp() = println("Usage: kotlin -script ${__FILE__} <command> <command>")

if (args.size < 2) {
    throw IllegalArgumentException(
        """
        Must be called with at least 2 arguments.
    """.trimIndent()
    )
}

val depsDir = args[0]

for (dep in args.drop(1)) {
    val pomFile = Paths.get(depsDir, "$dep.pom")

    if (!Files.isRegularFile(pomFile)) {
        throw IllegalArgumentException("Couldn't find '$dep' in $depsDir")
    }

    val inputStream = Files.readAllBytes(pomFile).inputStream()
    val pom = DocumentBuilderFactory
        .newInstance()
        .newDocumentBuilder()
        .parse(inputStream)

    val props = pom.getElementsByTagName("property")

    println(props)
}






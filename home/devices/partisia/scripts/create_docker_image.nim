import std/[xmltree, xmlparser, options, files, paths, osproc, strformat]

proc read_artifact_id(): Option[string] =
  if not file_exists("pom.xml".Path):
    return none[string]()
  let xml = load_xml("pom.xml")
  return xml.child("artifactId").innerText().some()


proc create_docker_image(image_name: string) =
  discard execCmd fmt"mvn clean compile com.google.cloud.tools:jib-maven-plugin:3.4.1:dockerBuild -Dimage={image_name}"


proc upload_docker_image(image_name: string) =
  discard execCmd fmt"docker tag {image_name} localhost:5000/{image_name}"
  discard execCmd fmt"docker push localhost:5000/{imagename}"


when isMainModule:
  let artifact_id = read_artifact_id()
  if artifact_id.is_none():
    echo "Could not find pom.xml"
    quit()
  let image_id = artifact_id.get() & "-dev"
  create_docker_image(image_id)
  upload_docker_image(image_id)

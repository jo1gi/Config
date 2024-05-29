#!/usr/bin/env fennel
(local xml2lua (require :xml2lua))

(fn file-exists [file]
  (local f (io.open file "rb"))
  (when f (f:close))
  (~= f nil))

(fn read-file-as-string [file]
  (var lines "")
  (each [line (io.lines file)]
    (set lines (.. lines line "\n")))
  lines)

(when (not (file-exists "pom.xml"))
  (print "pom.xml does not exist")
  (os.exit))

(local pom (read-file-as-string "pom.xml"))
(local handler (require :xmlhandler.tree))
(local parser (xml2lua.parser handler))
(parser:parse pom)
(local artifact-id handler.root.project.artifactId)
(local image-id (.. artifact-id "-dev"))

(os.execute (.. "mvn clean compile com.google.cloud.tools:jib-maven-plugin:3.4.1:dockerBuild -Dimage=\"" image-id "\""))
(os.execute (.. "docker tag " image-id " localhost:5000/" image-id))
(os.execute (.. "docker push localhost:5000/" image-id))

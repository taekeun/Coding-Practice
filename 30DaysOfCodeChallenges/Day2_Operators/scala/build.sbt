ThisBuild / scalaVersion := "2.12.6"

lazy val solution = (project in file("."))
  .settings(
    libraryDependencies += "org.scalatest" %% "scalatest" % "3.0.5" % Test
  )

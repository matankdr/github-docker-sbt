name := "test-project"
version := "1.0"
scalaVersion := "2.12.11"

lazy val userdir = taskKey[Unit]("Print user.dir proprety")
userdir := { // sbt userdir is going to crash if not in this directory
  println(System.getProperty("user.dir"))
}
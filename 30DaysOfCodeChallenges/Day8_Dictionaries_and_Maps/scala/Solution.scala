// https://www.hackerrank.com/challenges/30-dictionaries-and-maps/problem
// TODO refactoring

import java.io._

object Solution {
  def solve(phoneBook: scala.collection.mutable.Map[String, String], name: String): String = {
    if(phoneBook.isDefinedAt(name))
      name + "=" + phoneBook(name)
    else
      "Not found"
  }

  def main(args: Array[String]) {
    val stdin = scala.io.StdIn
    val n = stdin.readLine.trim.toInt

    var phoneBook = scala.collection.mutable.Map.empty[String, String]
    for(_ <- 1 to n) {
      val row = stdin.readLine.split(" ").map(_.trim)
      phoneBook(row(0)) = row(1)
    }

    for(_ <- 1 to n) {
      val name = stdin.readLine.trim
      println(solve(phoneBook, name))
    }
  }
}

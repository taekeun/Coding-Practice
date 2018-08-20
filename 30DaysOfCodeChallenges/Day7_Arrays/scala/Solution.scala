// https://www.hackerrank.com/challenges/30-arrays/problem

import java.io._

object Solution {
  def solve(a: Array[Int]): String = {
    a.reverse.mkString(" ")
  }

  def main(args: Array[String]) {
    val stdin = scala.io.StdIn
    stdin.readLine.trim.toInt
    val a = stdin.readLine.split(" ").map(_.trim.toInt)
    println(solve(a))
  }
}

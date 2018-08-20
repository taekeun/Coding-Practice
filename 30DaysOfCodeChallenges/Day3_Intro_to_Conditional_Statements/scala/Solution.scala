// https://www.hackerrank.com/challenges/30-conditional-statements/problem

import java.io._

object Solution {
  def conditionalAction(n: Int): String = {
    n match {
      case x if x % 2 != 0 => "Weird"
      case x if x <= 5 => "Not Weird"
      case x if x <= 20 => "Weird"
      case _ => "Not Weird"
    }
  }

  def main(args: Array[String]) {
    val stdin = scala.io.StdIn
    val n = stdin.readLine.trim.toInt
    println(conditionalAction(n))
  }
}

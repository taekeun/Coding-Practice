// https://www.hackerrank.com/challenges/30-conditional-statements/problem

import java.io._

object Solution {
  def conditionalAction(n: Int): String = {
    if(n % 2 != 0) "Weird"
    else if(n <= 5) "Not Weird"
    else if(n <= 20) "Weird"
    else "Not Weird"
  }

  def main(args: Array[String]) {
    val stdin = scala.io.StdIn
    val n = stdin.readLine.trim.toInt
    println(conditionalAction(n))
  }
}

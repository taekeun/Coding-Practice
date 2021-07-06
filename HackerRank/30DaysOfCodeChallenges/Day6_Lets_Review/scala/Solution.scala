// https://www.hackerrank.com/challenges/30-review-loop/problem

import java.io._

object Solution {
  def separate(s: String): String = {
    var odd = ""
    var even = ""

    for(i <- 0 until s.length()) {
      val c = s(i)
      if ((i + 1) % 2 == 0)
        even += c
      else
        odd += c
    }

    odd + " " + even
  }

  def main(args: Array[String]) {
    val stdin = scala.io.StdIn
    val n = stdin.readLine.trim.toInt
    for (i <- 1 to n) {
      val s = stdin.readLine.trim
      println(separate(s))
    }
  }
}

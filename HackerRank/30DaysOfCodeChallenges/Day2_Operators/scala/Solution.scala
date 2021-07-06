// https://www.hackerrank.com/challenges/30-operators/problem

import java.io._

object Solution {
  def totalCost(mealCost: Double, tipPercent: Int, taxPercent: Int): Int = {
    def calcPercent(percent: Int): Double = mealCost * percent / 100

    val cost = mealCost + calcPercent(tipPercent) + calcPercent(taxPercent)
    math.round(cost).toInt
  }

  def main(args: Array[String]):Unit = {
    val stdin = scala.io.StdIn
    val mealCost = stdin.readLine.trim.toDouble
    val tipPercent = stdin.readLine.trim.toInt
    val taxPercent = stdin.readLine.trim.toInt

    val result = totalCost(mealCost, tipPercent, taxPercent)

    println(s"The total meal cost is $result dollars.")
  }
}

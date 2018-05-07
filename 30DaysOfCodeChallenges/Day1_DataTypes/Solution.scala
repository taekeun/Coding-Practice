object Solution {
  def main(args: Array[String]) {
    val i = 4
    val d = 4.0
    val s = "HackerRank "
    // Read values of another integer, double, and string variables
    // Note use scala.io.StdIn to read from stdin
    val int_value = scala.io.StdIn.readLine().toInt // .readInt()
    val double_value = scala.io.StdIn.readLine().toDouble // .readDouble()
    val string_value = scala.io.StdIn.readLine()
            
    // Print the sum of both the integer variables
    println(int_value + i)

    // Print the sum of both the double variables
    println(double_value + d)

    // Concatenate and print the string variables
    // The 's' variable above should be printed first.
    println(s + string_value)
  }
}

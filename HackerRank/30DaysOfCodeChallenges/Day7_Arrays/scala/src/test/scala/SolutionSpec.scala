import org.scalatest.FlatSpec

class SolutionSpec extends FlatSpec {
  "solve" should "return string" in {
    assert("2 3 4 1" == Solution.solve(Array(1, 4, 3, 2)))
  }
}

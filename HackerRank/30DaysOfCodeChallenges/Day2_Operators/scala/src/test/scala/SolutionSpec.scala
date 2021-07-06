import org.scalatest.FlatSpec

class SolutionSpec extends FlatSpec {
  "totalCost" should "be right" in {
    assert(15 == Solution.totalCost(12.00, 20, 8))
    assert(19 == Solution.totalCost(15.50, 15, 10))
  }
  it should "round to the nearest integer" in {
    assert(10 == Solution.totalCost(10.00, 2, 2))
    assert(11 == Solution.totalCost(10.00, 3, 3))
  }
}

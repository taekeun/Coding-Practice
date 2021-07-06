import org.scalatest.FlatSpec

class SolutionSpec extends FlatSpec {
  "conditionalAction" should "Weird when odd" in {
    assert("Weird" == Solution.conditionalAction(1))
    assert("Weird" == Solution.conditionalAction(3))
  }
  it should "Not Weird when is even and in the inclusive range of 2 to 5" in {
    assert("Not Weird" == Solution.conditionalAction(2))
    assert("Not Weird" == Solution.conditionalAction(4))
  }
  it should "Weird when is even and in the inclusive range of 6 to 20" in {
    assert("Weird" == Solution.conditionalAction(6))
    assert("Weird" == Solution.conditionalAction(20))
  }
  it should "Not Weird when is even and greater than 20" in {
    assert("Not Weird" == Solution.conditionalAction(24))
  }
}

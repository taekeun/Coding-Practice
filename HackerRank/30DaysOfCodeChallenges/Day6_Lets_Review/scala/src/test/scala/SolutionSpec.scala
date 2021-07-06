import org.scalatest.FlatSpec

class SolutionSpec extends FlatSpec {
  "sperate" should "seperate string to odd-indexed, even-indexed" in {
    assert("Hce akr" == Solution.separate("Hacker"))
    assert("Rn ak" == Solution.separate("Rank"))
  }
}

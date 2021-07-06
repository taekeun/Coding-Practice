import org.scalatest.FlatSpec

class SolutionSpec extends FlatSpec {
  val phoneBook = scala.collection.mutable.Map(
    "sam" -> "99912222",
    "tom" -> "11122222",
    "harry" -> "12299933"
  )

  "solve" should "found phone number" in {
    assert("sam=99912222" == Solution.solve(phoneBook, "sam"))
    assert("harry=12299933" == Solution.solve(phoneBook, "harry"))
  }

  it should "not found" in {
    assert("Not found" == Solution.solve(phoneBook, "edward"))
  }
}

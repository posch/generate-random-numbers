
object Gen {
  def main(args: Array[String]) = {
    var r = scala.util.Random
    val n = args(0).toInt
    for (i <- 1 to n) {
      println("%.6f".format(r.nextDouble()))
    }
  }
}

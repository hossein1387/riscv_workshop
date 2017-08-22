// See LICENSE.txt for license details.
package problems

import chisel3._
import chisel3.iotesters.Driver
import utils.TutorialRunner

object Launcher {
  val tests = Map(
    "Accumulator" -> { (backendName: String) =>
      Driver(() => new Accumulator(), backendName) {
        (c) => new AccumulatorTests(c)
      }
    },
    "Adder" -> { (backendName: String) =>
      Driver(() => new Adder(8), backendName) {
        (c) => new AdderTests(c)
      }
    },
    "Mux4" -> { (backendName: String) =>
      Driver(() => new Mux4(), backendName) {
        (c) => new Mux4Tests(c)
      }
    },
    "Counter" -> { (backendName: String) =>
      Driver(() => new Counter(), backendName) {
        (c) => new CounterTest(c)
      }
    }
  )

  def main(args: Array[String]): Unit = {
    TutorialRunner(tests, args)
  }
}

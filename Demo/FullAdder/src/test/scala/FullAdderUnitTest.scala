// See LICENSE for license details.

package example.test

import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}
import example.FullAdder

class FullAdderUnitTester(fa: FullAdder) extends PeekPokeTester(fa) {
 
  poke(fa.io.A , 1)
  poke(fa.io.B , 0)
  poke(fa.io.Cin , 1)
  expect(fa.io.Sum, 0)
  expect(fa.io.Cout, 1)
 
  printf("======================================\n");
  printf("Test Pass!\n");
  printf("======================================\n");

}

class FullAdderTester extends ChiselFlatSpec {
  private val backendNames = Array[String]("firrtl", "verilator")
  for ( backendName <- backendNames ) {
    "FullAdder" should s"Implements a simple FullAdder(with $backendName)" in {
      Driver(() => new FullAdder, backendName) {
        c => new FullAdderUnitTester(c)
      } should be (true)
    }
  }
}

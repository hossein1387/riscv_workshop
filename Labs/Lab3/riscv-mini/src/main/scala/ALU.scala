// See LICENSE for license details.

package mini

import chisel3._
import chisel3.util._
import config.Parameters

object ALU {
  val ALU_ADD    = 0.U(4.W)
  val ALU_SUB    = 1.U(4.W)
  val ALU_AND    = 2.U(4.W)
  val ALU_OR     = 3.U(4.W)
  val ALU_XOR    = 4.U(4.W)
  val ALU_SLT    = 5.U(4.W)
  val ALU_SLL    = 6.U(4.W)
  val ALU_SLTU   = 7.U(4.W)
  val ALU_SRL    = 8.U(4.W)
  val ALU_SRA    = 9.U(4.W)
  val ALU_COPY_A = 10.U(4.W)
  val ALU_COPY_B = 11.U(4.W)
  val ALU_XXX    = 15.U(4.W)
}

class ALUIo(implicit p: Parameters) extends CoreBundle()(p) {
  val A = Input(UInt(xlen.W))
  val B = Input(UInt(xlen.W))
  val alu_op = Input(UInt(4.W))
  val out = Output(UInt(xlen.W))
  val sum = Output(UInt(xlen.W))
}

import ALU._

abstract class ALU(implicit val p: Parameters) extends Module with CoreParams {
  val io = IO(new ALUIo)
}

class ALUSimple(implicit p: Parameters) extends ALU()(p) {
  val shamt = io.B(4,0).asUInt

  io.out := MuxLookup(io.alu_op, io.B, Seq(
        ALU_ADD  -> (io.A + io.B),
      //ALU_SUB  ,
      //ALU_SRA  ,
      //ALU_SRL  ,
      //ALU_SLL  ,
      //ALU_SLT  ,
      //ALU_SLTU ,
      //ALU_AND  ,
      //ALU_OR   ,
      //ALU_XOR  ,
      //ALU_COPY_A ,

  io.sum := io.A + Mux(io.alu_op(0), -io.B, io.B)
}

class ALUArea(implicit p: Parameters) extends ALU()(p) { 
  val sum = io.A + Mux(io.alu_op(0), -io.B, io.B)
  val cmp = Mux(io.A(xlen-1) === io.B(xlen-1), sum(xlen-1),
            Mux(io.alu_op(1), io.B(xlen-1), io.A(xlen-1)))
  val shamt  = io.B(4,0).asUInt
  val shin   = Mux(io.alu_op(3), io.A, Reverse(io.A))
  val shiftr = (Cat(io.alu_op(0) && shin(xlen-1), shin).asSInt >> shamt)(xlen-1, 0)
  val shiftl = Reverse(shiftr)

  val out ///= ??


  io.out := out
  io.sum := sum
}

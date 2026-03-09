import VersoManual
import Cookbook.Lean

open Verso.Genre Manual
open Verso.Genre.Manual.InlineLean

open Lean Elab Meta Tactic Command
open Cookbook

set_option pp.rawOnError true

#doc (Manual) "Running an external program (e.g. `curl`)" =>

%%%
tag := "running-an-external-program"
number := false
%%%

{index}[Running an external program (e.g. `curl`)]

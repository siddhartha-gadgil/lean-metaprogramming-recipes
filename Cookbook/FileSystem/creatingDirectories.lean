import VersoManual
import Cookbook.Lean

open Verso.Genre Manual
open Verso.Genre.Manual.InlineLean

open Lean Elab Meta Tactic Command
open Cookbook

set_option pp.rawOnError true

#doc (Manual) "Creating directories (if they don't exist)" =>

%%%
tag := "creating-directories"
number := false
%%%

{index}[Creating directories (if they don't exist)]

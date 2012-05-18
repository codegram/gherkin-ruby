#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.4.8
# from Racc grammer file "".
#

require 'racc/parser.rb'

  require_relative "lexer"
  require_relative "../ast"

module Gherkin
  class Parser < Racc::Parser

module_eval(<<'...end gherkin.y/module_eval...', 'gherkin.y', 107)

  def parse(input)
    @yydebug = true if ENV['DEBUG_RACC']
    scan_str(input)
  end
...end gherkin.y/module_eval...
##### State transition tables begin ###

racc_action_table = [
    17,    17,     5,    13,    15,    43,    17,    28,    17,     5,
    18,    41,    34,    35,    36,    37,    38,    17,     5,     4,
     9,     5,    17,    34,    35,    36,    37,    38,    34,    35,
    36,    37,    38,    34,    35,    36,    37,    38,    13,    15,
    30,    21,     5,    16,     5,    23,    17,     5,    45,    17,
    46,     5,    26,    49,    10,     5,    17,     5,    17,    24 ]

racc_action_check = [
    22,    27,    14,    11,    11,    27,    44,    14,     6,    32,
     6,    22,    44,    44,    44,    44,    44,    42,     0,     0,
     0,    16,    52,    42,    42,    42,    42,    42,    52,    52,
    52,    52,    52,    20,    20,    20,    20,    20,     3,     3,
    18,     7,    21,     4,    26,     9,    29,     8,    33,    39,
    40,    41,    13,    43,     1,    46,    47,    49,    51,    10 ]

racc_action_pointer = [
    16,    54,   nil,    32,    30,   nil,     6,    36,    45,    32,
    59,    -3,   nil,    39,     0,   nil,    19,   nil,    27,   nil,
    25,    40,    -2,   nil,   nil,   nil,    42,    -1,   nil,    44,
   nil,   nil,     7,    35,   nil,   nil,   nil,   nil,   nil,    47,
    37,    49,    15,    40,     4,   nil,    53,    54,   nil,    55,
   nil,    56,    20,   nil ]

racc_action_default = [
   -35,   -35,    -1,    -2,   -35,    -7,   -35,    -9,   -11,   -35,
   -35,    -4,   -29,   -35,   -35,   -33,    -5,    -8,   -35,   -10,
   -35,   -35,   -12,   -14,    54,   -30,   -35,   -35,   -34,    -6,
   -15,   -18,   -20,   -35,   -24,   -25,   -26,   -27,   -28,   -19,
   -13,   -35,   -35,   -35,   -21,   -23,   -35,   -16,   -31,   -35,
   -22,   -17,   -35,   -32 ]

racc_goto_table = [
     6,    31,    12,    19,     3,     7,    11,     8,    22,    40,
    25,    20,     2,     1,    27,   nil,    29,   nil,   nil,   nil,
   nil,    39,   nil,    48,   nil,    50,    42,   nil,   nil,   nil,
   nil,   nil,    44,    53,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,    47,   nil,   nil,   nil,   nil,    51,   nil,   nil,    52 ]

racc_goto_check = [
     5,    11,    14,     7,     3,     6,     4,     8,     5,     9,
    14,    10,     2,     1,     5,   nil,     5,   nil,   nil,   nil,
   nil,     5,   nil,    11,   nil,    11,     5,   nil,   nil,   nil,
   nil,   nil,     5,    11,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,     5,   nil,   nil,   nil,   nil,     5,   nil,   nil,     5 ]

racc_goto_pointer = [
   nil,    13,    12,     4,     3,     0,     5,    -4,     7,   -13,
     4,   -19,   nil,   nil,    -1,   nil ]

racc_goto_default = [
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,    32,    33,   nil,    14 ]

racc_reduce_table = [
  0, 0, :racc_error,
  1, 15, :_reduce_1,
  1, 15, :_reduce_2,
  1, 15, :_reduce_3,
  2, 15, :_reduce_4,
  2, 16, :_reduce_5,
  3, 16, :_reduce_6,
  1, 19, :_reduce_none,
  2, 19, :_reduce_none,
  1, 17, :_reduce_9,
  2, 17, :_reduce_10,
  1, 20, :_reduce_11,
  2, 20, :_reduce_12,
  3, 20, :_reduce_13,
  2, 22, :_reduce_14,
  3, 22, :_reduce_15,
  2, 23, :_reduce_none,
  3, 23, :_reduce_none,
  2, 21, :_reduce_18,
  2, 24, :_reduce_19,
  1, 25, :_reduce_20,
  2, 25, :_reduce_21,
  3, 25, :_reduce_22,
  2, 26, :_reduce_23,
  1, 27, :_reduce_none,
  1, 27, :_reduce_none,
  1, 27, :_reduce_none,
  1, 27, :_reduce_none,
  1, 27, :_reduce_none,
  1, 18, :_reduce_29,
  2, 18, :_reduce_30,
  4, 28, :_reduce_31,
  6, 28, :_reduce_32,
  1, 29, :_reduce_33,
  2, 29, :_reduce_34 ]

racc_reduce_n = 35

racc_shift_n = 54

racc_token_table = {
  false => 0,
  :error => 1,
  :NEWLINE => 2,
  :LOCALE => 3,
  :FEATURE => 4,
  :BACKGROUND => 5,
  :SCENARIO => 6,
  :TAG => 7,
  :GIVEN => 8,
  :WHEN => 9,
  :THEN => 10,
  :AND => 11,
  :BUT => 12,
  :TEXT => 13 }

racc_nt_base = 14

racc_use_result_var = true

Racc_arg = [
  racc_action_table,
  racc_action_check,
  racc_action_default,
  racc_action_pointer,
  racc_goto_table,
  racc_goto_check,
  racc_goto_default,
  racc_goto_pointer,
  racc_nt_base,
  racc_reduce_table,
  racc_token_table,
  racc_shift_n,
  racc_reduce_n,
  racc_use_result_var ]

Racc_token_to_s_table = [
  "$end",
  "error",
  "NEWLINE",
  "LOCALE",
  "FEATURE",
  "BACKGROUND",
  "SCENARIO",
  "TAG",
  "GIVEN",
  "WHEN",
  "THEN",
  "AND",
  "BUT",
  "TEXT",
  "$start",
  "Root",
  "Locale",
  "Feature",
  "Scenarios",
  "Newline",
  "FeatureHeader",
  "Background",
  "FeatureName",
  "Description",
  "BackgroundHeader",
  "Steps",
  "Step",
  "Keyword",
  "Scenario",
  "Tags" ]

Racc_debug_parser = false

##### State transition tables end #####

# reduce 0 omitted

module_eval(<<'.,.,', 'gherkin.y', 15)
  def _reduce_1(val, _values, result)
     result = val[0]; 
    result
  end
.,.,

module_eval(<<'.,.,', 'gherkin.y', 17)
  def _reduce_2(val, _values, result)
     result = val[0] 
    result
  end
.,.,

module_eval(<<'.,.,', 'gherkin.y', 19)
  def _reduce_3(val, _values, result)
     result = val[0]; 
    result
  end
.,.,

module_eval(<<'.,.,', 'gherkin.y', 22)
  def _reduce_4(val, _values, result)
     result = val[0]; result.scenarios = val[1] 
    result
  end
.,.,

module_eval(<<'.,.,', 'gherkin.y', 26)
  def _reduce_5(val, _values, result)
     result = val[1] 
    result
  end
.,.,

module_eval(<<'.,.,', 'gherkin.y', 27)
  def _reduce_6(val, _values, result)
     result = val[1] 
    result
  end
.,.,

# reduce 7 omitted

# reduce 8 omitted

module_eval(<<'.,.,', 'gherkin.y', 36)
  def _reduce_9(val, _values, result)
     result = val[0] 
    result
  end
.,.,

module_eval(<<'.,.,', 'gherkin.y', 38)
  def _reduce_10(val, _values, result)
     result = val[0]; result.background = val[1] 
    result
  end
.,.,

module_eval(<<'.,.,', 'gherkin.y', 42)
  def _reduce_11(val, _values, result)
     result = val[0] 
    result
  end
.,.,

module_eval(<<'.,.,', 'gherkin.y', 43)
  def _reduce_12(val, _values, result)
     result = val[0] 
    result
  end
.,.,

module_eval(<<'.,.,', 'gherkin.y', 45)
  def _reduce_13(val, _values, result)
     result = val[0] 
    result
  end
.,.,

module_eval(<<'.,.,', 'gherkin.y', 49)
  def _reduce_14(val, _values, result)
     result = AST::Feature.new(val[1]); result.pos(filename, lineno) 
    result
  end
.,.,

module_eval(<<'.,.,', 'gherkin.y', 50)
  def _reduce_15(val, _values, result)
     result = AST::Feature.new(val[2]); result.pos(filename, lineno) 
    result
  end
.,.,

# reduce 16 omitted

# reduce 17 omitted

module_eval(<<'.,.,', 'gherkin.y', 60)
  def _reduce_18(val, _values, result)
     result = val[0]; result.steps = val[1] 
    result
  end
.,.,

module_eval(<<'.,.,', 'gherkin.y', 64)
  def _reduce_19(val, _values, result)
     result = AST::Background.new; result.pos(filename, lineno) 
    result
  end
.,.,

module_eval(<<'.,.,', 'gherkin.y', 68)
  def _reduce_20(val, _values, result)
     result = [val[0]] 
    result
  end
.,.,

module_eval(<<'.,.,', 'gherkin.y', 69)
  def _reduce_21(val, _values, result)
     result = [val[0]] 
    result
  end
.,.,

module_eval(<<'.,.,', 'gherkin.y', 70)
  def _reduce_22(val, _values, result)
     val[2].unshift(val[0]); result = val[2] 
    result
  end
.,.,

module_eval(<<'.,.,', 'gherkin.y', 74)
  def _reduce_23(val, _values, result)
     result = AST::Step.new(val[1], val[0]); result.pos(filename, lineno) 
    result
  end
.,.,

# reduce 24 omitted

# reduce 25 omitted

# reduce 26 omitted

# reduce 27 omitted

# reduce 28 omitted

module_eval(<<'.,.,', 'gherkin.y', 82)
  def _reduce_29(val, _values, result)
     result = [val[0]] 
    result
  end
.,.,

module_eval(<<'.,.,', 'gherkin.y', 83)
  def _reduce_30(val, _values, result)
     result = val[0] << val[1] 
    result
  end
.,.,

module_eval(<<'.,.,', 'gherkin.y', 88)
  def _reduce_31(val, _values, result)
     result = AST::Scenario.new(val[1], val[3]); result.pos(filename, lineno - 1) 
    result
  end
.,.,

module_eval(<<'.,.,', 'gherkin.y', 91)
  def _reduce_32(val, _values, result)
     result = AST::Scenario.new(val[3], val[5], val[0]); result.pos(filename, lineno - 2) 
    result
  end
.,.,

module_eval(<<'.,.,', 'gherkin.y', 95)
  def _reduce_33(val, _values, result)
     result = [AST::Tag.new(val[0])] 
    result
  end
.,.,

module_eval(<<'.,.,', 'gherkin.y', 96)
  def _reduce_34(val, _values, result)
     result = val[0] << AST::Tag.new(val[1]) 
    result
  end
.,.,

def _reduce_none(val, _values, result)
  val[0]
end

  end   # class Parser
  end   # module Gherkin

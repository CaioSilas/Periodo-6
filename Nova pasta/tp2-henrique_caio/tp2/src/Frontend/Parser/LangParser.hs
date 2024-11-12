{-# OPTIONS_GHC -w #-}
module Frontend.Parser.LangParser (langParser) where

import Frontend.Lexer.LangLexer
import Syntax.Syntax
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.1.1

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17
	= HappyTerminal (Token)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 t12
	| HappyAbsSyn13 t13
	| HappyAbsSyn14 t14
	| HappyAbsSyn15 t15
	| HappyAbsSyn16 t16
	| HappyAbsSyn17 t17

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,282) ([0,0,0,0,0,0,0,0,0,0,8,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,2048,0,512,32768,0,0,0,0,0,0,16384,0,7680,0,0,0,0,8192,0,0,0,2048,0,0,0,0,7680,40960,2191,0,30,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4096,0,0,0,0,8,0,1,0,0,0,0,8,8192,133,32256,0,0,0,0,0,1,0,0,0,0,0,7680,0,0,0,0,0,0,7680,40960,2071,0,34080,0,126,0,0,384,0,63488,15,1,0,0,0,0,34080,0,126,8192,133,32256,0,34080,0,126,8192,133,32256,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,256,0,34080,0,126,0,4096,0,0,34080,0,126,0,4088,256,0,0,0,1,8192,133,32256,0,64000,15,0,0,0,0,0,14336,15,0,0,0,0,0,64000,15,0,16384,4088,0,0,34080,0,126,8192,133,32256,0,34080,0,126,8192,133,32256,0,34080,0,126,8192,133,32256,0,34080,0,126,8192,133,32256,0,34080,0,126,0,0,0,0,34080,0,126,0,0,0,0,64000,15,0,0,0,0,0,0,0,0,7680,40960,2063,0,63488,15,0,0,0,0,0,0,8,0,0,2048,0,0,0,8,0,0,3896,0,0,14336,15,0,0,3840,0,0,0,15,0,0,3840,0,0,0,0,0,0,0,0,0,30,4000,8,0,4088,0,0,0,0,0,0,0,0,0,0,64,0,0,0,0,0,30,4000,8,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parser","Program","StructureList","Structure","ParamList","Param","List","CodeBlock","StmtList","Stmt","Expr","Id","TypeList","PTy","Init","'Int'","'Char'","'Bool'","'Float'","'['","']'","'.'","'('","')'","'!'","'*'","'/'","'%'","'+'","'-'","'<'","'=='","'!='","'&&'","'='","'if'","'else'","'read'","'print'","'return'","'iterate'","'{'","'}'","':'","'::'","','","';'","'true'","'false'","id","float","char","int","%eof"]
        bit_start = st Prelude.* 56
        bit_end = (st Prelude.+ 1) Prelude.* 56
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..55]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (4) = happyGoto action_3
action_0 (5) = happyGoto action_2
action_0 _ = happyReduce_3

action_1 (5) = happyGoto action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (52) = happyShift action_6
action_2 (6) = happyGoto action_4
action_2 (14) = happyGoto action_5
action_2 _ = happyReduce_1

action_3 (56) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 _ = happyReduce_2

action_5 (25) = happyShift action_7
action_5 _ = happyFail (happyExpListPerState 5)

action_6 _ = happyReduce_42

action_7 (52) = happyShift action_6
action_7 (7) = happyGoto action_8
action_7 (8) = happyGoto action_9
action_7 (14) = happyGoto action_10
action_7 _ = happyReduce_7

action_8 (26) = happyShift action_12
action_8 (48) = happyShift action_13
action_8 _ = happyFail (happyExpListPerState 8)

action_9 _ = happyReduce_6

action_10 (47) = happyShift action_11
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (18) = happyShift action_18
action_11 (19) = happyShift action_19
action_11 (20) = happyShift action_20
action_11 (21) = happyShift action_21
action_11 (16) = happyGoto action_17
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (46) = happyShift action_16
action_12 (15) = happyGoto action_15
action_12 _ = happyReduce_45

action_13 (52) = happyShift action_6
action_13 (8) = happyGoto action_14
action_13 (14) = happyGoto action_10
action_13 _ = happyFail (happyExpListPerState 13)

action_14 _ = happyReduce_5

action_15 (18) = happyShift action_18
action_15 (19) = happyShift action_19
action_15 (20) = happyShift action_20
action_15 (21) = happyShift action_21
action_15 (38) = happyShift action_27
action_15 (40) = happyShift action_28
action_15 (41) = happyShift action_29
action_15 (42) = happyShift action_30
action_15 (43) = happyShift action_31
action_15 (44) = happyShift action_32
action_15 (48) = happyShift action_33
action_15 (52) = happyShift action_6
action_15 (10) = happyGoto action_23
action_15 (12) = happyGoto action_24
action_15 (14) = happyGoto action_25
action_15 (16) = happyGoto action_26
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (18) = happyShift action_18
action_16 (19) = happyShift action_19
action_16 (20) = happyShift action_20
action_16 (21) = happyShift action_21
action_16 (16) = happyGoto action_22
action_16 _ = happyFail (happyExpListPerState 16)

action_17 _ = happyReduce_8

action_18 _ = happyReduce_46

action_19 _ = happyReduce_49

action_20 _ = happyReduce_47

action_21 _ = happyReduce_48

action_22 _ = happyReduce_44

action_23 _ = happyReduce_4

action_24 _ = happyReduce_12

action_25 (37) = happyShift action_52
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (52) = happyShift action_6
action_26 (14) = happyGoto action_51
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (25) = happyShift action_50
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (52) = happyShift action_6
action_28 (14) = happyGoto action_49
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (22) = happyShift action_40
action_29 (25) = happyShift action_41
action_29 (27) = happyShift action_42
action_29 (32) = happyShift action_43
action_29 (50) = happyShift action_44
action_29 (51) = happyShift action_45
action_29 (52) = happyShift action_6
action_29 (53) = happyShift action_46
action_29 (54) = happyShift action_47
action_29 (55) = happyShift action_48
action_29 (13) = happyGoto action_38
action_29 (14) = happyGoto action_39
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (9) = happyGoto action_37
action_30 _ = happyReduce_10

action_31 (25) = happyShift action_36
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (11) = happyGoto action_35
action_32 _ = happyReduce_14

action_33 (18) = happyShift action_18
action_33 (19) = happyShift action_19
action_33 (20) = happyShift action_20
action_33 (21) = happyShift action_21
action_33 (16) = happyGoto action_34
action_33 _ = happyFail (happyExpListPerState 33)

action_34 _ = happyReduce_43

action_35 (18) = happyShift action_18
action_35 (19) = happyShift action_19
action_35 (20) = happyShift action_20
action_35 (21) = happyShift action_21
action_35 (38) = happyShift action_27
action_35 (40) = happyShift action_28
action_35 (41) = happyShift action_29
action_35 (42) = happyShift action_30
action_35 (43) = happyShift action_31
action_35 (45) = happyShift action_76
action_35 (52) = happyShift action_6
action_35 (12) = happyGoto action_75
action_35 (14) = happyGoto action_25
action_35 (16) = happyGoto action_26
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (22) = happyShift action_40
action_36 (25) = happyShift action_41
action_36 (27) = happyShift action_42
action_36 (32) = happyShift action_43
action_36 (50) = happyShift action_44
action_36 (51) = happyShift action_45
action_36 (52) = happyShift action_6
action_36 (53) = happyShift action_46
action_36 (54) = happyShift action_47
action_36 (55) = happyShift action_48
action_36 (13) = happyGoto action_74
action_36 (14) = happyGoto action_39
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (48) = happyShift action_72
action_37 (49) = happyShift action_73
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (28) = happyShift action_62
action_38 (29) = happyShift action_63
action_38 (30) = happyShift action_64
action_38 (31) = happyShift action_65
action_38 (32) = happyShift action_66
action_38 (33) = happyShift action_67
action_38 (34) = happyShift action_68
action_38 (35) = happyShift action_69
action_38 (36) = happyShift action_70
action_38 (49) = happyShift action_71
action_38 _ = happyFail (happyExpListPerState 38)

action_39 _ = happyReduce_39

action_40 (22) = happyShift action_40
action_40 (25) = happyShift action_41
action_40 (27) = happyShift action_42
action_40 (32) = happyShift action_43
action_40 (50) = happyShift action_44
action_40 (51) = happyShift action_45
action_40 (52) = happyShift action_6
action_40 (53) = happyShift action_46
action_40 (54) = happyShift action_47
action_40 (55) = happyShift action_48
action_40 (13) = happyGoto action_61
action_40 (14) = happyGoto action_39
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (22) = happyShift action_40
action_41 (25) = happyShift action_41
action_41 (27) = happyShift action_42
action_41 (32) = happyShift action_43
action_41 (50) = happyShift action_44
action_41 (51) = happyShift action_45
action_41 (52) = happyShift action_6
action_41 (53) = happyShift action_46
action_41 (54) = happyShift action_47
action_41 (55) = happyShift action_48
action_41 (13) = happyGoto action_60
action_41 (14) = happyGoto action_39
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (22) = happyShift action_40
action_42 (25) = happyShift action_41
action_42 (27) = happyShift action_42
action_42 (32) = happyShift action_43
action_42 (50) = happyShift action_44
action_42 (51) = happyShift action_45
action_42 (52) = happyShift action_6
action_42 (53) = happyShift action_46
action_42 (54) = happyShift action_47
action_42 (55) = happyShift action_48
action_42 (13) = happyGoto action_59
action_42 (14) = happyGoto action_39
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (22) = happyShift action_40
action_43 (25) = happyShift action_41
action_43 (27) = happyShift action_42
action_43 (32) = happyShift action_43
action_43 (50) = happyShift action_44
action_43 (51) = happyShift action_45
action_43 (52) = happyShift action_6
action_43 (53) = happyShift action_46
action_43 (54) = happyShift action_47
action_43 (55) = happyShift action_48
action_43 (13) = happyGoto action_58
action_43 (14) = happyGoto action_39
action_43 _ = happyFail (happyExpListPerState 43)

action_44 _ = happyReduce_37

action_45 _ = happyReduce_38

action_46 _ = happyReduce_34

action_47 _ = happyReduce_36

action_48 _ = happyReduce_35

action_49 (49) = happyShift action_57
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (22) = happyShift action_40
action_50 (25) = happyShift action_41
action_50 (27) = happyShift action_42
action_50 (32) = happyShift action_43
action_50 (50) = happyShift action_44
action_50 (51) = happyShift action_45
action_50 (52) = happyShift action_6
action_50 (53) = happyShift action_46
action_50 (54) = happyShift action_47
action_50 (55) = happyShift action_48
action_50 (13) = happyGoto action_56
action_50 (14) = happyGoto action_39
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (37) = happyShift action_55
action_51 (17) = happyGoto action_54
action_51 _ = happyReduce_51

action_52 (22) = happyShift action_40
action_52 (25) = happyShift action_41
action_52 (27) = happyShift action_42
action_52 (32) = happyShift action_43
action_52 (50) = happyShift action_44
action_52 (51) = happyShift action_45
action_52 (52) = happyShift action_6
action_52 (53) = happyShift action_46
action_52 (54) = happyShift action_47
action_52 (55) = happyShift action_48
action_52 (13) = happyGoto action_53
action_52 (14) = happyGoto action_39
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (28) = happyShift action_62
action_53 (29) = happyShift action_63
action_53 (30) = happyShift action_64
action_53 (31) = happyShift action_65
action_53 (32) = happyShift action_66
action_53 (33) = happyShift action_67
action_53 (34) = happyShift action_68
action_53 (35) = happyShift action_69
action_53 (36) = happyShift action_70
action_53 (49) = happyShift action_93
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (49) = happyShift action_92
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (22) = happyShift action_40
action_55 (25) = happyShift action_41
action_55 (27) = happyShift action_42
action_55 (32) = happyShift action_43
action_55 (50) = happyShift action_44
action_55 (51) = happyShift action_45
action_55 (52) = happyShift action_6
action_55 (53) = happyShift action_46
action_55 (54) = happyShift action_47
action_55 (55) = happyShift action_48
action_55 (13) = happyGoto action_91
action_55 (14) = happyGoto action_39
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (26) = happyShift action_90
action_56 (28) = happyShift action_62
action_56 (29) = happyShift action_63
action_56 (30) = happyShift action_64
action_56 (31) = happyShift action_65
action_56 (32) = happyShift action_66
action_56 (33) = happyShift action_67
action_56 (34) = happyShift action_68
action_56 (35) = happyShift action_69
action_56 (36) = happyShift action_70
action_56 _ = happyFail (happyExpListPerState 56)

action_57 _ = happyReduce_19

action_58 (28) = happyShift action_62
action_58 (29) = happyShift action_63
action_58 (30) = happyShift action_64
action_58 (33) = happyShift action_67
action_58 (34) = happyShift action_68
action_58 (35) = happyShift action_69
action_58 (36) = happyShift action_70
action_58 _ = happyReduce_33

action_59 _ = happyReduce_32

action_60 (26) = happyShift action_89
action_60 (28) = happyShift action_62
action_60 (29) = happyShift action_63
action_60 (30) = happyShift action_64
action_60 (31) = happyShift action_65
action_60 (32) = happyShift action_66
action_60 (33) = happyShift action_67
action_60 (34) = happyShift action_68
action_60 (35) = happyShift action_69
action_60 (36) = happyShift action_70
action_60 _ = happyFail (happyExpListPerState 60)

action_61 (23) = happyShift action_88
action_61 (28) = happyShift action_62
action_61 (29) = happyShift action_63
action_61 (30) = happyShift action_64
action_61 (31) = happyShift action_65
action_61 (32) = happyShift action_66
action_61 (33) = happyShift action_67
action_61 (34) = happyShift action_68
action_61 (35) = happyShift action_69
action_61 (36) = happyShift action_70
action_61 _ = happyFail (happyExpListPerState 61)

action_62 (22) = happyShift action_40
action_62 (25) = happyShift action_41
action_62 (27) = happyShift action_42
action_62 (32) = happyShift action_43
action_62 (50) = happyShift action_44
action_62 (51) = happyShift action_45
action_62 (52) = happyShift action_6
action_62 (53) = happyShift action_46
action_62 (54) = happyShift action_47
action_62 (55) = happyShift action_48
action_62 (13) = happyGoto action_87
action_62 (14) = happyGoto action_39
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (22) = happyShift action_40
action_63 (25) = happyShift action_41
action_63 (27) = happyShift action_42
action_63 (32) = happyShift action_43
action_63 (50) = happyShift action_44
action_63 (51) = happyShift action_45
action_63 (52) = happyShift action_6
action_63 (53) = happyShift action_46
action_63 (54) = happyShift action_47
action_63 (55) = happyShift action_48
action_63 (13) = happyGoto action_86
action_63 (14) = happyGoto action_39
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (22) = happyShift action_40
action_64 (25) = happyShift action_41
action_64 (27) = happyShift action_42
action_64 (32) = happyShift action_43
action_64 (50) = happyShift action_44
action_64 (51) = happyShift action_45
action_64 (52) = happyShift action_6
action_64 (53) = happyShift action_46
action_64 (54) = happyShift action_47
action_64 (55) = happyShift action_48
action_64 (13) = happyGoto action_85
action_64 (14) = happyGoto action_39
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (22) = happyShift action_40
action_65 (25) = happyShift action_41
action_65 (27) = happyShift action_42
action_65 (32) = happyShift action_43
action_65 (50) = happyShift action_44
action_65 (51) = happyShift action_45
action_65 (52) = happyShift action_6
action_65 (53) = happyShift action_46
action_65 (54) = happyShift action_47
action_65 (55) = happyShift action_48
action_65 (13) = happyGoto action_84
action_65 (14) = happyGoto action_39
action_65 _ = happyFail (happyExpListPerState 65)

action_66 (22) = happyShift action_40
action_66 (25) = happyShift action_41
action_66 (27) = happyShift action_42
action_66 (32) = happyShift action_43
action_66 (50) = happyShift action_44
action_66 (51) = happyShift action_45
action_66 (52) = happyShift action_6
action_66 (53) = happyShift action_46
action_66 (54) = happyShift action_47
action_66 (55) = happyShift action_48
action_66 (13) = happyGoto action_83
action_66 (14) = happyGoto action_39
action_66 _ = happyFail (happyExpListPerState 66)

action_67 (22) = happyShift action_40
action_67 (25) = happyShift action_41
action_67 (27) = happyShift action_42
action_67 (32) = happyShift action_43
action_67 (50) = happyShift action_44
action_67 (51) = happyShift action_45
action_67 (52) = happyShift action_6
action_67 (53) = happyShift action_46
action_67 (54) = happyShift action_47
action_67 (55) = happyShift action_48
action_67 (13) = happyGoto action_82
action_67 (14) = happyGoto action_39
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (22) = happyShift action_40
action_68 (25) = happyShift action_41
action_68 (27) = happyShift action_42
action_68 (32) = happyShift action_43
action_68 (50) = happyShift action_44
action_68 (51) = happyShift action_45
action_68 (52) = happyShift action_6
action_68 (53) = happyShift action_46
action_68 (54) = happyShift action_47
action_68 (55) = happyShift action_48
action_68 (13) = happyGoto action_81
action_68 (14) = happyGoto action_39
action_68 _ = happyFail (happyExpListPerState 68)

action_69 (22) = happyShift action_40
action_69 (25) = happyShift action_41
action_69 (27) = happyShift action_42
action_69 (32) = happyShift action_43
action_69 (50) = happyShift action_44
action_69 (51) = happyShift action_45
action_69 (52) = happyShift action_6
action_69 (53) = happyShift action_46
action_69 (54) = happyShift action_47
action_69 (55) = happyShift action_48
action_69 (13) = happyGoto action_80
action_69 (14) = happyGoto action_39
action_69 _ = happyFail (happyExpListPerState 69)

action_70 (22) = happyShift action_40
action_70 (25) = happyShift action_41
action_70 (27) = happyShift action_42
action_70 (32) = happyShift action_43
action_70 (50) = happyShift action_44
action_70 (51) = happyShift action_45
action_70 (52) = happyShift action_6
action_70 (53) = happyShift action_46
action_70 (54) = happyShift action_47
action_70 (55) = happyShift action_48
action_70 (13) = happyGoto action_79
action_70 (14) = happyGoto action_39
action_70 _ = happyFail (happyExpListPerState 70)

action_71 _ = happyReduce_18

action_72 (22) = happyShift action_40
action_72 (25) = happyShift action_41
action_72 (27) = happyShift action_42
action_72 (32) = happyShift action_43
action_72 (50) = happyShift action_44
action_72 (51) = happyShift action_45
action_72 (52) = happyShift action_6
action_72 (53) = happyShift action_46
action_72 (54) = happyShift action_47
action_72 (55) = happyShift action_48
action_72 (13) = happyGoto action_78
action_72 (14) = happyGoto action_39
action_72 _ = happyFail (happyExpListPerState 72)

action_73 _ = happyReduce_20

action_74 (26) = happyShift action_77
action_74 (28) = happyShift action_62
action_74 (29) = happyShift action_63
action_74 (30) = happyShift action_64
action_74 (31) = happyShift action_65
action_74 (32) = happyShift action_66
action_74 (33) = happyShift action_67
action_74 (34) = happyShift action_68
action_74 (35) = happyShift action_69
action_74 (36) = happyShift action_70
action_74 _ = happyFail (happyExpListPerState 74)

action_75 _ = happyReduce_13

action_76 _ = happyReduce_11

action_77 (18) = happyShift action_18
action_77 (19) = happyShift action_19
action_77 (20) = happyShift action_20
action_77 (21) = happyShift action_21
action_77 (38) = happyShift action_27
action_77 (40) = happyShift action_28
action_77 (41) = happyShift action_29
action_77 (42) = happyShift action_30
action_77 (43) = happyShift action_31
action_77 (44) = happyShift action_32
action_77 (52) = happyShift action_6
action_77 (10) = happyGoto action_95
action_77 (12) = happyGoto action_24
action_77 (14) = happyGoto action_25
action_77 (16) = happyGoto action_26
action_77 _ = happyFail (happyExpListPerState 77)

action_78 (28) = happyShift action_62
action_78 (29) = happyShift action_63
action_78 (30) = happyShift action_64
action_78 (31) = happyShift action_65
action_78 (32) = happyShift action_66
action_78 (33) = happyShift action_67
action_78 (34) = happyShift action_68
action_78 (35) = happyShift action_69
action_78 (36) = happyShift action_70
action_78 _ = happyReduce_9

action_79 _ = happyReduce_31

action_80 (33) = happyFail []
action_80 (34) = happyFail []
action_80 (35) = happyFail []
action_80 (36) = happyShift action_70
action_80 _ = happyReduce_30

action_81 (33) = happyFail []
action_81 (34) = happyFail []
action_81 (35) = happyFail []
action_81 (36) = happyShift action_70
action_81 _ = happyReduce_29

action_82 (33) = happyFail []
action_82 (34) = happyFail []
action_82 (35) = happyFail []
action_82 (36) = happyShift action_70
action_82 _ = happyReduce_28

action_83 (28) = happyShift action_62
action_83 (29) = happyShift action_63
action_83 (30) = happyShift action_64
action_83 (33) = happyShift action_67
action_83 (34) = happyShift action_68
action_83 (35) = happyShift action_69
action_83 (36) = happyShift action_70
action_83 _ = happyReduce_25

action_84 (28) = happyShift action_62
action_84 (29) = happyShift action_63
action_84 (30) = happyShift action_64
action_84 (33) = happyShift action_67
action_84 (34) = happyShift action_68
action_84 (35) = happyShift action_69
action_84 (36) = happyShift action_70
action_84 _ = happyReduce_23

action_85 (33) = happyShift action_67
action_85 (34) = happyShift action_68
action_85 (35) = happyShift action_69
action_85 (36) = happyShift action_70
action_85 _ = happyReduce_27

action_86 (33) = happyShift action_67
action_86 (34) = happyShift action_68
action_86 (35) = happyShift action_69
action_86 (36) = happyShift action_70
action_86 _ = happyReduce_26

action_87 (33) = happyShift action_67
action_87 (34) = happyShift action_68
action_87 (35) = happyShift action_69
action_87 (36) = happyShift action_70
action_87 _ = happyReduce_24

action_88 _ = happyReduce_41

action_89 _ = happyReduce_40

action_90 (18) = happyShift action_18
action_90 (19) = happyShift action_19
action_90 (20) = happyShift action_20
action_90 (21) = happyShift action_21
action_90 (38) = happyShift action_27
action_90 (40) = happyShift action_28
action_90 (41) = happyShift action_29
action_90 (42) = happyShift action_30
action_90 (43) = happyShift action_31
action_90 (44) = happyShift action_32
action_90 (52) = happyShift action_6
action_90 (10) = happyGoto action_94
action_90 (12) = happyGoto action_24
action_90 (14) = happyGoto action_25
action_90 (16) = happyGoto action_26
action_90 _ = happyFail (happyExpListPerState 90)

action_91 (28) = happyShift action_62
action_91 (29) = happyShift action_63
action_91 (30) = happyShift action_64
action_91 (31) = happyShift action_65
action_91 (32) = happyShift action_66
action_91 (33) = happyShift action_67
action_91 (34) = happyShift action_68
action_91 (35) = happyShift action_69
action_91 (36) = happyShift action_70
action_91 _ = happyReduce_50

action_92 _ = happyReduce_22

action_93 _ = happyReduce_21

action_94 (18) = happyReduce_16
action_94 (19) = happyReduce_16
action_94 (20) = happyReduce_16
action_94 (21) = happyReduce_16
action_94 (38) = happyReduce_16
action_94 (39) = happyShift action_96
action_94 (40) = happyReduce_16
action_94 (41) = happyReduce_16
action_94 (42) = happyReduce_16
action_94 (43) = happyReduce_16
action_94 (45) = happyReduce_16
action_94 (52) = happyReduce_16
action_94 (56) = happyReduce_16
action_94 _ = happyReduce_16

action_95 _ = happyReduce_17

action_96 (18) = happyShift action_18
action_96 (19) = happyShift action_19
action_96 (20) = happyShift action_20
action_96 (21) = happyShift action_21
action_96 (38) = happyShift action_27
action_96 (40) = happyShift action_28
action_96 (41) = happyShift action_29
action_96 (42) = happyShift action_30
action_96 (43) = happyShift action_31
action_96 (44) = happyShift action_32
action_96 (52) = happyShift action_6
action_96 (10) = happyGoto action_97
action_96 (12) = happyGoto action_24
action_96 (14) = happyGoto action_25
action_96 (16) = happyGoto action_26
action_96 _ = happyFail (happyExpListPerState 96)

action_97 (18) = happyReduce_15
action_97 (19) = happyReduce_15
action_97 (20) = happyReduce_15
action_97 (21) = happyReduce_15
action_97 (38) = happyReduce_15
action_97 (39) = happyReduce_15
action_97 (40) = happyReduce_15
action_97 (41) = happyReduce_15
action_97 (42) = happyReduce_15
action_97 (43) = happyReduce_15
action_97 (45) = happyReduce_15
action_97 (52) = happyReduce_15
action_97 (56) = happyReduce_15
action_97 _ = happyReduce_15

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (Program happy_var_1
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_2  5 happyReduction_2
happyReduction_2 (HappyAbsSyn6  happy_var_2)
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_2 : happy_var_1
	)
happyReduction_2 _ _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_0  5 happyReduction_3
happyReduction_3  =  HappyAbsSyn5
		 ([]
	)

happyReduce_4 = happyReduce 6 6 happyReduction_4
happyReduction_4 ((HappyAbsSyn10  happy_var_6) `HappyStk`
	(HappyAbsSyn15  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (Func happy_var_1 happy_var_3 happy_var_5 happy_var_6
	) `HappyStk` happyRest

happyReduce_5 = happySpecReduce_3  7 happyReduction_5
happyReduction_5 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_3 : happy_var_1
	)
happyReduction_5 _ _ _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_1  7 happyReduction_6
happyReduction_6 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 ([happy_var_1]
	)
happyReduction_6 _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_0  7 happyReduction_7
happyReduction_7  =  HappyAbsSyn7
		 ([]
	)

happyReduce_8 = happySpecReduce_3  8 happyReduction_8
happyReduction_8 (HappyAbsSyn16  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn8
		 (Decl happy_var_1 happy_var_3
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_3  9 happyReduction_9
happyReduction_9 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_3 : happy_var_1
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_0  9 happyReduction_10
happyReduction_10  =  HappyAbsSyn9
		 ([]
	)

happyReduce_11 = happySpecReduce_3  10 happyReduction_11
happyReduction_11 _
	(HappyAbsSyn11  happy_var_2)
	_
	 =  HappyAbsSyn10
		 (Block (reverse happy_var_2)
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_1  10 happyReduction_12
happyReduction_12 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn10
		 (OneStmt happy_var_1
	)
happyReduction_12 _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_2  11 happyReduction_13
happyReduction_13 (HappyAbsSyn12  happy_var_2)
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (happy_var_2 : happy_var_1
	)
happyReduction_13 _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_0  11 happyReduction_14
happyReduction_14  =  HappyAbsSyn11
		 ([]
	)

happyReduce_15 = happyReduce 7 12 happyReduction_15
happyReduction_15 ((HappyAbsSyn10  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 (IfElse happy_var_3 happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_16 = happyReduce 5 12 happyReduction_16
happyReduction_16 ((HappyAbsSyn10  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 (If happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_17 = happyReduce 5 12 happyReduction_17
happyReduction_17 ((HappyAbsSyn10  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 (Iterate happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_18 = happySpecReduce_3  12 happyReduction_18
happyReduction_18 _
	(HappyAbsSyn13  happy_var_2)
	_
	 =  HappyAbsSyn12
		 (Print happy_var_2
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_3  12 happyReduction_19
happyReduction_19 _
	(HappyAbsSyn14  happy_var_2)
	_
	 =  HappyAbsSyn12
		 (CRead happy_var_2
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_3  12 happyReduction_20
happyReduction_20 _
	(HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn12
		 (Return happy_var_2
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happyReduce 4 12 happyReduction_21
happyReduction_21 (_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 (Assign happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_22 = happyReduce 4 12 happyReduction_22
happyReduction_22 (_ `HappyStk`
	(HappyAbsSyn17  happy_var_3) `HappyStk`
	(HappyAbsSyn14  happy_var_2) `HappyStk`
	(HappyAbsSyn16  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 (Def happy_var_1 happy_var_2 happy_var_3
	) `HappyStk` happyRest

happyReduce_23 = happySpecReduce_3  13 happyReduction_23
happyReduction_23 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (Add happy_var_1 happy_var_3
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_3  13 happyReduction_24
happyReduction_24 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (Mul happy_var_1 happy_var_3
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_3  13 happyReduction_25
happyReduction_25 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (Sub happy_var_1 happy_var_3
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_3  13 happyReduction_26
happyReduction_26 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (Div happy_var_1 happy_var_3
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_3  13 happyReduction_27
happyReduction_27 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (Mod happy_var_1 happy_var_3
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_3  13 happyReduction_28
happyReduction_28 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (Relac happy_var_1 happy_var_3
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_3  13 happyReduction_29
happyReduction_29 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (Equal happy_var_1 happy_var_3
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_3  13 happyReduction_30
happyReduction_30 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (NEqual happy_var_1 happy_var_3
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_3  13 happyReduction_31
happyReduction_31 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (Conj happy_var_1 happy_var_3
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_2  13 happyReduction_32
happyReduction_32 (HappyAbsSyn13  happy_var_2)
	_
	 =  HappyAbsSyn13
		 (Not happy_var_2
	)
happyReduction_32 _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_2  13 happyReduction_33
happyReduction_33 (HappyAbsSyn13  happy_var_2)
	_
	 =  HappyAbsSyn13
		 (Negate happy_var_2
	)
happyReduction_33 _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_1  13 happyReduction_34
happyReduction_34 (HappyTerminal (Token _ (TNumberF happy_var_1)))
	 =  HappyAbsSyn13
		 (EValue (EFloat happy_var_1)
	)
happyReduction_34 _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_1  13 happyReduction_35
happyReduction_35 (HappyTerminal (Token _ (TNumber happy_var_1)))
	 =  HappyAbsSyn13
		 (EValue (EInt happy_var_1)
	)
happyReduction_35 _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_1  13 happyReduction_36
happyReduction_36 (HappyTerminal (Token _ (TCharLit happy_var_1)))
	 =  HappyAbsSyn13
		 (EValue (EChar happy_var_1)
	)
happyReduction_36 _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_1  13 happyReduction_37
happyReduction_37 _
	 =  HappyAbsSyn13
		 (EValue (EBool True)
	)

happyReduce_38 = happySpecReduce_1  13 happyReduction_38
happyReduction_38 _
	 =  HappyAbsSyn13
		 (EValue (EBool False)
	)

happyReduce_39 = happySpecReduce_1  13 happyReduction_39
happyReduction_39 (HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn13
		 (EVar happy_var_1
	)
happyReduction_39 _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_3  13 happyReduction_40
happyReduction_40 _
	(HappyAbsSyn13  happy_var_2)
	_
	 =  HappyAbsSyn13
		 (happy_var_2
	)
happyReduction_40 _ _ _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_3  13 happyReduction_41
happyReduction_41 _
	(HappyAbsSyn13  happy_var_2)
	_
	 =  HappyAbsSyn13
		 (happy_var_2
	)
happyReduction_41 _ _ _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_1  14 happyReduction_42
happyReduction_42 (HappyTerminal (Token _ (TIdent happy_var_1)))
	 =  HappyAbsSyn14
		 (Var happy_var_1
	)
happyReduction_42 _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_3  15 happyReduction_43
happyReduction_43 (HappyAbsSyn16  happy_var_3)
	_
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (happy_var_3 : happy_var_1
	)
happyReduction_43 _ _ _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_2  15 happyReduction_44
happyReduction_44 (HappyAbsSyn16  happy_var_2)
	_
	 =  HappyAbsSyn15
		 ([happy_var_2]
	)
happyReduction_44 _ _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_0  15 happyReduction_45
happyReduction_45  =  HappyAbsSyn15
		 ([]
	)

happyReduce_46 = happySpecReduce_1  16 happyReduction_46
happyReduction_46 _
	 =  HappyAbsSyn16
		 (TSInt
	)

happyReduce_47 = happySpecReduce_1  16 happyReduction_47
happyReduction_47 _
	 =  HappyAbsSyn16
		 (TSBool
	)

happyReduce_48 = happySpecReduce_1  16 happyReduction_48
happyReduction_48 _
	 =  HappyAbsSyn16
		 (TSFloat
	)

happyReduce_49 = happySpecReduce_1  16 happyReduction_49
happyReduction_49 _
	 =  HappyAbsSyn16
		 (TSChar
	)

happyReduce_50 = happySpecReduce_2  17 happyReduction_50
happyReduction_50 (HappyAbsSyn13  happy_var_2)
	_
	 =  HappyAbsSyn17
		 (Just happy_var_2
	)
happyReduction_50 _ _  = notHappyAtAll 

happyReduce_51 = happySpecReduce_0  17 happyReduction_51
happyReduction_51  =  HappyAbsSyn17
		 (Nothing
	)

happyNewToken action sts stk [] =
	action 56 56 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	Token _ TInt -> cont 18;
	Token _ TChar -> cont 19;
	Token _ TBool -> cont 20;
	Token _ TFloat -> cont 21;
	Token _ TLBracket -> cont 22;
	Token _ TRBracket -> cont 23;
	Token _ TDot -> cont 24;
	Token _ TLParen -> cont 25;
	Token _ TRParen -> cont 26;
	Token _ TNot -> cont 27;
	Token _ TMul -> cont 28;
	Token _ TDiv -> cont 29;
	Token _ TMod -> cont 30;
	Token _ TAdd -> cont 31;
	Token _ TSub -> cont 32;
	Token _ TRelac -> cont 33;
	Token _ TEqual -> cont 34;
	Token _ TNEqual -> cont 35;
	Token _ TConj -> cont 36;
	Token _ TAssign -> cont 37;
	Token _ TIf -> cont 38;
	Token _ TElse -> cont 39;
	Token _ TRead -> cont 40;
	Token _ TPrint -> cont 41;
	Token _ TReturn -> cont 42;
	Token _ TIterate -> cont 43;
	Token _ TLKeys -> cont 44;
	Token _ TRKeys -> cont 45;
	Token _ TColon -> cont 46;
	Token _ TDoubleColon -> cont 47;
	Token _ TComma -> cont 48;
	Token _ TSemicolon -> cont 49;
	Token _ TTrue -> cont 50;
	Token _ TFalse -> cont 51;
	Token _ (TIdent happy_dollar_dollar) -> cont 52;
	Token _ (TNumberF happy_dollar_dollar) -> cont 53;
	Token _ (TCharLit happy_dollar_dollar) -> cont 54;
	Token _ (TNumber happy_dollar_dollar) -> cont 55;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 56 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Prelude.Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Prelude.Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (Prelude.>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (Prelude.return)
happyThen1 m k tks = (Prelude.>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (Prelude.return) a
happyError' :: () => ([(Token)], [Prelude.String]) -> HappyIdentity a
happyError' = HappyIdentity Prelude.. (\(tokens, _) -> parseError tokens)
parser tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a
parseError [] = error "Parse error!"
parseError (t : _) = error $ "Parse error " ++ (show t)

langParser :: String -> Program
langParser = parser . lexer
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Prelude.Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x Prelude.< y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `Prelude.div` 16)) (bit `Prelude.mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Prelude.Int ->                    -- token number
         Prelude.Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Prelude.- ((1) :: Prelude.Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Prelude.Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n Prelude.- ((1) :: Prelude.Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Prelude.- ((1)::Prelude.Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Prelude.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.

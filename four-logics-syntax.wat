;; INDICES
;; Reduced array indexing
;; Produced a barely measurable performance improvement
;;

(module

  (import "imports" "log"      (func $log     (param i32)))
  (memory                      (import "imports"    "mem") 1)

  (global $a                   (mut i32) (i32.const  1732584193))
  (global $b                   (mut i32) (i32.const -271733879))
  (global $c                   (mut i32) (i32.const -1732584194))
  (global $d                   (mut i32) (i32.const  271733878))
  (global $aa                  (mut i32) (i32.const    0))
  (global $bb                  (mut i32) (i32.const    0))
  (global $cc                  (mut i32) (i32.const    0))
  (global $dd                  (mut i32) (i32.const    0))
  (global $i                   (mut i32) (i32.const    0))
  (global $j                   (mut i32) (i32.const    0))
  (global $m0                  (mut i32) (i32.const    0))
  (global $m1                  (mut i32) (i32.const    0))
  (global $m2                  (mut i32) (i32.const    0))
  (global $m3                  (mut i32) (i32.const    0))
  (global $m4                  (mut i32) (i32.const    0))
  (global $m5                  (mut i32) (i32.const    0))
  (global $m6                  (mut i32) (i32.const    0))
  (global $m7                  (mut i32) (i32.const    0))
  (global $m8                  (mut i32) (i32.const    0))
  (global $m9                  (mut i32) (i32.const    0))
  (global $m10                 (mut i32) (i32.const    0))
  (global $m11                 (mut i32) (i32.const    0))
  (global $m12                 (mut i32) (i32.const    0))
  (global $m13                 (mut i32) (i32.const    0))
  (global $m14                 (mut i32) (i32.const    0))
  (global $m15                 (mut i32) (i32.const    0))
  (global $x                   (mut i32) (i32.const    0))

  ;; Function 'loops'
  ;; Parameters:
  ;;     iteration-limit, up to 192
  ;;  Memory already been loaded
  ;; for ( i = 0 ; i < limit ; i += 16 ) {
  ;;   loop()
  ;; }
  (func $loops (param i32) (result)
    (local $numloops          i32)
    i32.const        0
    global.set       $i
    local.get        0
    i32.const        6
    i32.shl
    local.set        $numloops

    (block           $break          (loop $top
      (br_if         $break          (i32.eq (global.get $i) (local.get $numloops)))
      (global.get    $a)
      (global.set    $aa)
      (global.get    $b)
      (global.set    $bb)
      (global.get    $c)
      (global.set    $cc)
      (global.get    $d)
      (global.set    $dd)
      (call          $loop)
      (global.get    $aa)
      (global.get    $a)
      i32.add
      (global.set    $a)
      (global.get    $bb)
      (global.get    $b)
      i32.add
      (global.set    $b)
      (global.get    $cc)
      (global.get    $c)
      i32.add
      (global.set    $c)
      (global.get    $dd)
      (global.get    $d)
      i32.add
      (global.set    $d)
      (global.set    $i              (i32.add (global.get $i)  (i32.const 64)))
      (br $top))
    )
    global.get       $i
    global.get       $x
    i32.add
    global.set       $x
  )

  ;; Parameters:  
  (func $loop (param) (result)
    global.get         $i
    global.get         $x
    i32.add
    global.set         $j
    call               $prime
    call               $loopA
    call               $loopB
    call               $loopC
    call               $loopD
  )


  ;; Parameters:  
  (func $prime (param) (result)
    i32.const          0
    global.get         $j
    i32.add
    i32.load
    global.set         $m0
    i32.const          4
    global.get         $j
    i32.add
    i32.load
    global.set         $m1
    i32.const          8
    global.get         $j
    i32.add
    i32.load
    global.set         $m2
    i32.const          12
    global.get         $j
    i32.add
    i32.load
    global.set         $m3
    i32.const          16
    global.get         $j
    i32.add
    i32.load
    global.set         $m4
    i32.const          20
    global.get         $j
    i32.add
    i32.load
    global.set         $m5
    i32.const          24
    global.get         $j
    i32.add
    i32.load
    global.set         $m6
    i32.const          28
    global.get         $j
    i32.add
    i32.load
    global.set         $m7
    i32.const          32
    global.get         $j
    i32.add
    i32.load
    global.set         $m8
    i32.const          36
    global.get         $j
    i32.add
    i32.load
    global.set         $m9
    i32.const          40
    global.get         $j
    i32.add
    i32.load
    global.set         $m10
    i32.const          44
    global.get         $j
    i32.add
    i32.load
    global.set         $m11
    i32.const          48
    global.get         $j
    i32.add
    i32.load
    global.set         $m12
    i32.const          52
    global.get         $j
    i32.add
    i32.load
    global.set         $m13
    i32.const          56
    global.get         $j
    i32.add
    i32.load
    global.set         $m14
    i32.const          60
    global.get         $j
    i32.add
    i32.load
    global.set         $m15
  )


  ;; Parameters: 
  (func $loopA (param) (result)
    call               $loopA1
    call               $loopA2
    call               $loopA3
    call               $loopA4
  )

  ;; Parameters:  
  (func $loopA1 (param) (result)
    i32.const          -680876936
    global.get         $m0
    i32.add
    call               $oneFullA
    i32.const          -389564586
    global.get         $m1
    i32.add
    call               $oneFullD
    i32.const          606105819
    global.get         $m2
    i32.add
    call               $oneFullC
    i32.const          -1044525330
    global.get         $m3
    i32.add
    call               $oneFullB
  )

  ;; Parameters:  
  (func $loopA2(param) (result)
    i32.const          -176418897
    global.get         $m4
    i32.add
    call               $oneFullA
    i32.const          1200080426
    global.get         $m5
    i32.add
    call               $oneFullD
    i32.const          -1473231341
    global.get         $m6
    i32.add
    call               $oneFullC
    i32.const          -45705983
    global.get         $m7
    i32.add
    call               $oneFullB
  )

  ;; Parameters:  
  (func $loopA3(param) (result)
    i32.const          1770035416
    global.get         $m8
    i32.add
    call               $oneFullA
    i32.const          -1958414417
    global.get         $m9
    i32.add
    call               $oneFullD
    i32.const          -42063
    global.get         $m10
    i32.add
    call               $oneFullC
    i32.const          -1990404162
    global.get         $m11
    i32.add
    call               $oneFullB
  )

  ;; Parameters:  
  (func $loopA4(param) (result)
    i32.const          1804603682
    global.get         $m12
    i32.add
    call               $oneFullA
    i32.const          -40341101
    global.get         $m13
    i32.add
    call               $oneFullD
    i32.const          -1502002290
    global.get         $m14
    i32.add
    call               $oneFullC
    i32.const          1236535329
    global.get         $m15
    i32.add
    call               $oneFullB
  )

  ;; Parameters:  
  (func $loopB (param) (result)
    call               $loopB1
    call               $loopB2
    call               $loopB3
    call               $loopB4
  )

  ;; Parameters:  
  (func $loopB1 (param) (result)
    i32.const          -165796510
    global.get         $m1
    i32.add
    call               $twoFullA
    i32.const          -1069501632
    global.get         $m6
    i32.add
    call               $twoFullD
    i32.const          643717713
    global.get         $m11
    i32.add
    call               $twoFullC
    i32.const          -373897302
    global.get         $m0
    i32.add
    call               $twoFullB
  )

  ;; Parameters:  
  (func $loopB2(param) (result)
    i32.const          -701558691
    global.get         $m5
    i32.add
    call               $twoFullA
    i32.const          38016083
    global.get         $m10
    i32.add
    call               $twoFullD
    i32.const          -660478335
    global.get         $m15
    i32.add
    call               $twoFullC
    i32.const          -405537848
    global.get         $m4
    i32.add
    call               $twoFullB
  )

  ;; Parameters:  
  (func $loopB3(param) (result)
    i32.const          568446438
    global.get         $m9
    i32.add
    call               $twoFullA
    i32.const          -1019803690
    global.get         $m14
    i32.add
    call               $twoFullD
    i32.const          -187363961
    global.get         $m3
    i32.add
    call               $twoFullC
    i32.const          1163531501
    global.get         $m8
    i32.add
    call               $twoFullB
  )

  ;; Parameters:  
  (func $loopB4(param) (result)
    i32.const          -1444681467
    global.get         $m13
    i32.add
    call               $twoFullA
    i32.const          -51403784
    global.get         $m2
    i32.add
    call               $twoFullD
    i32.const          1735328473
    global.get         $m7
    i32.add
    call               $twoFullC
    i32.const          -1926607734
    global.get         $m12
    i32.add
    call               $twoFullB
  )

  ;; Parameters:  
  (func $loopC (param) (result)
    call               $loopC1
    call               $loopC2
    call               $loopC3
    call               $loopC4
  )

  ;; Parameters:  
  (func $loopC1 (param) (result)
    i32.const          -378558
    global.get         $m5
    i32.add
    call               $treFullA
    i32.const          -2022574463
    global.get         $m8
    i32.add
    call               $treFullD
    i32.const          1839030562
    global.get         $m11
    i32.add
    call               $treFullC
    i32.const          -35309556
    global.get         $m14
    i32.add
    call               $treFullB
  )

  ;; Parameters:  
  (func $loopC2(param) (result)
    i32.const          -1530992060
    global.get         $m1
    i32.add
    call               $treFullA
    i32.const          1272893353
    global.get         $m4
    i32.add
    call               $treFullD
    i32.const          -155497632
    global.get         $m7
    i32.add
    call               $treFullC
    i32.const          -1094730640
    global.get         $m10
    i32.add
    call               $treFullB
  )

  ;; Parameters:  
  (func $loopC3(param) (result)
    i32.const          681279174
    global.get         $m13
    i32.add
    call               $treFullA
    i32.const          -358537222
    global.get         $m0
    i32.add
    call               $treFullD
    i32.const          -722521979
    global.get         $m3
    i32.add
    call               $treFullC
    i32.const          76029189
    global.get         $m6
    i32.add
    call               $treFullB
  )

  ;; Parameters:  
  (func $loopC4(param) (result)
    i32.const          -640364487
    global.get         $m9
    i32.add
    call               $treFullA
    i32.const          -421815835
    global.get         $m12
    i32.add
    call               $treFullD
    i32.const          530742520
    global.get         $m15
    i32.add
    call               $treFullC
    i32.const          -995338651
    global.get         $m2
    i32.add
    call               $treFullB
  )

  ;; Parameters:  
  (func $loopD (param) (result)
    call               $loopD1
    call               $loopD2
    call               $loopD3
    call               $loopD4
  )

  ;; Parameters:  
  (func $loopD1 (param) (result)
    i32.const          -198630844
    global.get         $m0
    i32.add
    call               $quaFullA
    i32.const          1126891415
    global.get         $m7
    i32.add
    call               $quaFullD
    i32.const          -1416354905
    global.get         $m14
    i32.add
    call               $quaFullC
    i32.const          -57434055
    global.get         $m5
    i32.add
    call               $quaFullB
  )

  ;; Parameters:  
  (func $loopD2(param) (result)
    i32.const          1700485571
    global.get         $m12
    i32.add
    call               $quaFullA
    i32.const          -1894986606
    global.get         $m3
    i32.add
    call               $quaFullD
    i32.const          -1051523
    global.get         $m10
    i32.add
    call               $quaFullC
    i32.const          -2054922799
    global.get         $m1
    i32.add
    call               $quaFullB
  )

  ;; Parameters:  
  (func $loopD3(param) (result)
    i32.const          1873313359
    global.get         $m8
    i32.add
    call               $quaFullA
    i32.const          -30611744
    global.get         $m15
    i32.add
    call               $quaFullD
    i32.const          -1560198380
    global.get         $m6
    i32.add
    call               $quaFullC
    i32.const          1309151649
    global.get         $m13
    i32.add
    call               $quaFullB
  )

  ;; Parameters:  
  (func $loopD4(param) (result)
    i32.const          -145523070
    global.get         $m4
    i32.add
    call               $quaFullA
    i32.const          -1120210379
    global.get         $m11
    i32.add
    call               $quaFullD
    i32.const          718787259
    global.get         $m2
    i32.add
    call               $quaFullC
    i32.const          -343485551
    global.get         $m9
    i32.add
    call               $quaFullB
  )

  ;; Parameters:  x, k
  (func $oneFullA (param i32) (result)
    (local $n                 i32)
    i32.const          -1
    global.get         $b
    i32.xor
    global.get         $d
    i32.and
    global.get         $b
    global.get         $c
    i32.and
    i32.or
    global.get         $a
    i32.add
    local.get          0
    i32.add
    local.tee          $n
    i32.const          7
    i32.shl
    local.get          $n
    i32.const          25
    i32.shr_u
    i32.or
    global.get         $b
    i32.add
    global.set         $a
  )

  ;; Parameters:  x, k
  (func $oneFullB (param i32) (result)
    (local $n                 i32)
    i32.const          -1
    global.get         $c
    i32.xor
    global.get         $a
    i32.and
    global.get         $c
    global.get         $d
    i32.and
    i32.or
    global.get         $b
    i32.add
    local.get          0
    i32.add
    local.tee          $n
    i32.const          22
    i32.shl
    local.get          $n
    i32.const          10
    i32.shr_u
    i32.or
    global.get         $c
    i32.add
    global.set         $b
  )

  ;; Parameters:  x, k
  (func $oneFullC (param i32) (result)
    (local $n                 i32)
    i32.const          -1
    global.get         $d
    i32.xor
    global.get         $b
    i32.and
    global.get         $d
    global.get         $a
    i32.and
    i32.or
    global.get         $c
    i32.add
    local.get          0
    i32.add
    local.tee          $n
    i32.const          17
    i32.shl
    local.get          $n
    i32.const          15
    i32.shr_u
    i32.or
    global.get         $d
    i32.add
    global.set         $c
  )

  ;; Parameters:  x, k
  (func $oneFullD (param i32) (result)
    (local $n                 i32)
    i32.const          -1
    global.get         $a
    i32.xor
    global.get         $c
    i32.and
    global.get         $a
    global.get         $b
    i32.and
    i32.or
    global.get         $d
    i32.add
    local.get          0
    i32.add
    local.tee          $n
    i32.const          12
    i32.shl
    local.get          $n
    i32.const          20
    i32.shr_u
    i32.or
    global.get         $a
    i32.add
    global.set         $d
  )

  ;; Parameters:  x, k
  (func $twoFullA (param i32) (result)
    (local $n                 i32)
    global.get         $c
    i32.const         -1
    global.get         $d
    i32.xor
    i32.and
    global.get         $b
    global.get         $d
    i32.and
    i32.or
    global.get         $a
    i32.add
    local.get          0
    i32.add
    local.tee          $n
    i32.const          5
    i32.shl
    local.get          $n
    i32.const          27
    i32.shr_u
    i32.or
    global.get         $b
    i32.add
    global.set         $a
  )

  ;; Parameters:  x, k
  (func $twoFullB (param i32) (result)
    (local $n                 i32)
    global.get         $d
    i32.const         -1
    global.get         $a
    i32.xor
    i32.and
    global.get         $c
    global.get         $a
    i32.and
    i32.or
    global.get         $b
    i32.add
    local.get          0
    i32.add
    local.tee          $n
    i32.const          20
    i32.shl
    local.get          $n
    i32.const          12
    i32.shr_u
    i32.or
    global.get         $c
    i32.add
    global.set         $b
  )

  ;; Parameters:  x, k
  (func $twoFullC (param i32) (result)
    (local $n                 i32)
    global.get         $a
    i32.const         -1
    global.get         $b
    i32.xor
    i32.and
    global.get         $d
    global.get         $b
    i32.and
    i32.or
    global.get         $c
    i32.add
    local.get          0
    i32.add
    local.tee          $n
    i32.const          14
    i32.shl
    local.get          $n
    i32.const          18
    i32.shr_u
    i32.or
    global.get         $d
    i32.add
    global.set         $c
  )

  ;; Parameters:  x, k
  (func $twoFullD (param i32) (result)
    (local $n                 i32)
    global.get         $b
    i32.const         -1
    global.get         $c
    i32.xor
    i32.and
    global.get         $a
    global.get         $c
    i32.and
    i32.or
    global.get         $d
    i32.add
    local.get          0
    i32.add
    local.tee          $n
    i32.const          9
    i32.shl
    local.get          $n
    i32.const          23
    i32.shr_u
    i32.or
    global.get         $a
    i32.add
    global.set         $d
  )

  ;; Parameters:  x, k
  (func $treFullA (param i32) (result)
    (local $n                 i32)
    global.get         $b
    global.get         $c
    i32.xor
    global.get         $d
    i32.xor
    global.get         $a
    i32.add
    local.get          0
    i32.add
    local.tee          $n
    i32.const          4
    i32.shl
    local.get          $n
    i32.const          28
    i32.shr_u
    i32.or
    global.get         $b
    i32.add
    global.set         $a
  )

  ;; Parameters:  x, k
  (func $treFullB (param i32) (result)
    (local $n                 i32)
    global.get         $c
    global.get         $d
    i32.xor
    global.get         $a
    i32.xor
    global.get         $b
    i32.add
    local.get          0
    i32.add
    local.tee          $n
    i32.const          23
    i32.shl
    local.get          $n
    i32.const          9
    i32.shr_u
    i32.or
    global.get         $c
    i32.add
    global.set         $b
  )

  ;; Parameters:  x, k
  (func $treFullC (param i32) (result)
    (local $n                 i32)
    global.get         $d
    global.get         $a
    i32.xor
    global.get         $b
    i32.xor
    global.get         $c
    i32.add
    local.get          0
    i32.add
    local.tee          $n
    i32.const          16
    i32.shl
    local.get          $n
    i32.const          16
    i32.shr_u
    i32.or
    global.get         $d
    i32.add
    global.set         $c
  )

  ;; Parameters:  x, k
  (func $treFullD (param i32) (result)
    (local $n                 i32)
    global.get         $a
    global.get         $b
    i32.xor
    global.get         $c
    i32.xor
    global.get         $d
    i32.add
    local.get          0
    i32.add
    local.tee          $n
    i32.const          11
    i32.shl
    local.get          $n
    i32.const          21
    i32.shr_u
    i32.or
    global.get         $a
    i32.add
    global.set         $d
  )

  ;; Parameters:  x, k
  (func $quaFullA (param i32) (result)
    (local $n                 i32)
    i32.const          -1 
    global.get         $d
    i32.xor
    global.get         $b
    i32.or
    global.get         $c
    i32.xor
    global.get         $a
    i32.add
    local.get          0
    i32.add
    local.tee          $n
    i32.const          6
    i32.shl
    local.get          $n
    i32.const          26
    i32.shr_u
    i32.or
    global.get         $b
    i32.add
    global.set         $a
  )

  ;; Parameters:  x, k
  (func $quaFullB (param i32) (result)
    (local $n                 i32)
    i32.const          -1 
    global.get         $a
    i32.xor
    global.get         $c
    i32.or
    global.get         $d
    i32.xor
    global.get         $b
    i32.add
    local.get          0
    i32.add
    local.tee          $n
    i32.const          21
    i32.shl
    local.get          $n
    i32.const          11
    i32.shr_u
    i32.or
    global.get         $c
    i32.add
    global.set         $b
  )

  ;; Parameters:  x, k
  (func $quaFullC (param i32) (result)
    (local $n                 i32)
    i32.const          -1 
    global.get         $b
    i32.xor
    global.get         $d
    i32.or
    global.get         $a
    i32.xor
    global.get         $c
    i32.add
    local.get          0
    i32.add
    local.tee          $n
    i32.const          15
    i32.shl
    local.get          $n
    i32.const          17
    i32.shr_u
    i32.or
    global.get         $d
    i32.add
    global.set         $c
  )

  ;; Parameters:  x, k
  (func $quaFullD (param i32) (result)
    (local $n                 i32)
    i32.const          -1 
    global.get         $c
    i32.xor
    global.get         $a
    i32.or
    global.get         $b
    i32.xor
    global.get         $d
    i32.add
    local.get          0
    i32.add
    local.tee          $n
    i32.const          10
    i32.shl
    local.get          $n
    i32.const          22
    i32.shr_u
    i32.or
    global.get         $a
    i32.add
    global.set         $d
  )

  (func $getA (result i32)
    global.get         $a
  )
  (func $getB (result i32)
    global.get         $b
  )
  (func $getC (result i32)
    global.get         $c
  )
  (func $getD (result i32)
    global.get         $d
  )
  (func $getX (result i32)
    global.get         $x
  )
  (func $setA (param i32) (result)
    local.get          0
    global.set         $a
  )
  (func $setB (param i32) (result)
    local.get          0
    global.set         $b
  )
  (func $setC (param i32) (result)
    local.get          0
    global.set         $c
  )
  (func $setD (param i32) (result)
    local.get          0
    global.set         $d
  )
  (func $setX (param i32) (result)
    local.get          0
    global.set         $x
  )


  ;;  INITIALIZE  INITIALIZE  INITIALIZE  INITIALIZE  INITIALIZE 

  (export "oneFullA"      (func $oneFullA))
  (export "oneFullB"      (func $oneFullB))
  (export "oneFullC"      (func $oneFullC))
  (export "oneFullD"      (func $oneFullD))
  (export "loops"         (func $loops))
  (export "loop"          (func $loop))
  (export "prime"         (func $prime))
  (export "loopA"         (func $loopA))
  (export "loopA1"        (func $loopA1))
  (export "loopA2"        (func $loopA2))
  (export "loopA3"        (func $loopA3))
  (export "loopA4"        (func $loopA4))
  (export "loopB"         (func $loopB))
  (export "loopB1"        (func $loopB1))
  (export "loopB2"        (func $loopB2))
  (export "loopB3"        (func $loopB3))
  (export "loopB4"        (func $loopB4))
  (export "loopC"         (func $loopC))
  (export "loopC1"        (func $loopC1))
  (export "loopC2"        (func $loopC2))
  (export "loopC3"        (func $loopC3))
  (export "loopC4"        (func $loopC4))
  (export "loopD"         (func $loopD))
  (export "loopD1"        (func $loopD1))
  (export "loopD2"        (func $loopD2))
  (export "loopD3"        (func $loopD3))
  (export "loopD4"        (func $loopD4))
  (export "getA"          (func $getA))
  (export "getB"          (func $getB))
  (export "getC"          (func $getC))
  (export "getD"          (func $getD))
  (export "getX"          (func $getX))
  (export "setA"          (func $setA))
  (export "setB"          (func $setB))
  (export "setC"          (func $setC))
  (export "setD"          (func $setD))
  (export "setX"          (func $setX))
)



(module
  (func (export "addTwo") (param) (result i32)
    i32.const 2
    i32.const 5
    i32.sub)
    ;; call $subtract)
  (func $subtract (param i32 i32) (result i32)
    local.get 0       ;; 2
    local.get 1       ;; 5
    i32.sub)
)










var a           =  1732584193,
    b           = -271733879,
    c           = -1732584194,
    d           =  271733878,
    x           = 397,
    s           = 7,
    t           = 25,
    k           = [
       -680876936,
       -389564586,
        606105819,
       -1044525330,
       -176418897,
        1200080426,
       -1473231341,
       -45705983,
       1770035416,
       -1958414417,
       -42063,
       -1990404162,
       1804603682,
       -40341101,
       -1502002290,
       1236535329,
       -165796510,
       -1069501632,
       643717713,
       -373897302,
       -701558691,
       38016083,
       -660478335,
       -405537848,
       568446438,
       -1019803690,
       -187363961,
       1163531501,
       -1444681467,
       -51403784,
       1735328473,
       -1926607734,
       -378558,
       -2022574463,
       1839030562,
       -35309556,
       -1530992060,
       1272893353,
       -155497632,
       -1094730640,
       681279174,
       -358537222,
       -722521979,
       76029189,
       -640364487,
       -421815835,
       530742520,
       -995338651,
       -198630844,
       1126891415,
       -1416354905,
       -57434055,
       1700485571,
       -1894986606,
       -1051523,
       -2054922799,
       1873313359,
       -30611744,
       -1560198380,
       1309151649,
       -145523070,
       -1120210379,
       718787259,
       -343485551
    ];

var memory      = new WebAssembly.Memory({initial:1}),
    memoryView  = new Uint32Array(memory.buffer),
    importObj   = {imports:{}};
importObj.imports.mem  = memory;
importObj.imports.log  = console.log;
window.memView  = memoryView;
memoryView[ 0]  = 222276052;
memoryView[ 1]  = 345793779;
memoryView[ 2]  = 2136982124;
memoryView[ 3]  = 1316939885;
memoryView[ 4]  = 1547534739;
memoryView[ 5]  = -284939038;
memoryView[ 6]  = 1469981822;
memoryView[ 7]  = -1234317410;
memoryView[ 8]  = -1781228691;
memoryView[ 9]  = -1647675518;
memoryView[10]  = -1840444952;
memoryView[11]  = -2112094242;
memoryView[12]  = 821354614;
memoryView[13]  = 1215603772;
memoryView[14]  = 633323235;
memoryView[15]  = 1782231572;

const wasmInstance = new WebAssembly.Instance(wasmModule, importObj);
const { oneFullA , oneFullB , oneFullC , oneFullD , loop , prime , loopA , loopA1 , loopA2 , loopA3 , loopA4 , loopB , loopB1 , loopB2 , loopB3 , loopB4 , loopC , loopC1 , loopC2 , loopC3 , loopC4 , loopD , loopD1 , loopD2 , loopD3 , loopD4 , getA , getB , getC , getD , print0 , print1 , print2 , print3 } = wasmInstance.exports;

function unoLogic(a,b,c,d){return b & c | ~b & d}
function unoN(a,b,c,d,x,k){return a + ( b & c | ~b & d ) + x + k}
function unoFull(a,b,c,d,s,t,x,k){
  var n = a + ( b & c | ~b & d ) + x + k ;
  return ((n << s) | (n >>> t)) + b
}
function dosFull(a,b,c,d,s,t,x,k){
  var n = a + ( b & d | c & ~d ) + x + k ;
  return ((n << s) | (n >>> t)) + b
}
function triFull(a,b,c,d,s,t,x,k){
  var n = a + (b ^ c ^ d) + x + k ;
  return ((n << s) | (n >>> t)) + b
}
function forFull(a,b,c,d,s,t,x,k){
  var n = a + (c ^ (b | ~d)) + x + k ;
  return ((n << s) | (n >>> t)) + b
}
function dosLogic(a,b,c,d){return b & d | c & ~d}
function triLogic(a,b,c,d){return b ^ c ^ d}
function forLogic(a,b,c,d){return c ^ (b | ~d)}


prime();
x=memoryView[0];
// print0();
// oneFullA(x,k[0]);
loopA1();
console.log("|"+getA()+"|"+(a=(unoFull(a,b,c,d,s,t,x,k[0]))>>0)+"|"); 
x=memoryView[1];
// console.log((x=memoryView[1]));
// print1();
console.log(" ");
s=12;
t=20;
// oneFullD(x,k[1]); 
console.log("|"+getD()+"|"+((d=(unoFull(d,a,b,c,s,t,x,k[1])))>>0)+"|"); 
x=memoryView[2];
// console.log((x=memoryView[2]));
// print2();
console.log(" ");
s=17;
t=15;
// oneFullC(x,k[2]); 
console.log("|"+getC()+"|"+((c=(unoFull(c,d,a,b,s,t,x,k[2])))>>0)+"|"); 
x=memoryView[3];
// console.log((x=memoryView[3]));
// print3();
console.log(" ");
s=22;
t=10;
// oneFullB(x,k[3]); 
console.log(getB());
console.log("|"+getB()+"|"+((b=(unoFull(b,c,d,a,s,t,x,k[3])))>>0)+"|");
console.log(" ");
loopA2();
s=7;
t=25;
x=memoryView[4];
console.log("|"+getA()+"|"+((a=(unoFull(a,b,c,d,s,t,x,k[4])))>>0)+"|"); 
s=12;
t=20;
x=memoryView[5];
console.log("|"+getD()+"|"+((d=(unoFull(d,a,b,c,s,t,x,k[5])))>>0)+"|");
s=17;
t=15;
x=memoryView[6];
console.log("|"+getC()+"|"+((c=(unoFull(c,d,a,b,s,t,x,k[6])))>>0)+"|"); 
s=22;
t=10;
x=memoryView[7];
console.log("|"+getB()+"|"+((b=(unoFull(b,c,d,a,s,t,x,k[7])))>>0)+"|");

console.log(" ");
loopA3();
s=7;
t=25;
x=memoryView[8];
console.log("|"+getA()+"|"+((a=(unoFull(a,b,c,d,s,t,x,k[8])))>>0)+"|"); 
s=12;
t=20;
x=memoryView[9];
console.log("|"+getD()+"|"+((d=(unoFull(d,a,b,c,s,t,x,k[9])))>>0)+"|");
s=17;
t=15;
x=memoryView[10];
console.log("|"+getC()+"|"+((c=(unoFull(c,d,a,b,s,t,x,k[10])))>>0)+"|"); 
s=22;
t=10;
x=memoryView[11];
console.log("|"+getB()+"|"+((b=(unoFull(b,c,d,a,s,t,x,k[11])))>>0)+"|");

console.log(" ");
loopA4();
s=7;
t=25;
x=memoryView[12];
console.log("|"+getA()+"|"+((a=(unoFull(a,b,c,d,s,t,x,k[12])))>>0)+"|"); 
s=12;
t=20;
x=memoryView[13];
console.log("|"+getD()+"|"+((d=(unoFull(d,a,b,c,s,t,x,k[13])))>>0)+"|");
s=17;
t=15;
x=memoryView[14];
console.log("|"+getC()+"|"+((c=(unoFull(c,d,a,b,s,t,x,k[14])))>>0)+"|"); 
s=22;
t=10;
x=memoryView[15];
console.log("|"+getB()+"|"+((b=(unoFull(b,c,d,a,s,t,x,k[15])))>>0)+"|");



console.log(" ");
console.log(" ");
s=5;
t=27;
x=memoryView[1];
loopB1();
console.log("|"+getA()+"|"+((a=(dosFull(a,b,c,d,s,t,x,k[16])))>>0)+"|"); 
x=memoryView[6];
s=9;
t=23;
console.log("|"+getD()+"|"+((d=(dosFull(d,a,b,c,s,t,x,k[17])))>>0)+"|"); 
x=memoryView[11];
s=14;
t=18; 
console.log("|"+getC()+"|"+((c=(dosFull(c,d,a,b,s,t,x,k[18])))>>0)+"|"); 
x=memoryView[0];
s=20;
t=12;
console.log("|"+getB()+"|"+((b=(dosFull(b,c,d,a,s,t,x,k[19])))>>0)+"|");
loopB2();
s=5;
t=27;
x=memoryView[5];
console.log("|"+getA()+"|"+((a=(dosFull(a,b,c,d,s,t,x,k[20])))>>0)+"|");
s=9;
t=23;
x=memoryView[10];
console.log("|"+getD()+"|"+((d=(dosFull(d,a,b,c,s,t,x,k[21])))>>0)+"|");
s=14;
t=18;
x=memoryView[15];
console.log("|"+getC()+"|"+((c=(dosFull(c,d,a,b,s,t,x,k[22])))>>0)+"|"); 
s=20;
t=12;
x=memoryView[4];
console.log("|"+getB()+"|"+((b=(dosFull(b,c,d,a,s,t,x,k[23])))>>0)+"|");
loopB3();
s=5;
t=27;
x=memoryView[9];
console.log("|"+getA()+"|"+((a=(dosFull(a,b,c,d,s,t,x,k[24])))>>0)+"|");
s=9;
t=23;
x=memoryView[14];
console.log("|"+getD()+"|"+((d=(dosFull(d,a,b,c,s,t,x,k[25])))>>0)+"|");
s=14;
t=18;
x=memoryView[3];
console.log("|"+getC()+"|"+((c=(dosFull(c,d,a,b,s,t,x,k[26])))>>0)+"|"); 
s=20;
t=12;
x=memoryView[8];
console.log("|"+getB()+"|"+((b=(dosFull(b,c,d,a,s,t,x,k[27])))>>0)+"|");
loopB4();
s=5;
t=27;
x=memoryView[13];
console.log("|"+getA()+"|"+((a=(dosFull(a,b,c,d,s,t,x,k[28])))>>0)+"|");
s=9;
t=23;
x=memoryView[2];
console.log("|"+getD()+"|"+((d=(dosFull(d,a,b,c,s,t,x,k[29])))>>0)+"|");
s=14;
t=18;
x=memoryView[7];
console.log("|"+getC()+"|"+((c=(dosFull(c,d,a,b,s,t,x,k[30])))>>0)+"|"); 
s=20;
t=12;
x=memoryView[12];
console.log("|"+getB()+"|"+((b=(dosFull(b,c,d,a,s,t,x,k[31])))>>0)+"|");




console.log(" ");
console.log(" ");
s=4;
t=28;
x=memoryView[5];
loopC1();
console.log("|"+getA()+"|"+((a=(triFull(a,b,c,d,s,t,x,k[32])))>>0)+"|"); 
x=memoryView[8];
s=11;
t=21;
console.log("|"+getD()+"|"+((d=(triFull(d,a,b,c,s,t,x,k[33])))>>0)+"|"); 
x=memoryView[11];
s=16;
t=16; 
console.log("|"+getC()+"|"+((c=(triFull(c,d,a,b,s,t,x,k[34])))>>0)+"|"); 
x=memoryView[14];
s=23;
t=9;
console.log("|"+getB()+"|"+((b=(triFull(b,c,d,a,s,t,x,k[35])))>>0)+"|");
loopC2();
s=4;
t=28;
x=memoryView[1];
console.log("|"+getA()+"|"+((a=(triFull(a,b,c,d,s,t,x,k[36])))>>0)+"|");
s=11;
t=21;
x=memoryView[4];
console.log("|"+getD()+"|"+((d=(triFull(d,a,b,c,s,t,x,k[37])))>>0)+"|");
s=16;
t=16; 
x=memoryView[7];
console.log("|"+getC()+"|"+((c=(triFull(c,d,a,b,s,t,x,k[38])))>>0)+"|"); 
s=23;
t=9;
x=memoryView[10];
console.log("|"+getB()+"|"+((b=(triFull(b,c,d,a,s,t,x,k[39])))>>0)+"|");
loopC3();
s=4;
t=28;
x=memoryView[13];
console.log("|"+getA()+"|"+((a=(triFull(a,b,c,d,s,t,x,k[40])))>>0)+"|");
s=11;
t=21;
x=memoryView[0];
console.log("|"+getD()+"|"+((d=(triFull(d,a,b,c,s,t,x,k[41])))>>0)+"|");
s=16;
t=16; 
x=memoryView[3];
console.log("|"+getC()+"|"+((c=(triFull(c,d,a,b,s,t,x,k[42])))>>0)+"|"); 
s=23;
t=9;
x=memoryView[6];
console.log("|"+getB()+"|"+((b=(triFull(b,c,d,a,s,t,x,k[43])))>>0)+"|");
loopC4();
s=4;
t=28;
x=memoryView[9];
console.log("|"+getA()+"|"+((a=(triFull(a,b,c,d,s,t,x,k[44])))>>0)+"|");
s=11;
t=21;
x=memoryView[12];
console.log("|"+getD()+"|"+((d=(triFull(d,a,b,c,s,t,x,k[45])))>>0)+"|");
s=16;
t=16; 
x=memoryView[15];
console.log("|"+getC()+"|"+((c=(triFull(c,d,a,b,s,t,x,k[46])))>>0)+"|"); 
s=23;
t=9;
x=memoryView[2];
console.log("|"+getB()+"|"+((b=(triFull(b,c,d,a,s,t,x,k[47])))>>0)+"|");





console.log(" ");
console.log(" ");
s=6;
t=26;
x=memoryView[0];
loopD1();
console.log("|"+getA()+"|"+((a=(forFull(a,b,c,d,s,t,x,k[48])))>>0)+"|"); 
x=memoryView[7];
s=10;
t=22;
console.log("|"+getD()+"|"+((d=(forFull(d,a,b,c,s,t,x,k[49])))>>0)+"|"); 
x=memoryView[14];
s=15;
t=17; 
console.log("|"+getC()+"|"+((c=(forFull(c,d,a,b,s,t,x,k[50])))>>0)+"|"); 
x=memoryView[5];
s=21;
t=11;
console.log("|"+getB()+"|"+((b=(forFull(b,c,d,a,s,t,x,k[51])))>>0)+"|");
loopD2();
s=6;
t=26;
x=memoryView[12];
console.log("|"+getA()+"|"+((a=(forFull(a,b,c,d,s,t,x,k[52])))>>0)+"|");
s=10;
t=22;
x=memoryView[3];
console.log("|"+getD()+"|"+((d=(forFull(d,a,b,c,s,t,x,k[53])))>>0)+"|");
s=15;
t=17; 
x=memoryView[10];
console.log("|"+getC()+"|"+((c=(forFull(c,d,a,b,s,t,x,k[54])))>>0)+"|"); 
s=21;
t=11;
x=memoryView[1];
console.log("|"+getB()+"|"+((b=(forFull(b,c,d,a,s,t,x,k[55])))>>0)+"|");
loopD3();
s=6;
t=26;
x=memoryView[8];
console.log("|"+getA()+"|"+((a=(forFull(a,b,c,d,s,t,x,k[56])))>>0)+"|");
s=10;
t=22;
x=memoryView[15];
console.log("|"+getD()+"|"+((d=(forFull(d,a,b,c,s,t,x,k[57])))>>0)+"|");
s=15;
t=17; 
x=memoryView[6];
console.log("|"+getC()+"|"+((c=(forFull(c,d,a,b,s,t,x,k[58])))>>0)+"|"); 
s=21;
t=11;
x=memoryView[13];
console.log("|"+getB()+"|"+((b=(forFull(b,c,d,a,s,t,x,k[59])))>>0)+"|");
loopD4();
s=6;
t=26;
x=memoryView[4];
console.log("|"+getA()+"|"+((a=(forFull(a,b,c,d,s,t,x,k[60])))>>0)+"|");
s=10;
t=22;
x=memoryView[11];
console.log("|"+getD()+"|"+((d=(forFull(d,a,b,c,s,t,x,k[61])))>>0)+"|");
s=15;
t=17; 
x=memoryView[2];
console.log("|"+getC()+"|"+((c=(forFull(c,d,a,b,s,t,x,k[62])))>>0)+"|"); 
s=21;
t=11;
x=memoryView[9];
console.log("|"+getB()+"|"+((b=(forFull(b,c,d,a,s,t,x,k[63])))>>0)+"|");









https://webassembly.github.io/wabt/demo/wat2wasm/

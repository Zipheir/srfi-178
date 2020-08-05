(define-library (srfi 178)
  (import (scheme base))
  (import (scheme write))
  (import (scheme case-lambda))
  (import (srfi 151))
  (import (srfi 160 u8))
  (import (srfi 166))

  (cond-expand
   ((library (srfi 1))
    (import (only (srfi 1) list-tabulate)))
   (else
    (begin
     (define (list-tabulate len f)
       (let lp ((i 0))
         (if (= i len)
             '()
             (cons (f i) (lp (+ i 1)))))))))

  (export bit->integer bit->boolean  ; Bit conversion

          ;; Constructors
          make-bitvector bitvector bitvector-unfold
          bitvector-unfold-right bitvector-copy
          bitvector-reverse-copy bitvector-append bitvector-concatenate
          bitvector-append-subbitvectors

          ;; Predicates
          bitvector? bitvector-empty? bitvector=

          ;; Selectors
          bitvector-ref/int bitvector-ref/bool bitvector-length

          ;; Iteration
          bitvector-take bitvector-take-right
          bitvector-drop bitvector-drop-right bitvector-segment
          bitvector-fold/int bitvector-fold/bool bitvector-fold-right/int
          bitvector-fold-right/bool bitvector-map/int bitvector-map/bool
          bitvector-map!/int bitvector-map!/bool bitvector-map->list/int
          bitvector-map->list/bool bitvector-for-each/int
          bitvector-for-each/bool

          ;; Prefixes, suffixes, trimming, padding
          bitvector-prefix-length
          bitvector-suffix-length bitvector-prefix?  bitvector-suffix?
          bitvector-pad bitvector-pad-right bitvector-trim
          bitvector-trim-right bitvector-trim-both

          ;; Mutators
          bitvector-set!
          bitvector-swap!  bitvector-fill!  bitvector-reverse!
          bitvector-copy!  bitvector-reverse-copy!

          ;; Conversion
          bitvector->list/int
          bitvector->list/bool reverse-bitvector->list/int
          reverse-bitvector->list/bool list->bitvector
          reverse-list->bitvector bitvector->vector/int
          bitvector->vector/bool vector->bitvector bitvector->string
          string->bitvector bitvector->integer integer->bitvector
          bitvector->bytevector bitvector->bytevector! bytevector->bitvector

          ;; Generators and accumulators
          make-bitvector-generator/int make-bitvector-generator/bool
          make-bitvector-accumulator

          ;; Basic operations
          bitvector-not bitvector-not!
          bitvector-and bitvector-and!  bitvector-ior bitvector-ior!
          bitvector-xor bitvector-xor!  bitvector-eqv bitvector-eqv!
          bitvector-nand bitvector-nand!  bitvector-nor bitvector-nor!
          bitvector-andc1 bitvector-andc1!  bitvector-andc2
          bitvector-andc2!  bitvector-orc1 bitvector-orc1!
          bitvector-orc2 bitvector-orc2!

          ;; Quasi-integer operations
          bitvector-logical-shift
          bitvector-logical-shift!  bitvector-count bitvector-if
          bitvector-first-bit bitvector-count-run

          ;; Bit field operations
          bitvector-field-any?  bitvector-field-every?
          bitvector-field-clear bitvector-field-clear!
          bitvector-field-set bitvector-field-set!
          bitvector-field-replace bitvector-field-replace!
          bitvector-field-replace-same bitvector-field-replace-same!
          bitvector-field-rotate bitvector-field-reverse
          bitvector-field-reverse!  bitvector-field-flip
          bitvector-field-flip! bit->integer bit->boolean
          bitvector-field-replace bitvector-field-reverse
          bitvector-field-replace! bitvector-field-reverse!
          )

  (include "178/macros.scm")
  (include "178/convert.scm")
  (include "178/fields.scm")
  (include "178/gen-acc.scm")
  (include "178/logic-ops.scm")
  (include "178/map2list.scm")
  (include "178/quasi-ints.scm")
  (include "178/quasi-strs.scm")
  (include "178/unfolds.scm")
  (include "178/util.scm")
  (include "178/wrappers.scm")
)

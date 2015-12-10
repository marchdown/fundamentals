;; TODO: namespace declarations go here.
;; HWÆT how do I import this file from a repl?
(defn read-int [] (Integer. (read-line)))
;(def N (read-int))
(defn words [s] (clojure.string/split s #"\s"))
(defn read-line-of-ints [] (map #(Integer. %) (words (read-line))))
;(def xs (read-line-of-ints))

(defn announce [result]
  (print (apply str (interpose " " result)))) ;; <-- does this actually work?

(defn print-seq [s] (println (apply str (interpose " " s)))) ; TODO: get rid of the trailing space

;;;; reasonable problem structure:
;(def N (read-int))
;(def xs (read-line-of-ints))
;
;(def result (solve xs))
;(announce result)

; HWÆT learn how to measure running time of a function.

;; how to force evaluation so that I don't get a lazy seq of side-effect-ful exprs? 
;; doseq and dotimes are strict and are intended to be used for side-effects

;; N.B. ns is a bad variable name in clojure, because by convention it means
;; namespace, not seq-of-nats


;; HWÆT clojure construct that don't quite make sense to me yet:
;; for
;; do, doseq, dotimes — how do we force evaluation exactly?
;; loop
;; apply str idiom


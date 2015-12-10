;; TODO: namespace declarations go here.
;; HWÆT how do I import this file from a repl?
(defn read-int [] (Integer. (read-line)))


(defn words [s] (clojure.string/split s #"\s"))
(defn read-line-of-ints [] (map #(Integer. %) (words (read-line))))
(defn print-seq [s] (apply map println s))

;;;; reasonable problem structure:
;(def N (read-int))
;(def xs (read-line-of-ints))
;
;(def result (solve xs))
;(def answer (format result))
;(print answer)

(defn solve [xs p] (partition xs (count xs) p))
(defn partition [ar n p]
  (concat (filter (partial > p) xs) (filter (partial <= p) xs))
  )

(defn format-result [result]
  (drop-last (str (map #(format "%d " %) result))))
                                        ; this is a lazy functional solution which probably takes forever
; HWÆT learn how to measure running time of a function.

;; how to force evaluation so that I don't get a lazy seq of side-effect-ful exprs? 

;; N.B. ns is a bad variable name in clojure, because by convention it means
;; namespace, not seq-of-nats


;; clojure construct that don't quite make sense to me yet:
;; for
;; proc
;; loop
;; apply str idiom


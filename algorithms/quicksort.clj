(defn tail [xs] (drop 1 xs)) ; rest in clojure idiom
;; HWÆT!! learn to measure performance time.

(defn partition___ [xs p]
  (concat (filter (partial > p) xs) (filter (partial <= p) xs)))



(defn partition__ [xs]
;;  requirements:
  ;;  sort left half before right
  (do ;;(print "* enter partition_" xs "*\n")
    )
  (if (>= 1 (count xs)) ;;(do (print "+ " xs " +\n") xs) ;; we've been given a singleton list, don't recur.
      
      (let [p  (first xs)
            ls (filter (partial > p) (tail xs))
            hs (filter (partial <= p) (tail xs))]
        (let [result (concat (partition_ ls) [p] (partition_ hs))]
          (announce result)
;          (print "\n --> " result "\n") ;; we've just sorted a subarray, let's print it out.
          result))))
;; I've used nested let expressions here. Is there a better way?

  ;; what I don't understand now: how to print from inside a "pure" evaluation.
  ;; also, subtleties of differences between evaluation, calculation & who-knows-what-else. Application? 
  ;;  print on merging sorted sequences (lg n sequences doubling in length)
  

;;   (let [xs (tail xs) p (first xs) ls [] hs []]
;;;;
;; are there pattern-matching facilities as in Haskell?

;; (defn partition_ [xs p]
;;   (concat (map #(filter (partial % p) xs) [> <=])))




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn read-int [] (Integer. (read-line)))
(def N (read-int))

(defn words [s] (clojure.string/split s #"\s"))
(defn read-line-of-ints [] (map #(Integer. %) (words (read-line))))
(def xs (read-line-of-ints))

(defn print-seq-of-ints [s] (println (apply str (interpose " " s))))

(defn partition_ [xs]
  (if (>= 1 (count xs)) 
    xs
    (let [p  (first xs)
          ls (filter (partial > p) (rest xs))
          hs (filter (partial <= p) (rest xs))]
      (let [result (concat (partition_ ls) [p] (partition_ hs))]
        (announce result)
              result))))
        
        
(partition_ xs)

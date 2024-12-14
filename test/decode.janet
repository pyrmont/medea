(use ../deps/testament/src/testament)


(import ../lib/decode :as medea)


(deftest decode
  (def expect 1)
  (def actual (medea/decode "1"))
  (is (== expect actual))

  (def expect 100)
  (def actual (medea/decode "100"))
  (is (== expect actual))

  (def expect true)
  (def actual (medea/decode "true"))
  (is (== expect actual))

  (def expect false)
  (def actual (medea/decode "false"))
  (is (== expect actual))

  (def expect :null)
  (def actual (medea/decode "null"))
  (is (== expect actual))

  (def expect (range 1000))
  (def actual (medea/decode (string/format "[%s]" (-> (map string (range 1000)) (string/join ",")))))
  (is (== expect actual))

  (def expect "\n")
  (def actual (medea/decode `"\n"`))
  (is (== expect actual))

  (def expect "👎")
  (def actual (medea/decode `"\ud83d\udc4e"`))
  (is (== expect actual)))


(run-tests!)

(use ../deps/testament/src/testament)


(import ../lib/encode :as medea)


(deftest encode
  (def expect "1")
  (def actual (medea/encode 1))
  (is (== expect actual))

  (def expect "100")
  (def actual (medea/encode 100))
  (is (== expect actual))

  (def expect "true")
  (def actual (medea/encode true))
  (is (== expect actual))

  (def expect "false")
  (def actual (medea/encode false))
  (is (== expect actual))

  (def expect "null")
  (def actual (medea/encode nil))
  (is (== expect actual))

  (def expect (string/format "[%s]" (-> (map string (range 1000)) (string/join ","))))
  (def actual (medea/encode (range 1000)))
  (is (== expect actual))


  (def expect `"\n"`)
  (def actual (medea/encode "\n"))
  (is (== expect actual))

  (def expect `"\ud83d\udc4e"`)
  (def actual (medea/encode "👎"))
  (is (== expect actual)))


(run-tests!)

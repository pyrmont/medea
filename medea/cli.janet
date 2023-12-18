(import argy-bargy :as argy)
(import ./init :as medea)


(def config
  ```
  The configuration for Argy-Bargy
  ```
  {:rules [:input {:default :stdin
                   :help    "The <path> for the input file."}
           "--output" {:default :stdout
                       :help    "The <path> for the output file."
                       :kind    :single
                       :proxy   "path"
                       :short   "o"}
           "--reverse" {:default false
                        :help    "Reverse the polarity and convert from Janet to JSON."
                        :kind    :flag
                        :short   "r"}
           "-------------------------------------------"]
   :info {:about "Another JSON encoder and decoder in Janet, tragically."}})


(defn- main [& args]
  (def parsed (argy/parse-args "medea" config))
  (def err (parsed :err))
  (def help (parsed :help))

  (cond
    (not (empty? help))
    (do
      (prin help)
      (os/exit (if (get-in parsed [:opts "help"]) 0 1)))

    (not (empty? err))
    (do
      (eprin err)
      (os/exit 1))

    (do
      (def params (parsed :params))
      (def opts (parsed :opts))
      (def input-path (params :input))
      (def input (if (= :stdin input-path)
                   (do
                     (var lines @"")
                     (while (def line (getline))
                       (if (empty? line)
                         (break))
                       (buffer/push lines line))
                     lines)
                   (slurp input-path)))
      (def to-janet? (opts "reverse"))
      (def output (if to-janet?
                    (medea/encode (parse input))
                    (medea/decode input)))
      (def output-path (opts "output"))
      (if (= :stdout output-path)
        (printf "%j" output)
        (spit output-path output)))))

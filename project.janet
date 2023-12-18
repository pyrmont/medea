(declare-project
  :name "Medea"
  :description "Another JSON encoder and decoder in Janet, tragically"
  :author "Michael Camilleri"
  :license "MIT"
  :url "https://github.com/pyrmont/medea"
  :repo "git+https://github.com/pyrmont/medea"
  :dependencies []
  :exe-dependencies ["https://github.com/pyrmont/argy-bargy"]
  :dev-dependencies ["https://github.com/pyrmont/testament"])

# Library

(declare-source
  :source ["medea"])

(task "deps" []
  (if-let [deps ((dyn :project) :dependencies)]
    (each dep deps
      (bundle-install dep))
    (do
      (print "no dependencies found")
      (flush))))

# Executable

(post-deps
  (declare-executable
    :name "medea"
    :entry "medea/cli.janet"
    :install false))

(task "exe-deps" ["deps"]
  (if-let [deps ((dyn :project) :exe-dependencies)]
    (each dep deps
      (bundle-install dep))
    (do
      (print "no dev-dependencies found")
      (flush))))

# Development

(task "dev-deps" ["deps"]
  (if-let [deps ((dyn :project) :dev-dependencies)]
    (each dep deps
      (bundle-install dep))
    (do
      (print "no dev-dependencies found")
      (flush))))

# Testing

(task "test-deps" []
  # Running these rules in parallel can break
  (do-rule "exe-deps")
  (do-rule "dev-deps"))

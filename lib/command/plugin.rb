require "vagrant"

module VagrantPlugins
  module VagrantCommand
    class Plugin < Vagrant.plugin(2)
      name 'reimport-db'
      description 'reimports the TYPO3 database. GIT submodule "database" has to be updated before!'
      command("reimport-db") do
        require_relative "command"
        Command
      end
    end
  end
end
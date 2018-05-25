module VagrantPlugins
  module VagrantCommand
    class Command < Vagrant.plugin(2, :command)
      def self.synopsis
        "reimports the TYPO3 database. GIT submodule \"database\" has to be updated before!"
      end

      def execute
        with_target_vms("current", :reverse => true) do |machine|
          machine.communicate.sudo("rm -rf /tmp/database_imported")
          `git pull /database`
          machine.action(:provision)
        end
      end
    end
  end
end
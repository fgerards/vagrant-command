module VagrantPlugins
  module VagrantCommand
    class Command < Vagrant.plugin(2, :command)
      def self.synopsis
        "reimports the TYPO3 database. GIT submodule \"database\" has to be updated before!"
      end

      def execute
        with_target_vms("current", reverse: true) do |machine|
          machine.communicate.sudo("rm -rf /tmp/database_imported")
          machine.action(:provision)
        end
        if result.nil?
          puts "Error was #{$?}"
          return 1
        end
        puts "Success!!"
        return 0
      end
    end
  end
end
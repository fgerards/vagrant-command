module VagrantPlugins
  module VagrantCommand
    class Command < Vagrant.plugin(2, :command)
      def self.synopsis
        "reimports the TYPO3 database. GIT submodule \"database\" has to be updated before!"
      end

      def execute
        with_target_vms("current", :reverse => true) do |machine|
          machine.communicate.sudo("rm -rf /tmp/database_imported")
          repoDir = File.join(Dir.pwd, 'website-typo3-portal/database/')
          `git -C #{repoDir} checkout develop`
          `git -C #{repoDir} pull`
          machine.action(:provision)
        end
      end
    end
  end
end
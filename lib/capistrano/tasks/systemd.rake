# frozen_string_literal: true

namespace :systemd do
  namespace :puma do
    %w[start stop restart status].each do |command|
      desc "#{command} puma"
      task command do
        on roles(:web) do
          execute "sudo systemctl #{command} puma"
        end
      end
    end
  end
  namespace :sidekiq do
    %w[start stop restart status].each do |command|
      desc "#{command} sidekiq"
      task command do
        on roles(:app) do
          execute "sudo systemctl #{command} sidekiq@1"
          execute "sudo systemctl #{command} sidekiq@2"
        end
      end
    end
  end
end

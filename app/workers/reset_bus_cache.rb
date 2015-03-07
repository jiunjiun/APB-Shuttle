class ResetBusCache
  include Sidekiq::Worker

  def perform
    Bus.reset_cache
  end
end
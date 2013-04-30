# Defines a user_ulimit modification
# Sample:
#
# depends 'ulimit'
#
# user_ulimit "tomcat" do
#  order_force 99
#  filehandle_limit 8192
#  process_limit 61504
#  memory_limit 1024
# end

define :user_ulimit, :order_force => nil, :filehandle_limit => nil, :process_limit => nil, :memory_limit => nil, :core_size => nil, :data_size => nil, :file_size => nil, :resident_set_size => nil, :stack_size => nil, :max_cpu_time => nil, :address_space => nil, :max_logins => nil, :priority => nil, :max_locks_files => nil, :max_pending_signals => nil, :max_memory_posix_queues => nil, :max_nice => nil, :max_realtime_priority => nil
 do
  template "/etc/security/limits.d/#{params[:name]}-#{params[:name]}_limits.conf" do
    source "ulimit.erb"
    cookbook "ulimit"
    owner "root"
    group "root"
    mode 0644
    variables(
      :ulimit_user => params[:name],
      :filehandle_limit => params[:filehandle_limit],
      :process_limit => params[:process_limit],
      :memory_limit => params[:memory_limit],
      :core_size => params[:core_size],
      :data_size => params[:data_size],
      :file_size => params[:file_size],
      :resident_set_size => params[:resident_set_size],
      :stack_size => params[:stack_size],
      :max_cpu_time => params[:max_cpu_time],
      :address_space => params[:address_space],
      :max_logins => params[:max_logins],
      :priority => params[:priority],
      :max_locks_files => params[:locks],
      :max_pending_signals => params[:max_pending_signals],
      :max_memory_posix_queues => params[:max_memory_posix_queues],
      :max_nice => params[:max_nice],
      :max_realtime_priority => params[:max_realtime_priority],
    )
  end
end

/usr/local/etc/supervisord.conf


[program:my_rake_task]
command=bash -l -c "/Users/inito/.rvm/gems/ruby-2.7.2@keys-gemset/bin/rake keys:update"
directory=/Users/inito/Documents/rails/rails6/keys_assignment
user=inito
autostart=true
autorestart=true
stdout_logfile=/Users/inito/Documents/rails/rails6/keys_assignment/log/my_rake_task_stdout.log
stderr_logfile=/Users/inito/Documents/rails/rails6/keys_assignment/log/my_rake_task_stderr.log

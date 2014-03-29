git add .
git commit -m "autocommit"
rem call get_heroku_log.cmd
rem	call heroku run rake assets:clean
rem	call heroku run rake assets:clobber
git push origin master
git push heroku master>push.log
rem	call heroku run rake assets:precompile
pause
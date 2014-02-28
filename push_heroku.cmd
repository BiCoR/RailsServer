git add .
git commit -m "autocommit"
call get_heroku_log.cmd
call heroku run rake assets:clean
call heroku run rake assets:clobber
git push origin master
git push heroku master>push.log
call heroku run rake assets:precompile
pause
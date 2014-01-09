git add .
git commit -m "autocommit"
call heroku run rake assets:clean
git push heroku master>push.log
call heroku run rake assets:precompile
pause
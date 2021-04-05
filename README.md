# To Install

## This Application is built using Rails 6.1 using Postgres and redis

### To Install, you need the following:
* Postgres Set needs to be set up locally
``` 
  Once installed to start postgres server run "pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"

  To Stop run "pg_ctl -D /usr/local/var/postgres stop -s -m fast" 
  ```

* Redis needs to be installed
  ```
  To Start Redis run "redis-server"
  To Stop CTRL + C
  ```

* To Run Webpack server
  ```
   ./bin/webpack-dev-server
   To Stop CTRL + C
   ```

# SQL Injections in ActiveRecord 3.2 talk.

center <<-AMEN
  \e[1mFunkyzeit mit ActiveRecord 3.2\e[0m


  Wojtek Ogrodowczyk
  @sharnik
AMEN

section "Warmup " do

  code "User.where(\"login = '\#{params[:login]}'\").all"
  code <<-AMEN
    # "Bob' OR 1=1);--"

    User.where("login = '\#{params[:login]}'").all

    => SELECT "users".* FROM "users" WHERE (name = 'Bob' OR 1=1);
  AMEN

  code "User.where :login => params[:login] "
  code "User.where :login => params[:login] # OK"


end

section "In oder aus? " do
  code "User.count params[:field] "
  code <<-AMEN
    # '"users"."name") FROM "users" WHERE "users"."admin"="t";--'

    User.count params[:field]

    => SELECT COUNT("users"."name") FROM "users" WHERE "users"."admin"="t";
  AMEN

  code "User.exists? params[:user_id].to_i"
  code "User.exists? params[:user_id].to_i # OK"

  code "User.exists? params[:user_id].to_s"
  code "User.exists? params[:user_id].to_s # OK"

  code "User.exists? params[:user_id]"
  code <<-AMEN
    # ["password LIKE '%%secret%%'"]

    User.exists? params[:user_id]

    => SELECT 1 AS one FROM "users" WHERE (password LIKE '%secret%') LIMIT 1
  AMEN

  code "Order.calculate :sum, params[:column]"
  code <<-AMEN
    # '"total") FROM "orders" WHERE "user_id"=79;--'

    Order.calculate :sum, params[:column]

    => SELECT SUM("total") FROM "orders" WHERE "user_id"=79;
  AMEN
  block <<-AMEN
    Also applies to other calculate-based methods:

      * average

      * count

      * maximum

      * minimum

      * sum
  AMEN

  code "Order.pluck params[:field]"
  code <<-AMEN
    # '* FROM USERS;--'

    Order.pluck params[:field]

    => SELECT * FROM USERS;
  AMEN

  code "Order.all :select => params[:field]"
  code <<-AMEN
    # "id AS total FROM users WHERE admin='t';--"

    Order.all :select => params[:field]

    => SELECT id AS total FROM users WHERE admin='t';
  AMEN

  code "User.all :limit => params[:limit]"
  code "User.all :limit => params[:limit] # OK"

  code "User.all :offset => params[:offset]"
  code "User.all :offset => params[:offset] # OK"

  code "User.all :order => params[:order]"
  code <<-AMEN
    # "(CASE WHEN
    #     (SELECT SUBSTR(password, 1, 1) FROM users where name='Admin') = 'A'
    #   THEN name
    #   ELSE id END)"

    User.all :order => params[:order]

    => SELECT "users".* FROM "users" ORDER BY (CASE WHEN
      (SELECT SUBSTR(password, 1, 1) FROM users where name='Admin') = 'A'
      THEN name ELSE id END
    )
  AMEN
end

section "Questions?" do
  center <<-AMEN
    \e[1mThanks!\e[0m


    Wojtek Ogrodowczyk
    @sharnik
  AMEN
end
